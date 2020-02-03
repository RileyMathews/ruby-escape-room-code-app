# frozen_string_literal: true

require_relative 'helpers/sinatra_controller_helper'
require 'rspec-html-matchers'

RSpec.describe Sinatra::Application do
  include SinatraControllerHelper
  include RSpecHtmlMatchers

  describe 'get /' do
    it ' returns hello world' do
      get '/'

      expect(last_response.body).to have_tag('form', with: { action: '/', method: 'post' }) do
        with_tag 'input#game_code', with: { type: 'text' }
        with_tag 'input#submit', with: { text: 'submit' }
      end
    end
  end
end
