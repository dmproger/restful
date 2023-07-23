module FormattedDatetime
  ATTRIBUTES = %w(created_at updated_at)

  def attributes
    result = super
    result.merge(result.slice(*ATTRIBUTES).transform_values { |value| formatted(value) })
  end

  def created_at
    formatted(send(:[], __method__))
  end

  def updated_at
    formatted(send(:[], __method__))
  end

  private

  def formatted(time)
    time&.iso8601
  end
end
