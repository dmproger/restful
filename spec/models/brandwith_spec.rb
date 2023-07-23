#
# manual testing
#
RSpec.describe Bandwith do
  let(:bandwith) { create(:bandwith) }

  it 'prevents to save brandiwth with invalid values' do
    bandwith.Value = 10_000_000
    expect { bandwith.save }.not_to change { bandwith.Value }

    bandwith.Value = -10
    expect { bandwith.save }.not_to change { bandwith.Value }
  end

  it 'allows to save brandiwth with valid values' do
    value = 2_000

    expect(bandwith.Value).not_to eq(value)
    bandwith.Value = value
    bandwith.save

    expect(bandwith.Value).to eq(value)
  end
end
