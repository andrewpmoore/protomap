<script setup lang="ts">
import { ref } from 'vue'
import { useToast } from 'primevue/usetoast'
import { supabase } from '@/supabase'

const helloWorldInput = ref()

const openAiInput = ref()
const openAiResult = ref()

const toast = useToast()

const helloWorld = async () => {
  console.log('hello world called')

  const { data, error } = await supabase.functions.invoke('hello-world', {
    body: { name: helloWorldInput.value }
  })
  console.log('got to here ok')
  // console.log("Data:", JSON.stringify(data, null, 2));
  if ('message' in data) {
    console.log('Message:', data.message)
    toast.add({
      severity: 'info',
      summary: 'Hello-world edge function called',
      detail: data.message
    })
  } else {
    console.warn('The \'message\' property does not exist in the data.')
  }
  console.log(`error ${error}`)
}

const openai = async () => {
  console.log('openai called')


  const { data, error } = await supabase.functions.invoke('openai', {
    body: {
      query: openAiInput.value,
      tokenLength: 4,
      model: 'gpt-3.5-turbo-instruct',
      temperature: 0.5,
    },
  });
  console.log('got to here ok')
  console.log('Data:', JSON.stringify(data, null, 2))
  // if ('message' in data) {
  //   console.log("Message:", data.message);
  //   toast.add({severity: 'info', summary: 'Openai edge function called', detail: data.message,});
  //
  // } else {
  //   console.warn("The 'message' property does not exist in the data.");
  // }

  openAiResult.value = data.choices[0]?.text

  console.log(`error ${error}`)
}
</script>

<template>
  <main>
    <div class="container">
      <span class="p-float-label">
        <InputText id="txt" v-model="helloWorldInput" />
        <label for="txt">Hello-world test function</label>
      </span>
      <Button label="Call edge function" @click="helloWorld" icon="pi pi-user"></Button>

      <span class="p-float-label mt-8">
        <InputText id="txt" v-model="openAiInput" />
        <label for="txt">Open ai test function</label>
      </span>
      <Button label="Query" @click="openai" icon="pi pi-pencil"></Button>

      <p class="mt-4">{{ openAiResult }}</p>
    </div>
  </main>
</template>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 80vh;
  text-align: center;
}

/* Additional styles for the input and button if needed */
.p-float-label {
  margin-bottom: 8px;
}

/* Adjust the styles based on your preferences */
</style>
