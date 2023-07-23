class BandwithsController < RestfulController
  def resources
    Server.find(query_params['server_id']).bandwiths
  end
end
