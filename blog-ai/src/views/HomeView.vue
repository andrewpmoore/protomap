<script setup lang="ts">

import {ref} from "vue";
import {useToast} from "primevue/usetoast";

const text = ref();
const toast = useToast();
const greet = () => {
  console.log('greet called');
  toast.add({severity: 'success', summary: 'Toast demo', detail: text.value,});
}

</script>

<template>
  <main>
    <div class="container">
    <span class="p-float-label">
      <InputText id="txt" v-model="text"/>
      <label for="txt">Text</label>
    </span>
      <Button label="Greet" @click="greet" icon="pi pi-user"></Button>
    </div>
  </main>
</template>



<style scoped>
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 80vh;
}
</style>
