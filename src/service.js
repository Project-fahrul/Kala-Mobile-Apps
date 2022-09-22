import axios from "axios"
import vueCookie from "vue-cookies"

const instance = axios.create({
    // baseURL: 'http://103.63.25.154:8080',
    baseURL: "http://localhost:8080",
    timeout: 1000,
    headers: { 'Content-type': 'application/json' }
});

const api = {
    async addCutomer(params){
        let token = await vueCookie.get("token")
        let ret = {
            status: true
        }
        await instance.post("/customer", params, {
            headers: {
                "Authorization": token
            }
        }).catch(() => {
            ret.status = false
        });
        return ret.status
    },
    async editCustomer(id, params){
        let token = await vueCookie.get("token")
        let ret = {
            status: true
        }
        await instance.patch(`/customer/${id}`, params, {
            headers: {
                "Authorization": token
            }
        }).catch(() => {
            ret.status = false
        });
        return ret.status
    },
    async deleteCustomer(id){
        let token = await vueCookie.get("token")
        let ret = {
            status: true
        }
        await instance.delete(`/customer/${id}`, {
            headers: {
                "Authorization": token
            }
        }).catch(() => {
            ret.status = false
        });
        return ret.status
    },
    async token() {
        return await vueCookie.get("token")
    },
    async login(email, password) {
        let ret = {}
        let data = await instance.post("/auth", {
            email: email,
            password: password
        }).catch((e) => {
            ret.status = false
            ret.message = e.response.data.message
        });

        if (data == undefined) {
            return ret
        }
        if (data.data.data.role != "sales") {
            return {
                status: false,
                message: "Your account not allowed"
            }
        }
        ret.status = true
        await vueCookie.set("token", data.data.data.token)
        return ret
    },
    async me(token) {
        let res = {
            status: true
        }
        let data = await instance.get("/me", {
            headers: {
                "Authorization": token
            }
        }).catch(() => {
            res.status = false
        })

        res.data = data.data.data
        return res
    },
    async checkEmail(email) {
        let data = await instance.post("/user/email", {
            email: email
        }).catch(() => {
            return {
                status: false
            }
        })

        return {
            status: true,
            data: data.data.data
        }
    },
    async changePassword(email, password) {
        await instance.patch("/user/change-password", {
            email: email,
            password: password
        }).catch(() => {
            return {
                status: false
            }
        })
        return {
            status: true
        }
    },
    async listCustomer(offset){
        let token = await vueCookie.get("token")
        let data = await instance.get(`/customer/sales?sales=${offset}`,{
            headers: {
                "Authorization": token
            }
        }).catch(()=>[])
        if(data.data.status)
            return data.data.data
        return []
    },
    async getCustomerByID(id){
        let token = await vueCookie.get("token")
        let data = await instance.get(`/customer/${id}`,{
            headers: {
                "Authorization": token
            }
        }).catch(()=>[])
        if(data.data.status)
            return [data.data.data]
        return []
    },
    async listAllNotification(){
        let token = await vueCookie.get("token")
        let data = await instance.get("/notif",{
            headers: {
                "Authorization": token
            }
        }).catch(()=>[])
        if(data.data.status)
            return data.data.data
        return []
    },
    async uploadEvidance(formData){
        let res = true
        let token = await vueCookie.get("token")
        await instance.post("/evidance", formData,{
            headers: {
                "Authorization": token
            }
        }).catch(()=>{
            res = false
        })

        return res
    }
}

export default api