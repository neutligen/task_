class Task < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(due_at: :asc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :content, length: {maximum: 500}
  # validates :due_at, presence: true
  
  # def initialize
    # self.due_at.sec ||= 0
  # end
  
end
