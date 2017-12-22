require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = "https://vps.sakura.ad.jp"

module Crawler
  class VPS
	include Capybara::DSL

	def login
		visit('/')
		fill_in "username",
			:with => "YOUR_VPS_USER_ID"
		fill_in "password",
			:with => "YOUR_VPS_PASSWORD"
		click_button "signin"
	end

	def portal
		select('YOUR_VPS_ID',
	      		:from => 'idbox_store_id')
		select('yesterday', :from => 'preSelectedPeriod')
		first('.line-item-links')
			.click_link("report show")
	end

	def report
		select(:xpath, "//*[@class='totals']") do
		  puts "send product"+all('td')[1].text
		  puts "sales:"+all('td')[2].text
		  puts "affiriate"+all('td')[3].text
		end
	end

  end
end

crawler = Crawlar::Vps.new
crawler.login
crawler.portal
crawler.report
