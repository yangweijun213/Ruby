require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在
require 'test/unit'

#加载默认路径引入公共类
require File.expand_path('../../utility/StringUtils',__FILE__)
require File.expand_path('../../utility/LogUtils',__FILE__)

#define class Agreement Search
class ColAgreementDetailsAgreementSearch
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
  
  #go to Colline Agreement Search
  def goToColAgreementSearch (checkpoint)
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    $browser.div(:text => "Collateral").fire_event('onmouseover')
    sleep(1)
    $browser.div(:text => "Agreement Details").fire_event('onmouseover')
    sleep(1)
    $browser.div(:text => "Agreement Search").click

    # Page check - "Collateral - Agreement Search"
    assert_equal( "#{checkpoint}", checkpoint)
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

  #agreement Search By SystemId
  def agreementSearchBySystemId(systemId,checkpoint)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    systemId=id
    $browser.text_field(:id => 'systemId').set '#{systemId}'
    sleep(2)
    $browser.button(:id, 'submit').click

    # Page check - "Agreementid:12101"
    assert_equal( "#{checkpoint}", checkpoint)
    if $browser.text.include?("#{checkpoint}")
      $logger.info("#{@transactionName}: Test Passed. Found the test string: 'Agreementid:12101'.Actual Results match Expected Results.")
    else
      $logger.error("#{@transactionName}: Test Failure")
      $browser.screenshot.save "#{@transactionName}_#{StringUtils.new().getStrftime()}.png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{@httpWatch_report}\\#{@transactionName}_#{StringUtils.new().getStrftime()}.csv","#{@httpwatch_fieldList}")
  end

end