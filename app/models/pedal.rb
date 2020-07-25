class Pedal < ApplicationRecord
  validates :name, :price, :brand, :description, :quantity, :image_url,
  :kind, :category, presence: true
  validates_inclusion_of :featured, in: [true, false]

  scope :random_pedal, -> {(
    select("*")
    .from("pedals")
    .order(Arel.sql("RANDOM()"))
    .limit(1)
  )}

  scope :value, -> { where(kind: "value")}
  scope :standard, -> { where(kind: "standard")}
  scope :premium, -> { where(kind: "premium")}
  scope :featured, -> { where(featured: "true")}
  scope :ten_most_recent, -> { order(created_at: :desc).limit(10)}
  scope :delay_pedals, -> { where(category: "Delay")}
  scope :fuzz_pedals, -> { where(category: "Fuzz")}
  scope :overdrive_pedals, -> { where(category: "Overdrive")}
  scope :distortion_pedals, -> { where(category: "Distortion")}

  scope :search_by_name, -> (name) { where("LOWER(name) like ?", "%#{name}%")}
  scope :search_by_brand, -> (brand) { where("LOWER(brand) like ?", "%#{brand}%")}
end
