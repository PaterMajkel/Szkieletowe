class HomepageCarousel < ApplicationRecord

  after_initialize :default_duration, :default_image, :default_text, unless: :persisted?

  private

  def default_duration
    self.duration ||= 5000.to_i
  end
  def default_image
    self.image ||= "https://icatcare.org/app/uploads/2018/10/What-is-a-cat.png"
  end

  def default_text
    self.heading ||= "Lorem"
    self.description ||= "Lorem Ipsum"
  end
end
