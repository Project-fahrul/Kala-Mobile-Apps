<template>
    <div class="body">
        <h1 class="title">Customers</h1>
        <div>
            <p class="sub"><span class="d-inline-block">Daftar Customer</span> <span
                    class="d-inline-block" @click="tambahkan">Tambahkan</span></p>
            <div class="wrapper">
                <div class="cus-wrap">
                    <div class="d-flex content" v-for="(d,i) in customer" :key="i">
                        <div>
                            <h5>{{d.name}}</h5>
                            <p class="message">{{d.type}}</p>
                        </div>
                        <div class="dropdown">
                        <button class="btn aksi dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Pilih
                        </button>
                        <ul class="dropdown-menu action-btn">
                            <li><button class="btn" @click="show(d.id)">Lihat</button></li>
                            <li><button class="btn mt-3 mb-3" @click="edit(d.id)">Edit</button></li>
                            <li><button class="btn" @click="del(d.id)">Hapus</button></li>
                        </ul>
                        </div>
                    </div>
                    <div class="mb-3" v-if="customer == null || customer.length == 0">
                        <div class="empty">
                        <font-awesome-icon icon="user" class="empty-icon" />
                        <p>Belum ada customer ditambahkan</p>
                    </div>
                    </div>
                </div>
                
    <div class="cus-page">
        <button @click="prev" class="btn" :class="[isPrevActive ? 'page-evidance' : 'disabled']">Prev</button>
        <p class="btn page-evidance">{{page}}/{{pages == 0 ? 1 : pages}}</p>
        <button @click="next" class="btn" :class="[isNextActive ? 'page-evidance' : 'disabled']">Next</button>
    </div>
            </div>
        </div>
    </div>
    <ModelViewCustomer :customer="model"></ModelViewCustomer>
    <div class="modal fade" id="tambahModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{isEdit ? 'Edit' : 'Tambah'}} Customer</h5>
                        <button type="button" class="btn cc" data-bs-dismiss="modal" aria-label="Close">
                            X
                        </button>
                    </div>
                    <div v-if="message!=null" class="modal-body">
                        {{message}}
                    </div>
                    <div class="modal-body" v-else>
                        <p class="note">*Masukkan '-', bila dikosongkan</p>
                        <div class="mb-3">
                            <label class="form-label">Nama</label>
                            <input type="text" class="form-control" required v-model="data.name">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Alamat</label>
                            <input type="text" class="form-control" required v-model="data.address">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nomor Hp</label>
                            <input type="text" class="form-control" required v-model="data.phone">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Angsuran</label>
                            <select class="form-select" v-model="data.tipeAngsuran" required>
                                <option selected value="Tunai">Tunai</option>
                                <option value="Kredit">Kredit</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal service selanjutnya</label>
                            <input type="date" class="form-control" required v-model="data.serviceDate">
                        </div>
                        <div class="mb-3" v-if="data.tipeAngsuran == 'Kredit'">
                            <label class="form-label">Tanggal angsuran selanjutnya</label>
                            <input type="date" class="form-control" required v-model="data.angsuranDate">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal jatuh tempo STNK selanjutnya</label>
                            <input type="date" class="form-control" required v-model="data.stnkDate">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal lahir</label>
                            <input type="date" class="form-control" required v-model="data.birthday">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">No rangka</label>
                            <input type="text" class="form-control" required v-model="data.noRangka">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tipe kendaraan</label>
                            <input type="text" class="form-control" required v-model="data.tipeKendaraan">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Total angsuran</label>
                            <input type="number" min="0" max="60" class="form-control" required v-model="data.totalAngsuran">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Leasing</label>
                            <input type="text" class="form-control" v-model="data.leasing" required>
                        </div>
                    </div>
                    <div class="modal-footer" :style="{display: dataDisplaySimpan}">
                        <button type="button" @click="save" class="btn simpan">Simpan</button>
                    </div>
                    <div class="modal-footer" :style="{display: dataDisplayBack}">
                        <button type="button" class="btn simpan" @click="setBack">Kembali</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <FooterComp></FooterComp>
</template>


<script>
import bootstrap from "bootstrap/dist/js/bootstrap.min.js"
import ModelViewCustomer from './ModelViewCustomer.vue';
import api from "../service";

import Customer from "../storage/customerStore"
import FooterComp from "./footerComp.vue";

export default {
    components: { ModelViewCustomer, FooterComp },
    data() {
        return {
            modelIni: null,
            myID : -1,
            model: [],
            isEdit: false,
            idTarget: 0,
            isLoaading: false,
            message: null,
            data: {
                name: "",
                address: "",
                phone: "",
                email: "",
                serviceDate: "",
                angsuranDate: "",
                stnkDate:"",
                birthday: "",
                tipeKendaraan: "",
                leasing: "",
                tipeAngsuran: "Tunai",
                noRangka:"",
                totalAngsuran: 0
            },
            pages: 1,
            page: 1

        }
    },
    watch:{
        // 'data.tipeAngsuran'(n){
        //     if(n == "Tunai"){
        //         this.$refs.angsuran.style.display = 'none';
        //     }else{
        //         this.$refs.angsuran.style.display = 'block';
        //     }
            
        // },
    },
    methods: {
        setBack(){
            this.message=null;
            // if(this.data.tipeAngsuran == "Tunai"){
            //     this.$refs.angsuran.style.display = 'none';
            // }else{
            //     this.$refs.angsuran.style.display = 'block';
            // }
        },
        show: async function (id) {
            this.model = []
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                keyboard: false
            })
            myModal.toggle();
            let cus = await api.getCustomerByID(id)
            this.model = cus
        },
        tambahkan(){
            this.data.name= ""
            this.data.address= ""
            this.data.phone= ""
            this.data.email= ""
            this.data.serviceDate= ""
            this.data.angsuranDate= ""
            this.data.stnkDate=""
            this.data.birthday= ""
            this.data.tipeKendaraan= ""
            this.data.leasing= ""
            this.data.tipeAngsuran= "Tunai"
            this.data.noRangka=""
            this.data.totalAngsuran= 0
            
            this.message = null
            this.isEdit = false;
            this.modelIni.toggle()
        },
        async edit(id){
            this.message = null
            this.idTarget = id
            this.isEdit = true
            let cus = await api.getCustomerByID(id)
            this.model = cus;
            let dec = new Date(cus[0].tgl_dec)
            let angsuran = new Date(cus[0].tgl_angsuran)
            let stnk = new Date(cus[0].tgl_stnk)
            let lahir = new Date(cus[0].tgl_lahir)
            
                this.data.name = cus[0].name,
                this.data.address = cus[0].address,
                this.data.phone = cus[0].no_hp,
                this.data.email = cus[0].email,
                this.data.serviceDate = dec.toISOString().split('T')[0],
                this.data.angsuranDate = angsuran.toISOString().split('T')[0],
                this.data.stnkDate = stnk.toISOString().split('T')[0],
                this.data.birthday = lahir.toISOString().split('T')[0],
                this.data.tipeKendaraan = cus[0].type_kendaraan,
                this.data.leasing = cus[0].leasing,
                this.data.tipeAngsuran = cus[0].angsuran,
                this.data.noRangka = cus[0].no_rangka,
                this.data.totalAngsuran = cus[0].total_angsuran
            
            this.modelIni.toggle()
        },
        cek(n, t){
            let x = t - n;
            x = x / 1000
            return x > 0
        },
        async save(){
            console.log("salalalal1121212")
            this.isLoaading = true
            let res = true
            let service = new Date(this.data.serviceDate),
            lahir = new Date(this.data.birthday),
            stnk = new Date(this.data.stnkDate),
            angsuran = this.data.tipeAngsuran == 'Tunai' ? new Date('2090-04-11T10:20:30Z') : new Date(this.data.angsuranDate) 
            let now = Date.now()

            if(!this.cek(now, service) ||
            !this.cek(now, stnk) || (!this.cek(now, angsuran) && this.data.tipeAngsuran == 'Kredit')){
                console.log("salalalal")
                this.message = "Kesalahan menginput tanggal"
                return
            }
            if(!this.isEdit){
               res = await api.addCutomer({
                    name: this.data.name,
                    address: this.data.address,
                    "no_hp": this.data.phone,
                    "tgl_dec": service,
                    "tgl_lahir": lahir,
                    "tgl_stnk": stnk,
                    "tgl_angsuran": angsuran,
                    "no_rangka": this.data.noRangka,
                    "type_kendaraan": this.data.tipeKendaraan,
                    "leasing": this.data.leasing,
                    "sales_id": this.myID,
                    "type_angsuran": this.data.tipeAngsuran,
                    "total_angsuran": this.data.totalAngsuran
                })
            }else{
                res = await api.editCustomer(this.idTarget, {
                    name: this.data.name,
                    address: this.data.address,
                    "no_hp": this.data.phone,
                    "tgl_dec": service,
                    "tgl_lahir": lahir,
                    "tgl_stnk": stnk,
                    "tgl_angsuran": angsuran,
                    "no_rangka": this.data.noRangka,
                    "type_kendaraan": this.data.tipeKendaraan,
                    "leasing": this.data.leasing,
                    "sales_id": this.myID,
                    "type_angsuran": this.data.tipeAngsuran,
                    "total_angsuran": this.data.totalAngsuran
                })
            }

            this.isLoaading = false
            if(!res){
                this.message = "Terjadi kesalahan, harap coba lagi"
            }else{
            this.modelIni.toggle()
                this.message = null
                let data = await api.listCustomer(0)

            let composeCustomer = data.Customer.map(e => {
                return {
                    id: e.id,
                    name: e.name,
                    type: e.type_kendaraan
                }
            })
            Customer.creator.customers(composeCustomer)
            }
        },
        async del(id){
            let conf = await confirm("Ada yakin akan menghapus?")
            if(!conf){
                return
            }
            await api.deleteCustomer(id)
            let data = await api.listCustomer(0)

            let composeCustomer = data.Customer.map(e => {
                return {
                    id: e.id,
                    name: e.name,
                    type: e.type_kendaraan
                }
            })
            Customer.creator.customers(composeCustomer)
        },
        async next(){
                if(!this.isNextActive){
                    return
                }
                this.page++
                let data = await api.listCustomer(this.page)
                this.pages = data.TotalPage
                console.log("data next", data);
                let composeCustomer = data.Customer.map(e => {
                    return {
                        id: e.id,
                        name: e.name,
                        type: e.type_kendaraan
                    }
                })
                Customer.creator.customers(composeCustomer)
            },
            async prev(){
                if(!this.isPrevActive){
                    return
                }
                this.page--
                let data = await api.listCustomer(this.page)
                this.pages = data.TotalPage
                console.log("data prev: "+data);
                let composeCustomer = data.Customer.map(e => {
                    return {
                        id: e.id,
                        name: e.name,
                        type: e.type_kendaraan
                    }
                })
                Customer.creator.customers(composeCustomer)
            },
    },
    async mounted() {
        // this.$refs.angsuran.style.display = 'none';
        if (Customer.state.customers.length == 0) {
            let data = await api.listCustomer(this.page)
            this.pages = data.TotalPage
            let composeCustomer = data.Customer.map(e => {
                return {
                    id: e.id,
                    name: e.name,
                    type: e.type_kendaraan
                }
            })
            Customer.creator.customers(composeCustomer)
        }
        if(this.myID == -1){
            this.myID = (await api.me(await api.token())).data.id
        }
        this.modelIni = new bootstrap.Modal(document.getElementById('tambahModal'))
    },
    computed: {
        customer: () => {
            let { state } = Customer
            return state.customers
        },
        isNextActive(){
            return this.page < this.pages
        },
        isPrevActive(){
            return this.page > 1
        },
        dataDisplaySimpan(){
            return this.message == null ? 'flex' : 'none'
        },
        dataDisplayBack(){
            return this.message != null ? 'flex' : 'none'
        }
    }
}
</script>