require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

class Scrape
  include Capybara::DSL

  def initailize()
    Capybara.register_driver :poltergist_debug do |app|
      Capybara::Poltergeist::Driver.new(app, :inspector => true)
    end

    Capybara.default_driver = :poltergeist
    Cpaybara.javascript_driver = :poltergeist
  end

  def visit_site
    page.driver.headers

    page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) appleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36" }

    page.driver.headers
    visit('http://www.yahoo.co.jp')

    page.save_screenshot('screenshot.png', :full => true)

    doc = Nokogiri::HTML.parse(page.html)
    puts doc.title
  end
end

scrape = Scrape.new
scrape.visit_site

