class Cat < ActiveRecord::Base
  COLORS  =[
    "black",
    "orange",
    "tabby",
    "pink"
  ]

  validates :birth_date, :name, :color, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "%{value} is not a valid color"}

  validates :sex, length: { maximum: 1 }, inclusion: { in: ["M", "F"],
    message: "That's not a sex! Silly billy."}

end
