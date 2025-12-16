class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true
  validates :title, :status, :priority, presence: true
end
