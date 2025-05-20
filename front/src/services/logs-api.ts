
import axios from "axios";
import api from "./axios-api";
import { apiLink } from "@/constants";

export interface UserLog {
  id: number;
  userId: string;
  action: string;
  tableName: string;
  details: string;
  timestamp: string;
}

export async function fetchLogs(
  userId?: string,
  action?: string,
  from?: string,
  to?: string
): Promise<UserLog[]> {
  const params: any = {};
  if (userId) params.userId = userId;
  if (action) params.action = action;
  if (from) params.from = from;
  if (to) params.to = to;

  const response = await api.get(`${apiLink}UserLog/filter`, { params });
  return response.data;
}
