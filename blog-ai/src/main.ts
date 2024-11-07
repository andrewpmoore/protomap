import { createApp } from 'vue'
import { createPinia } from 'pinia'
import PrimeVue from 'primevue/config'
import './assets/app.css'
import 'primevue/resources/themes/lara-dark-green/theme.css'
import 'primevue/resources/primevue.min.css'
import 'primeicons/primeicons.css'

import Galleria from 'primevue/galleria';
import Image from 'primevue/image';
import InputText from 'primevue/inputtext'
import Button from 'primevue/button'
import Toast from 'primevue/toast'
import Menubar from 'primevue/menubar'
import Panel from 'primevue/panel'
import Card from 'primevue/card'
import RadioButton from 'primevue/radiobutton';
import Dropdown from 'primevue/dropdown';
import SelectButton from 'primevue/selectbutton';
import InputSwitch from 'primevue/inputswitch';
import Textarea from 'primevue/textarea';
import Tag from 'primevue/tag';


// import Vue from 'vue'
// import VueI18n from 'vue-i18n'





// import Badge from 'primevue/badge';
import ToastService from 'primevue/toastservice'
import BadgeDirective from 'primevue/badgedirective'
import Ripple from 'primevue/ripple'

import App from './App.vue'
import router from './router'


const app = createApp(App)

// Vue.use(VueI18n)



app.use(PrimeVue, { ripple: true })
app.use(ToastService)



// eslint-disable-next-line vue/multi-word-component-names,vue/no-reserved-component-names
app.component('Button', Button)
app.component('RadioButton', RadioButton)
app.component('SelectButton', SelectButton)


// eslint-disable-next-line vue/multi-word-component-names
app.component('Panel', Panel)
// eslint-disable-next-line vue/multi-word-component-names
app.component('Card', Card)
// eslint-disable-next-line vue/multi-word-component-names
app.component('Dropdown', Dropdown)
app.component('InputSwitch', InputSwitch)

// eslint-disable-next-line vue/multi-word-component-names,vue/no-reserved-component-names
app.component('Image', Image)
// eslint-disable-next-line vue/multi-word-component-names,vue/no-reserved-component-names

app.component('InputText', InputText)
// eslint-disable-next-line vue/multi-word-component-names,vue/no-reserved-component-names
app.component('Galleria', Galleria);
// eslint-disable-next-line vue/multi-word-component-names,vue/no-reserved-component-names
app.component('Textarea', Textarea)
// eslint-disable-next-line vue/multi-word-component-names
app.component('Toast', Toast)
// eslint-disable-next-line vue/multi-word-component-names
app.component('Tag', Tag)
// eslint-disable-next-line vue/multi-word-component-names
app.component('Menubar', Menubar)
app.directive('badge', BadgeDirective)
app.directive('ripple', Ripple)

app.use(createPinia())
app.use(router)

app.mount('#app')

// const loader = new Loader({

