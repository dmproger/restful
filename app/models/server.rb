class Server < ApplicationRecord
  include Timestamps[Iso8601]

  has_many :bandwiths, dependent: :destroy
end
