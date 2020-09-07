<template>
    <div class="historylist">
        <v-card elevation="2" class="elevation-12">
                    <v-toolbar
                        :color="$store.state.color"
                        dark
                        elevation="0"
                    >
                        <v-toolbar-title>Монитор</v-toolbar-title>
                        <v-spacer />
                    </v-toolbar>
                    <v-card-text>
      <v-data-table
        :headers="headers"
        :items="dataset"
        :loading="loading"
      >
        <template v-slot:item.temp="{ item }">
          <v-chip :color="getColorFromTemp(
              $store.state.minimalTemp,
              $store.state.maximalTemp,
              $store.state.mediumTemp,
              item.temp
            )" dark>{{ item.temp }}</v-chip>
        </template>
        <template v-slot:item.time="{ item }">
         {{ new Date(item.time).toLocaleString() }}
        </template>
      </v-data-table>
      </v-card-text>
                    </v-card>
    </div>
</template>

<script lang="ts">
import Vue from 'vue'
import axios from 'axios'

export default Vue.extend({
    methods: {
        getColorFromTemp (tempMin: number, tempMax: number, tempMed: number, temp: number): string {
            return temp > tempMin
                ? temp > tempMed
                    ? temp > tempMax ? 'red' : 'orange' : 'green darken-2' : 'light-blue'
        },

        updateData () {
            axios.get(
                'http://localhost:8080/api/active',
                {
                    headers: {
                        token: this.$store.state.token
                    }
                }).then((response: any) => {
                if (response.data.error.message) { } else {
                    this.dataset = response.data.data.map((el: any) => {
                        el.temp = parseFloat(el.temp)
                        return el
                    })
                    this.loading = false
                }
            })
                .catch(console.log)
        }
    },
    mounted () {
        this.updateData()
        this.interval = setInterval(() => {
            this.updateData()
        }, 2000)
    },
    beforeDestroy () {
        clearInterval(this.interval)
    },
    data: () => ({
        interval: 0,
        loading: true,
        headers: [
            {
                text: 'Номер турникета',
                align: 'start',
                sortable: true,
                sort: true,
                value: 'gate_id'
            },
            { text: 'Имя', value: 'first_name' },
            { text: 'Фамилия', value: 'last_name' },
            { text: 'Номер пропуска', value: 'card_id' },
            { text: 'Температура', value: 'temp' },
            { text: 'Время', value: 'time' }
        ],
        dataset: []
    })
})
</script>
