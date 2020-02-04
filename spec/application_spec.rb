# frozen_string_literal: true

require_relative 'helpers/sinatra_controller_helper'
require 'rspec-html-matchers'

RSpec.describe Sinatra::Application do
  include SinatraControllerHelper
  include RSpecHtmlMatchers

  describe 'get /' do
    it 'returns hello world' do
      get '/'

      expect(last_response.body).to have_tag('form', with: { action: '/', method: 'post' }) do
        with_tag 'input#game_code', with: { type: 'text' }
        with_tag 'input#submit', with: { value: 'submit', type: 'submit' }
      end
    end
  end

  describe 'post /' do
    context 'when the game code matches the env var' do
      it 'renders the success page' do
        post '/', game_code: ENV['GAME_CODE']

        expect(last_response.body).to have_tag('h1', text: 'Success, you win!')
      end
    end

    context 'when the game code does not match the env var' do
      it 'renders the form again with a failure message' do
        post '/', game_code: (ENV['GAME_CODE'].to_i + 2).to_s

        expect(last_response.body).to have_tag('h1', text: 'Wrong code, try again!')
        expect(last_response.body).to have_tag('form', with: { action: '/', method: 'post' }) do
          with_tag 'input#game_code', with: { type: 'text' }
          with_tag 'input#submit', with: { value: 'submit', type: 'submit' }
        end
      end
    end
  end
end
