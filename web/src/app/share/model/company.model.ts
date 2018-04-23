import {Country} from './country.model';

export interface Company {
  id?: number;
  title: string;
  country?: Country;
}
