<template>
    <v-app>
      <router-view />
    </v-app>
</template>


<script>

  import {App} from "@capacitor/app"
  import { Device } from '@capacitor/device';

  export default {
    async mounted() {
      if((await Device.getInfo()).platform == "android"){
        App.addListener("backButton", ()=>{
          let n = this.$router.currentRoute.value.name
          if(n == "Home" || n == "Onboarding"){
            App.exitApp()
          }else{
            this.$router.back()
          }
        })
      }
    }
  }
</script>