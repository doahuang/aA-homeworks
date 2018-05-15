class Corgi < ApplicationRecord
  # validates :name, presence: true

  include Toyable
  # has_many :toys, as: :toyable
end
