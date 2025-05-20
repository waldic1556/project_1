'use client';

import * as React from 'react';
import { LoanDTO } from '@/services/loans-api';
import { PaymentTypeDTO } from '@/services/payment_types-api';
import { PaymentDTO } from '@/services/payments-api';
import {
  Box,
  Button,
  Card,
  CardActions,
  CardHeader,
  Chip,
  Divider,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TablePagination,
  TableRow,
} from '@mui/material';
import type { SxProps } from '@mui/material/styles';
import { ArrowRight as ArrowRightIcon } from '@phosphor-icons/react/dist/ssr/ArrowRight';
import dayjs from 'dayjs';

export interface LatestPaymentsProps {
  readonly payments?: PaymentDTO[];
  readonly loans?: LoanDTO[];
  readonly paymentTypes?: PaymentTypeDTO[];
  readonly sx?: SxProps;
  readonly onEdit?: (payment: PaymentDTO) => void;
  readonly onDelete?: (payment: PaymentDTO) => void;
}

export function LatestPayments({
  payments = [],
  loans = [],
  paymentTypes = [],
  sx,
  onEdit,
  onDelete,
}: LatestPaymentsProps): React.JSX.Element {
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);

  const handlePageChange = (_event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const paginatedRows = React.useMemo(() => {
    return payments.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage);
  }, [payments, page, rowsPerPage]);

  const handleRowsPerPageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };
  return (
    <Card sx={sx}>
      <CardHeader title="Payments" />
      <Divider />
      <Box sx={{ overflowX: 'auto' }}>
        <Table sx={{ minWidth: 800 }}>
          <TableHead>
            <TableRow>
              <TableCell>#</TableCell>
              <TableCell>Loan ID</TableCell>
              <TableCell>Amount</TableCell>
              <TableCell>Payment Date</TableCell>
              <TableCell>Payment Type</TableCell>
              <TableCell>Actions</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {paginatedRows.map((payment) => {
              const loan = loans.find((l) => l.id === payment.loanId);
              const type = paymentTypes.find((t) => t.id === payment.paymentTypeId)?.typename;

              return (
                <TableRow hover key={payment.id}>
                  <TableCell>{payment.id}</TableCell>
                  <TableCell>{loan ? `#${loan.id}` : 'N/A'}</TableCell>
                  <TableCell>{payment.amount}</TableCell>
                  <TableCell>{dayjs(payment.paymentdate).format('MMM D, YYYY')}</TableCell>
                  <TableCell>
                    <Chip color="info" label={type} size="small" />
                  </TableCell>
                  <TableCell>
                    <Button
                      size="small"
                      variant="outlined"
                      onClick={(e) => {
                        e.stopPropagation();
                        onEdit?.(payment);
                      }}
                      sx={{ mr: 1 }}
                    >
                      Edit
                    </Button>
                    <Button
                      size="small"
                      variant="outlined"
                      color="error"
                      onClick={(e) => {
                        e.stopPropagation();
                        onDelete?.(payment);
                      }}
                    >
                      Delete
                    </Button>
                  </TableCell>
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </Box>
      <Divider />
      <TablePagination
        component="div"
        count={payments.length}
        onPageChange={handlePageChange}
        onRowsPerPageChange={handleRowsPerPageChange}
        page={page}
        rowsPerPage={rowsPerPage}
        rowsPerPageOptions={[5, 10, 25]}
      />
    </Card>
  );
}
