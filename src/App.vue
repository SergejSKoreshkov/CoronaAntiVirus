<template>
  <v-app>
        <router-view></router-view>
  </v-app>
</template>

<style>
  .padding-p1 {
    padding: 1%;
  }
</style>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
    name: 'App',
    data: () => ({
        color: 'deep-purple'
    }),
    beforeMount () {
        const color = localStorage.getItem('COLOR')
        if (color) {
            this.$store.commit('color', color)
        }
    }
})
</script>
