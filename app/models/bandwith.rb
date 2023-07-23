class Bandwith < ApplicationRecord
  # put real world network brandwiths limits
  MBIT_IN_SEC_RANGE = 1..5_000_000

  belongs_to :server

  validates :interface_name, presence: true, uniqueness: { scope: :server_id }
  validates_numericality_of :Value, only_numeric: true, in: MBIT_IN_SEC_RANGE
  validates_numericality_of :value_id, only_numeric: true, in: Serial::RANGE
end
