class Resume < ApplicationRecord
  belongs_to :user
  has_many :experiences, -> {order(:position)}, dependent: :destroy
  has_many :educations, -> {order(:position)}, dependent: :destroy
  has_many :projects, -> {order(:position)}, dependent: :destroy
  has_many :skills, -> {order(:position)}, dependent: :destroy

  validates :title, presence: true

  before_save :capitalize_title

  private 

  def capitalize_title
    self.title = title.split.map{|title| title.capitalize}.join(' ') if title.present?
  end
end
