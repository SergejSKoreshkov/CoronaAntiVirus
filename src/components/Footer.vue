<template>
    <div class="footer">
        <v-footer
            :color="color"
            app
        >
        <span class="white--text ml-auto mr-auto">System&copy; 2020</span>
        </v-footer>
    </div>
</template>

<style scoped>
    .footer {
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
    }
})
</script>
