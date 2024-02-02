import os
import sys
import time
from datetime import datetime

from math import nan
import pandas as pd
from alive_progress import alive_bar
from mysql.connector import Error, connect

from utils.get_period import get_period_time
from utils.get_datatype import get_data_type


class OccupancyDataReader:
    connection = None
    path = None

    current_file_name = None
    current_data_type = None
    current_period_time = None
    current_execute_time = None
    sheets = None
    current_sheet_name = None

    #################
    # Constructor
    def __init__(self, **config):
        try:
            self.connection = connect(
                host=config["host"],
                user=config["user"],
                password=config["password"],
                database=config["database"],
                auth_plugin='mysql_native_password'
            )
            self.path = config["path"]

        except Error as e:
            print(e)
            sys.exit(1)

    # Destructor
    def __del__(self):
        if self.connection is not None:
            self.connection.close()

    # ----------------

    #################
    # Test connection available
    def check_connection(self):
        if self.connection.is_connected:
            print("Connected")
        else:
            print("Not connected")

    # ----------------

    #################
    # Check if file_name exist in logdata and success to processed
    def check_log_data(self):
        cursor = self.connection.cursor(prepared=True)
        cursor.execute(
            """
            SELECT COUNT(*)
            FROM logdata
            WHERE fileName=(?)
            AND sheetName=(?)
            AND status=(?)
            """,
            (self.current_file_name, self.current_sheet_name, "Success"),
        )

        result = cursor.fetchall()
        cursor.close()

        row_count = result[0][0]
        if row_count > 0:
            return True
        else:
            return False

    # Insert new log data
    def insert_to_log_data(self, **kwargs):
        cursor = self.connection.cursor(prepared=True)
        print(f"{kwargs['status']}: {kwargs['deskripsi']}")

        cursor.execute(
            """
            INSERT INTO log_inject
            VALUES (?,?,?,?,?,?,?,?)
            """,
            (
                self.current_file_name,
                self.current_data_type,
                self.current_sheet_name,
                self.current_period_time,
                self.current_execute_time,
                kwargs["status"],
                kwargs["deskripsi"],
                kwargs["jumlah_row"],
            ),
        )

        self.connection.commit()
        cursor.close()

    # ----------------

    #################
    # For each new file processing, generate the atrributes for logging
    def set_current_process_attributes(self, file_path):
        # Timestamp saat eksekusi file
        self.current_execute_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        # Nama file
        self.current_file_name = os.path.basename(file_path)

        # Mengambil periode waktu berdasarkan nama file
        self.current_period_time = get_period_time(self.current_file_name)

        # Mengambil periode waktu berdasarkan nama file
        self.current_data_type = get_data_type(self.current_file_name)

        # Nama sheet yang akan di proses
        self.sheets = ["Kunjungan", "Menginap", "Jumlah Area"]

        # Current sheet kosong
        self.current_sheet_name = ""

    # Reset attribute for the next process

    def reset_current_process_attributes(self):
        self.current_file_name = None
        self.current_data_type = None
        self.sheets = None
        self.current_sheet_name = None
        self.current_period_time = None
        self.current_execute_time = None

    def is_duplicate_kunjungan(self, data) -> bool:
        cursor = self.connection.cursor(prepared=True)
        cursor.execute(
            """
            SELECT Tahun, Bulan
            FROM kunjungan
            WHERE Tahun=(?)
            AND Bulan=(?)
            AND ID_Negara_Wisatawan=(?)
            AND ID_Kawasan=(?)
            """,
            data
        )
        results = cursor.fetchall()
        cursor.close()

        if len(results) > 0:
            return True
        else:
            return False

    def insert_to_kunjungan(self, data) -> bool:
        tahun = int(data[0])
        bulan = int(data[1])
        id_negara_wisatawan = str(data[2])
        id_kawasan = str(data[3])

        total_kunjungan = int(data[4])

        check = (tahun, bulan, id_negara_wisatawan, id_kawasan)
        data = (tahun, bulan, id_negara_wisatawan, id_kawasan, total_kunjungan)

        if self.is_duplicate_kunjungan(check):
            return False
        else:
            cursor = self.connection.cursor(prepared=True)
            cursor.execute(
                """
                INSERT INTO kunjungan
                VALUES (?,?,?,?,?)
                """,
                data,
            )
            self.connection.commit()
            cursor.close()

            return True

    def is_duplicate_menginap(self, data) -> bool:
        cursor = self.connection.cursor(prepared=True)
        cursor.execute(
            """
            SELECT Tahun, Bulan
            FROM menginap
            WHERE Tahun=(?)
            AND Bulan=(?)
            AND ID_Unit =(?)
            AND ID_Kawasan=(?)
            """,
            data
        )
        results = cursor.fetchall()
        cursor.close()

        if len(results) > 0:
            return True
        else:
            return False

    def insert_to_menginap(self, data) -> bool:
        tahun = int(data[0])
        bulan = int(data[1])
        id_unit = str(data[2])
        id_kawasan = str(data[3])

        occupancy = float(data[4])
        jumlah_kamar = int(data[5])
        jumlah_menginap = int(data[6])
        total_rate = float(data[7])

        check = (tahun, bulan, id_unit, id_kawasan)
        data = (tahun, bulan, id_unit, id_kawasan, occupancy,
                jumlah_kamar, jumlah_menginap, total_rate)

        if self.is_duplicate_menginap(check):
            return False
        else:
            cursor = self.connection.cursor(prepared=True)
            cursor.execute(
                """
                INSERT INTO menginap
                VALUES (?,?,?,?,?,?,?,?,?)
                """,
                data,
            )
            self.connection.commit()
            cursor.close()

            return True

    def is_duplicate_jumlah_area(self, data) -> bool:
        cursor = self.connection.cursor(prepared=True)
        cursor.execute(
            """
            SELECT Tahun, Bulan
            FROM jumlah_area
            WHERE Tahun=(?)
            AND Bulan=(?)
            AND ID_Area =(?)
            """,
            data
        )
        results = cursor.fetchall()
        cursor.close()

        if len(results) > 0:
            return True
        else:
            return False

    def insert_to_jumlah_area(self, data) -> bool:
        id_area = int(data[0])
        tahun = int(data[1])
        bulan = int(data[2])
        kunjungan_area = str(data[3])

        check = (tahun, bulan, id_area)
        data = (id_area, tahun, bulan, kunjungan_area)

        if self.is_duplicate_jumlah_area(check):
            return False
        else:
            cursor = self.connection.cursor(prepared=True)
            cursor.execute(
                """
                INSERT INTO jumlah_area
                VALUES (?,?,?,?)
                """,
                data,
            )
            self.connection.commit()
            cursor.close()

            return True

    # File processing
    def process_file(self, file_path):
        self.set_current_process_attributes(file_path)
        file = pd.ExcelFile(file_path)

        # Mengecek data pada logData apakah sudah tersedia
        is_file_duplicate = self.check_log_data()
        if is_file_duplicate:
            # Jika pada logData data sudah pernah ada, masukkan Log Error
            self.insert_to_log_data(
                status="Error",
                deskripsi="Data sudah pernah diinput atau sheet tidak sesuai",
                jumlah_row=0,
            )
            return

        total_rows = 0
        total_inserted = 0
        for sheet in self.sheets:
            self.current_sheet_name = sheet

            print("Current sheet:", self.current_sheet_name)
            print("Start:", str(self.current_execute_time))
            inserted = 0
            not_inserted = 0

            # Baca data pada sheet
            df = file.parse(sheet)

            # Konversi struktur data
            df = df.replace({nan: None})
            df = df.to_dict(orient="records")
            total_rows = total_rows + len(df)

            cursor = self.connection.cursor()

            with alive_bar(len(df)) as bar:
                for row in df:
                    arr = list(row.values())
                    arr = [0 if value is None else value for value in arr]

                    is_inserted = False
                    match sheet:
                        case "Kunjungan":
                            is_inserted = self.insert_to_kunjungan(arr)

                        case "Menginap":
                            is_inserted = self.insert_to_menginap(arr)

                        case "Jumlah Area":
                            is_inserted = self.insert_to_jumlah_area(arr)

                        case _:
                            print("Sheet not available.", sheet)

                    if is_inserted:
                        inserted += 1
                    else:
                        not_inserted += 1

                    bar.text(f"| OK: {inserted} ~ HALT: {not_inserted}")
                    bar()
                total_inserted = total_inserted + inserted

        # self.connection.commit()
        file.close()
        cursor.close()

        # Jika jumlah data sesuai, masukkan Log Success ke logData
        if (total_inserted == total_rows):
            self.insert_to_log_data(
                status="Success",
                deskripsi="Done",
                jumlah_row=str(total_inserted),
            )

        # Jika jumlah data tidak sesuai, masukkan Log Error
        else:
            self.insert_to_log_data(
                status="Error",
                deskripsi="Ada data yang sudah terdapat di database",
                jumlah_row=str(total_inserted),
            )

        # Pindahkan file
        source = file_path
        destination = os.path.join(
            os.path.dirname(
                file_path), "archive", self.current_file_name
        )
        os.rename(source, destination)

        # Selesai
        print(f"Inserted: {inserted} \tNot inserted: {not_inserted}")

        # Reset
        self.reset_current_process_attributes()
        print("\nListen to directory: {}".format(self.path))
        time.sleep(5)

    # ----------------
