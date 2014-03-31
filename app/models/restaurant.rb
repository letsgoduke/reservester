class Restaurant < ActiveRecord::Base	
	validates :name, presence: true
	validates :phone_number, presence: true

	belongs_to :owner
	has_many :reservations
end
