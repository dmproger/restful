RSpec.shared_examples 'response' do |method|
  it 'has correct data' do
    try(:database_behavior)
    subject
    expect(response.parsed_body).to match(
      'method' => method,
      'errors' => try(:errors) || [],
      'data' => data
    )
  end
end
