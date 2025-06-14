// /docker-entrypoint-initdb.d/01-init-db-and-user.js
print("Starting MongoDB initialization script...");

const rootUser = process.env.MONGO_INITDB_ROOT_USERNAME;
const rootPassword = process.env.MONGO_INITDB_ROOT_PASSWORD;

const notificationsDbName = process.env.MONGO_DB_NOTIFICATIONS || 'notificationsdb';
const notificationsUser = process.env.MONGO_NOTIFICATIONS_USER || 'notifications_user';
const notificationsPassword = process.env.MONGO_NOTIFICATIONS_PASSWORD || 'notifications_password123'; // Default if not set

// Authenticate as the root user first
let adminDb = db.getSiblingDB('admin');
if (rootUser && rootPassword) {
    print(`Authenticating as root user '${rootUser}'...`);
    let authResult = adminDb.auth(rootUser, rootPassword);
    printjson(authResult); // Print auth result for debugging
    if (!authResult.ok && authResult.errmsg && authResult.errmsg.includes("AuthenticationFailed")) {
        print(`Root authentication failed: ${authResult.errmsg}. Ensure MONGO_INITDB_ROOT_USERNAME and MONGO_INITDB_ROOT_PASSWORD are correct.`);
        // Attempt to proceed if user already exists, common in re-runs
    }
} else {
    print("MONGO_INITDB_ROOT_USERNAME or MONGO_INITDB_ROOT_PASSWORD not set. Skipping root authentication.");
    // This might be okay if this is the very first run and no auth is set up yet.
}


let targetDb = db.getSiblingDB(notificationsDbName);

// Check if user already exists in the target database context
// Need to switch to admin to check users across DBs or the specific DB's admin functions
adminDb = db.getSiblingDB('admin'); // Re-ensure admin context for user check/creation

let userDetails = adminDb.runCommand({ usersInfo: { user: notificationsUser, db: notificationsDbName } });

if (userDetails.users && userDetails.users.length > 0) {
  print(`User '${notificationsUser}' already exists in database '${notificationsDbName}'.`);
} else {
  print(`Creating user '${notificationsUser}' for database '${notificationsDbName}'...`);
  try {
    targetDb.createUser({
      user: notificationsUser,
      pwd: notificationsPassword,
      roles: [
        { role: 'readWrite', db: notificationsDbName },
        { role: 'dbAdmin', db: notificationsDbName }
      ],
    });
    print(`User '${notificationsUser}' created successfully for database '${notificationsDbName}'.`);
  } catch (e) {
    print(`Error creating user '${notificationsUser}': ${e}. This might happen if the user exists but check failed or due to auth issues.`);
  }
}

// Ensure the database exists by creating a dummy collection (MongoDB creates DBs on first write)
const collections = targetDb.getCollectionNames();
if (!collections.includes('init_check')) {
    targetDb.createCollection('init_check');
    // targetDb.init_check.drop(); // Optional: remove dummy collection
    print(`Database '${notificationsDbName}' ensured to exist and init_check collection added/verified.`);
} else {
    print(`Database '${notificationsDbName}' already exists with collections.`);
}

print("MongoDB initialization script completed.");
