import * as React from 'react';

import { MagnifyingGlass as MagnifyingGlassIcon } from '@phosphor-icons/react/dist/ssr/MagnifyingGlass';
import { Autocomplete, TextField } from '@mui/material';
import { CustomerDTO } from '@/services/customers-api';

interface Props{
  readonly customers: CustomerDTO[];
  readonly onChange: (querry: number|null) => void;

}

export function FinancesUserFilters({customers,onChange}:Props): React.JSX.Element {
  const [value, setValue] = React.useState<CustomerDTO | null>(null);

  return (
    <Autocomplete
    value={value}
    onChange={(event: any, newValue: CustomerDTO | null) => {
      setValue(newValue);
      onChange(newValue ? newValue.id : null);
    }}
    options={customers}
    getOptionLabel={(option) => `${option.name} (${option.phone})`}
    renderInput={(params) => (
      <TextField {...params} label="Search customer" variant="outlined" />
    )}
    fullWidth
    clearOnEscape
    isOptionEqualToValue={(option, value) => option.id === value.id}
  />
    // <Card sx={{ p: 2 }}>
    //   <OutlinedInput
    //     defaultValue=""
    //     fullWidth
    //     placeholder="Search integration"
    //     startAdornment={
    //       <InputAdornment position="start">
    //         <MagnifyingGlassIcon fontSize="var(--icon-fontSize-md)" />
    //       </InputAdornment>
    //     }
    //     sx={{ maxWidth: '500px' }}
    //   />
    // </Card>
  );
}
