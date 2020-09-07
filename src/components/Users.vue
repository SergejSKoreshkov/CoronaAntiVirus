<template>
    <div class="historylist">
        <v-card elevation="2" class="elevation-12">
                    <v-toolbar
                        :color="$store.state.color"
                        dark
                        elevation="0"
                    >
                        <v-toolbar-title>Пользователи</v-toolbar-title>
                        <v-spacer />
                    </v-toolbar>
                    <v-card-text>
      <v-data-table
        :headers="headers"
        :items="dataset"
        :loading="loading"
      >
        <template v-slot:item.actions="{ item }">
            <v-icon
                small
                @click="deleteItem(item.login)"
            >mdi-delete</v-icon>
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
                    ? temp > tempMax ? 'red' : 'orange' : 'lime' : 'light-blue'
        },

        deleteItem (login: string) {
            if (confirm(`Delete user ${login}`)) {
                axios.delete(
                    '/api/users',
                    {
                        data: { login },
                        headers: {
                            token: this.$store.state.token
                        }
                    } as any).then((response: any) => {
                    console.log(response)
                    if (response.data.error.message) { } else {
                        this.dataset = response.data.data.map((el: any) => {
                            el.actions = true
                            return el
                        })
                        this.loading = false
                    }
                })
                    .catch(console.log)
            }
        },

        updateData () {
            axios.get(
                '/api/users',
                {
                    headers: {
                        token: this.$store.state.token
                    }
                }).then((response: any) => {
                if (response.data.error.message) { } else {
                    this.dataset = response.data.data.map((el: any) => {
                        el.actions = true
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
                text: 'Пользователь',
                align: 'start',
                sortable: true,
                sort: true,
                value: 'login'
            },
            { text: 'Действия', value: 'actions', sortable: false }
        ],
        dataset: []
    })
})
</script>
