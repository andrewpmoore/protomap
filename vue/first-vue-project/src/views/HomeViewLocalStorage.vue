<script setup>
import { useStorage } from '@/composables/useStorage'


let food = useStorage('food', 'salad')
let age = useStorage('age')

// let obj = useStorage('obj', { one: 'one' })   //need to deep watch for the sub bits

// setTimeout(() => {
//   obj.value.one = 'changed'
// })

// let food = ref(localStorage.getItem('food'))
// let age = ref(localStorage.getItem('age'))
//
//
// watch(food, (val) => {
//   write('food', val)
// })
//
// watch(age, (val) => {
//   write('age', val)
// })
//
// function write(key, val) {
//   localStorage.setItem(key, val)
// }
//
// setTimeout(() => {
//   food.value = 'changed'
// }, 2000)

</script>


<template>
  <main>
    <p>
      What is your fav food? <input type="text" v-model="food" />
    </p>
    <p>
      What is your age? <input type="text" v-model="age" />
    </p>
  </main>
</template>