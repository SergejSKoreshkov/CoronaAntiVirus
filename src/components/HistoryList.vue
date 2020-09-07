<template>
    <div class="historylist">
                <v-date-picker
                    v-model="selectedDate"
                    :allowed-dates="allowedDates"
                    width="100%"
                    @change="updateData"
                ></v-date-picker>
                <v-divider></v-divider>
                <v-row>
                    <v-col cols="4">
                        <v-text-field
                            placeholder="Номур турникета"
                            outlined
                            v-model="filterGate"
                        ></v-text-field>
                    </v-col>
                    <v-col cols="4">
                        <v-text-field
                            placeholder="Номур пропуска"
                            outlined
                            v-model="filterId"
                        ></v-text-field>
                    </v-col>
                    <v-col cols="4" class="d-flex">
                        <v-text-field
                            placeholder="Температура"
                            outlined
                            class="pr-2 col-8"
                            v-model="filterTemp"
                            type="number"
                        ></v-text-field>
                        <v-spacer></v-spacer>
                        <v-switch
                            :label="selectHighTemp ? 'Выше' : 'Ниже'"
                            v-model="selectHighTemp"
                        ></v-switch>
                    </v-col>
                </v-row>
                <v-divider></v-divider>
                <v-card elevation="2" class="elevation-12">
                    <v-toolbar
                        :color="$store.state.color"
                        dark
                        elevation="0"
                    >
                        <v-toolbar-title>История</v-toolbar-title>
                        <v-spacer />
                    </v-toolbar>
                    <v-card-text>
      <v-data-table
        :headers="headers"
        :items="filteredDataset"
        class="elevation-0"
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
        allowedDates (date: string) {
            return this.dates.includes(date)
        },
        getDates () {
            axios.get(
                '/api/dates',
                {
                    headers: {
                        token: this.$store.state.token
                    }
                }).then((response: any) => {
                if (response.data.error.message) { } else {
                    this.dates = response.data.data.map((el: any) => el.day)
                    this.loading = false
                }
            })
        },
        updateData () {
            this.loading = true
            axios.get(
                `/api/history?date=${this.selectedDate}`,
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
        this.getDates()
        this.updateData()
    },
    beforeDestroy () {
        clearInterval(this.interval)
    },
    computed: {
        filteredDataset () {
            return this.dataset.filter((el: any) => {
                let flag = true
                if (this.filterGate.length > 0) {
                    flag = el.gate_id.includes(this.filterGate)
                }
                if (this.filterId.length > 0) {
                    flag = flag && el.card_id.includes(this.filterId)
                }
                if (this.filterTemp > 0) {
                    flag = flag && this.selectHighTemp
                        ? el.temp > this.filterTemp
                        : el.temp < this.filterTemp
                }
                return flag
            })
        }
    },
    data: () => ({
        interval: 0,
        dates: [] as string[],
        loading: true,
        selectedDate: '2020-09-03',
        selectHighTemp: false,
        filterGate: '',
        filterId: '',
        filterTemp: 0,
        headers: [
            {
                text: 'Номер турникета',
                align: 'start',
                sortable: true,
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
