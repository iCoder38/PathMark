/* This file was generated by upb_generator from the input file:
 *
 *     envoy/config/core/v3/resolver.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_CONFIG_CORE_V3_RESOLVER_PROTO_UPBDEFS_H_
#define ENVOY_CONFIG_CORE_V3_RESOLVER_PROTO_UPBDEFS_H_

#include "upb/reflection/def.h"
#include "upb/reflection/internal/def_pool.h"

#include "upb/port/def.inc" // Must be last.
#ifdef __cplusplus
extern "C" {
#endif

extern _upb_DefPool_Init envoy_config_core_v3_resolver_proto_upbdefinit;

UPB_INLINE const upb_MessageDef *envoy_config_core_v3_DnsResolverOptions_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &envoy_config_core_v3_resolver_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "envoy.config.core.v3.DnsResolverOptions");
}

UPB_INLINE const upb_MessageDef *envoy_config_core_v3_DnsResolutionConfig_getmsgdef(upb_DefPool *s) {
  _upb_DefPool_LoadDefInit(s, &envoy_config_core_v3_resolver_proto_upbdefinit);
  return upb_DefPool_FindMessageByName(s, "envoy.config.core.v3.DnsResolutionConfig");
}

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port/undef.inc"

#endif  /* ENVOY_CONFIG_CORE_V3_RESOLVER_PROTO_UPBDEFS_H_ */
