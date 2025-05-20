'use client';

import * as React from 'react';
import { CustomerDTO, getAllCustomer } from '@/services/customers-api';
import { getAllLoanStatuse, LoanStatusDTO } from '@/services/loan_statuses-api';
import { getAllLoanType, LoanTypeDTO } from '@/services/loan_types-api';
import { createLoan, deleteLoan, getAllLoan, getLoansByCustomerId, LoanDTO, updateLoan } from '@/services/loans-api';
import { getAllPaymentType, PaymentTypeDTO } from '@/services/payment_types-api';
import {
  createPayment,
  deletePayment,
  getAllPayment,
  getPaymentByCustomerId,
  PaymentDTO,
  updatePayment,
} from '@/services/payments-api';
import { PaymentScheduleDTO } from '@/services/payments-schedule.api';
import { Dialog, DialogActions, DialogContent, DialogTitle, Grid } from '@mui/material';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import Typography from '@mui/material/Typography';
import { Plus as PlusIcon } from '@phosphor-icons/react/dist/ssr/Plus';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { toast } from 'react-toastify';
import { number } from 'zod';

import { FinancesUserFilters } from '@/components/dashboard/finances/integrations-filters';
import { LatestLoans } from '@/components/dashboard/finances/latest-loans';
import { LatestPayments } from '@/components/dashboard/finances/latest-payment';
import { LoanPaymentInfo } from '@/components/dashboard/finances/loan-info-modal';
import { LoanModal } from '@/components/dashboard/finances/loan-modal';
import { PaymentModal } from '@/components/dashboard/finances/payment-modal';
import { Budget } from '@/components/dashboard/overview/budget';
import { TotalCustomers } from '@/components/dashboard/overview/total-customers';
import { TotalPayments } from '@/components/dashboard/overview/total-payments';
import { TotalProfit } from '@/components/dashboard/overview/total-profit';
import LoanReports from '@/components/dashboard/finances/loanreports';

// export const metadata = { title: `Integrations | Dashboard | ${config.site.name}` } satisfies Metadata;

export default function Page(): React.JSX.Element {
  const [customers, setCustomers] = React.useState<CustomerDTO[]>([]);
  const [selectedCustomerId, setSelectedCustomerId] = React.useState<number | null>(null);

  //
  //  Loans
  //
  const [loans, setLoan] = React.useState<LoanDTO[]>([]);
  const [loanStatuses, setLoanStatuses] = React.useState<LoanStatusDTO[]>([]);
  const [loanTypes, setLoanTypes] = React.useState<LoanTypeDTO[]>([]);

  const [modalOpen, setModalOpen] = React.useState(false);
  const [selectedLoan, setSelectedLoan] = React.useState<LoanDTO | null>(null);
  const [deleteDialogOpen, setDeleteDialogOpen] = React.useState(false);
  const [loanToDelete, setLoanToDelete] = React.useState<LoanDTO | null>(null);

  const [loanInfoModalOpen, setLoanInfoModalOpen] = React.useState(false);
  const [loanInfoLoanId, setLoanInfoLoanId] = React.useState<number | null>(null);

  //
  //  Payments
  //
  const [payments, setPayments] = React.useState<PaymentDTO[]>([]);
  const [paymentTypes, setPaymentTypes] = React.useState<PaymentTypeDTO[]>([]);

  const [paymentModalOpen, setPaymentModalOpen] = React.useState(false);
  const [selectedPayment, setSelectedPayment] = React.useState<PaymentDTO | null>(null);
  const [deletePaymentDialogOpen, setDeletePaymentDialogOpen] = React.useState(false);
  const [paymentToDelete, setPaymentToDelete] = React.useState<PaymentDTO | null>(null);

  React.useEffect(() => {
    async function getData() {
      setCustomers(await getAllCustomer());
      setLoanStatuses(await getAllLoanStatuse());
      setLoanTypes(await getAllLoanType());
      setPaymentTypes(await getAllPaymentType());
    }
    getData();
  }, []);

  React.useEffect(() => {
    async function getData() {
      if (selectedCustomerId) {
        setLoan(await getLoansByCustomerId(selectedCustomerId));
        setPayments(await getPaymentByCustomerId(selectedCustomerId));
        return;
      }
      setPayments(await getAllPayment());
      setLoan(await getAllLoan());
    }
    getData();
  }, [selectedCustomerId]);

  const handleAddLoan = () => {
    setSelectedLoan(null);
    setModalOpen(true);
  };

  const handleEditLoan = (loan: LoanDTO) => {
    setSelectedLoan(loan);
    setModalOpen(true);
  };

  const handleViewLoanInfo = (loanId: number) => {
    setLoanInfoLoanId(loanId);
    setLoanInfoModalOpen(true);
  };

  const handleDeleteLoan = (loan: LoanDTO) => {
    setLoanToDelete(loan);
    setDeleteDialogOpen(true);
  };

  const handleSaveLoan = async (loan: Partial<LoanDTO>) => {
    console.log(loan);

    if (
      !loan.interestrate ||
      !loan.amount ||
      !loan.termmonths ||
      !loan.loantypeid ||
      !loan.statusid ||
      !loan.customerid
    ) {
      toast.error('data is required');
      return;
    }
    if (loan.amount < 0) {
      toast.error("amount can't be less than 0");
      return;
    }
    if (loan.termmonths < 0) {
      toast.error("termmonths can't be less than 0");
      return;
    }
    if (loan.interestrate < 0 || loan.interestrate > 10) {
      toast.error("interestrate can't be less than 0 or more than 10");
      return;
    }

    if (loan.id) {
      await updateLoan(loan);
    } else {
      await createLoan({ ...loan, id: 0 });
    }
    refreshLoans();
  };

  const exportToPDFPayment = () => {
    const doc = new jsPDF();
    doc.text('Customer List', 14, 10);

    autoTable(doc, {
      startY: 20,
      head: [['ID', 'Amount', 'Loan id', 'Payment type id', 'Patment Date']],
      body: payments.map((c) => [c.id, c.amount, c.loanId, c.paymentTypeId, c.paymentdate]),
    });

    doc.save('payment.pdf');
  };

  const exportToPDFLoan = () => {
    const doc = new jsPDF();
    doc.text('Customer List', 14, 10);

    autoTable(doc, {
      startY: 20,
      head: [
        ['ID', 'Amount', 'Creating Time', 'Customer id', 'Interest rate', 'loan type id', 'status id', 'term month'],
      ],
      body: loans.map((c) => [
        c.id,
        c.amount,
        c.creatintime,
        c.customerid,
        c.interestrate,
        c.loantypeid,
        c.statusid,
        c.termmonths,
      ]),
    });

    doc.save('employee.pdf');
  };

  const confirmDeleteLoan = async () => {
    if (loanToDelete) {
      await deleteLoan(loanToDelete.id);
      refreshLoans();
      setDeleteDialogOpen(false);
    }
  };

  async function refreshLoans() {
    if (selectedCustomerId) {
      setLoan(await getLoansByCustomerId(selectedCustomerId));
      return;
    }
    setLoan(await getAllLoan());
  }

  const handleAddPayment = () => {
    setSelectedPayment(null);
    setPaymentModalOpen(true);
  };

  const handleEditPayment = (payment: PaymentDTO) => {
    setSelectedPayment(payment);
    setPaymentModalOpen(true);
  };

  const handleDeletePayment = (payment: PaymentDTO) => {
    setPaymentToDelete(payment);
    setDeletePaymentDialogOpen(true);
  };

  const handleSavePayment = async (payment: Partial<PaymentDTO>) => {
    if (!payment.amount || !payment.loanId || !payment.paymentTypeId || !payment.paymentdate) {
      toast.error('data is required');
      return;
    }
    
    if (payment.amount < 0) {
      toast.error("amount can't be less than 0");
      return;
    }
  
    payment.amount = +payment.amount;
    payment.paymentdate = payment.paymentdate.split('T')[0];
    if (payment.id) {
      await updatePayment(payment);
    } else {
      await createPayment(payment);
    }
    refreshPayments();
  };

  const confirmDeletePayment = async () => {
    if (paymentToDelete) {
      await deletePayment(paymentToDelete.id);
      refreshPayments();
      setDeletePaymentDialogOpen(false);
    }
  };

  async function refreshPayments() {
    if (selectedCustomerId) {
      setPayments(await getPaymentByCustomerId(selectedCustomerId));
      return;
    }
    setPayments(await getAllPayment());
  }
  function roundValue(value: number) {
    return Math.floor(value * 100) / 100;
  }

  return (
    <Stack spacing={3}>
      <Stack direction="row" spacing={3}>
        <Stack spacing={1} sx={{ flex: '1 1 auto' }}>
          <Typography variant="h4">Finances</Typography>
        </Stack>
      </Stack>
      <FinancesUserFilters customers={customers} onChange={(customerId) => setSelectedCustomerId(customerId)} />
      <div className="d-flex">
        <Button onClick={exportToPDFLoan} className="mb-4">
          Export to PDF Loan
        </Button>
        <Button onClick={exportToPDFPayment} className="mb-4">
          Export to PDF Payment
        </Button>
      </div>
      <Grid sx={{ paddingLeft: '24px', marginTop: '24px' }} gap={3} container spacing={3}>
        <Grid lg={3} sm={6} xs={12}>
          <Budget
            sx={{ height: '100%' }}
            value={`${roundValue(loans.reduce((prev, curr, arr) => prev + curr.amount, 0))}`}
          />
        </Grid>
        <Grid lg={3} sm={6} xs={12}>
          <TotalCustomers sx={{ height: '100%' }} value={`${customers.length}`} />
        </Grid>
        <Grid lg={3} sm={6} xs={12}>
          <TotalPayments
            sx={{ height: '100%' }}
            value={`${roundValue(payments.reduce((prev, curr, arr) => prev + curr.amount, 0))}`}
          />
        </Grid>

        <Grid lg={12} sm={12} xs={12}>
          <Button
            onClick={handleAddLoan}
            startIcon={<PlusIcon fontSize="var(--icon-fontSize-md)" />}
            variant="contained"
          >
            Add
          </Button>
        </Grid>
        <Grid lg={12} md={12} xs={12}>
          <LatestLoans
            loans={loans}
            loanStatuses={loanStatuses}
            loanTypes={loanTypes}
            onEdit={handleEditLoan}
            onDelete={handleDeleteLoan}
            onRowClick={handleViewLoanInfo}
            sx={{ height: '100%' }}
          />
        </Grid>
        <Grid lg={12} sm={12} xs={12}>
          <Button
            onClick={handleAddPayment}
            startIcon={<PlusIcon fontSize="var(--icon-fontSize-md)" />}
            variant="contained"
            sx={{ ml: 2 }}
          >
            Add Payment
          </Button>
        </Grid>
        <Grid lg={12} md={12} xs={12}>
          <LatestPayments
            payments={payments}
            loans={loans}
            paymentTypes={paymentTypes}
            onEdit={handleEditPayment}
            onDelete={handleDeletePayment}
            sx={{ height: '100%' }}
          />
        </Grid>
      </Grid>

      <LoanModal
        open={modalOpen}
        onClose={() => setModalOpen(false)}
        onSave={handleSaveLoan}
        initialData={selectedLoan}
        loanStatuses={loanStatuses}
        customers={customers}
        loanTypes={loanTypes}
      />

      <Dialog open={deleteDialogOpen} onClose={() => setDeleteDialogOpen(false)}>
        <DialogTitle>Are you sure you want to delete this loan?</DialogTitle>
        <DialogActions>
          <Button onClick={() => setDeleteDialogOpen(false)}>Cancel</Button>
          <Button onClick={confirmDeleteLoan} color="error">
            Delete
          </Button>
        </DialogActions>
      </Dialog>

      <PaymentModal
        open={paymentModalOpen}
        onClose={() => setPaymentModalOpen(false)}
        onSave={handleSavePayment}
        initialData={selectedPayment}
        loans={loans}
        paymentTypes={paymentTypes}
      />

      <Dialog open={deletePaymentDialogOpen} onClose={() => setDeletePaymentDialogOpen(false)}>
        <DialogTitle>Are you sure you want to delete this payment?</DialogTitle>
        <DialogActions>
          <Button onClick={() => setDeletePaymentDialogOpen(false)}>Cancel</Button>
          <Button onClick={confirmDeletePayment} color="error">
            Delete
          </Button>
        </DialogActions>
      </Dialog>

      <Dialog open={loanInfoModalOpen} onClose={() => setLoanInfoModalOpen(false)} maxWidth="sm" fullWidth>
        <DialogTitle>Loan Info</DialogTitle>
        <DialogContent>{loanInfoLoanId !== null && <LoanPaymentInfo loanId={loanInfoLoanId} />}</DialogContent>
      </Dialog>

      <LoanReports />
    </Stack>
  );
}
