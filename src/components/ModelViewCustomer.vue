<template>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">{{customer.length > 0 ? customerData.name : "Customer"}}</h5>
                    </div>
                    <div v-if="customer.length > 0" class="modal-body view-cus">
                        <div class="mb-3">
                            <p class="cus-attr">Alamat</p>
                            <p class="cus-attr-val">{{customerData.address}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">No Hp</p>
                            <p class="cus-attr-val">{{customerData.no_hp}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">Tanggal service selanjutnya</p>
                            <p class="cus-attr-val">{{cvt(customerData.tgl_dec)}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">Jatuh Tempo STNK</p>
                            <p class="cus-attr-val">{{cvt(customerData.tgl_stnk)}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">Tanggal Lahir</p>
                            <p class="cus-attr-val">{{cvt(customerData.tgl_lahir)}}</p>
                        </div>
                        <div class="mb-3" v-if="customerData.angsuran == 'Kredit'">
                            <p class="cus-attr">Tanggal angsuran selanjutnya</p>
                            <p class="cus-attr-val">{{cvt(customerData.tgl_angsuran)}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">No Rangka</p>
                            <p class="cus-attr-val">{{customerData.no_rangka}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">Tipe Kendaraan</p>
                            <p class="cus-attr-val">{{customerData.type_kendaraan}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">Jenis Angsuran</p>
                            <p class="cus-attr-val">{{customerData.angsuran}}</p>
                        </div>
                        <div class="mb-3">
                            <p class="cus-attr">Leasing</p>
                            <p class="cus-attr-val">{{customerData.leasing}}</p>
                        </div>
                    </div>
                    <div v-else class="modal-body d-flex justify-content-center">
                        <div class="loader"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-closed" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
    
export default {
    props: {
        customer: {
            required: true,
            default: function(){
                return []
            }
        }
    },
    data() {
        return {
            progress: null,
            error: null,
        };
    },
    computed:{
        customerData(){
            console.log(this.customer)
            return this.customer[0]
        }
    },
    methods:{
        cvt(d){
            return new Date(d).toISOString().split('T')[0]
        }
    }
}
</script>