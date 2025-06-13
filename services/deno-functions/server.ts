import { serve } from "https://deno.land/std@0.212.0/http/server.ts";

const port = 3015;
console.log(`Deno Functions Service running on port ${port}`);
serve(() => new Response("Deno Functions Service"), { port });
