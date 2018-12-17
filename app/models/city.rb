class City < ApplicationRecord
has_many :users, class_name: "User", foreign_key: "user_id", dependent: :destroy
end
