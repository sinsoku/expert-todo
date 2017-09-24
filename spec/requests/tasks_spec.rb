require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  include_context "logged_in"

  describe "GET /tasks" do
    before { get tasks_path }
    it { expect(response).to have_http_status :ok }
  end
end
