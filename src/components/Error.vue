<template>
    <div class="error">
        <v-alert v-if="$store.getters.isErrorMessage" prominent type="error">
          <v-row align="center">
            <v-col class="grow">{{ $store.getters.getErrorMessage }}</v-col>
            <v-col class="shrink">
              <v-btn @click="$store.commit('removeError')">close</v-btn>
            </v-col>
          </v-row>
        </v-alert>
    </div>
</template>

<style scoped>
.error {
    border-radius: 5px;
}
</style>
