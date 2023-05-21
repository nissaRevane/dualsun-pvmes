import { createAction, props } from '@ngrx/store';

export const updateCompanyName = createAction(
  'Update company name',
  props<{ name: string }>()
);