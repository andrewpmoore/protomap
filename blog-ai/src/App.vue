<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { supabase } from '@/supabase'
import NotLoggedInView from '@/views/NotLoggedInView.vue'
import LoggedInView from '@/views/LoggedInView.vue'

const session = ref()

onMounted(() => {
  supabase.auth.getSession().then(({ data }) => {
    session.value = data.session
  })

  supabase.auth.onAuthStateChange((_, _session) => {
    session.value = _session
  })
})
</script>

<template>
  <Toast />

  <!--  <div class="container" style="padding: 50px 0 100px 0">-->
  <LoggedInView v-if="session" :session="session" />
  <NotLoggedInView v-else />
  <!--  </div>-->

  <!--  <MainMenu/>-->

  <!--  <nav>-->
  <!--    <RouterLink to="/">Home</RouterLink>-->
  <!--    <RouterLink to="/writer">Writer</RouterLink>-->
  <!--    <RouterLink to="/contact">Contact</RouterLink>-->
  <!--  </nav>-->

  <!--  <RouterView/>-->

  <!--  <FooterBar/>-->
</template>

<style scoped>

</style>
