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
    },
    mounted () {
        if (!this.$store.getters.isAuthenticated) {
            this.$store.commit('setToken', this.$route.query.token || (this as any).$cookie.get('token'))

            if (!this.$store.getters.isAuthenticated) this.$router.push('/login')
        }
    },
    methods: {
        signOut () {
            if (this.$store.getters.isAuthenticated) {
                (this as any).$cookie.delete('token')
                location.reload()
            } else {
                this.$router.push('/login')
            }
        }
    }
})
</script>
