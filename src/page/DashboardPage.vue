<template>
    <div>
        <AppHeader :clbk="sidebar"></AppHeader>
        <NotificationComp v-if="side === 0"></NotificationComp>
        <CustomersComp v-if="side === 1"></CustomersComp>
    </div>
</template>

<script>
import AppHeader from "@/components/AppHeader.vue";
import NotificationComp from "@/components/NotificationComp.vue";
import CustomersComp from "@/components/CustomersComp.vue";

export default{
    data(){
        return{
            side: 0
        }
    },
    methods:{
        sidebar(no){
            this.side = no
        }
    },  
    components:{
    AppHeader,
    NotificationComp,
    CustomersComp
}
}
</script>