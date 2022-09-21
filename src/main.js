import { createApp } from 'vue'
import App from './App.vue'
import routes from './routes'
import 'bootstrap/dist/css/bootstrap.css'
import "./assets/styles.css"
import VueImageChooser from 'vue-image-chooser'

import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import { faBell, faPeopleGroup, faSignOut, faArrowRight, faSpinner, faBars } from "@fortawesome/free-solid-svg-icons";

/* add icons to the library */
library.add(faBell,faPeopleGroup, faSignOut, faArrowRight, faSpinner, faBars)

createApp(App)
    .use(routes)
    .use(VueImageChooser)
    .use(require("vue-cookies"))
    .component('font-awesome-icon', FontAwesomeIcon)
    .mount('#app')
