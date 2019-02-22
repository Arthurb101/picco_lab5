ruleset sensor_profile {
  meta {
    shares __testing, get_deviceName, get_location, get_threshold, get_sms_recipient
    provide get_deviceName, get_location, get_threshold, get_sms_recipient
  }
  global {
    
    
    __testing = { "queries":
      [
      ] , "events":
      [ { "domain": "sensor", "type": "profile_updated", "attrs": ["new_deviceName","new_location","new_threshold", "new_recipient"] }
      ]
    }
    
    get_deviceName = function() {
      result = ent:deviceName;
      result
    }
    
    get_location = function() {
      result = ent:deviceLocation;
      result
    }
    
    get_threshold = function() {
      result = ent:temperature_threshold;
      result
    }
    
    get_sms_recipient = function() {
      result = ent:sms_recipient;
      result
    }
    
  }
  
  rule intialization {
    select when wrangler ruleset_added where event:attr("rids") >< meta:rid
    
    
    fired {
      ent:deviceName := "MySensor";
      ent:deviceLocation := "Provo";
      ent:temperature_threshold := 100;
      ent:sms_recipient := "19188070495";
    }
  }
  
  rule update_sensor_profile {
    select when sensor profile_updated
    
    always {
      ent:deviceName := (event:attr("new_deviceName") != "" && event:attr("new_deviceName") != null) => event:attr("new_deviceName") | ent:deviceName;
      ent:deviceLocation := (event:attr("new_location") != "" && event:attr("new_location") != null) => event:attr("new_location") | ent:deviceLocation;
      ent:temperature_threshold := (event:attr("new_threshold") != "" && event:attr("new_threshold") != null) => event:attr("new_threshold") | ent:temperature_threshold;
      ent:sms_recipient := (event:attr("new_recipient") != "" && event:attr("new_recipient") != null) => event:attr("new_recipient") | ent:sms_recipient;
    }
    
  }
  
}
