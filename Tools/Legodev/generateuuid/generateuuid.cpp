#include <iostream>
#include <sstream>
#include <string>
#ifdef __linux__
#include <uuid/uuid.h>

std::string generateUUID() {
        uuid_t id;
        uuid_generate_time(id);

        char uuidstring[37];
        uuid_unparse(id, uuidstring);

        return uuidstring;
}
#else
#include <rpc.h>
#pragma comment(lib, "rpcrt4.lib")

std::string generateUUID() {
        UUID uuid;
        UuidCreateSequential( &uuid );

        unsigned char* wszUuid = NULL;

        UuidToString(&uuid, &wszUuid);

        std::string uuidstring = (const char*)wszUuid;

        RpcStringFree(&wszUuid);
        wszUuid = NULL;

        return uuidstring;
}

#endif

std::string orderedUUID() {
   std::stringstream orderedUUID;
   std::string UUID = generateUUID();
   orderedUUID << UUID.substr (14,4) << UUID.substr (9,4) << UUID.substr (0,8) << UUID.substr (19,4) << UUID.substr (24);
   return orderedUUID.str();
}

int main(int argc, char *argv[])
{
  std::cout << orderedUUID() << std::endl;

  return 0;
}
