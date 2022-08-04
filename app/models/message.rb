# frozen_string_literal: true

class Message < ApplicationRecord
  validates :text, length: {minimum: 5, allow_blank: false}
  validates :name, length: {minimum: 3, allow_blank: false}
end
