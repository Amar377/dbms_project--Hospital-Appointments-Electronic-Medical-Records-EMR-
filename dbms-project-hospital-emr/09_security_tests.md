# 09 Security Tests
1. **Test:** Log in as 'scheduler' and try to delete from `Insurances` table.
   * **Result:** `ERROR 1142 (42000): DELETE command denied` (Success).
2. **Test:** Log in as 'clinician' and view `Prescriptions`.
   * **Result:** Query returns rows (Success).
