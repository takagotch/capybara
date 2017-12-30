require 'capybara'
require 'capybara/dsl'
require 'capybara-webkit'

Capybara.default_selector = :xpath
Capybara.default_driver   = :selenium

Capybara.app_host = 
	"http://www.contaract.reins.or.jp/search/displayAreaConditionBLogic.do"

module Spider
  class Reins
    include Capybara::DSL
    def initalize()
      @page = []
      @current_page = 0
    end

    def crawle
      visit('')

      select('osaka', :from => 'prefCodeA')
      select('osakanorth', :from => 'areaCodeA')
      click_on('search')

      page.driver.browser.switch_to.alert.accept

      get_pages

      for i in 1..@pages.size-1
        scrape
	page_change(i)
      end
    end

    def scrape
      all("//*[@id='data05']/div[2]/table/tbody/tr").each {|element|
        
        if element.text !~ /^hankyu/
	  puts element.text
	end
      }
    end

    def get_pages
      all("//*[@id='data05']/div[2]/table/tbody/tr").each {|element|
        @page.push(element.text)
      }
    end

    def page_change(page_no)
      select(@pages[page_no], :form => 'listPageNum')
    end
  end
end

spider = Spider::Rains.new
spider.crawle

