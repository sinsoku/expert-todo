# frozen_string_literal: true

RSpec.shared_context "logged_in" do
  let(:current_user) { create :user, :confirmed }
  before { login_as current_user }
end
