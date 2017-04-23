############################################################################
#   主要为被测系统的元素集合，一个元素一个方法  #
#   AgreementSearchCriteria元素   #
############################################################################
require 'rubygems'
require 'watir-classic'  #watir和watir-classic不能同时存在

class AgreementSearchCriteria

  #系统主页登陆地址
  #元素名："url地址"
  def goto_agreement_search(transaction_name,checkpoint)
    $plugin.Clear()
    # Start recording
    $plugin.Record()
    
    @browser.div(:text => "Collateral", :id => "oM_m6").fire_event('onmouseover')
    sleep(1)
    @browser.div(:text => "Agreement Details").fire_event('onmouseover')
    sleep(1)
    @browser.div(:text => "Agreement Search").click

    # Page check - "Collateral - Agreement Search"
    sleep(10)
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

  #agreement Search By SystemId
  def agreement_search_by_system_id(transaction_name,checkpoint,systemid)
    #Clear the HttpWatch Log
    $plugin.Clear()
    # Start recording
    $plugin.Record()

    @browser.text_field(:id => 'systemId').set "#{systemid}"
    sleep(2)
    @browser.button(:id, 'submit').click

    # Page check - "12101"
    sleep(5)
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

end