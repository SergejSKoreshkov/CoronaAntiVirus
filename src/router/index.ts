import Vue from 'vue'
import VueRouter, { RouteConfig } from 'vue-router'
import Dashboard from '../views/Dashboard.vue'
import History from '../views/History.vue'
import Login from '../views/Login.vue'
import Settings from '../views/Settings.vue'
import Out from '../views/Out.vue'

Vue.use(VueRouter)

const routes: Array<RouteConfig> = [
    {
        path: '/',
        name: 'Dashboard',
        component: Dashboard
    },
    {
        path: '/history',
        name: 'History',
        component: History
    },
    {
        path: '/login',
        name: 'Login',
        component: Login
    },
    {
        path: '/settings',
        name: 'Settings',
        component: Settings
    },
    {
        path: '/out',
        name: 'Out',
        component: Out
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
