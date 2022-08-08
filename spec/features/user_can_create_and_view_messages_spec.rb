# frozen_string_literal: true

require "rails_helper"

describe "User can create and view messages", :js do
  let(:app) { App.new }
  let(:notification) { Notification.new }

  it "User creates and views messages" do
    When "user visits the app and creates a message" do
      app.load do |page|
        page.add_message.click
        page.submit!(
          Text: "Such a great party",
          Name: "anonymous party goer",
          Picture: "spec/fixtures/images/party-1-adi-goldstein-Hli3R6LKibo-unsplash.jpg",
        )
      end
    end

    Then "a success message pops up" do
      expect(notification.message.text).to eq "Message was successfully created."
    end

    When "the user goes back and views the slideshow" do
      app.when_loaded do |page|
        page.back.click
        page.view_slideshow.click
      end
    end

    Then "they see their message show up" do
      app.when_loaded do |page|
        expect(page.text.text).to eq "Such a great party"
        expect(page.name.text).to eq "ANONYMOUS PARTY GOER" # capitalized in browser through CSS
      end
    end
  end
end
