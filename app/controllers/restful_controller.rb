class RestfulController < ApplicationController
  Error = Class.new RuntimeError
  NotImplement = Class.new Error

  rescue_from Error, ActiveRecord::RecordNotFound do |error|
    render_resource(errors: ResourceErrorsSerializer.call([error]))
  end

  def index
    @resources = resources
    render_resources
  end

  def create
    @resource = resources.create!(query_params)
    render_resource
  end

  def show
    @resource = resources.find(id)
    render_resource
  end

  def update
    @resource = resources.find(id)
    @resource.update!(query_params)
    render_resource
  end

  def destroy
    @resource = resources.find(id)
    @resource.destroy!
    render_resource
  end

  private

  def id
    params[:id]
  end

  def query_params
    params.permit!.to_h.except(*%w(id action controller format))
  end

  def render_resources(errors: nil)
    render_response(
      data: @resources&.map { |resource| ResourceSerializer.call(resource) } || [],
      errors: errors || []
    )
  end

  def render_resource(errors: nil)
    render_response(
      data: @resource && ResourceSerializer.call(@resource),
      errors: errors || @resource && ResourceErrorsSerializer.call(@resource.errors) || [],
    )
  end

  def render_response(data:, errors:)
    respond_to do |format|
      format.json do
        render json: {
          method: request.method,
          errors: errors,
          data: data
        }
      end
    end
  end

  def resources
    raise NotImplement
  end
end
