module ResourceSerializer
  module_function

  def call(resource)
    resource.attributes
  end
end
