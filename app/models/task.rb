class Task < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true
  auto_html_for :content do
    html_escape
  	image(:width => 200, :height => 250)
  	youtube(:width => "100%", :height => 250, :autoplay => false)
  	link :target => "_blank", :rel => "nofollow"
  	simple_format
  end
end
