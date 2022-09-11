<template>
    <div class="body">
        <h1 class="title">Notification</h1>
        <div>
            <p class="sub">Daftar Evidance</p>
            <div class="wrapper">
                <div class="d-flex content" v-for="(n,i) in notif" :key="i" >
                    <div>
                        <h5>{{n.customer_name}}</h5>
                        <p class="message">{{n.message}}</p>
                    </div>
                    <button class="btn" @click="show(n.sales_id, n.customer_id, n.type, n.customer_name)">
                        <font-awesome-icon icon="arrow-right" class="icon" />
                    </button>
                </div>
            </div>
        </div>
    </div>
    <ModelSendEvidance :model="model" :name="name" :type="type" :sales="sales_id" :customer="customer_id"></ModelSendEvidance>
</template>


<script>
import ModelSendEvidance from './ModelSendEvidance.vue';
import bootstrap from "bootstrap/dist/js/bootstrap.min.js"
import api from "../service";
import notifStorage from "../storage/notificationStorage"

export default {
    components: { ModelSendEvidance },
    methods: {
        show: function (sales, customer, type, name) {
            this.model = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            })
            this.model.toggle();

            this.sales_id = sales
            this.customer_id = customer
            this.type = type
            this.name = name
        }
    },
    async mounted(){
        let notif = await api.listAllNotification()
        notifStorage.creator.notifications(notif)
    },
    data(){
        return {
            sales_id: 0,
            customer_id: 0,
            type: "",
            name: "",
            model: null
        }
    },
    computed: {
        notif: () => notifStorage.state.notifications
    }
}
</script>