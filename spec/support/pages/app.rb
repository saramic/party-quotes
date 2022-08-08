# frozen_string_literal: true

class App < SitePrism::Page
  set_url Rails.application.routes.url_helpers.root_path

  element :add_message, :qa, "add-message"
  element :view_slideshow, :qa, "view-slideshow"
  element :back, :qa, "back"
  element :text, :qa, "message-text"
  element :name, :qa, "message-name"
  element :submit, :css, "input[type=submit]"

  def submit!(**args)
    args.each do |key, value|
      if page.find("[name=\"message\[#{key.downcase}\]\"]")["type"] == "file"
        attach_file(key, File.absolute_path(value))
      else
        fill_in key, with: value
      end
    end
    submit.click
  end
end
