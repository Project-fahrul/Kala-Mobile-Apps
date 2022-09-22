import {createRouter, createWebHistory} from "vue-router"
import DashboardPage from "./page/DashboardPage"
import LoginPage from "./page/LoginPage.vue"
import RegisterPage from "./page/RegisterPage.vue"
import LupaPassword from "./page/LupaPage.vue";

const route = [
    {
        path: "/",
        name: "Onboarding",
        component: LoginPage
    },
    {
        path: "/home",
        name: "Home",
        component: DashboardPage
    },
    {
        path: "/register",
        name: "Register",
        component: RegisterPage
    },
    {
        path: "/forgot-password",
        name: "lupa",
        component: LupaPassword
    }
]

let routes = createRouter({
    history: createWebHistory(),
    routes: route,
})

export default routes