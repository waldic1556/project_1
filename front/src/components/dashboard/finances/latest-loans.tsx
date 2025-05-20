import * as React from 'react';
import { LoanStatusDTO } from '@/services/loan_statuses-api';
import { LoanTypeDTO } from '@/services/loan_types-api';
import { LoanDTO } from '@/services/loans-api';
import { TablePagination } from '@mui/material';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardHeader from '@mui/material/CardHeader';
import Chip from '@mui/material/Chip';
import Divider from '@mui/material/Divider';
import type { SxProps } from '@mui/material/styles';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import { ArrowRight as ArrowRightIcon } from '@phosphor-icons/react/dist/ssr/ArrowRight';
import dayjs from 'dayjs';

export interface LatestOrdersProps {
  readonly loans?: LoanDTO[];
  readonly loanStatuses?: LoanStatusDTO[];
  readonly loanTypes?: LoanTypeDTO[];
  readonly sx?: SxProps;
  readonly onEdit?: (loan: LoanDTO) => void;
  readonly onDelete?: (loan: LoanDTO) => void;
  readonly onRowClick: (id: number) => void;
}

export function LatestLoans({
  loans = [],
  loanStatuses = [],
  loanTypes = [],
  sx,
  onEdit,
  onRowClick,
  onDelete,
}: LatestOrdersProps): React.JSX.Element {
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);

  const handlePageChange = (_event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const paginatedRows = React.useMemo(() => {
    return loans.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage);
  }, [loans, page, rowsPerPage]);

  const handleRowsPerPageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <Card sx={sx}>
      <CardHeader title="Loans" />
      <Divider />
      <Box sx={{ overflowX: 'auto' }}>
        <Table sx={{ minWidth: 800 }}>
          <TableHead>
            <TableRow>
              <TableCell>#</TableCell>
              <TableCell>Amount</TableCell>
              <TableCell>Interest rate</TableCell>
              <TableCell>Term months</TableCell>
              <TableCell sortDirection="desc">Creation Time</TableCell>
              <TableCell>Type</TableCell>
              <TableCell>Status</TableCell>
              <TableCell>Actions</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {paginatedRows.map((loan) => {
              const status = loanStatuses.find((item) => item.id == loan.statusid)?.statusname;
              const type = loanTypes.find((item) => item.id == loan.loantypeid)?.typename;

              return (
                <TableRow
                  onClick={() => {
                    onRowClick(loan.id);
                  }}
                  hover
                  key={loan.id}
                >
                  <TableCell>{loan.id}</TableCell>
                  <TableCell>{loan.amount}</TableCell>
                  <TableCell>{loan.interestrate}</TableCell>
                  <TableCell>{loan.termmonths}</TableCell>

                  <TableCell>{dayjs(loan.creatintime).format('MMM D, YYYY')}</TableCell>
                  <TableCell>
                    <Chip color={'success'} label={type} size="small" />
                  </TableCell>
                  <TableCell>
                    <Chip color={'warning'} label={status} size="small" />
                  </TableCell>
                  <TableCell>
                    <Button
                      size="small"
                      variant="outlined"
                      onClick={(e) => {
                        e.stopPropagation();
                        onEdit?.(loan);
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
                        onDelete?.(loan);
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
        count={loans.length}
        onPageChange={handlePageChange}
        onRowsPerPageChange={handleRowsPerPageChange}
        page={page}
        rowsPerPage={rowsPerPage}
        rowsPerPageOptions={[5, 10, 25]}
      />
    </Card>
  );
}
