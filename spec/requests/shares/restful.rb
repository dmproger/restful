require_relative 'restful/response'

RSpec.shared_examples 'restful', type: :request do
  let(:model) { resources.sample.class }

  context 'show resources' do
    subject { get("#{resources_url}.json") }

    it_behaves_like 'response', 'GET' do
      let(:data) { resources.map(&:attributes) }
      let(:database_behavior) do
        expect { subject }.not_to change { model.count }
      end
    end
  end

  context 'show resource' do
    subject { get("#{resources_url}/#{resource.id}.json") }
    let(:resource) { resources.sample }

    it_behaves_like 'response', 'GET' do
      let(:data) { resource.attributes }
      let(:database_behavior) do
        expect { subject }.not_to change { model.count }
      end
    end
  end

  context 'create resource' do
    subject { post("#{resources_url}.json", params: params) }
    let(:params) { build(model.to_s.underscore).attributes.compact }

    it_behaves_like 'response', 'POST' do
      let(:data) { model.last.attributes.merge(params) }
      let(:database_behavior) do
        expect { subject }.to change { model.count }.by(1)
      end
    end
  end

  context 'update resource' do
    subject { put("#{resources_url}/#{resource.id}.json", params: params) }
    let(:resource) { resources.sample }
    let(:params) { build(model.to_s.underscore).attributes.compact }

    it_behaves_like 'response', 'PUT' do
      let(:data) { resource.reload.attributes.merge(params) }
      let(:database_behavior) do
        expect { subject }.not_to change { model.count }
      end
    end
  end

  context 'delete resource' do
    subject { delete("#{resources_url}/#{resource.id}.json") }
    let(:resource) { resources.sample }

    it_behaves_like 'response', 'DELETE' do
      let(:data) { resource.attributes }
      let(:database_behavior) do
        expect { subject }.to change { model.count }.by(-1)
        expect { resource.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
