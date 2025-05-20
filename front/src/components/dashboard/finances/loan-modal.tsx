'use client';

import * as React from 'react';
import { CustomerDTO } from '@/services/customers-api';
import { LoanStatusDTO } from '@/services/loan_statuses-api';
import { LoanTypeDTO } from '@/services/loan_types-api';
import { LoanDTO } from '@/services/loans-api';
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, MenuItem, TextField } from '@mui/material';

interface LoanModalProps {
  readonly open: boolean;
  readonly onClose: () => void;
  readonly onSave: (loan: Partial<LoanDTO>) => void;
  readonly loanTypes: LoanTypeDTO[];
  readonly loanStatuses: LoanStatusDTO[];
  readonly initialData?: Partial<LoanDTO> | null;
  readonly customers: CustomerDTO[];
}

export function LoanModal({ open, onClose, onSave, loanTypes, loanStatuses, initialData, customers }: LoanModalProps) {
  const [formData, setFormData] = React.useState<Partial<LoanDTO>>({
    amount: 0,
    interestrate: 0,
    termmonths: 0,
    loantypeid: loanTypes[0]?.id || 0,
    statusid: loanStatuses[0]?.id || 0,
    customerid: customers[0]?.id || 0,
    creatintime: new Date().toISOString(),
  });

  React.useEffect(() => {
    if (initialData) {
      setFormData({
        ...initialData,
        creatintime: initialData.creatintime || new Date().toISOString(),
      });
    }
  }, [initialData]);

  const handleChange = (field: keyof LoanDTO) => (event: React.ChangeEvent<HTMLInputElement>) => {
    setFormData((prev) => ({
      ...prev,
      [field]: event.target.value,
    }));
  };

  const handleSave = () => {
    onSave(formData);
    onClose();
  };

  return (
    <Dialog open={open} onClose={onClose} fullWidth>
      <DialogTitle>{initialData ? 'Edit Loan' : 'Create Loan'}</DialogTitle>
      <DialogContent sx={{ display: 'flex', flexDirection: 'column', gap: 2, marginTop: 1 }}>
        <TextField
          sx={{ mt: 3 }}
          label="Amount"
          type="number"
          required
          value={formData.amount}
          onChange={handleChange('amount')}
          fullWidth
        />
        <TextField
          required
          label="Interest Rate"
          type="number"
          value={formData.interestrate}
          onChange={handleChange('interestrate')}
          fullWidth
        />
        <TextField
          required
          label="Term Months"
          type="number"
          value={formData.termmonths}
          onChange={handleChange('termmonths')}
          fullWidth
        />
        <TextField
          required
          label="Loan Type"
          select
          value={formData.loantypeid}
          onChange={handleChange('loantypeid')}
          fullWidth
        >
          {loanTypes.map((type) => (
            <MenuItem key={type.id} value={type.id}>
              {type.typename}
            </MenuItem>
          ))}
        </TextField>
        <TextField
          required
          label="Loan Status"
          select
          value={formData.statusid}
          onChange={handleChange('statusid')}
          fullWidth
        >
          {loanStatuses.map((status) => (
            <MenuItem key={status.id} value={status.id}>
              {status.statusname}
            </MenuItem>
          ))}
        </TextField>

        <TextField
          required
          label="Customer"
          select
          value={formData.customerid}
          onChange={handleChange('customerid')}
          fullWidth
        >
          {customers.map((customer) => (
            <MenuItem key={customer.id} value={customer.id}>
              {`${customer.name} (${customer.phone})`}
            </MenuItem>
          ))}
        </TextField>
      </DialogContent>
      <DialogActions>
        <Button variant="outlined" onClick={onClose}>
          Cancel
        </Button>
        <Button variant="contained" onClick={handleSave}>
          Save
        </Button>
      </DialogActions>
    </Dialog>
  );
}
