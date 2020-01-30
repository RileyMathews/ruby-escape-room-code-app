# frozen_string_literal: true

RSpec.describe 'rackup file' do
  def with_coerced_env(key, value)
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with(key).and_return(value)
    yield
  ensure
    allow(ENV).to receive(:[]).with(key).and_call_original
  end

  it 'can load without error' do
    expect do
      Rack::Builder.parse_file(File.expand_path('../config.ru', __dir__))
    end.to_not raise_error
  end

  context 'when a GAME_CODE env var is available' do
    it 'runs the application' do
      with_coerced_env 'GAME_CODE', '123123' do
        expect do
          Rack::Builder.parse_file(File.expand_path('../config.ru', __dir__))
        end.to_not raise_error
      end
    end
  end

  context 'when a GAME_CODE env var is not available' do
    it 'raises an error and does not load the config file' do
      with_coerced_env 'GAME_CODE', nil do
        expect do
          Rack::Builder.parse_file File.expand_path('../config.ru', __dir__)
        end.to raise_error 'GAME_CODE env var not found'
      end
    end
  end

  context 'when the GAME_CODE env var does not respond to to_i' do
    it 'raises an error and does not load the config file' do
      with_coerced_env 'GAME_CODE', Object.new do
        expect do
          Rack::Builder.parse_file(File.expand_path('../config.ru', __dir__))
        end.to raise_error 'GAME_CODE env var could not be parsed into an integer'
      end
    end
  end
end
