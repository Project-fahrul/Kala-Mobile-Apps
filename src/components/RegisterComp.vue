<template>
    <div class="container d-flex login">
        <img class="acent-1" src="../assets/Vector.svg" alt="acent">
        <img class="acent-2" src="../assets/Vector1.svg" alt="acent">

        <div class="greeting">
            <h1>Register</h1>
            <p>Register to enter this app</p>
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
                <div class="mb-3" v-if="enterPswd">
                    <label for="exampleInputPassword1" class="form-label">Password</label>
                    <input type="password" v-model="password" class="form-control" id="exampleInputPassword1" required>
                </div>
                <div v-if="loading == false">
                    <button type="submit" class="btn btn-primary log">Register</button>
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
import service from "../service"
import FooterComp from "./footerComp.vue"
export default {
    data() {
        return {
            email: "",
            password: "",
            alert: false,
            loading: false,
            message: "",
            enterPswd: false,
            step: 0
        };
    },
    methods: {
        async onSubmit() {
            this.alert = false;
            this.loading = true;
            let stat = false;
            if (this.step == 0) {
                stat = await service.checkEmail(this.email);
            }
            else {
                stat = await service.changePassword(this.email, this.password);
            }
            this.loading = false;
            if (!stat.status) {
                this.message = this.step == 0 ? "Invalid email address" : "Change password failed";
                this.alert = true;
                return;
            }
            if (this.step == 0 && stat.data.registered) {
                this.message = "You have registered";
                this.alert = true;
                return;
            }
            if (this.step == 0 && stat.status) {
                this.enterPswd = true;
            }
            if (this.step > 0) {
                this.$router.push("/");
                return;
            }
            this.step++;
        },
        alrt() {
            this.alert = !this.alert;
        }
    },
    components: { FooterComp }
}
</script>