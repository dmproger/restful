require_relative 'shares/restful'

RSpec.describe BandwithsController do
  let(:server) { create(:server) }
  let(:resources) { server.bandwiths }
  let(:resources_url) { "/servers/#{server.id}/bandwiths" }

  it_behaves_like 'restful'
end
