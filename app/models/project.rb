# frozen_string_literal: true
class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :todos, inverse_of: :project, dependent: :destroy

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :todos, reject_if: :all_blank, allow_destroy: true
end
