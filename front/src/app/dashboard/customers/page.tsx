'use client';

import * as React from 'react';
import {
  createCustomer,
  CustomerDTO,
  CustomerTypeDTO,
  deleteCustomer,
  getAllCustomer,
  getAllCustomerTypes,
  updateCustomer,
} from '@/services/customers-api';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import Typography from '@mui/material/Typography';
import { Plus as PlusIcon } from '@phosphor-icons/react/dist/ssr/Plus';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { toast } from 'react-toastify';

import { useSelection } from '@/hooks/use-selection';
import { CreateCustomerModal, CustomerFormData } from '@/components/dashboard/customer/create-customer-modal';
import { CustomersFilters } from '@/components/dashboard/customer/customers-filters';
import { CustomersTable } from '@/components/dashboard/customer/customers-table';

// export const metadata = { title: `Customers | Dashboard | ${config.site.name}` } satisfies Metadata;

export default function Page(): React.JSX.Element {
  const [customers, setCustomers] = React.useState<CustomerDTO[]>([]);
  const [selectedCustomer, setSelectedCustomer] = React.useState<CustomerDTO | null>(null);
  const rowIds = React.useMemo(() => customers.map((c) => c.id), [customers]);
  const { selected, selectAll, deselectAll, selectOne, deselectOne, selectedAny } = useSelection(rowIds);
  const [page, setPage] = React.useState(0);
  const [rowsPerPage, setRowsPerPage] = React.useState(5);
  const [searchQuery, setSearchQuery] = React.useState('');
  const [customerTypes, setCustomerTypes] = React.useState<CustomerTypeDTO[]>([]);
  const [open, setOpen] = React.useState(false);

  React.useEffect(() => {
    async function fetchCustomers() {
      try {
        const [customerList, customerTypeList] = await Promise.all([getAllCustomer(), getAllCustomerTypes()]);
        setCustomers(customerList);
        setCustomerTypes(customerTypeList);
      } catch (error) {
        console.error('Error while uploading customers', error);
      }
    }

    fetchCustomers();
  }, []);

  const exportToPDF = () => {
    const doc = new jsPDF();
    doc.text('Customer List', 14, 10);

    autoTable(doc, {
      startY: 20,
      head: [['ID', 'Name', 'Phone', 'Type', 'DateOfBirth']],
      body: customers
        .filter((item) => item.name.toLowerCase().includes(searchQuery.toLowerCase()))
        .map((c) => [c.id, c.name, c.phone, c.type, c.dateofbirth]),
    });

    doc.save('customers.pdf');
  };

  const handleOpen = () => {
    setSelectedCustomer(null);
    setOpen(true);
  };
  const handleClose = () => setOpen(false);

  const handleSave = async (data: CustomerFormData) => {
    console.log('Save customer:', data);
    data.type = `${data.type}`;
    if (!data.name || !data.dateofbirth || !data.phone || !data.type) {
      toast.error('Value is required');
      return;
    }

    if (selectedCustomer) {
      await updateCustomer({
        ...data,
        id: selectedCustomer.id,
      });
    } else {
      await createCustomer(data);
    }
    setCustomers(await getAllCustomer());
    handleClose();
  };

  const handleDeleteSelected = async () => {
    try{

      await Promise.all(Array.from(selected).map((id) => deleteCustomer(+id)));
    }catch(e){
      
    }
    const updatedCustomers = await getAllCustomer();
    setCustomers(updatedCustomers);
    deselectAll();
  };

  const handleRowClick = (customer: CustomerDTO) => {
    console.log(customer);

    setSelectedCustomer({
      ...customer,
      type: customerTypes.find((item) => item.typename == customer.type)?.id.toString()!,
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
          <Typography variant="h4">Customers</Typography>
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
      <CustomersFilters onChange={setSearchQuery} searchQuery={searchQuery} />
      <CustomersTable
        count={customers.filter((item) => item.name.toLowerCase().includes(searchQuery.toLowerCase())).length}
        page={page}
        rows={customers.filter((item) => item.name.toLowerCase().includes(searchQuery.toLowerCase()))}
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

      <CreateCustomerModal
        initialData={selectedCustomer}
        open={open}
        onClose={handleClose}
        onSave={handleSave}
        customerTypes={customerTypes}
      />
    </Stack>
  );
}
