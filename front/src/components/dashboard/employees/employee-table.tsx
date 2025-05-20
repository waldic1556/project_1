'use client';

import * as React from 'react';

import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import Checkbox from '@mui/material/Checkbox';
import Divider from '@mui/material/Divider';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableHead from '@mui/material/TableHead';
import TablePagination from '@mui/material/TablePagination';
import TableRow from '@mui/material/TableRow';
import dayjs from 'dayjs';

import { EmployeeDTO } from '@/services/employees-api';

interface EmployeeTableProps {
  readonly count?: number;
  readonly page?: number;
  readonly rows?: EmployeeDTO[];
  readonly rowsPerPage?: number;
  readonly onPageChange: (event: unknown, newPage: number) => void;
  readonly onRowsPerPageChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
  readonly selected: Set<number>;
  readonly selectOne: (id: number) => void;
  readonly deselectOne: (id: number) => void;
  readonly selectAll: () => void;
  readonly deselectAll: () => void;
  readonly handleRowClick: (c:EmployeeDTO) => void;
  
}

export function EmployeeTable({
  count = 0,
  rows = [],
  page = 0,
  rowsPerPage = 0,
  onPageChange,
  onRowsPerPageChange,
  selected,
  selectOne,
  deselectOne,
  selectAll,
  deselectAll,
  handleRowClick
}: EmployeeTableProps): React.JSX.Element {


  const paginatedRows = React.useMemo(() => {
    return rows.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage);
  }, [rows, page, rowsPerPage]);

  const selectedSome = (selected?.size ?? 0) > 0 && (selected?.size ?? 0) < rows.length;
  const selectedAll = rows.length > 0 && selected?.size === rows.length;

  return (
    <Card>
      <Box sx={{ overflowX: 'auto' }}>
        <Table sx={{ minWidth: '800px' }}>
          <TableHead>
            <TableRow>
              <TableCell padding="checkbox">
                <Checkbox
                  checked={selectedAll}
                  indeterminate={selectedSome}
                  onChange={(event) => {
                    if (event.target.checked) {
                      selectAll();
                    } else {
                      deselectAll();
                    }
                  }}
                />
              </TableCell>
              <TableCell>Id</TableCell>
              <TableCell>Name</TableCell>
              <TableCell>Login</TableCell>
              <TableCell>Position</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {paginatedRows.map((row) => {
              const isSelected = selected?.has(row.id);

              return (
                <TableRow onClick={()=>{handleRowClick(row)}} hover key={row.id} selected={isSelected}>
                  <TableCell onClick={(e)=>{
                    e.stopPropagation();
                  }} padding="checkbox">
                    <Checkbox
                      checked={isSelected}
                      onChange={(event) => {
                        if (event.target.checked) {
                          selectOne(row.id);
                        } else {
                          deselectOne(row.id);
                        }
                      }}
                    />
                  </TableCell>

                  <TableCell>{row.id}</TableCell>
                  <TableCell>{row.name}</TableCell>
                  <TableCell>{row.login}</TableCell>
                  <TableCell>{row.position}</TableCell>
                </TableRow>
              );
            })}
          </TableBody>
        </Table>
      </Box>
      <Divider />
      <TablePagination
        component="div"
        count={count}
        onPageChange={onPageChange}
        onRowsPerPageChange={onRowsPerPageChange}
        page={page}
        rowsPerPage={rowsPerPage}
        rowsPerPageOptions={[5, 10, 25]}
      />
    </Card>
  );
}
