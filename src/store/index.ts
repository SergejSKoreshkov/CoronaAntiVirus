import Vue from 'vue'
import Vuex from 'vuex'
import axios, { AxiosRequestConfig, AxiosResponse } from 'axios'

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
  method: <T = any, R = AxiosResponse<T>>(url: string, config?: AxiosRequestConfig | undefined) => Promise<R>;
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
        makeRequest ({ commit }: any, { url, data, method }: RequestData) {
            return new Promise((resolve, reject) => {
                method(url, {
                    login: data.login,
                    password: data.password
                } as any)
                    .then((res: any) => {
                        if (!res.data.error.name) {
                            if (res.data.data.token) {
                                commit('setToken', res.data.data.token)
                                resolve()
                            }
                        } else {
                            commit('setError', res.data.error.message)
                            reject(res.data.error.message)
                        }
                    })
                    .catch((err: any) => {
                        commit('setError', err.response?.data.error.message || err.message)
                        reject(err.response?.data.error.message || err.message)
                    })
            })
        },
        loginLocal ({ dispatch }: any, data: any) {
            return dispatch('makeRequest', { url: 'http://localhost:8080/api/auth/local', data, method: axios.post })
        },
        registerLocal ({ dispatch }: any, data: any) {
            return dispatch('makeRequest', { url: 'http://localhost:8080/api/auth/local/register', data, method: axios.post })
        },
        fetchData ({ dispatch }: any, { data, limit, offset }: any) {
            return dispatch('makeRequest', { url: 'http://localhost:8080/api/history', data, method: axios.get })
        }
    },
    modules: {
    }
} as VuexStore)
