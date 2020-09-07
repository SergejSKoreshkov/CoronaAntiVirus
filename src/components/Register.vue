<template>
    <div class="login">
                    <v-card elevation="2" class="elevation-12">
                    <v-toolbar
                        :color="$store.state.color"
                        dark
                        elevation="0"
                    >
                        <v-toolbar-title>Регистрация пользователя</v-toolbar-title>
                        <v-spacer />
                    </v-toolbar>
                    <v-card-text>
                        <v-form>
                        <v-text-field
                            label="Login"
                            name="login"
                            prepend-icon="mdi-account"
                            v-model="credentials.login"
                            type="text"
                        />

                        <v-text-field
                            id="password"
                            label="Password"
                            name="password"
                            prepend-icon="mdi-lock"
                            v-model="credentials.password"
                            type="password"
                        />
                        </v-form>
                    </v-card-text>
                    <v-card-actions>
                        <v-btn color="blue" :text="true" @click="loginLocal">Зарегистрировать</v-btn>
                    </v-card-actions>
                    </v-card>
    </div>
</template>

<script lang="ts">
import Vue from 'vue'
import axios, { AxiosResponse, AxiosError } from 'axios'

export default Vue.extend({
    data () {
        return {
            credentials: {
                login: '',
                password: ''
            }
        }
    },
    methods: {
        loginLocal () {
            axios.post(
                '/api/auth/local/register',
                {
                    login: this.credentials.login,
                    password: this.credentials.password
                },
                {
                    headers: { token: this.$store.getters.getAuthToken }
                })
                .then((res: AxiosResponse) => {
                    if (!res.data.error.name) {
                    } else {
                        this.$store.commit('setError', res.data.error.message)
                    }
                })
                .catch((err: AxiosError) => {
                    this.$store.commit('setError', err.response?.data.error.message || err.message)
                })
        }
    }
})
</script>
