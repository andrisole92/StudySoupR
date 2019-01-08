class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Short
  belongs_to :session, class_name: "Session", foreign_key: "sId"
  # belongs_to :user, class_name: "User", foreign_key: "uId"
  field :body, type: String
  field :type, type: String # Should be Enum (Text | Image | PDF)

  validates_presence_of :body, :sId, :type

end
