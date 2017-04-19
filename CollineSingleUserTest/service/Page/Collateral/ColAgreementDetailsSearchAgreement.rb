require 'rubygems'
require 'win32ole'
require 'watir-classic'  #watir和watir-classic不能同时存在

#加载默认路径引入公共类
require File.expand_path('../../utility/lib/Common',__FILE__)
require File.expand_path('../../utility/lib/Logger',__FILE__)

#define class Agreement Search
class ColAgreementDetailsAgreementSearch
  def initialize (transactionName,httpWatch_report,httpwatch_fieldList)
    @transactionName = transactionName
    @httpWatch_report = httpWatch_report
    @httpwatch_fieldList = httpwatch_fieldList
  end

  #define method goToColAgreementSearch
  def goToColAgreementSearch

    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach($ie.ie)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    $ie.div(:text => "Collateral").fire_event('onmouseover')
    sleep(1)
    $ie.div(:text => "Agreement Details").fire_event('onmouseover')
    sleep(1)
    $ie.div(:text => "Agreement Search").click

    # Page check
    if $ie.text.include?("Collateral - Agreement Search")
      $logger.info("#{@transactionName}: Test Passed. Found the test string: 'Collateral - Agreement Search'.Actual Results match Expected Results.")
    else
      $logger.error("#{@transactionName}: Test Failure")
      $ie.screenshot.save "#{@transactionName}_Common.new().getStrftime().png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{@httpWatch_report}\\#{@transactionName}_#{Common.new().getStrftime()}.csv","#{@httpwatch_fieldList}")
  end

  #define method agreementSearchBySystemId
  def agreementSearchBySystemId(id)

    # Attach HttpWatch
    $control = WIN32OLE.new('HttpWatch.Controller')
    $plugin = $control.IE.Attach($ie.ie)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    systemId=id
    $ie.text_field(:id => 'systemId').set '#{systemId}'
    sleep(2)
    $ie.button(:id, 'submit').click

    # Page check
    if $ie.text.include?("Agreementid:12101")
      $logger.info("#{@transactionName}: Test Passed. Found the test string: 'Agreementid:12101'.Actual Results match Expected Results.")
    else
      $logger.error("#{@transactionName}: Test Failure")
      $ie.screenshot.save "#{@transactionName}_Common.new().getStrftime().png"
    end

    # Stop recording
    $plugin.Stop()
    #Exports a specified list of data fields in CSV (Comma-Separated Values) format
    $plugin.Log.ExportFieldsAsCSV("#{@httpWatch_report}\\#{@transactionName}_#{Common.new().getStrftime()}.csv","#{@httpwatch_fieldList}")
  end

end