# frozen_string_literal: true

class Message < ApplicationRecord
  validates :text, length: {minimum: 0, maximum: 260, allow_blank: false}
  validates :name, length: {minimum: 0, allow_blank: false}

  has_one_attached :picture
end
