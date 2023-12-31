RSpec.describe Timestamps do
  Standard1 = Class.new do
    def self.call(value)
      "standard1 #{value}"
    end
  end

  Standard2 = Class.new do
    def self.call(value)
      "standard2 #{value}"
    end
  end

  Model = Class.new do
    def attributes
      {
        'attr1' => 'attr1_value',
        'created_at' => 'created_at_value',
        'updated_at' => 'updated_at_value'
      }
    end

    def [](attr)
      {
        attr1: 'attr1_value',
        created_at: 'created_at_value',
        updated_at: 'updated_at_value'
      }[attr]
    end

    def created_at
      'created_at_value'
    end

    def updated_at
      'updated_at_value'
    end
  end

  Model1 = Class.new(Model)
  Model2 = Class.new(Model)
  Model3 = Class.new(Model)

  subject do
    Model1.include(Timestamps[Standard1])
    Model2.include(Timestamps[Standard2])
    Model3.include(Timestamps[Standard1])
  end

  it 'has correct behavior' do
    [Model1.new, Model2.new, Model3.new].each do |model|
      expect(model.created_at).to eq('created_at_value')
      expect(model.updated_at).to eq('updated_at_value')
      expect(model.attributes).to match(
        'attr1' => 'attr1_value',
        'created_at' => 'created_at_value',
        'updated_at' => 'updated_at_value'
      )
    end

    subject

    [Model1.new, Model3.new].each do |model|
      expect(model.created_at).to eq('standard1 created_at_value')
      expect(model.updated_at).to eq('standard1 updated_at_value')
      expect(model.attributes).to match(
        'attr1' => 'attr1_value',
        'created_at' => 'standard1 created_at_value',
        'updated_at' => 'standard1 updated_at_value'
      )
    end

    [Model2.new].each do |model|
      expect(model.created_at).to eq('standard2 created_at_value')
      expect(model.updated_at).to eq('standard2 updated_at_value')
      expect(model.attributes).to match(
        'attr1' => 'attr1_value',
        'created_at' => 'standard2 created_at_value',
        'updated_at' => 'standard2 updated_at_value'
      )
    end
  end
end
