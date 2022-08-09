# frozen_string_literal: true

class PromotesController < ApplicationController
  def show
    qrcode = RQRCode::QRCode.new(URI.parse(Rails.application.config.party_quotes_base_url).to_s)
    @qr_svg = qrcode.as_svg(
      color: "212121",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true,
      viewbox: "0 0 500 500",
    ).html_safe # rubocop:disable Rails/OutputSafety
  end
end
