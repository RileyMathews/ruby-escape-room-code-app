# frozen_string_literal: true

bind 'tcp://0.0.0.0:3000'
rackup '../app/config.ru'
