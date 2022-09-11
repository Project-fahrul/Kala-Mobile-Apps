<template>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header d-block">
                        <h5 class="modal-title" id="exampleModalLabel">Send Evidance</h5>
                        <p>{{name}}</p>
                    </div>
                    <div class="modal-body">
                        <div v-if="valid == false" class="alert alert-danger" role="alert">
                            {{errorMessage}}
                        </div>
                        <div class="mb-3">
                            <label for="pesan" class="form-label">Message</label>
                            <input type="text" v-model="message" class="form-control" id="pesan" aria-describedby="message" required>
                        </div>
                        <div class="input-group mb-3">
                          <ImagePicker @change="picker" name="picker" :key="imageKey"></ImagePicker>
                        </div>
                    </div>
                    <div v-if="loading" class="modal-body d-flex justify-content-center">
                        <div class="loader"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" @click="clear">Close</button>
                        <button type="button" class="btn btn-primary" @click="upload">Send</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
import api from '@/service';
import ImagePicker from './ImagePicker.vue';
import notifStorage from "../storage/notificationStorage"

export default {
    props:{
        customer: {
            default:()=> 0
        },
        sales: {
            default:()=> 0
        },
        type: {
            default:()=> ""
        },
        name: {
            default: ()=> ""
        },model:{

        }
    },
    data() {
        return {
            message: "",
            file: null, 
            valid: true,
            errorMessage: "",
            loading: false,
            imageKey: 0
        };
    },
    methods: {
        clear(){
            this.message = ""
            this.file = null
            this.imageKey++
            if(this.imageKey> 1){
                this.imageKey = 0
            }
        },
        picker(file) {
            this.file = file
        },
        async upload(){
            if(this.message == ""){
                this.errorMessage = "Message not filled"
                this.valid = false
                return
            }else if(this.file == null){
                this.valid = false
                this.errorMessage = "File not filled"
                return
            }else{
                this.valid = true
            }
            this.loading = true
            let formData = new FormData();
            formData.append('image', this.file.file)
            formData.append('message', this.message)
            formData.append('customer_id', this.customer)
            formData.append('sales_id', this.sales)
            formData.append('type', this.type)

            if(!await api.uploadEvidance(formData)){
                this.loading = false
                return
            }
            
            let newData = await api.listAllNotification()
            if(newData.length == 0){
                this.loading = false
                return
            }

            notifStorage.creator.notifications(newData)
            this.clear()
            this.model.toggle()
            this.loading = false

        }
    },
    components: { ImagePicker }
}
</script>