class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  simple_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects
  accepts_nested_attributes_for :projects
  has_many :todos, dependent: :destroy

  scope :project_managers, (lambda do
    includes(:roles).where(roles: { name: 'project_manager' })
  end)

  scope :developers, (lambda do
    includes(:roles).where(roles: { name: 'developer' })
  end)

  scope :todos, (lambda do
    includes(:todos).where(user_id: id)
  end)

  def admin?
    roles.include?(:project_manager)
  end
end
