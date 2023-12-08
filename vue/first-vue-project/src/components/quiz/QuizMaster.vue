<script setup>

import QuizQuestion from '@/components/quiz/QuizQuestion.vue';
import QuizHeader from '@/components/quiz/QuizHeader.vue';
import QuizFooter from '@/components/quiz/QuizFooter.vue';
import {provide} from 'vue';

defineProps({quiz: Object});
provide('key', 'value');

</script>

<template>
  <QuizHeader/>
  <QuizQuestion/>
  <QuizFooter :quiz="quiz"/>
</template>

