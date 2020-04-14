<template>
    <div class="gatelist">
      <v-data-table
        :headers="headers"
        :items="dataset"
        class="elevation-1"
      >
        <template v-slot:item.active="{ item }">
          <v-chip :color="getColor(item.active)" dark>{{ item.active }}</v-chip>
        </template>
        <template v-slot:item.temp="{ item }">
          <v-chip :color="getColorFromTemp(
              $store.state.maximalTemp,
              $store.state.mediumTemp,
              item.temp
            )" dark>{{ item.temp }}</v-chip>
        </template>
      </v-data-table>
    </div>
</template>

<script lang="ts">
import Vue from 'vue'
export default Vue.extend({
    methods: {
        getColor (isActive: boolean): string {
            return isActive ? 'lime' : 'red'
        },

        getColorFromTemp (tempMax: number, tempMed: number, temp: number): string {
            return temp > tempMed
                ? temp > tempMax ? 'red' : 'orange' : 'lime'
        }
    },
    data: () => ({
        headers: [
            {
                text: 'Номер турникета',
                align: 'start',
                sortable: true,
                value: 'name'
            },
            { text: 'Последний пропуск', value: 'lastUserId' },
            { text: 'Температура', value: 'temp' },
            { text: 'Активен', value: 'active' }
        ],
        dataset: [
            {
                name: 'Турникет 17',
                lastUserId: 'Николай Коля',
                temp: 38.6,
                active: true
            },
            {
                name: 'Турникет 15',
                lastUserId: 'Николай Коля',
                temp: 36.6,
                active: true
            },
            {
                name: 'Турникет 12',
                lastUserId: 'Николай Коля',
                temp: 37.6,
                active: false
            },
            {
                name: 'Турникет 11',
                lastUserId: 'Николай Коля',
                temp: 36.6,
                active: true
            },
            {
                name: 'Турникет 17',
                lastUserId: 'Николай Коля',
                temp: 38.6,
                active: true
            },
            {
                name: 'Турникет 15',
                lastUserId: 'Николай Коля',
                temp: 36.6,
                active: true
            },
            {
                name: 'Турникет 12',
                lastUserId: 'Николай Коля',
                temp: 37.6,
                active: false
            },
            {
                name: 'Турникет 11',
                lastUserId: 'Николай Коля',
                temp: 36.6,
                active: true
            },
            {
                name: 'Турникет 17',
                lastUserId: 'Николай Коля',
                temp: 38.6,
                active: true
            },
            {
                name: 'Турникет 15',
                lastUserId: 'Николай Коля',
                temp: 36.6,
                active: true
            },
            {
                name: 'Турникет 12',
                lastUserId: 'Николай Коля',
                temp: 37.6,
                active: false
            },
            {
                name: 'Турникет 11',
                lastUserId: 'Николай Коля',
                temp: 36.6,
                active: true
            }
        ]
    })
})
</script>
