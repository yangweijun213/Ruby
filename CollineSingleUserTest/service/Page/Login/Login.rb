require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../utility/lib/Common',__FILE__)
require File.expand_path('../../utility/lib/Logger',__FILE__)

#define class Login
class Login
  def initialize (transactionName,httpWatch_report,httpwatch_fieldList)
    @transactionName = transactionName
    @httpWatch_report = httpWatch_report
    @httpwatch_fieldList = httpwatch_fieldList
  end

  #define method start
  def start ()
    $ie = Watir::IE.new
    $logger = Logger.new().getLogger()
  end

  #define method openPage
  def openPage (url)

    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach($ie.ie)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    $ie.goto("#{url}")

    # Page check
    if $ie.text.include?("Login")
      $logger.info("#{@transactionName}: Test Passed. Found the test string: 'Login '.Actual Results match Expected Results.")
    else
      $logger.error("#{@transactionName}: Test Failure")
      $ie.screenshot.save "#{@transactionName}_#Common.new().getStrftime().png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{@httpWatch_report}\\#{@transactionName}_#{Common.new().getStrftime()}.csv","#{@httpwatch_fieldList}")
  end

  #define method login
  def login (uname,password)

    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    #Setting a text field
    $ie.text_field(:name, "j_username").set "#{uname}"
    $ie.text_field(:name, "j_password").set "#{password}"

    #Clicking a button
    sleep(2)
    $ie.button(:name, "submit").click

    if $ie.title == "Session already exists"
      #Clicking a button Continue
      $ie.button(:name, "continue").click
    end

    #Checking for text in a page
    if $ie.text.include?("Home")
      $logger.info("#{@transactionName}: Test Passed. Found the test string: 'Home '.Actual Results match Expected Results.")
    else
      $logger.info("#{@transactionName}: Test Failure")
      $ie.screenshot.save "#{@transactionName}_#Common.new().getStrftime().png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{@httpWatch_report}\\#{@transactionName}_#{Common.new().getStrftime()}.csv","#{@httpwatch_fieldList}")

  end
end

