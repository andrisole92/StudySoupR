class Session
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  has_many :messages, autosave: true
  # has_one :tutor, class_name: "User", foreign_key: "tutor_id"
  # has_one :tutee, class_name: "User", foreign_key: "tutee_id"

  field :title, type: String
  field :status, type: String # This is kind of status. Mongoid no enum, all plugins 3 years old not maintained. FUCK!
  field :duration, type: Float
  field :startAt, type: String

  validates_presence_of :title, :status, :startAt

end
