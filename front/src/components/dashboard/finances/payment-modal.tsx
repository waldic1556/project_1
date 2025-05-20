'use client';

import * as React from 'react';
import {
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  TextField,
  MenuItem,
} from '@mui/material';
import { PaymentDTO } from '@/services/payments-api';
import { LoanDTO } from '@/services/loans-api';
import { PaymentTypeDTO } from '@/services/payment_types-api';

interface PaymentModalProps {
  open: boolean;
  onClose: () => void;
  onSave: (payment: Partial<PaymentDTO>) => void;
  loans: LoanDTO[];
  paymentTypes: PaymentTypeDTO[];
  initialData?: Partial<PaymentDTO> | null;
}

export function PaymentModal({
  open,
  onClose,
  onSave,
  loans,
  paymentTypes,
  initialData,
}: PaymentModalProps) {
  const [formData, setFormData] = React.useState<Partial<PaymentDTO>>({
    loanId: loans[0]?.id || 0,
    amount: 0,
    paymentTypeId: paymentTypes[0]?.id || 0,
    paymentdate: new Date().toISOString(),
  });

  React.useEffect(() => {
    if (initialData) {
      setFormData({
        ...initialData,
        paymentdate: initialData.paymentdate || new Date().toISOString(),
      });
    }
  }, [initialData]);

  const handleChange = (field: keyof PaymentDTO) => (event: React.ChangeEvent<HTMLInputElement>) => {
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
      <DialogTitle>{initialData ? 'Edit Payment' : 'Create Payment'}</DialogTitle>
      <DialogContent sx={{ display: 'flex', flexDirection: 'column', gap: 2, marginTop: 1 }}>
        <TextField
          sx={{ mt: 3 }} 
          label="Amount"
          type="number"
          value={formData.amount}
          onChange={handleChange('amount')}
          fullWidth
        />
        <TextField
          label="Loan"
          select
          value={formData.loanId}
          onChange={handleChange('loanId')}
          fullWidth
        >
          {loans.map((loan) => (
            <MenuItem key={loan.id} value={loan.id}>
              Loan #{loan.id}
            </MenuItem>
          ))}
        </TextField>
        <TextField
          label="Payment Type"
          select
          value={formData.paymentTypeId}
          onChange={handleChange('paymentTypeId')}
          fullWidth
        >
          {paymentTypes.map((type) => (
            <MenuItem key={type.id} value={type.id}>
              {type.typename}
            </MenuItem>
          ))}
        </TextField>
        <TextField
          label="Payment Date"
          type="date"
          value={formData.paymentdate?.split('T')[0]}
          onChange={(e) =>
            setFormData((prev) => ({
              ...prev,
              paymentdate: `${e.target.value}T00:00:00Z`,
            }))
          }
          InputLabelProps={{
            shrink: true,
          }}
          fullWidth
        />
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
