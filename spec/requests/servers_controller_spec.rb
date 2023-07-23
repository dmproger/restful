require_relative 'shares/restful'

RSpec.describe ServersController do
  let(:resources) { create_list(:server, rand(2..3)) }
  let(:resources_url) { '/servers' }

  it_behaves_like 'restful'
end
