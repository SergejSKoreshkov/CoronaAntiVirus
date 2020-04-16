<template>
  <div class="about">
    <v-content>
      <v-container class="fill-height" fluid>
        <v-row align="center" justify="center">
          <v-col cols="12" md="6" class="text-center">
            <Error></Error>
          </v-col>
        </v-row>
        <v-row align="center" justify="center">
          <v-col cols="12" md="6" class="text-center">
            <Login></Login>
          </v-col>
        </v-row>
      </v-container>
    </v-content>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

import Login from '@/components/Login.vue'
import Error from '@/components/Error.vue'

export default Vue.extend({
    components: {
        Login,
        Error
    }
})
</script>
