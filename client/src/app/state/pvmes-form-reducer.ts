import { ActionReducer ,createReducer, MetaReducer } from '@ngrx/store';

const initialState = {
  company: {},
  customer: {},
  installation: {},
  address: {},
  panels: []
};

function logger(reducer: ActionReducer<any>): ActionReducer<any> {
  return (state, action) => {
    const currentState = reducer(state, action);
    console.log('state before: ', state);
    console.log('state after: ', currentState);

    return currentState;
  }
}

export const metaReducers: MetaReducer[] = [logger];

export const pvmesFormReducer = createReducer(initialState);
