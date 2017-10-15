class Post < ActiveRecord::Base
  validates_presence_of :body, { message: "A comment is required." }
  validates_presence_of :guest_name, { message: "A name is required." }
end
