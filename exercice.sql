-- 1- Créez une procédure stockée simple nommée add()qui renvoie le produit de deux entiers à l'aide de plpgsql.
CREATE OR REPLACE FUNCTION multiply(a integer, b integer)
  RETURNS integer AS $$
BEGIN
  RETURN a * b;
END;
$$ LANGUAGE plpgsql;

-- 2- Connectez-vous au serveur de base de données PostgreSQL en créant une nouvelle instance de la PDOclasse.
$host = 'your_host';
$dbname = 'your_database_name';
$user = 'your_username';
$password = 'your_password';
$dsn = "pgsql:host=$host;dbname=$dbname;user=$user;password=$password";
$pdo = new PDO($dsn);

-- 3- Préparez l'instruction qui appelle la procédure stockée pour exécution à l'aide de la prepare()méthode de l'objet PDO. La prepare()méthode renvoie un PDOStatementobjet.
$sql = "SELECT multiply(:a, :b)";
$stmt = $pdo->prepare($sql);

-- 4- Transmettez éventuellement des valeurs à l'instruction à l'aide de la bindValue()méthode.
$stmt->bindValue(':a', 5, PDO::PARAM_INT);
$stmt->bindValue(':b', 7, PDO::PARAM_INT);

--5- Exécutez l'instruction à l'aide de la execute()méthode de l'objet PDOStatement
$stmt->execute();
$result = $stmt->fetchColumn();
echo $result; // Output: 35
