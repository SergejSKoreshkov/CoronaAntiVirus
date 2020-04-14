<template>
    <div class="historylist">
      <v-data-table
        :headers="headers"
        :items="dataset"
        class="elevation-1"
      >
        <template v-slot:item.temp="{ item }">
          <v-chip :color="getColorFromTemp(
              $store.state.minimalTemp,
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

        getColorFromTemp (tempMin: number, tempMax: number, tempMed: number, temp: number): string {
            return temp > tempMin
                ? temp > tempMed
                    ? temp > tempMax ? 'red' : 'orange' : 'lime' : 'light-blue'
        }
    },
    data: () => ({
        headers: [
            {
                text: 'Имя Фамилия',
                align: 'start',
                sortable: true,
                value: 'name'
            },
            { text: 'Температура', value: 'temp' },
            { text: 'Время', value: 'time' },
            { text: 'Турникет', value: 'gateId' }
        ],
        dataset: [
            {
                name: 'Иван Иван',
                temp: 38.5,
                time: new Date(Date.now()),
                gateId: 'Турникет 12'
            },
            {
                name: 'Иван Не Иван',
                temp: 37.1,
                time: new Date(Date.now()),
                gateId: 'Турникет 12'
            },
            {
                name: 'Иван Точно Иван',
                temp: 36.1,
                time: new Date(Date.now()),
                gateId: 'Турникет 12'
            },
            {
                name: 'Иван Возможно Иван',
                temp: 20.5,
                time: new Date(Date.now()),
                gateId: 'Турникет 12'
            },
            {
                name: 'Иван Реально Иван',
                temp: 37.5,
                time: new Date(Date.now()),
                gateId: 'Турникет 12'
            }
        ]
    })
})
</script>
