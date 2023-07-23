#
# global unique id fabric (serial data type), just for fun
#
SerialsNoMore = Class.new RuntimeError

SERIAL_BYTES = 4
SERIAL_MAX = 2 ** (SERIAL_BYTES * 8) / 2 - 1
SERIAL_NUMBERS = (1..SERIAL_MAX).lazy
SERIAL_GENERATOR = lambda {
  existing_serials = Bandwith.pluck(:value_id) # add other if need
  loop do
    serial = SERIAL_NUMBERS.next
    return serial unless existing_serials.include?(serial)
  end
}

FactoryBot.define do
  factory :serial, class: Integer do
    initialize_with { SERIAL_GENERATOR.() }

    after(:build) do |serial|
      raise SerialsNoMore, serial unless serial.is_a?(Integer)
    end
  end
end
