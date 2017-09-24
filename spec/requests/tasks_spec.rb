require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create :user }
  before { login_as user }

  describe "GET /tasks" do
    before { get tasks_path }
    it { expect(response).to have_http_status :ok }
  end
end
