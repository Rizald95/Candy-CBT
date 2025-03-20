<?php
require("config/config.default.php");
require("config/config.function.php");
require("config/functions.crud.php");

if (!isset($_SESSION['id_siswa'])) {
    header('location:logout.php');
    exit();
} else {
    $id_tugas = $_POST['id_tugas'];
    $id_siswa = $_SESSION['id_siswa'];
    $jawaban = addslashes($_POST['jawaban']);
    $datetime = date('Y-m-d H:i:s');
    $ektensi = ['jpg', 'png', 'docx', 'pdf', 'xlsx'];

    if ($_FILES['file']['name'] <> '') {
        $file = $_FILES['file']['name'];
        $temp = $_FILES['file']['tmp_name'];
        $ext = explode('.', $file);
        $ext = end($ext);

        if (in_array($ext, $ektensi)) {
            $dest = 'tugas/';
            $file = $id_tugas . '_' . $id_siswa . '.' . $ext;
            $path = $dest . $file;
            $upload = move_uploaded_file($temp, $path);

            if ($upload) {
                // Insert or Update ke Database
                $data = array(
                    'id_tugas' => $id_tugas,
                    'id_siswa' => $id_siswa,
                    'jawaban' => $jawaban,
                    'file' => $file
                );
                $where = array(
                    'id_siswa' => $id_siswa,
                    'id_tugas' => $id_tugas
                );
                $cek = rowcount($koneksi, 'jawaban_tugas', $where);
                if ($cek == 0) {
                    insert($koneksi, 'jawaban_tugas', $data);
                } else {
                    update($koneksi, 'jawaban_tugas', $data, $where);
                }

                // ✅ Upload ke Nextcloud via WebDAV
                $webdav_url = "http://192.168.233.253/remote.php/dav/files/didit/"; // URL WebDAV
                $webdav_user = "didit"; // Username
                $webdav_pass = "diditPass"; // Ganti dengan password Nextcloud
                $remote_file_url = $webdav_url . $file;

                $file_contents = file_get_contents($path); // Baca file lokal

                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $remote_file_url);
                curl_setopt($ch, CURLOPT_USERPWD, $webdav_user . ":" . $webdav_pass);
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT"); // Upload metode PUT
                curl_setopt($ch, CURLOPT_POSTFIELDS, $file_contents);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Disable SSL Verify (LAN)

                $response = curl_exec($ch);
                $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
                curl_close($ch);

                if ($http_code == 201 || $http_code == 204) {
                    echo "ok"; // Jika sukses upload ke WebDAV
                } else {
                    echo "Upload ke Nextcloud gagal. Kode: " . $http_code;
                }

            } else {
                echo "gagal";
            }
        } else {
            echo "Ekstensi file tidak diperbolehkan!";
        }
    } else {
        // Jika hanya jawaban text tanpa file
        $data = array(
            'id_tugas' => $id_tugas,
            'id_siswa' => $id_siswa,
            'jawaban' => $jawaban
        );
        $where = array(
            'id_siswa' => $id_siswa,
            'id_tugas' => $id_tugas
        );
        $cek = rowcount($koneksi, 'jawaban_tugas', $where);
        if ($cek == 0) {
            insert($koneksi, 'jawaban_tugas', $data);
        } else {
            update($koneksi, 'jawaban_tugas', $data, $where);
        }
        echo "ok";
    }
}
?>
