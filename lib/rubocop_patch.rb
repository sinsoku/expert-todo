# frozen_string_literal: true

require "rubocop/config_loader_resolver"

module RuboCop
  ConfigLoaderResolver.prepend(Module.new do
    # refs: https://github.com/bbatsov/rubocop/blob/master/lib/rubocop/config_loader_resolver.rb#L57
    def merge_with_default(config, config_file)
      default_configuration = ConfigLoader.default_configuration

      disabled_by_default = config.for_all_cops['DisabledByDefault']
      enabled_by_default = config.for_all_cops['EnabledByDefault']

      if disabled_by_default || enabled_by_default
        default_configuration = transform(default_configuration) do |params|
          params.merge('Enabled' => !disabled_by_default)
        end
      end

      if disabled_by_default
        config = handle_disabled_by_default(config, default_configuration)
      end

      # Config.new(merge(default_configuration, config), config_file)     # -
      opts = { inherit_mode: { "merge" => ["Exclude"] } }                 # +
      Config.new(merge(default_configuration, config, opts), config_file) # +
    end

    # refs: https://github.com/bbatsov/rubocop/blob/master/lib/rubocop/config_loader_resolver.rb#L81
    def merge(base_hash, derived_hash, **opts)
      result = base_hash.merge(derived_hash)
      keys_appearing_in_both = base_hash.keys & derived_hash.keys
      keys_appearing_in_both.each do |key|
        if base_hash[key].is_a?(Hash)
          # result[key] = merge(base_hash[key], derived_hash[key])     # -
          result[key] = merge(base_hash[key], derived_hash[key], opts) # +
        elsif should_union?(base_hash, key, opts[:inherit_mode])
          result[key] = base_hash[key] | derived_hash[key]
        elsif opts[:debug]
          warn_on_duplicate_setting(base_hash, derived_hash, key, opts)
        end
      end
      result
    end
  end)
end

raise("check this patch") if RuboCop::Version::STRING > '0.54.0'
