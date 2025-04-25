import { getApiKey, getBaseUrl, OPENAI_TIMEOUT_MS } from "./config.js";
import OpenAI, { AzureOpenAI } from "openai";

/**
 * Create an OpenAI client. If OPENAI_API_VERSION is set, use AzureOpenAI.
 * @param provider Optional provider name for key/baseURL lookup
 * @param options Additional client options to pass through
 */
export function createOpenAIClient(
  provider?: string,
  options: Record<string, unknown> = {},
): OpenAI {
  const apiKey = getApiKey(provider);
  const baseURL = getBaseUrl(provider);
  const timeout = OPENAI_TIMEOUT_MS;
  const apiVersion = process.env["OPENAI_API_VERSION"];
  const baseOpts: Record<string, unknown> = {
    ...(apiKey ? { apiKey } : {}),
    ...(baseURL ? { baseURL } : {}),
    ...(timeout !== undefined ? { timeout } : {}),
  };
  if (apiVersion) {
    return new AzureOpenAI({
      ...baseOpts,
      apiVersion,
      ...options,
    });
  }
  return new OpenAI({
    ...baseOpts,
    ...options,
  });
}