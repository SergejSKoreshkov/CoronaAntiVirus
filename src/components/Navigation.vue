<template>
    <div class="navigation">
        <v-navigation-drawer
          v-model="drawer"
          :stateless="true"
          :color="color"
          :expand-on-hover="true"
          :mini-variant="true"
          dark
          app
        >
          <v-list
            dense
            nav
            class="py-0"
          >
            <v-list-item two-line class="px-0">
              <v-list-item-avatar>
                <v-icon>mdi-account</v-icon>
              </v-list-item-avatar>

              <v-list-item-content>
                <v-list-item-title>Сергей Корешков</v-list-item-title>
                <v-list-item-subtitle>System</v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>

            <v-divider></v-divider>

            <v-list-item
              v-for="item in items"
              :key="item.title"
              link
            >
              <v-list-item-icon>
                <v-icon>{{ item.icon }}</v-icon>
              </v-list-item-icon>

              <v-list-item-content>
                <v-list-item-title>{{ item.title }}</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-navigation-drawer>
    </div>
</template>

<style scoped>
    .navigation {
        z-index: 100;
    }
</style>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
    computed: {
        color () {
            return this.$store.state.color
        }
    },
    data: () => ({
        drawer: true,
        items: [
            { title: 'Главная', icon: 'mdi-view-dashboard' },
            { title: 'История', icon: 'mdi-history' },
            { title: 'Выйти', icon: 'mdi-exit-run' }
        ]
    })
})
</script>
