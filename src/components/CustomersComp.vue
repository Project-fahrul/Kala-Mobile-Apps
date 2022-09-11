<template>
    <div class="body">
        <h1 class="title">Customers</h1>
        <div>
            <p class="sub">Daftar Customer</p>
            <div class="wrapper">
                <div class="cus-wrap">
                    <div class="d-flex content" v-for="(d,i) in customer" :key="i">
                        <div>
                            <h5>{{d.name}}</h5>
                            <p class="message">{{d.type}}</p>
                        </div>
                        <button class="btn" @click="show(d.id)">
                            <span>Lihat</span>
                        </button>
                    </div>
                </div>
                <div class="cus-page">
                    <button class="btn disabled">Prev</button>
                    <p class="btn">1/1</p>
                    <button class="btn disabled">Next</button>
                </div>
            </div>
        </div>
    </div>
    <ModelViewCustomer :customer="model"></ModelViewCustomer>
</template>


<script>
import bootstrap from "bootstrap/dist/js/bootstrap.min.js"
import ModelViewCustomer from './ModelViewCustomer.vue';
import api from "../service";

import Customer from "../storage/customerStore"

export default {
    components: {  ModelViewCustomer },
    data(){
        return {
            model: []
        }
    },  
    methods: {
        show: async function (id) {
            this.model = []
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            })
            myModal.toggle();
            let cus = await api.getCustomerByID(id)
            this.model = cus
        }
    },
    async mounted(){
        if(Customer.state.customers.length == 0){
            let data = await api.listCustomer(0)

            let composeCustomer =data.map(e=>{
                return {
                    id: e.id,
                    name: e.name,
                    type: e.type_kendaraan
                }
            })
            Customer.creator.customers(composeCustomer)
        }
    },  
    computed:{
        customer:()=>{
            let {state} = Customer
            return state.customers
        }
    }
}
</script>