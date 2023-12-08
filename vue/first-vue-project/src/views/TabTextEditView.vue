<script setup>

import TabbableTextArea from '@/components/TabbableTextArea.vue'
import { ref } from 'vue'


let comment = ref('test value');

setTimeout(() => {
    comment.value = 'something else'
  },
  2000);



</script>


<template>
  <main>
    <form>
      <TabbableTextArea v-model="comment" style="width: 100%; height: 300px"/>
    </form>
  </main>
</template>