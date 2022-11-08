<template>
  <v-app>
    <router-view />
  </v-app>
</template>


<script>

import { App } from "@capacitor/app"
import { Device } from '@capacitor/device';
import {
  PushNotifications,
} from '@capacitor/push-notifications';

import{LocalNotifications} from "@capacitor/local-notifications"

export default {
  methods: {
    async activevated() {
      await LocalNotifications.requestPermissions()
    
      PushNotifications.requestPermissions().then(result => {
        if (result.receive === 'granted') {
          // Register with Apple / Google to receive push via APNS/FCM
          PushNotifications.register();
        } else {
          // Show some error
          console.log("error");
        }
      });

      PushNotifications.addListener('registration', () => {
        // alert('Push registration success, token: ' + token.value);
      });

      PushNotifications.addListener('registrationError', (error) => {
        alert('Error on registration: ' + JSON.stringify(error));
      });

      PushNotifications.addListener(
        'pushNotificationReceived',
        () => {
          LocalNotifications.schedule({
            notifications: [
              {
                title: "Kalla Astra",
                body: "Anda memiliki evidance yang belum dikerjakan",
                id: 1,
                schedule: { at: new Date(Date.now() + 1000 * 2) },
              }
            ]
          });
        },
      );

      PushNotifications.addListener(
        'pushNotificationActionPerformed',
        () => {
          // alert('Push action performed: ' + JSON.stringify(notification));
        },
      );
    }
  },
  async mounted() {
    if ((await Device.getInfo()).platform == "android") {

      App.addListener("backButton", () => {
        let n = this.$router.currentRoute.value.name
        if (n == "Home" || n == "Onboarding") {
          App.exitApp()
        } else {
          this.$router.back()
        }
      })
    }
  }
}
</script>