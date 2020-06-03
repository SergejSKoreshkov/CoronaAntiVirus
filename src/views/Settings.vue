<template>
  <div class="dashboard">
    <Navigation />
      <v-content>
        <v-container
          class="fill-height"
        >
          <v-row
            align="center"
            justify="center"
          >
            <v-col :cols="12" :md="6">
              <Error />
              <Users />
            </v-col>
            <v-col :cols="12" :md="6">
              <Register />
            </v-col>
          </v-row>
        </v-container>
      </v-content>
    <Footer />
  </div>
</template>

<script>
import Users from '@/components/Users.vue'
import Error from '@/components/Error.vue'
import Register from '@/components/Register.vue'
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'

export default {
    name: 'Dashboard',
    components: {
        Navigation,
        Footer,
        Users,
        Register,
        Error
    }
}
</script>
