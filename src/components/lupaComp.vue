<template>
    <div class="container d-flex login">
        <img class="acent-1" src="../assets/Vector.svg" alt="acent">
        <img class="acent-2" src="../assets/Vector1.svg" alt="acent">

        <div class="greeting">
            <h1>Lupa Password</h1>
            <p>Masukkan email untuk mendapatkan password sementara</p>
        </div>
        <div class="alert alert-danger alert-dismissible fade show" role="alert" v-if="alert === true">
            {{message}}
            <button type="button" class="btn-close" aria-label="Close" @click="alrt"></button>
        </div>
        <div>
            <form @submit.prevent="onSubmit">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" v-model="email" :disabled="enterPswd" class="form-control"
                        id="exampleInputEmail1" required aria-describedby="emailHelp">
                </div>
                <div v-if="loading == false">
                    <button type="submit" class="btn btn-primary log">Konfirmasi</button>
                    <div class="mt-3">
                        <router-link to="/" class="btn register">Login</router-link>
                    </div>
                </div>
                <div class="loader-wrapper" v-if="loading">
                    <div class="loader"></div>
                </div>
            </form>
        </div>
    </div>
    <FooterComp></FooterComp>
</template>

<script>
    import service from '@/service'
import FooterComp from "./footerComp.vue"
export default {
    data() {
        return {
            email: "",
            alert: false,
            loading: false,
            message: "",
        };
    },
    methods: {
        async onSubmit() {
            this.alert = false;
            this.loading = true;
            let res = await service.forgotPassword(this.email)
            if (!res){
                this.loading = false
                this.alert = true
                this.message = "Terjadi kesalahan atau email tidak dikenal"
                return   
            }
            this.loading = false
            this.alert = true
            this.message = "Berhasil mengirim password sementara. Lihat email dan login kembali"
        },
        alrt() {
            this.alert = !this.alert;
        }
    },
    components: { FooterComp }
}
</script>