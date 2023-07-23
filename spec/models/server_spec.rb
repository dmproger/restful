#
# manual testing
#
RSpec.describe Server do
  let(:server) { create(:server) }
  let(:other_server) { create(:server) }

  it 'has unique bandwiths interface names' do
    bandwith_attributes = server.bandwiths.first.attributes.except('id')
    expect { server.bandwiths.create!(bandwith_attributes) }.to raise_error(ActiveRecord::RecordInvalid)

    bandwith_attributes.merge!({ 'interface_name' => 'foo' })
    expect { server.bandwiths.create!(bandwith_attributes) }.not_to raise_error
  end

  it 'destroys bandwiths when destroy server' do
    expect(server.bandwiths.any?).to be_truthy
    expect(other_server.bandwiths.any?).to be_truthy

    server.destroy
    expect(server.bandwiths.any?).to be_falsey
    expect(other_server.bandwiths.any?).to be_truthy
  end
end
