class Task < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true, length: {minimum: 6}
    validates :user, presence: true
end
