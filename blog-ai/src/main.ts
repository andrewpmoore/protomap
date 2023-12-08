
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import PrimeVue from 'primevue/config';
import 'primevue/resources/themes/lara-dark-green/theme.css';
import 'primevue/resources/primevue.min.css';
import 'primeicons/primeicons.css';
import './assets/app.css';


import InputText from 'primevue/inputtext';
import Button from 'primevue/button';
import Toast from 'primevue/toast';
import Menubar from 'primevue/menubar';
import ToastService from 'primevue/toastservice';




import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(PrimeVue);
app.use(ToastService);
// eslint-disable-next-line vue/multi-word-component-names,vue/no-reserved-component-names
app.component('Button', Button);
app.component('InputText', InputText);
// eslint-disable-next-line vue/multi-word-component-names
app.component('Toast', Toast);
// eslint-disable-next-line vue/multi-word-component-names
app.component('Menubar', Menubar);

app.use(createPinia())
app.use(router)

app.mount('#app')
