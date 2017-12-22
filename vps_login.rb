require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = "https://vps.sakura.ad.jp"

module Crawler
class Amazon
	include Capybara::DSL

	def login
		visit('/')
		fill_in "username",
			:with => "YOUR_VPS_USER_ID"
		fill_in "password",
			:with => "YOUR_VPS_PASSWORD"
		click_button "signin"
	end
end
end

crawler = Crawlar::Amazon.new
crawler.login

