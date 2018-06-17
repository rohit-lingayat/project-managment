class Todo < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user, optional: true
end
