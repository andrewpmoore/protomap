<script setup lang="ts">
import { supabase } from '@/supabase'
import { ref } from 'vue'
import { useToast } from 'primevue/usetoast'

const toast = useToast()

const items = ref([
  {
    label: 'Home',
    icon: 'pi pi-home',
    route: '/'
  },
  {
    label: 'Writer',
    icon: 'pi pi-pencil',
    route: '/writer'
  },
  {
    label: 'Travel writer',
    icon: 'pi pi-envelope',
    badge: 3,
    route: '/travel'
  }
])

const logout = async () => {
  console.log('logging out')
  const { error } = await supabase.auth.signOut()
  if (error == null) {
    toast.add({ severity: 'success', summary: 'Logged out', detail: 'You are now logged out' })
  } else {
    toast.add({
      severity: 'error',
      summary: 'Logging out failed',
      detail: 'Unable to log out, error was $error'
    })
  }
}
</script>

<template>
  <Menubar :model="items" class="rounded-t-none bg-gray-800 border-gray-800">
    <!--    <template #start>-->
    <!--      <svg width="35" height="40" viewBox="0 0 35 40" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-2rem">-->
    <!--        <path d="..." fill="var(&#45;&#45;primary-color)"/>-->
    <!--        <path d="..." fill="var(&#45;&#45;text-color)"/>-->
    <!--      </svg>-->
    <!--    </template>-->
    <template #item="{ item, props, hasSubmenu, root }"  >
      <a v-ripple class="flex align-items-center" v-bind="props.action">
        <router-link v-if="item.route" v-slot="{ href, navigate }" :to="item.route" custom>
          <a v-ripple :href="href" v-bind="props.action" @click="navigate">
            <span :class="item.icon" />
            <span class="ml-4">{{ item.label }}</span>
          </a>
        </router-link>
        <!--        <Badge v-if="item.badge" :class="{ 'ml-auto': !root, 'ml-2': root }" :value="item.badge"/>-->
        <span
          v-if="item.shortcut"
          class="ml-auto border-1 surface-border border-round surface-100 text-xs p-1"
          >{{ item.shortcut }}</span
        >
        <i
          v-if="hasSubmenu"
          :class="[
            'pi pi-angle-down text-primary',
            { 'pi-angle-down ml-2': root, 'pi-angle-right ml-auto': !root }
          ]"
        ></i>
      </a>
    </template>
    <template #end>
      <div><a href="#" @click="logout" class="mr-8">Logout</a></div>
    </template>
  </Menubar>
</template>

<style scoped></style>
