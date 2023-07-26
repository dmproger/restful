module Timestamps
  ATTRIBUTES = %w(created_at updated_at)

  def self.[](timeservice)
    modul = Module.new

    ATTRIBUTES.each do |attr|
      modul.define_method(attr) { timeservice.call(send(:[], __method__)) }
    end

    modul.define_method(:attributes) do
      super().each_with_object({}) do |(attr, value), result|
        result.merge!(attr => ATTRIBUTES.include?(attr) ? timeservice.call(value) : value)
      end
    end

    modul
  end
end
