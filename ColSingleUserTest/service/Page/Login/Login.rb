require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../../../core/utils/StringUtils',__FILE__)
require File.expand_path('../../../../core/utils/LogUtils',__FILE__)
require File.expand_path('../../../../core/utils/TimeUtils',__FILE__)

#define class Login
class Login 
  def initialize (browser,url,uname,pwd)
    @browser = browser
    @url = url
    @uname = uname
    @pwd = pwd
  end

  # test initial
  def start ()
    $logger = LogUtil.new().getlogger($auto_log)
    
    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach(@browser.ie)
  end

  #open Page
  def open_page (transaction_name,checkpoint)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()
    
    #open page
    @browser.goto("#{@url}")

    # Page check - checkpoint "login"
    if @browser.text.include?("#{checkpoint}") 
      $logger.info("#{transaction_name}: Test Passed. Found the test string: '#{checkpoint}'.Actual Results match Expected Results.")
    else
      $logger.error("#{transaction_name}: Test Failure, can't find checkpoint '#{checkpoint}'")
      @browser.screenshot.save "#{$auto_screenshot}\\#{transaction_name}_#{StringUtils.new().getstrftime()}.png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{$httpWatch_report}\\#{transaction_name}_#{StringUtils.new().getstrftime()}.csv","#{$httpwatch_fieldList}")
  end

  #login to home page
  def login (transaction_name,checkpoint)

    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    #Setting a text field
    @browser.text_field(:name, "j_username").set "#{@uname}"
    @browser.text_field(:name, "j_password").set "#{@pwd}"
    

    #Clicking a button
    sleep(2)
    @browser.button(:name, "submit").click
    

    if @browser.title == "Session already exists"
      #Clicking a button Continue
      @browser.button(:name, "continue").click
    end

    #Checking for text in a page - checkpoint "Home"
    if @browser.text.include?("#{checkpoint}")
      $logger.info("#{transaction_name}: Test Passed. Found the test string: '#{checkpoint} '.Actual Results match Expected Results.")
    else
      $logger.info("#{transaction_name}: Test Failure,not found checkpoint '#{checkpoint}'")
      @browser.screenshot.save "#{$auto_screenshot}\\#{transaction_name}_#{StringUtils.new().getstrftime()}.png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{$httpWatch_report}\\#{transaction_name}_#{StringUtils.new().getstrftime()}.csv","#{$httpwatch_fieldList}")

  end
end

