
import { createApp } from "vue";
import { createPinia } from 'pinia'
import { createHead } from '@unhead/vue'
import { DragonDropVue } from 'dragon-drop-vue'
// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
const vuetify = createVuetify({
  components,
  directives,
})

//bootstrap

import App from '@/App.vue'
import router from '@/router/index'
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"

const app = createApp(App)
const dragonDropOptions = {
  dragOverDebounceMs: 300,
  debugLog: true,
}

/** Pinia **/
/** https://pinia.vuejs.org/ **/
const pinia = createPinia()
app.use(pinia)

/** Vue Router **/
/** https://router.vuejs.org/ **/
app.use(router)

/** Unhead **/
/** https://unhead.unjs.io/ **/
const head = createHead()
app.use(head)
app.use(vuetify)
app.use(DragonDropVue, dragonDropOptions)
app.mount('#app')
