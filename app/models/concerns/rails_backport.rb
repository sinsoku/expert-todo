module RailsBackport
  extend ActiveSupport::Concern

  class_methods do
    # refs: https://github.com/rails/rails/pull/31989
    def create_or_find_by(attributes, &block)
      transaction(requires_new: true) { create(attributes, &block) }
    rescue ActiveRecord::RecordNotUnique
      find_by!(attributes)
    end

    def create_or_find_by!(attributes, &block)
      transaction(requires_new: true) { create!(attributes, &block) }
    rescue ActiveRecord::RecordNotUnique
      find_by!(attributes)
    end
  end

  raise("Delete me") if Rails::VERSION::MAJOR >= 6
end
