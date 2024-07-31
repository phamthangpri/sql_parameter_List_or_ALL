# Calculate Dividend and Export XML with SQL

## Overview

This project contains SQL scripts to calculate dividends for a list of contracts or all contracts within a specified date range and to generate XML files in batches. The scripts facilitate exporting data into XML format for further processing or reporting.

## Features

- Calculate dividends for specific or all contracts within a date range.
- Export data to XML files in batches.
- Split large datasets into manageable chunks for processing.

## Prerequisites

- SQL Server (or compatible RDBMS)
- A database with necessary tables (e.g., `table_contract`, `dividend`)

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/phamthangpri/calculate_dividend_export_xml_with_SQL.git
    ```
2. Import the SQL scripts into your SQL Server.

## Usage

### Calculate Dividends

Run the stored procedure `sp_procedure_div` to calculate dividends for specific or all contracts within a date range.

```sql
EXEC sp_procedure_div @startdate = '2024-01-01', @enddate = '2024-03-31', @contract_codes = '1234;5678;1122';
