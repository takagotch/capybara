#'capybara/rspec'
require 'capybara/rspec'

Capybara.default_driver = :selenium

feature '' do
  scenario '' do
    visit ''
    fill_in()
    click_button('')
  end
end

#'capybara'
require 'capybara'

Capybara.default_driver = :selenium

class CapybaraSampleClass
  include Capybara::DSL

  def sample_method
    visit 'http://example.selenium.jp/reserveApp'
    fill_in('guestname', with: 'sample-user')
    click_button('goto_next')
  end
end

sample = CapybaraSampleClass.new
sample.sample_method

#click lists
click_buttton('save')
click_link('root')
click_on('on')
