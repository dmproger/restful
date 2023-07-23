class ApplicationRecord < ActiveRecord::Base
  include FormattedDatetime

  primary_abstract_class
end
