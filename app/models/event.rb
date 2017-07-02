class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types, dependent: :destroy

  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :name, :ends_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
  	where("ends_at > ? AND publish_at is NOT NULL", Time.now)
  end

  def self.search(search)
  	where("name ILIKE ?", "%#{search}%" )
  end

  def publish
  	validates_presence_of :ticket_types
  	self.publish_at = Time.now.strftime("%d-%m-%Y %H:%M:%S")
  	self.save
  end

  def unpublish
  	self.publish_at = nil
  	self.save
  end

  def published?
  	!publish_at.nil?
  end

end
