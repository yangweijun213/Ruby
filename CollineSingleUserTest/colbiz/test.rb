require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

ie = Watir::IE.new
ie.goto('http://54.193.33.252:8080/colline/')
ie.text_field(:name, 'j_username').set('sa3')
ie.text_field(:id, 'j_password').set('password')
ie.button(:name, 'submit').click
sleep(2)

ie.div(:text => "Collateral", :id => "oM_m6").fire_event('onmouseover')
sleep(2)
ie.div(:text => "Agreement Details").fire_event('onmouseover')
sleep(2)
ie.div(:text => "Agreement Search").click
sleep(10)
puts ie.text.include?("Collateral - Agreement Search")

ie.text_field(:id => 'systemId').set '12102'
ie.button(:id, 'submit').click

