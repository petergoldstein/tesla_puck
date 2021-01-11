# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'rack'
require 'sidekiq'
require_relative 'lib/tesla_puck'
require 'sidekiq/web'

use Rack::Auth::Basic, 'TeslaPuck' do |_username, password|
  ENV['WEB_PASSWORD'] == password
end

run Sidekiq::Web
