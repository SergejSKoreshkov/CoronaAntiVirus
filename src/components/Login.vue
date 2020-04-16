<template>
    <div class="login">
                    <v-card elevation="2" class="elevation-12">
                    <v-toolbar
                        :color="$store.state.color"
                        dark
                        elevation="0"
                    >
                        <v-toolbar-title>Login form</v-toolbar-title>
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
                        <v-btn color="blue" :text="true" @click="loginLocal">Login</v-btn>
                    </v-card-actions>
                    </v-card>
    </div>
</template>

<script lang="ts">
import Vue from 'vue'
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
            this.$store.dispatch('loginLocal', this.credentials)
                .then(() => {
                    if (this.$store.state.token) {
                        (this as any).$cookie.set('token', this.$store.state.token, 1)
                        this.$router.push('/')
                    }
                })
        }
    }
})
</script>
