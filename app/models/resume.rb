class Resume < ApplicationRecord
  belongs_to :user
  has_many :experiences, -> {order(:position)}, dependent: :destroy
  has_many :educations, -> {order(:position)}, dependent: :destroy
  has_many :projects, -> {order(:position)}, dependent: :destroy
  has_many :skills, -> {order(:position)}, dependent: :destroy

  validates :title, presence: true
end
