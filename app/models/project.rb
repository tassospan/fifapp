class Project < ActiveRecord::Base
    has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates_presence_of :title, :url
end
