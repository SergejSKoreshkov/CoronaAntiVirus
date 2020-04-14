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
            <v-col :cols="12">
              <GateList />
            </v-col>
          </v-row>
        </v-container>
      </v-content>
    <Footer />
  </div>
</template>

<script>
import GateList from '@/components/GateList.vue'
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'

export default {
    name: 'Dashboard',
    components: {
        Navigation,
        Footer,
        GateList
    }
}
</script>
