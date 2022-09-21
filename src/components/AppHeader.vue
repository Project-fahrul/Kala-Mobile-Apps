<template>
    <div class="position-relative">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Kala Apps</a>
                <button class="btn" type="button" @click="sidebar">
                    <font-awesome-icon icon="bars" style="color: #fff;"></font-awesome-icon>
                </button>
            </div>
        </nav>
        <sidebar id="sidebar" class="sidebar">
            <div class="wrapper">
                <button class="btn" @click="sidebar">X</button>
                <p>Halo,</p>
                <h1 class="name">{{myname}}</h1>
            </div>
            <div class="panel">
                <ul>
                    <li class="active" @click="action(0)">
                        <font-awesome-icon icon="bell" class="icon" />
                        <span class="action">Notification</span>
                    </li>
                    <li @click="action(1)">
                        <font-awesome-icon icon="people-group" class="icon" />
                        <span class="action">Customer</span>
                    </li>
                    <li class="logout" @click="logout">
                        <font-awesome-icon icon="sign-out" class="icon" />
                        <span class="action">Logout</span>
                    </li>
                </ul>
            </div>
        </sidebar>
    </div>
</template>


<script>
import userStore from '@/storage/userStorage';
import api from '@/service';
export default {
    props: {
        clbk: {
            type: Function,
            required: true
        }
    },
    methods: {
        sidebar() {
            let sidebar = document.getElementById("sidebar")
            if (sidebar.style.right == "0px" && sidebar.style.right != "") {
                sidebar.style.right = "-400px";
            } else {
                sidebar.style.right = "0px"
            }
        },
        action(no) {
            let li = document.querySelectorAll(".sidebar li")
            Array.from(li).forEach(e => {
                e.classList.remove("active")
            });
            this.sidebar()
            li.item(no).classList.add("active")
            this.clbk(no)
        },
        logout() {
            this.$cookies.remove("token")
            this.$router.push("/")
        }
    },
    async mounted() {
        if (userStore.state.name == "") {
            let token = this.$cookies.get("token")
            let res = await api.me(token)
            if (res.status) {
                userStore.creator.name(res.data.name)
            }
        }
    },
    computed: {
        myname: () => userStore.state.name
    }
}
</script>