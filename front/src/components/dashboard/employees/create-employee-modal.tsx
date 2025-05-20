'use client';

import * as React from 'react';
import { CustomerDTO, CustomerTypeDTO } from '@/services/customers-api';
import { EmployeeDTO } from '@/services/employees-api';
import { PositionDTO } from '@/services/positions-api';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import MenuItem from '@mui/material/MenuItem';
import TextField from '@mui/material/TextField';

export interface EmployeeFormData {
  name: string;
  login: string;
  password: string;
  position: string;
}

interface CreateEmployeeModalProps {
  readonly open: boolean;
  readonly onClose: () => void;
  readonly onSave: (data: EmployeeFormData) => void;
  readonly positionTypes: PositionDTO[];
  readonly initialData?: EmployeeDTO | null;
}

export function CreateEmployeeModal({
  open,
  onClose,
  onSave,
  positionTypes,
  initialData,
}: CreateEmployeeModalProps): React.JSX.Element {
  const [formData, setFormData] = React.useState<EmployeeFormData>({
    name: '',
    login: '',
    password: '',
    position: '',
  });

  React.useEffect(() => {
    if (initialData) {
      setFormData({
        name: initialData.name,
        login: initialData.login,
        password: '',
        position: initialData.position,
      });
    } else {
      setFormData({ name: '', login: '', password: '', position: '' });
    }
  }, [initialData]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData((prev) => ({
      ...prev,
      [e.target.name]: e.target.value,
    }));
  };

  const handleSubmit = () => {
    onSave(formData);
    setFormData({ name: '', login: '', password: '', position: '' });
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>{initialData ? 'Edit customer' : 'Add customer'}</DialogTitle>
      <DialogContent sx={{ display: 'flex', flexDirection: 'column', gap: 2, mt: 1 }}>
        <TextField
          name="name"
          label="Name"
          sx={{ mt: 3 }}
          value={formData.name}
          onChange={handleChange}
          fullWidth
          required
        />
        <TextField name="login" label="Login" value={formData.login} onChange={handleChange} fullWidth required />
        <TextField name="password" label="Password" value={formData.password} onChange={handleChange} fullWidth required />

        <TextField name="position" label="Position" select value={formData.position} onChange={handleChange} fullWidth required>
          {positionTypes.map((type) => (
            <MenuItem key={type.id} value={type.id}>
              {type.positionname}
            </MenuItem>
          ))}
        </TextField>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose}>Cancel</Button>
        <Button onClick={handleSubmit} variant="contained">
          Save
        </Button>
      </DialogActions>
    </Dialog>
  );
}
