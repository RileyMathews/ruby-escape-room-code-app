# frozen_string_literal: true

require_relative 'helpers/sinatra_controller_helper'
require 'rspec-html-matchers'

RSpec.describe Sinatra::Application do
  include SinatraControllerHelper
  include RSpecHtmlMatchers

  describe 'get /' do
    it ' returns hello world' do
      get '/'

      expect(last_response.body).to have_tag('h1', text: 'Hello world')
    end
  end
end
