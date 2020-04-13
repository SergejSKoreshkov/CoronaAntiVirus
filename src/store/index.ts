import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

interface VuexState {
  color: string;
  maximalTemp: number;
  mediumTemp: number;
}

interface VuexStore {
  state: VuexState;
  mutations: {[index: string]: (...args: any[]) => void};
}

export default new Vuex.Store({
    state: {
        color: 'indigo',
        maximalTemp: 38.0,
        mediumTemp: 37.0
    },
    mutations: {
        color (state: VuexState, color: string) {
            state.color = color
        }
    },
    actions: {
    },
    modules: {
    }
} as VuexStore)
