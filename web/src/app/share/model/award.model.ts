import {Country} from './country.model';

export interface Award {
  id?: number;
  title: string;
  country?: Country;
}
