class Actor < ApplicationRecord
  belongs_to :movie
  belongs_to :studio
end 