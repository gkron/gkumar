module RestfulServices
  require 'uri'
  #require 'httparty'
  require 'json'

  def lookup(rule_name)
    @url="http://11.120.101.251:8282/rules/service/v1/rule"
    post_xml =<<-HEREDOC
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ns8:createMerchRule xmlns="www.macys.com/entity/identifier" xmlns:ns2="www.macys.com/meta/audit" xmlns:ns3="www.macys.com/entity/tenant" xmlns:ns4="www.macys.com/entity/merchrule" xmlns:ns5="www.macys.com/entity/merchrule/merchtrigger" xmlns:ns6="www.macys.com/entity/merchrule/merchtriggergroup" xmlns:ns7="www.macys.com/entity/merchrule/merchaction" xmlns:ns8="www.macys.com/stars/saturn/service/merchrule" xmlns:ns9="www.macys.com/entity/merchrule/merchtrigger/keyword" xmlns:ns10="www.macys.com/entity/merchrule/merchtrigger/resultsset" xmlns:ns11="www.macys.com/entity/merchrule/merchtrigger/pdm" xmlns:ns12="www.macys.com/entity/merchrule/merchtrigger/contextAttribute" xmlns:ns13="www.macys.com/entity/merchrule/merchtrigger/facetrefine" xmlns:ns14="www.macys.com/entity/merchrule/merchtrigger/resultcount" xmlns:ns15="www.macys.com/entity/merchrule/merchaction/catredirect" xmlns:ns16="www.macys.com/entity/merchrule/merchaction/displayFacet" xmlns:ns17="www.macys.com/entity/merchrule/merchaction/displaymastersmembers" xmlns:ns18="www.macys.com/entity/merchrule/merchaction/displaymedia" xmlns:ns19="www.macys.com/entity/merchrule/merchaction/displaymessage" xmlns:ns20="www.macys.com/entity/merchrule/merchaction/facetvalue" xmlns:ns21="www.macys.com/entity/merchrule/merchaction/modifyResultSet" xmlns:ns22="www.macys.com/entity/merchrule/merchaction/newsearch" xmlns:ns23="www.macys.com/entity/merchrule/merchaction/pdpredirect" xmlns:ns24="www.macys.com/entity/merchrule/merchaction/rdpp" xmlns:ns25="www.macys.com/entity/merchrule/merchaction/urlredirect">
    <ns4:merchRule>
        <ns4:merchRuleIdentifier>
            <name>testing 2014 Aug 13 16:17</name>
            <ns2:auditContext>
                <ns2:createdTimestamp>2014-08-13T16:18:32.716-03:00</ns2:createdTimestamp>
                <ns2:createdBy>superbauser</ns2:createdBy>
                <ns2:updatedTimestamp>2014-08-13T16:18:32.717-03:00</ns2:updatedTimestamp>
                <ns2:updatedBy>superbauser</ns2:updatedBy>
            </ns2:auditContext>
            <ns3:tenant>
                <ns3:tenantType>
                    <ns3:tenantTypeEnum>MCOM</ns3:tenantTypeEnum>
                </ns3:tenantType>
                <ns3:tenantDescription>MCOM</ns3:tenantDescription>
            </ns3:tenant>
        </ns4:merchRuleIdentifier>
        <ns4:merchRuleName>#{rule_name}</ns4:merchRuleName>
        <ns4:merchRuleDesc>meh</ns4:merchRuleDesc>
        <ns4:merchRuleTriggerCombinationIndicator>A</ns4:merchRuleTriggerCombinationIndicator>
        <ns4:merchRuleStartDate>2014-08-13-03:00</ns4:merchRuleStartDate>
        <ns4:merchRuleEndDate>2014-08-13-03:00</ns4:merchRuleEndDate>
        <ns4:merchRuleState>
            <ns4:ruleState>Draft</ns4:ruleState>
        </ns4:merchRuleState>
        <ns5:merchTriggerIdentifierList>
            <ns5:merchTriggerIdentifiers>
                <id xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xsi:type="xs:long">148959</id>
                <name>2014-08-13T16:18:32.718-03:00</name>
                <ns2:auditContext>
                    <ns2:createdTimestamp>2014-08-13T16:18:32.718-03:00</ns2:createdTimestamp>
                    <ns2:createdBy>superbauser</ns2:createdBy>
                    <ns2:updatedTimestamp>2014-08-13T16:18:32.718-03:00</ns2:updatedTimestamp>
                    <ns2:updatedBy>superbauser</ns2:updatedBy>
                </ns2:auditContext>
                <ns3:tenant>
                    <ns3:tenantType>
                        <ns3:tenantTypeEnum>MCOM</ns3:tenantTypeEnum>
                    </ns3:tenantType>
                    <ns3:tenantDescription>MCOM</ns3:tenantDescription>
                </ns3:tenant>
            </ns5:merchTriggerIdentifiers>
        </ns5:merchTriggerIdentifierList>
        <ns6:merchTriggerGroupList/>
        <ns7:merchActionIdentifierList/>
        <ns4:merchPublishFlag>false</ns4:merchPublishFlag>
        <ns4:merchRulePriority>
            <ns4:priority>65</ns4:priority>
        </ns4:merchRulePriority>
        <ns4:navigationType>Browse</ns4:navigationType>
    </ns4:merchRule>
</ns8:createMerchRule>
HEREDOC
    $ruby_obj=JSON.parse(
    HTTParty.post(
@url,
headers: {
'Content-Type' => 'text/xml',
'Accept' => 'application/json'
},
body: post_xml
).body )
  end
end


