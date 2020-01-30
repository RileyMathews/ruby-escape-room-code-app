# frozen_string_literal: true

require_relative 'helpers/sinatra_controller_helper'

RSpec.describe Sinatra::Application do
  include SinatraControllerHelper

  describe 'get /' do
    it ' returns hello world' do
      get '/'

      expect(last_response.body).to include 'Hello world'
    end
  end
end
