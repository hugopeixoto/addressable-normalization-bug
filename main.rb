require 'webmock'
require 'httparty'
require 'byebug'

require_relative "./patch.rb"

include WebMock::API

WebMock.enable!
WebMock.disable_net_connect!

WebMock.stub_request(:get, Addressable::Template.new("https://x.com/users{?email}")).to_return do |req|
  { status: 200, body: req.uri.query }
end

puts HTTParty.get("https://x.com/users", query: { email: "hugo@frctls.com" })
