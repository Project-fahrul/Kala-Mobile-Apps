import { readonly, reactive } from "vue";

function createReactiveState(data){
    return reactive(data)
}

function createCreator(data, reactiveState){
    let creator = {}
    Object.keys(data).forEach(e=>{
        creator[e] = function(newState){
            reactiveState[e] = newState
        }
    })

    return creator
}

export default function createStore(data){
    let state = createReactiveState(data)
    let creator = createCreator(data, state)
    return {state: readonly(state), creator: creator}
}