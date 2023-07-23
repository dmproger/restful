module ResourceErrorsSerializer
  module_function

  def call(errors)
    errors.map(&:inspect).compact_blank
  end
end
