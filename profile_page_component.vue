<template>
  <div>
<h1>Profile Info</h1>
<p> Device Name:{{device_name}} Location:{{location}} threshold:{{threshold}} SMS Recipient:{{sms_recipient}} </p>
<b-container fluid>
  <b-row class="my-1">
    <b-col sm="2">
      <label for="input-small">Device Name:</label>
    </b-col>
    <b-col sm="10">
      <b-form-input v-model="new_device_name" id="input-small" type="text" />
    </b-col>
  </b-row>

  <b-row class="my-1">
    <b-col sm="2">
      <label for="input-default">Location:</label>
    </b-col>
    <b-col sm="10">
      <b-form-input v-model="new_location" id="input-default" type="text" />
    </b-col>
  </b-row>

  <b-row class="my-1">
    <b-col sm="2">
      <label for="input-large">Threshold:</label>
    </b-col>
    <b-col sm="10">
      <b-form-input v-model="new_threshold"  id="input-large" type="text" />
    </b-col>
  </b-row>
  <b-row class="my-1">
    <b-col sm="2">
      <label for="input-sms">SMS Recipient:</label>
    </b-col>
    <b-col sm="10">
      <b-form-input v-model="new_sms"  id="input-sms" type="text" />
    </b-col>

  </b-row>
<b-button v-on:click="collect_temp" variant="primary">Save</b-button>
</b-container>

</div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'Profile',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      device_name:'',
      location:'',
      threshold:'',
      sms_recipient:'',
      new_device_name:'',
      new_location:'',
      new_threshold:'',
      new_sms:'',
      log_violations:[]
    }
  },
  methods :{
   collect_temp: function() {
    var query = 'http://localhost:8080/sky/event/FURPSPGhVg1of8yrZfyoUK/19/sensor/profile_updated?new_deviceName='+this.new_device_name + '&new_location=' + this.new_location + '&new_threshold=' + this.new_threshold + '&new_recipient='+ this.ne
w_sms;
 console.log(query,'this is my query');
 axios.get(query).then(console.log('sent_query'));
  }
},
  mounted(){
  axios
   .get('http://localhost:8080/sky/cloud/FURPSPGhVg1of8yrZfyoUK/sensor_profile/get_deviceName')
   .then(response => (this.device_name=response.data))
  axios.get('http://localhost:8080/sky/cloud/FURPSPGhVg1of8yrZfyoUK/sensor_profile/get_location')
        .then(response=>(this.location=response.data))
  axios.get('http://localhost:8080/sky/cloud/FURPSPGhVg1of8yrZfyoUK/sensor_profile/get_location')
        .then(response=>(this.location=response.data))
  axios.get('http://localhost:8080/sky/cloud/FURPSPGhVg1of8yrZfyoUK/sensor_profile/get_threshold')
        .then(response=>(this.threshold=response.data))
  axios.get('http://localhost:8080/sky/cloud/FURPSPGhVg1of8yrZfyoUK/sensor_profile/get_sms_recipient')
        .then(response=>(this.sms_recipient=response.data))
 }
}
</script>
