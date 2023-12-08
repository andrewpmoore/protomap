<script setup>


import Quiz from '@/components/quiz/QuizMaster.vue'
</script>


<template>
  <main>
    <form>
      <Quiz :quiz="{name: 'My first quiz', questions: []}"/>
    </form>
  </main>
</template>