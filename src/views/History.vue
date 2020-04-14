<template>
  <div class="history">
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
              <HistoryList />
            </v-col>
          </v-row>
        </v-container>
      </v-content>
    <Footer />
  </div>
</template>

<script>
import HistoryList from '@/components/HistoryList.vue'
import Navigation from '@/components/Navigation.vue'
import Footer from '@/components/Footer.vue'

export default {
    name: 'History',
    components: {
        Navigation,
        Footer,
        HistoryList
    }
}
</script>
