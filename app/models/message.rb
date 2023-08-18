class Message < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :room, class_name: "Room", foreign_key: "room_id"
end
