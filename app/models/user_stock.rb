class UserStock < ApplicationRecord
  attr_accessor :symbol

  belongs_to :user
  belongs_to :stock
end
