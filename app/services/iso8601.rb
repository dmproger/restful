module Iso8601
  module_function

  def call(time)
    time && Time.parse(time.to_s).iso8601
  end
end
