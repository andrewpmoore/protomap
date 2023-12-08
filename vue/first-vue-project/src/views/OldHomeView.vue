<script setup>
import TheWelcome from '../components/TheWelcome.vue'
import {onMounted, ref} from 'vue'
import {useFlash} from '@/composables/useFlash'


onMounted(()=>{
  // alert('mounted');
});


let {flash} = useFlash();

let message = ref('hello, world');

setTimeout(()=>{
  message.value = 'I have been changed';
}, 2000);

let doSomething = () =>{
  flash('test-home', 'do something here');
};

</script>

<template>
  <main>
    <TheWelcome />

    {{ message }}
    <p>
      <input type="text" v-model="message"/>
      <button @click="doSomething">Click me</button>
    </p>
  </main>
</template>
