require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'URI'

Capybara.current_driver = :selenium
Capybara.app_host = "http://www.yahoo.co.jp/"
Capybara.default_wait_time = 30

module Crawler
	class LinkChecker
		include Capybara::DSL

		def initialize()
			visit('')
		end

		def find_links
			@links = []
			all('a').each do |a|
			next if u.nil? or u.empty?
			@links << u
			break if @links.size >= 10
		end

		def screenshot(link)
			puts link
			visit(link)
			page.save_screenshot("screenshot.png")
		end
	end
end

base = URI.parse(Capybara.app_host)
crawler = Crawler::LinkChecker.new
links = crawler.find_links
  if URI.parse{(link).host == base.host then
	  crawler.screenshot(link)
  end
}

