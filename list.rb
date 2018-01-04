visit

click_link('id-of-link')
click_link('Link Text')
click_button('Save')
click_on('Link Text')
click_on('Button Value')

fill_in('First Name', :with => 'John')
fill_in('Password', :with => 'Seekrit')
fill_in('Description', :with => 'Really Long Text...')
choose('A Radio Button')
check('A Checkbox')
uncheck('A Checkbox')
attach_file('Image', '/path/to/image.jpg')
select('Option', :from => 'Select Box')

page.has_selector?('table tr')
page.has_selector?(:xpath, '//table/tr')
page.has_xpath?('//table/tr')
page.has_css?('table tr.foo')
page.has_content?('foo')

find_field('First Name').value
find_lin('Hello').visible?
find_button('Send').click
find(:xpath, "//table/tr").click
find("#overlay").find("h1").click
all('a').each{|a| a[:href]}

#scope
within("li#employee") do
  fill_in 'Name', :with => 'Jimmy'
end

within(:xpath, "//li[@id='employee']") do
  fill_in 'Name', :with => 'Jimmy'
end

page.execute_script("$('body').empty()")

save_and_open_page
print page.html
page.save_screenshot('screenshot.png')

#Capybara.default_driver = :selenium
RackTest
capybara-mechanize
Selenium
Capybara-webkit
Poltergeist



