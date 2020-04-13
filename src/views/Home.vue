<template>
  <div class="home">
    <Navigation />
      <v-content>
        <v-container
          class="fill-height"
        >
          <v-row
            align="center"
            justify="center"
          >
            <v-col :cols="12">
              <Gates />
            </v-col>
          </v-row>
        </v-container>
      </v-content>
    <Footer />
  </div>
</template>

<script>
import Gates from '@/components/Gates.vue'
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'

export default {
    name: 'Home',
    components: {
        Navigation,
        Footer,
        Gates
    }
}
</script>
