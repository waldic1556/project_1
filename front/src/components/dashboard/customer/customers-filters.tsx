import * as React from 'react';
import Card from '@mui/material/Card';
import InputAdornment from '@mui/material/InputAdornment';
import OutlinedInput from '@mui/material/OutlinedInput';
import { MagnifyingGlass as MagnifyingGlassIcon } from '@phosphor-icons/react/dist/ssr/MagnifyingGlass';

interface Props {
 readonly searchQuery: string;
 readonly onChange: (querry: string) => void;
}
export function CustomersFilters({ searchQuery, onChange }: Props): React.JSX.Element {
  return (
    <Card sx={{ p: 2 }}>
      <OutlinedInput
        fullWidth
        value={searchQuery}
        onChange={(e) => onChange(e.target.value)}
        placeholder="Search customer"
        startAdornment={
          <InputAdornment position="start">
            <MagnifyingGlassIcon fontSize="var(--icon-fontSize-md)" />
          </InputAdornment>
        }
        sx={{ maxWidth: '500px' }}
      />
    </Card>
  );
}
