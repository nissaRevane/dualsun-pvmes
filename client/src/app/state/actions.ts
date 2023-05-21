import { createAction, props } from '@ngrx/store';

export const updateStore = createAction(
  'updateStore',
  props<{ category: string, key: string, value: string }>()
);