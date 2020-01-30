# frozen_string_literal: true

require 'bundler/setup'
require_relative 'app/application'

def validate_env_preconditions
  value = ENV['GAME_CODE']
  raise 'GAME_CODE env var not found' if value.nil?
  raise 'GAME_CODE env var could not be parsed into an integer' unless value.respond_to?(:to_i)
end

validate_env_preconditions
run Sinatra::Application
