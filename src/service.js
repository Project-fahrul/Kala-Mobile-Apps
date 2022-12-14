import axios from "axios"
import vueCookie from "vue-cookies"

const instance = axios.create({
    baseURL: 'http://103.63.25.154:8080',
    // baseURL: "http://localhost:8080",
    timeout: 60000,
    headers: { 'Content-type': 'application/json' }
});

const api = {
     async forgotPassword(email){
        let data = {
            status: true
        };

         await instance.post("/user/forgot-password", {
            email: email,
        }).catch(()=>{
            data.status = false
        })


        return data.status
    },
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
            console.log(e);
            if(!e.response.data){
                ret.status = false
                ret.message = e.message
                return
            }
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
        let res = {
            status: true
        }
        let data = await instance.post("/user/email", {
            email: email
        }).catch(() => {
            
                res.status= false
            
        })

    
            res.data = data.data.data
            return res
        
    },
    async changePassword(email, password) {
        let status = true
        await instance.patch("/user/change-password", {
            email: email,
            password: password
        }).catch(() => {
           status = false
        })
        return {
            status: status
        }
    },
    async listCustomer(page){
        let token = await vueCookie.get("token")
        let data = await instance.get(`/customer/sales?page=${page}`,{
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