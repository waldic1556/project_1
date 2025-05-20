'use client';

import * as React from 'react';
import { CustomerDTO, CustomerTypeDTO } from '@/services/customers-api';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogActions from '@mui/material/DialogActions';
import DialogContent from '@mui/material/DialogContent';
import DialogTitle from '@mui/material/DialogTitle';
import MenuItem from '@mui/material/MenuItem';
import TextField from '@mui/material/TextField';

export interface CustomerFormData {
  name: string;
  dateofbirth: string;
  phone: string;
  type: string;
}

interface CreateCustomerModalProps {
  readonly open: boolean;
  readonly onClose: () => void;
  readonly onSave: (data: CustomerFormData) => void;
  readonly customerTypes: CustomerTypeDTO[];
  readonly initialData?: CustomerDTO | null;
}

export function CreateCustomerModal({
  open,
  onClose,
  onSave,
  customerTypes,
  initialData,
}: CreateCustomerModalProps): React.JSX.Element {
  const [formData, setFormData] = React.useState<CustomerFormData>({
    name: '',
    dateofbirth: '',
    phone: '',
    type: '',
  });

  React.useEffect(() => {
    if (initialData) {
      setFormData({
        name: initialData.name,
        dateofbirth: initialData.dateofbirth,
        phone: initialData.phone,
        type: initialData.type,
      });
    } else {
      setFormData({ name: '', dateofbirth: '', phone: '', type: '' });
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
    setFormData({ name: '', dateofbirth: '', phone: '', type: '' });
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
        <TextField
          name="dateofbirth"
          label="Date of Birth"
          type="date"
          value={formData.dateofbirth}
          onChange={handleChange}
          InputLabelProps={{ shrink: true }}
          fullWidth
          required
        />
        <TextField name="phone" label="Phone" value={formData.phone} onChange={handleChange} fullWidth required />
        <TextField name="type" label="Type" select value={formData.type} onChange={handleChange} fullWidth required>
          {customerTypes.map((type) => (
            <MenuItem key={type.id} value={type.id}>
              {type.typename}
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
