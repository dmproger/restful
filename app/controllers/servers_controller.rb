class ServersController < RestfulController
  def resources
    Server.all
  end
end
