
"use client";
import { useEffect, useState } from "react";
import LogsFilters from "@/components/dashboard/logs/logs-filters";
import LogsTable from "@/components/dashboard/logs/logs-table";
import { UserLog, fetchLogs } from "@/services/logs-api";
import BackupManager from "@/components/dashboard/settings/backup";

export default function LogsPage() {
  const [logs, setLogs] = useState<UserLog[]>([]);

  const handleFilter = async (userId?: string, action?: string, from?: string, to?: string) => {
    const filtered = await fetchLogs(userId, action, from, to);
    setLogs(filtered);
  };

  useEffect(() => {
    handleFilter();
  }, []);

  return (
    <div style={{ padding: "1rem" }}>
            <BackupManager />
      <h1 style={{ fontSize: "24px", fontWeight: "bold", marginBottom: "1rem" }}>
        Logs
      </h1>
      <LogsFilters onFilter={handleFilter} />
      <LogsTable logs={logs} />
    </div>
  );
}
