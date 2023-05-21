import { createReducer, on } from '@ngrx/store';

import { updateCompanyName } from './actions';

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
    updateCompanyName,
    (state, props) => {
      return {...state, company: { ...state.company, name: props.name } }
    }
  )
);
