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
                            <li><button class="btn" @click="edit(d.id)">Edit</button></li>
                            <li><button class="btn">Hapus</button></li>
                        </ul>
                        </div>
                    </div>
                </div>
                <div class="cus-page">
                    <button class="btn disabled">Prev</button>
                    <p class="btn">1/1</p>
                    <button class="btn disabled">Next</button>
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
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="note">*Masukkan '-', bila dikosongkan</p>
                        <div class="mb-3">
                            <label class="form-label">Nama</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Alamat</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nomor Hp</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal service selanjutnya</label>
                            <input type="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal angsuran selanjutnya</label>
                            <input type="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal jatuh tempo STNK selanjutnya</label>
                            <input type="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tanggal lahir</label>
                            <input type="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">No rangka</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tipe kendaraan</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Total angsuran</label>
                            <input type="number" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Leasing</label>
                            <input type="text" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Angsuran</label>
                            <select class="form-select" aria-label="Default select example">
                                <option selected value="tunai">Tunai</option>
                                <option value="kredit">Kredit</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn simpan">Simpan</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>


<script>
import bootstrap from "bootstrap/dist/js/bootstrap.min.js"
import ModelViewCustomer from './ModelViewCustomer.vue';
import api from "../service";

import Customer from "../storage/customerStore"

export default {
    components: { ModelViewCustomer },
    data() {
        return {
            model: [],
            isEdit: false,
            data: {
                name: "",

            }
        }
    },
    methods: {
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
            this.isEdit = false;
            (new bootstrap.Modal(document.getElementById('tambahModal'))).toggle()
        },
        async edit(id){
            this.isEdit = true
            let cus = await api.getCustomerByID(id)
            this.model = cus;
            console.log(cus);
            (new bootstrap.Modal(document.getElementById('tambahModal'))).toggle()
        }
    },
    async mounted() {
        if (Customer.state.customers.length == 0) {
            let data = await api.listCustomer(0)

            let composeCustomer = data.map(e => {
                return {
                    id: e.id,
                    name: e.name,
                    type: e.type_kendaraan
                }
            })
            Customer.creator.customers(composeCustomer)
        }
    },
    computed: {
        customer: () => {
            let { state } = Customer
            return state.customers
        }
    }
}
</script>