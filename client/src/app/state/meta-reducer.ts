import { ActionReducer ,MetaReducer } from '@ngrx/store';

function logger(reducer: ActionReducer<any>): ActionReducer<any> {
  return (state, action) => {
    const currentState = reducer(state, action);

    console.log('action', action);
    console.log('state after: ', currentState);

    return currentState;
  }
}

export const metaReducers: MetaReducer[] = [logger];