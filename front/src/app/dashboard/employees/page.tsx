'use client';

import * as React from 'react';
import { CustomerTypeDTO } from '@/services/customers-api';
import { createEmployee, deleteEmployee, EmployeeDTO, getAllEmployee, updateEmployee } from '@/services/employees-api';
import { getAllPosition, PositionDTO } from '@/services/positions-api';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import Typography from '@mui/material/Typography';
import { Plus as PlusIcon } from '@phosphor-icons/react/dist/ssr/Plus';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { toast } from 'react-toastify';

import { useSelection } from '@/hooks/use-selection';
import { CreateEmployeeModal, EmployeeFormData } from '@/components/dashboard/employees/create-employee-modal';
import { EmployeeFilters } from '@/components/dashboard/employees/employee-filters';
import { EmployeeTable } from '@/components/dashboard/employees/employee-table';

export default function Page(): React.JSX.Element {
  const [employee, setEmployee] = React.useState<EmployeeDTO[]>([]);
  const [selectedEmployee, setSelectedCustomer] = React.useState<EmployeeDTO | null>(null);
  const rowIds = React.useMemo(() => employee.map((c) => c.id), [employee]);
  const { selected, selectAll, deselectAll, selectOne, deselectOne, selectedAny } = useSelection(rowIds);
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);
  const [searchQuery, setSearchQuery] = React.useState('');
  const [positionTypes, setPositionTypes] = React.useState<PositionDTO[]>([]);
  const [open, setOpen] = React.useState(false);

  React.useEffect(() => {
    async function fetchEmployee() {
      try {
        const [customerList, customerTypeList] = await Promise.all([getAllEmployee(), getAllPosition()]);
        setEmployee(customerList);
        setPositionTypes(customerTypeList);
      } catch (error) {
        console.error('Error while uploading Employee', error);
      }
    }

    fetchEmployee();
  }, []);

  const exportToPDF = () => {
    const doc = new jsPDF();
    doc.text('Customer List', 14, 10);

    autoTable(doc, {
      startY: 20,
      head: [['ID', 'Name', 'login', 'position']],
      body: getFilteredEmployee().map((c) => [c.id, c.name, c.login, c.position]),
    });

    doc.save('employee.pdf');
  };

  const handleOpen = () => {
    setSelectedCustomer(null);
    setOpen(true);
  };
  const handleClose = () => setOpen(false);
  const getFilteredEmployee = () => {
    return employee.filter(
      (item) =>
        item.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        item.login.toLowerCase().includes(searchQuery.toLowerCase())
    );
  };
  const handleSave = async (data: EmployeeFormData) => {
    console.log('Save customer:', data);
    data.position = `${data.position}`;

    if (data.login == '' || data.password == '' || data.position == '' || data.name == '') {
      toast.error('Value is required');
      return;
    }
    if (data.login.length < 3) {
      toast.error('login must be at least 3 symbols');
      return;
    }

    if (data.password.length < 6 || data.password.length > 20) {
      toast.error('Password must be 6-20 symbols');
      return;
    }

    if (selectedEmployee) {
      await updateEmployee({
        ...data,
        id: selectedEmployee.id,
      });
    } else {
      await createEmployee(data);
    }
    setEmployee(await getAllEmployee());
    handleClose();
  };

  const handleDeleteSelected = async () => {
    await Promise.all(Array.from(selected).map((id) => deleteEmployee(+id)));
    const updatedEmployee = await getAllEmployee();
    setEmployee(updatedEmployee);
    deselectAll();
  };

  const handleRowClick = (employee: EmployeeDTO) => {
    setSelectedCustomer({
      ...employee,
      position: positionTypes.find((item) => item.positionname == employee.position)?.id.toString()!,
      // type: customerTypes.find((item) => item.typename == customer.type)?.id.toString()!,
    });

    setOpen(true);
  };

  const handlePageChange = (_event: unknown, newPage: number) => {
    setPage(newPage);
  };

  const handleRowsPerPageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setRowsPerPage(parseInt(event.target.value, 10));
    setPage(0);
  };

  return (
    <Stack spacing={3}>
      <Stack direction="row" spacing={3}>
        <Stack spacing={1} sx={{ flex: '1 1 auto' }}>
          <Typography variant="h4">Employees</Typography>
        </Stack>
        <div>
          <Button onClick={exportToPDF} className="mb-4">
            Export to PDF
          </Button>
          <Button
            sx={{ mx: '5px' }}
            startIcon={<PlusIcon fontSize="var(--icon-fontSize-md)" />}
            onClick={handleOpen}
            variant="contained"
          >
            Add
          </Button>
          <Button
            startIcon={<PlusIcon fontSize="var(--icon-fontSize-md)" />}
            onClick={handleDeleteSelected}
            variant="contained"
          >
            Delete
          </Button>
        </div>
      </Stack>
      <EmployeeFilters onChange={setSearchQuery} searchQuery={searchQuery} />
      <EmployeeTable
        count={getFilteredEmployee().length}
        page={page}
        rows={getFilteredEmployee()}
        rowsPerPage={rowsPerPage}
        onPageChange={handlePageChange}
        onRowsPerPageChange={handleRowsPerPageChange}
        selected={selected}
        selectOne={selectOne}
        deselectOne={deselectOne}
        deselectAll={deselectAll}
        selectAll={selectAll}
        handleRowClick={handleRowClick}
      />

      <CreateEmployeeModal
        initialData={selectedEmployee}
        open={open}
        onClose={handleClose}
        onSave={handleSave}
        positionTypes={positionTypes}
      />
    </Stack>
  );
}
