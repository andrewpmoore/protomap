<script setup lang="ts">
import {RouterLink, RouterView} from 'vue-router'
import {ref} from "vue";
import {useToast} from 'primevue/usetoast';
import MainMenu from "@/components/menu/MainMenu.vue";
import FooterBar from "@/components/footer/FooterBar.vue";






</script>

<template>

  <Toast/>

  <MainMenu/>


<!--  <nav>-->
<!--    <RouterLink to="/">Home</RouterLink>-->
<!--    <RouterLink to="/writer">Writer</RouterLink>-->
<!--    <RouterLink to="/contact">Contact</RouterLink>-->
<!--  </nav>-->





  <RouterView/>

  <FooterBar/>

</template>

<style scoped>
.container {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 80vh;
}
</style>
