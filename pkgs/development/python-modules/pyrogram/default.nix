{ lib
, buildPythonPackage
, pythonOlder
, fetchPypi
, pyaes
, pysocks
, async-lru
, tgcrypto
, pytestCheckHook
, pytest-asyncio
}:

buildPythonPackage rec {
  pname = "pyrogram";
  version = "1.3.6";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    pname = "Pyrogram";
    inherit version;
    hash = "sha256-Q3JGTNSfqEMUqEru0crcbE8Ut/n+9MjFIDRKRSZ7tlE=";
  };

  propagatedBuildInputs = [
    pyaes
    pysocks
    async-lru
    tgcrypto
  ];

  checkInputs = [
    pytestCheckHook
    pytest-asyncio
  ];

  pythonImportsCheck = [
    "pyrogram"
    "pyrogram.errors"
    "pyrogram.types"
  ];

  meta = with lib; {
    description = "Telegram MTProto API Client Library and Framework for Python";
    homepage = "https://github.com/pyrogram/pyrogram";
    license = licenses.lgpl3Plus;
    maintainers = with maintainers; [ dotlambda ];
  };
}
