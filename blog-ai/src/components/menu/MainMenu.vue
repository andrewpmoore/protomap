<script setup lang="ts">


import {ref} from "vue";

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
  // {
  //   label: 'Projects',
  //   icon: 'pi pi-search',
  //   items: [
  //     {
  //       label: 'Core',
  //       icon: 'pi pi-bolt',
  //       shortcut: '⌘+S'
  //     },
  //     {
  //       label: 'Blocks',
  //       icon: 'pi pi-server',
  //       shortcut: '⌘+B'
  //     },
  //     {
  //       label: 'UI Kit',
  //       icon: 'pi pi-pencil',
  //       shortcut: '⌘+U'
  //     },
  //     {
  //       separator: true
  //     },
  //     {
  //       label: 'Templates',
  //       icon: 'pi pi-palette',
  //       items: [
  //         {
  //           label: 'Apollo',
  //           icon: 'pi pi-palette',
  //           badge: 2
  //         },
  //         {
  //           label: 'Ultima',
  //           icon: 'pi pi-palette',
  //           badge: 3
  //         }
  //       ]
  //     }
  //   ]
  // },
  {
    label: 'Contact',
    icon: 'pi pi-envelope',
    badge: 3,
    route: '/contact'

  }
]);




</script>

<template>
  <Menubar :model="items">
<!--    <template #start>-->
<!--      <svg width="35" height="40" viewBox="0 0 35 40" fill="none" xmlns="http://www.w3.org/2000/svg" class="h-2rem">-->
<!--        <path d="..." fill="var(&#45;&#45;primary-color)"/>-->
<!--        <path d="..." fill="var(&#45;&#45;text-color)"/>-->
<!--      </svg>-->
<!--    </template>-->
    <template #item="{ item, props, hasSubmenu, root }">
      <a v-ripple class="flex align-items-center" v-bind="props.action">
        <router-link v-if="item.route" v-slot="{ href, navigate }" :to="item.route" custom>
          <a v-ripple :href="href" v-bind="props.action" @click="navigate">
            <span :class="item.icon" />
            <span class="ml-2">{{ item.label }}</span>
          </a>
        </router-link>
        <Badge v-if="item.badge" :class="{ 'ml-auto': !root, 'ml-2': root }" :value="item.badge"/>
        <span v-if="item.shortcut"
              class="ml-auto border-1 surface-border border-round surface-100 text-xs p-1">{{ item.shortcut }}</span>
        <i v-if="hasSubmenu"
           :class="['pi pi-angle-down text-primary', { 'pi-angle-down ml-2': root, 'pi-angle-right ml-auto': !root }]"></i>
      </a>
    </template>
    <template #end>
      <div>Avatar</div>
    </template>
  </Menubar>
</template>

<style scoped>

</style>