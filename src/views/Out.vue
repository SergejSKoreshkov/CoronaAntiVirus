<template>
  <div class="dashboard">
    <Navigation />
      <v-content>
      </v-content>
    <Footer />
  </div>
</template>

<script>
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'

export default {
    name: 'Dashboard',
    components: {
        Navigation,
        Footer
    },
    mounted () {
        this.$store.commit('setToken', '')
        this.$cookie.delete('token')
        this.$router.push('/login')
    }
}
</script>
