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

  it "User creates and updates a message but only for 1 minute from the last update" do
    When "user visits the app and creates a message successfully" do
      travel_to Time.zone.local(2022, 1, 1, 0, 0, 0)
      app.load do |page|
        page.add_message.click
        page.submit!(
          Text: "Such a great party",
          Name: "anonymous party goer",
          Picture: "spec/fixtures/images/party-1-adi-goldstein-Hli3R6LKibo-unsplash.jpg",
        )
      end
    end

    When "they wait 2 minutes and no longer" do
      travel_to Time.zone.local(2022, 1, 1, 0, 2, 0)
    end

    And "they hit edit and change the text" do
      app.edit.click
      app.submit!(
        Text: "Such a great party YAAAAAAAAAAAAS",
      )
    end

    Then "they see the message update" do
      app.when_loaded do |page|
        expect(page.text.text).to eq "Such a great party YAAAAAAAAAAAAS"
      end
    end

    When "they wait 2 minutes and 1 second" do
      travel_to Time.zone.local(2022, 1, 1, 0, 2, 1)
    end

    And "try to update it agian" do
      app.edit.click
    end

    Then "get a message that the message is locked and can no longer be edited" do
      expect(notification.message.text).to eq "Message is now locked."
    end
  end
end
