<template>
    <div class="container d-flex login">
        <div class="greeting">
            <div class="img">
                <img class="d-block" src="../assets/logo.jpg" alt="kala">
                <img class="d-block" src="../assets/logo1.jpg" alt="kala">
            </div>
            <p>Silahkan masuk ke akun anda</p>
        </div>
        <div  class="alert alert-danger alert-dismissible fade show" role="alert" v-if="alert === true">
            {{message}}
            <button type="button" class="btn-close" aria-label="Close" @click="alrt"></button>
        </div>
        <div>
            <form @submit.prevent="onSubmit">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                    <input type="email" v-model="email" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp">
                </div>
                <div class="mb-3">
                    <div class="lupa">
                        <label for="exampleInputPassword1" class="form-label">Password</label>
                        <router-link to="/forgot-password">Lupa password</router-link>
                    </div>
                    <input type="password" v-model="password" class="form-control" id="exampleInputPassword1" required>
                </div>
                <div v-if="loading == false">
                    <button type="submit" class="btn log">Login</button>
                    <div class="mt-3">
                        <router-link to="/register" class="btn register">Register</router-link>
                    </div>
                </div>
                <div class="loader-wrapper" v-if="loading">
                    <div class="loader"></div>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import service from "../service"
    export default{
        data(){
            return {
                email: "",
                password: "",
                alert: false,
                loading: false,
                message: ""
            }
        },
        methods:{
            async onSubmit(){
                this.alert = false
                this.loading = true
                let res = await service.login(this.email, this.password)
                this.loading = false
                if(!res.status){
                    this.message = res.message
                    this.alert = true
                    return
                }
                this.$router.push("home")
            },
            alrt(){
                this.alert = !this.alert
            }
        }
    }
</script>