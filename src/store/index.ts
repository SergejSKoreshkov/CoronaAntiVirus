import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

interface VuexState {
  color: string;
  maximalTemp: number;
  mediumTemp: number;
  minimalTemp: number;
  token: string;
  error: Error | false;
}

interface VuexStore {
  state: VuexState;
  mutations: {[index: string]: (...args: any[]) => void};
}

interface RequestData {
  url: string;
  data: any;
//   method: <T = any, R = AxiosResponse<T>>(url: string, config?: AxiosRequestConfig | undefined) => Promise<R>;
  method: any;
}

export default new Vuex.Store({
    state: {
        color: 'indigo',
        maximalTemp: 38.0,
        mediumTemp: 37.0,
        minimalTemp: 35.0,
        token: '',
        error: false
    },
    getters: {
        getAuthToken: (state: VuexState) => {
            return state.token
        },
        getUser: (state: VuexState) => {
            return decodeURIComponent(atob(state.token.split('.')[1]).split('').map(c => {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)
            }).join(''))
        },
        isAuthenticated: (state: VuexState) => {
            return !!state.token
        },
        isErrorMessage: (state: VuexState) => {
            return !!state.error
        },
        getErrorMessage: (state: VuexState) => {
            return state.error
        }
    },
    mutations: {
        color (state: VuexState, color: string) {
            state.color = color
        },
        setToken (state: VuexState, token: string) {
            state.token = token
        },
        setError (state: VuexState, error: Error | false) {
            state.error = error
        },
        removeError (state: VuexState) {
            state.error = false
        }
    },
    actions: {
    },
    modules: {
    }
} as VuexStore)
