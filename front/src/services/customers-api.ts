'use client';

import { CustomerFormData } from '@/components/dashboard/customer/create-customer-modal';
import { apiLink } from '@/constants';
import axios from 'axios';
import api from './axios-api';

export interface CustomerDTO {
  id: number;
  name: string;
  dateofbirth: string;
  phone: string;
  type: string;
}

export interface CustomerTypeDTO {
  id: number;
  typename: string;
}

export async function getAllCustomer() {
  const response = await api.get<CustomerDTO[]>(`${apiLink}Customer`);
  return response.data;
}
export async function getAllCustomerTypes() {
  const response = await api.get<CustomerTypeDTO[]>(`${apiLink}CustomerType`);
  return response.data;
}

export async function getCustomerById(id: number) {
  const response = await api.get(`${apiLink}Customer/${id}`);
  return response.data;
}

export async function createCustomer(data: CustomerFormData) {

  await api.post(`${apiLink}Customer`,data);
}

export async function updateCustomer(data: any) {
  await api.put(`${apiLink}Customer`, data);
}

export async function deleteCustomer(id: number) {
  await api.delete(`${apiLink}Customer/${id}`);
}
