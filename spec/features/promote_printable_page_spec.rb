# frozen_string_literal: true

require "rails_helper"

describe "Promote printable page", :js do
  it "creates a promotion page with a QR code" do
    When "admin visits the hiddenn /promote url" do
      visit "/promote"
    end

    Then "there is a title, a sub title, and a QR code" do
      expect(page.find(:qa, "title").text).to eq "Felix 18th Birthday Guest Book"
      expect(page.find(:qa, "sub-title").text).to eq "Join in the fun and upload a pic and message for Felix's party!"
      expect(page.find(:qa, "qr-code")).to be_truthy
    end
  end
end
