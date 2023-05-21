import { createReducer, on } from '@ngrx/store';

import { updateStore } from './actions';

const initialState = {
  company: {
    name: '',
    immatriculation: ''
  },
  customer: {
    name: '',
    email: '',
    phoneNumber: ''
  },
  installation: {
    startDate: '',
    numberOfPanels: 0
  },
  address: {
    number: '',
    street: '',
    zipCode: '',
    city: '',
    country: ''
  },
  panels: []
};

export const pvmesFormReducer = createReducer(
  initialState,
  on(
    updateStore,
    (state, props: { category: string, key: string, value: string }) => {
      return {
        ...state,
        [props.category]: {
          ...state[props.category as keyof typeof state],
          [props.key]: props.value
        }
      };
    }
  )
);
