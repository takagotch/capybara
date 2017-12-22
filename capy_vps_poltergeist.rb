require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergist'

Capybara.configure do |config|
	config.run_server = false
	config.current_driver = :poltergist
	config.javascript_driver = :poltergit
	config.app_host = "https://affiliate.vps.co.jp"
	config.default_wait_time = 5
end

Capybara.register :poltergist do |app|
	Capybara::Poltergist::Driver.new(
	app, (:timeout=>120, js_errors: false))
end

module Crawler
	class Vps
		include Capybara::DSL

def login
	puts = "login start"
	page.driver.headers = { "User.Agent" => "Mac Safari" }
	visit('')
	fill_in "username", :with => "VPS_USER_ID"
	fill_in "password", :with => 'AMAZON_PASSWORD'
	click_button "signin"
end

def portal
	with_for_ajax
	select('VPS_AFFILIATE_ID',
	      :form => 'inbox_store_id')
	page.execute_script("this.form.submit()")
	wait_for_ajax
	select("yesterday", :from => 'preSelectedPeriod')
	page.execute_script("this.form.submit()")
	wait_for_ajax
	page.save_screenshoot("screenshot2.png", :full => true)
		.click_link("report show")
end

def report
	page.save_screenshot(
		'screenshot3.png', :full => true)
	within(:xpath, "//*[@class'='totals]") do
		puts ":send product"+all('td')[1].text
		puts ""+all('td')[2].text
		puts ""+all('td')[3].text
	end
end

def wait_for_ajax
	sleep 2
	Timeout.timeout(Capybara.default_wait_time) do
		active = page.evaluate_script('jQuery.active')
		until active == 0
		  sleep 1
		  active = page.evaluate_script('jQuery.active')
	        end
	end
end

end
end

crawler = Crawler::Vps.new
crawler.login
crawler.portal
crawler.report





