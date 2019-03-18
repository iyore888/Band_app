class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
  validates :content, presence: true, length: {maximum: 50 }
end