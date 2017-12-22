require 'capybara'
require 'capybara/dsl'
require 'selenuim-webdriver'

Capybara.current_driver = :selenium
Capybara.app_host = "http://www.blackliststalert.org/"
Capybara.default_wait_time = 20

module Crawler
	calss BlackListAlert
	include Capybara::DSL
	
	def domain_check(target)
	  visit('/')
	  fill_in "", :with => target
	  clikc_button "check"

	  within(:xpath, "/html/body/center/font/form") do
	
		alert_notice if page.has_content?('Listed!')
	end
	page.save_screenshot('screenshot.png')
	end
	
	def alert_notice
	  put "Alert!"
	end
	end
end

crawler = Carawler::BlacklistAlert.new
crawler.domain_check('mail.google.com')
