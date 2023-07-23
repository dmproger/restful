class Server < ApplicationRecord
  has_many :bandwiths, dependent: :destroy
end
