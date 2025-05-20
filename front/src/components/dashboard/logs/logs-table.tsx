
"use client";
import { useState } from "react";
import {
  Table, TableHead, TableBody, TableRow, TableCell,
  TableContainer, Paper, TablePagination
} from "@mui/material";
import { UserLog } from "@/services/logs-api";

export default function LogsTable({ logs }: { logs: UserLog[] }) {
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  const handleChangePage = (event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <Paper sx={{ width: '100%' }}>
      <TableContainer>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>User</TableCell>
              <TableCell>Action</TableCell>
              <TableCell>Table</TableCell>
              <TableCell>Detail</TableCell>
              <TableCell>Date</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {logs.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage).map((log) => (
              <TableRow key={log.id}>
                <TableCell>{log.userId}</TableCell>
                <TableCell>{log.action}</TableCell>
                <TableCell>{log.tableName}</TableCell>
                <TableCell>{log.details}</TableCell>
                <TableCell>{new Date(log.timestamp).toLocaleString()}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <TablePagination
        component="div"
        count={logs.length}
        page={page}
        onPageChange={handleChangePage}
        rowsPerPage={rowsPerPage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />
    </Paper>
  );
}
