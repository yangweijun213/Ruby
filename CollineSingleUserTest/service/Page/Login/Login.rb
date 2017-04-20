require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在
require 'test/unit'

#加载默认路径引入公共类
require File.expand_path('../../utility/StringUtils',__FILE__)
require File.expand_path('../../utility/LogUtils',__FILE__)

#define class Login
class Login < Test::Unit::TestCase
  def initialize (browser,transactionName,httpWatch_report,httpwatch_fieldList)
    @browser = browser
    @transactionName = transactionName
    @httpWatch_report = httpWatch_report
    @httpwatch_fieldList = httpwatch_fieldList
  end

  # test initial
  def start ()
    $logger = Logger.new().getLogger()
    
    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach($browser.ie)
  end

  #open Page
  def openPage (url,checkpoint)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()
    
    #open page
    $browser.goto("#{url}")

    # Page check - checkpoint "login"
    assert_equal( "test", checkpoint)
    if $browser.text.include?("#{checkpoint}") 
      $logger.info("#{@transactionName}: Test Passed. Found the test string: '#{checkpoint}'.Actual Results match Expected Results.")
    else
      $logger.error("#{@transactionName}: Test Failure, can't find checkpoint '#{checkpoint}'")
      $browser.screenshot.save "#{@transactionName}_#{StringUtils.new().getStrftime()}.png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{@httpWatch_report}\\#{@transactionName}_#{StringUtils.new().getStrftime()}.csv","#{@httpwatch_fieldList}")
  end

  #login to home page
  def login (uname,password,checkpoint)

    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    #Setting a text field
    $browser.text_field(:name, "j_username").set "#{uname}"
    $browser.text_field(:name, "j_password").set "#{password}"

    #Clicking a button
    sleep(2)
    $browser.button(:name, "submit").click

    if $browser.title == "Session already exists"
      #Clicking a button Continue
      $browser.button(:name, "continue").click
    end

    #Checking for text in a page - checkpoint "Home"
    assert_equal( "Home", checkpoint)
    if $browser.text.include?("Home")
      $logger.info("#{@transactionName}: Test Passed. Found the test string: '#{checkpoint} '.Actual Results match Expected Results.")
    else
      $logger.info("#{@transactionName}: Test Failure,not found checkpoint '#{checkpoint}'")
      $browser.screenshot.save "#{@transactionName}_#{StringUtils.new().getStrftime()}.png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{$httpWatch_report}\\#{@transactionName}_#{StringUtils.new().getStrftime()}.csv","#{$httpwatch_fieldList}")

  end
end

