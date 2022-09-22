<template>
    <div>
        <LoginComp></LoginComp>
    </div>
</template>

<script>
import api from '@/service';
import LoginComp from '../components/LoginComp.vue';
import userStore from '@/storage/userStorage';
export default {
    methods: {
        
    },
    components: {
        LoginComp
    },
    async mounted(){
        let token = this.$cookies.get("token")
        if(token){
            let res = await api.me(token)
            if(res.status){
                userStore.creator.name(res.data.name)
                userStore.creator.id(res.data.id)
                this.$router.push("/home")
            }
        }
    }
}
</script>