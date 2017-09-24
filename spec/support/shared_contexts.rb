RSpec.shared_context "logged_in" do
  let(:current_user) { create :user }
  before { login_as current_user }
end
