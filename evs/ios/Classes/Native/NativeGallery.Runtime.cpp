#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif


#include <cstring>
#include <string.h>
#include <stdio.h>
#include <cmath>
#include <limits>
#include <assert.h>
#include <stdint.h>

#include "codegen/il2cpp-codegen.h"
#include "il2cpp-object-internals.h"

template <typename R>
struct VirtFuncInvoker0
{
	typedef R (*Func)(void*, const RuntimeMethod*);

	static inline R Invoke (Il2CppMethodSlot slot, RuntimeObject* obj)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		return ((Func)invokeData.methodPtr)(obj, invokeData.method);
	}
};
struct VirtActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeObject* obj)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct VirtActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeObject* obj, T1 p1)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
template <typename T1, typename T2>
struct VirtActionInvoker2
{
	typedef void (*Action)(void*, T1, T2, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeObject* obj, T1 p1, T2 p2)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_virtual_invoke_data(slot, obj);
		((Action)invokeData.methodPtr)(obj, p1, p2, invokeData.method);
	}
};
struct GenericVirtActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_virtual_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct GenericVirtActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj, T1 p1)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_virtual_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
template <typename T1, typename T2>
struct GenericVirtActionInvoker2
{
	typedef void (*Action)(void*, T1, T2, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj, T1 p1, T2 p2)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_virtual_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, p1, p2, invokeData.method);
	}
};
struct InterfaceActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeClass* declaringInterface, RuntimeObject* obj)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_interface_invoke_data(slot, obj, declaringInterface);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct InterfaceActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeClass* declaringInterface, RuntimeObject* obj, T1 p1)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_interface_invoke_data(slot, obj, declaringInterface);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
template <typename T1, typename T2>
struct InterfaceActionInvoker2
{
	typedef void (*Action)(void*, T1, T2, const RuntimeMethod*);

	static inline void Invoke (Il2CppMethodSlot slot, RuntimeClass* declaringInterface, RuntimeObject* obj, T1 p1, T2 p2)
	{
		const VirtualInvokeData& invokeData = il2cpp_codegen_get_interface_invoke_data(slot, obj, declaringInterface);
		((Action)invokeData.methodPtr)(obj, p1, p2, invokeData.method);
	}
};
struct GenericInterfaceActionInvoker0
{
	typedef void (*Action)(void*, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_interface_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, invokeData.method);
	}
};
template <typename T1>
struct GenericInterfaceActionInvoker1
{
	typedef void (*Action)(void*, T1, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj, T1 p1)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_interface_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, p1, invokeData.method);
	}
};
template <typename T1, typename T2>
struct GenericInterfaceActionInvoker2
{
	typedef void (*Action)(void*, T1, T2, const RuntimeMethod*);

	static inline void Invoke (const RuntimeMethod* method, RuntimeObject* obj, T1 p1, T2 p2)
	{
		VirtualInvokeData invokeData;
		il2cpp_codegen_get_generic_interface_invoke_data(method, obj, &invokeData);
		((Action)invokeData.methodPtr)(obj, p1, p2, invokeData.method);
	}
};

// NativeGallery/MediaPickCallback
struct MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B;
// NativeGallery/MediaPickMultipleCallback
struct MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C;
// NativeGallery/MediaSaveCallback
struct MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D;
// NativeGalleryNamespace.NGMediaReceiveCallbackiOS
struct NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6;
// NativeGalleryNamespace.NGMediaSaveCallbackiOS
struct NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8;
// System.ArgumentException
struct ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1;
// System.AsyncCallback
struct AsyncCallback_t3F3DA3BEDAEE81DD1D24125DF8EB30E85EE14DA4;
// System.Byte[]
struct ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821;
// System.Char[]
struct CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2;
// System.Collections.IDictionary
struct IDictionary_t1BD5C1546718A374EA8122FBD6C6EE45331E8CE7;
// System.Delegate
struct Delegate_t;
// System.DelegateData
struct DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE;
// System.Delegate[]
struct DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86;
// System.Diagnostics.StackTrace[]
struct StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196;
// System.Exception
struct Exception_t;
// System.IAsyncResult
struct IAsyncResult_t8E194308510B375B42432981AE5E7488C458D598;
// System.IO.DirectoryInfo
struct DirectoryInfo_t432CD06DF148701E930708371CB985BC0E8EF87F;
// System.IO.FileNotFoundException
struct FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431;
// System.IntPtr[]
struct IntPtrU5BU5D_t4DC01DCB9A6DF6C9792A6513595D7A11E637DCDD;
// System.Reflection.MethodInfo
struct MethodInfo_t;
// System.Runtime.Serialization.SafeSerializationManager
struct SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770;
// System.String
struct String_t;
// System.String[]
struct StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E;
// System.Void
struct Void_t22962CB4C05B1D89B55A6E1139F0E87A90987017;
// UnityEngine.Component
struct Component_t05064EF382ABCAF4B8C94F8A350EA85184C26621;
// UnityEngine.GameObject
struct GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F;
// UnityEngine.MonoBehaviour
struct MonoBehaviour_t4A60845CF505405AF8BE8C61CC07F75CADEF6429;
// UnityEngine.Object
struct Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0;
// UnityEngine.RenderTexture
struct RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6;
// UnityEngine.Texture
struct Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4;
// UnityEngine.Texture2D
struct Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C;

IL2CPP_EXTERN_C RuntimeClass* ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Boolean_tB53F6830F670160873277339AA58F15CAED4399C_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Exception_t_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Graphics_t6FB7A5D4561F3AB3C34BF334BB0BD8061BE763B1_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Int32_t585191389E07734F19F3156FF88FB3EF4800D102_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* RuntimeObject_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C RuntimeClass* UnityException_t513F7D97037DB40AE78D7C3AAA2F9E011D050C28_il2cpp_TypeInfo_var;
IL2CPP_EXTERN_C String_t* _stringLiteral0A3CF76AA4D046F4E79CDE3341E93210C22D0D9E;
IL2CPP_EXTERN_C String_t* _stringLiteral339F5868588CFC8FDA4A1EC94EAD8F737C5FCFC0;
IL2CPP_EXTERN_C String_t* _stringLiteral34D71611DCE9C30419B3C3EA42DC9426E931CDDE;
IL2CPP_EXTERN_C String_t* _stringLiteral377ED966B3A8FCCD3BE787DDE011557F2EC947F9;
IL2CPP_EXTERN_C String_t* _stringLiteral48022311225DF803178B78ACBDB71930DBF6C39C;
IL2CPP_EXTERN_C String_t* _stringLiteral4CCBEFEEDADEDC4ABB85D0C8ADEF1A3BD2CF85B7;
IL2CPP_EXTERN_C String_t* _stringLiteral6086A9E1FB0848F6D06CBF4F123D6CCC58A06F0D;
IL2CPP_EXTERN_C String_t* _stringLiteral60C283FF6EF6CAD8B67415AE1A3C6BABD3477040;
IL2CPP_EXTERN_C String_t* _stringLiteral64CC1194405FA366D9AE015C627F4609DEAC4879;
IL2CPP_EXTERN_C String_t* _stringLiteral680C002DD68BA7790878A280403262AF039049BE;
IL2CPP_EXTERN_C String_t* _stringLiteral801DC5C3610D303D73C37E27B3D6F5AC9F7661DC;
IL2CPP_EXTERN_C String_t* _stringLiteral9396C555ED6F4114FE93CC622496F6970B922A31;
IL2CPP_EXTERN_C String_t* _stringLiteral94D6A6A95D604C88AC795D66235A6C9EDF2D412B;
IL2CPP_EXTERN_C String_t* _stringLiteralA04667285B0D56FA5C9AD66F9249C0C461B42CCD;
IL2CPP_EXTERN_C String_t* _stringLiteralA6E98DBB2BD82CB83A4EB01F4DFB5062494F8E28;
IL2CPP_EXTERN_C String_t* _stringLiteralAA060E67BCEBDAC58D595E0A4BCBBB8A8FCB0BCF;
IL2CPP_EXTERN_C String_t* _stringLiteralB3F0D81387C1211E197E16C94BFDA6583BC874F9;
IL2CPP_EXTERN_C String_t* _stringLiteralC68C6D5E83DA7C25F2861D5D19720D87BB3436B4;
IL2CPP_EXTERN_C String_t* _stringLiteralDCDFD41CB6E96E78736DEB5F5ADD6F6311DA8E80;
IL2CPP_EXTERN_C String_t* _stringLiteralDEA5175F6A97B90A17B319CCE2F424AB43E28258;
IL2CPP_EXTERN_C String_t* _stringLiteralE16425C70B0BF8A4323B323DF6C309092ED0409B;
IL2CPP_EXTERN_C String_t* _stringLiteralE35B1258A7DF335EB03C6AFAF41FE620F875441F;
IL2CPP_EXTERN_C String_t* _stringLiteralF1786D5D9BDB111F25FFD27805EA7BA70D7D856E;
IL2CPP_EXTERN_C String_t* _stringLiteralF339FE7C9DD4741BECBD12D0DE696B820BDAC3AB;
IL2CPP_EXTERN_C String_t* _stringLiteralFA339DE2EA366B99856105DBEB37AD37EDB2629C;
IL2CPP_EXTERN_C String_t* _stringLiteralFACB855C9CEF68CF9733F539BDE2B57586848293;
IL2CPP_EXTERN_C const RuntimeMethod* GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_mB7F5F3B119B04E28416C77CEC62EDAAACC4CFC4D_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_mCA927EF486B961DDF90EF5835D3275EA5CAC5BFA_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* NativeGallery_GetImageProperties_m2137D3FC3927982C0D837306DF96C0F64A0A3AC2_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* NativeGallery_GetVideoProperties_mE8CA6471D0D5BD3854AD736ACE114D070BEEC450_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* NativeGallery_SaveImageToGallery_m728A6EF9F87538011C5F6A354B63A6785CAAD827_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B_RuntimeMethod_var;
IL2CPP_EXTERN_C const RuntimeMethod* NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F_RuntimeMethod_var;
IL2CPP_EXTERN_C const uint32_t MediaSaveCallback_BeginInvoke_m399CA83C99E784BED783143A9A349263685A4A1C_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaReceiveCallbackiOS_Initialize_m42081AEDDFA2FFBF12D98CC91BFD1AA353CD10E8_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaReceiveCallbackiOS_SplitPaths_mB0EAF48CA4095A30E0204927DE5A2696A4A905B7_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536NativeGallery_Runtime_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1NativeGallery_Runtime_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NGMediaSaveCallbackiOS_Initialize_m53B8975819EF4C0612C5B00C3B03C496B1AE6464_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_CanOpenSettings_m847639237A4E11935794EAE99D287AB837EC1BCA_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_CanSelectMultipleFilesFromGallery_m0693426E1BE05221AEB29DB7E501488657554C58_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_CheckPermission_m6CBB87E6602B4B6BEAACADBCFAEBA442C7EEC4DB_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetAudioFromGallery_mA6BEF99F6634B9FA74AD00C5CABDE1D60026B994_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetAudiosFromGallery_mEEB9C527F473A66657CD3485F7E27287FD1124F8_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetImageFromGallery_mD6435483D1565EB83325A2FE7F9A162D8B8745B1_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetImageProperties_m2137D3FC3927982C0D837306DF96C0F64A0A3AC2_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetImagesFromGallery_mF48712C89BA085E981A4668C86008D338642096F_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetMediaTypeOfFile_mF7A9CA2D534917B15EF249627420E71D48365B57_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetMixedMediaFromGallery_m583F8C1E2148E4CAA21076BCB7DD6E3262B7E14A_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetMixedMediasFromGallery_m32F32D2150DD12E664B437066D6F2F5ACFAEEC81_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetTemporarySavePath_m351D4BFF627FA6826F36DA27EFEF5A5B79ECB0D9_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetTextureBytesFromCopy_m15D9F6E2A638A3E3E4C84A32EF0423A37EA42470_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetVideoFromGallery_mF01FF3520FAFD799864DB03E4D02AAB4FF3BA379_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetVideoProperties_mE8CA6471D0D5BD3854AD736ACE114D070BEEC450_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetVideoThumbnail_m5A493C4668050765D590020321E5CF2CB662C5AD_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_GetVideosFromGallery_mC935A98C580F5B011F473115BCD0E9FBF1F01B9D_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_OpenSettings_mAD76D7597380F0E0E5A7610CB9E13BE06237C38C_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveAudioToGallery_m4D83A61947AF42B6241C79B033AB64DF853E41B8_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveAudioToGallery_m74CDC661A74D900A6FF2CB2A89A7CF689F431242_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveImageToGallery_m2E70C422B2B25697A9DD2EDC296108098D8B3881_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveImageToGallery_m728A6EF9F87538011C5F6A354B63A6785CAAD827_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveImageToGallery_m7E8E411A26713ABB577D2D7968EB77E4900D38CF_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveToGalleryInternal_m0588F4885ED6F5590276A2CE811C19366734B185_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveVideoToGallery_mAC3763642892EFF5D73850E6BFC6D68419C1C2D1_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_SaveVideoToGallery_mBD422A019323B67BCB1D5B0753B4C839946072F9_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_TryExtendLimitedAccessPermission_m0D1D92FB05B5C85A8AD0F96031B630C4D834B9CD_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_get_SelectedMediaPath_m73539045C11D3F6340EFF65DDC5EAA7F67DECD2C_MetadataUsageId;
IL2CPP_EXTERN_C const uint32_t NativeGallery_get_TemporaryImagePath_m0C8232159D07C61BE9CF5A2275953E4F44DA5354_MetadataUsageId;
struct Delegate_t_marshaled_com;
struct Delegate_t_marshaled_pinvoke;
struct Exception_t_marshaled_com;
struct Exception_t_marshaled_pinvoke;

struct ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821;
struct CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2;
struct DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86;
struct StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E;

IL2CPP_EXTERN_C_BEGIN
IL2CPP_EXTERN_C_END

#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif

// <Module>
struct U3CModuleU3E_t0052C22E4FB735ED719736815E5E1162805A360B 
{
public:

public:
};


// System.Object


// NativeGallery
struct NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87  : public RuntimeObject
{
public:

public:
};

struct NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields
{
public:
	// System.String NativeGallery::m_temporaryImagePath
	String_t* ___m_temporaryImagePath_0;
	// System.String NativeGallery::m_selectedMediaPath
	String_t* ___m_selectedMediaPath_1;

public:
	inline static int32_t get_offset_of_m_temporaryImagePath_0() { return static_cast<int32_t>(offsetof(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields, ___m_temporaryImagePath_0)); }
	inline String_t* get_m_temporaryImagePath_0() const { return ___m_temporaryImagePath_0; }
	inline String_t** get_address_of_m_temporaryImagePath_0() { return &___m_temporaryImagePath_0; }
	inline void set_m_temporaryImagePath_0(String_t* value)
	{
		___m_temporaryImagePath_0 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___m_temporaryImagePath_0), (void*)value);
	}

	inline static int32_t get_offset_of_m_selectedMediaPath_1() { return static_cast<int32_t>(offsetof(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields, ___m_selectedMediaPath_1)); }
	inline String_t* get_m_selectedMediaPath_1() const { return ___m_selectedMediaPath_1; }
	inline String_t** get_address_of_m_selectedMediaPath_1() { return &___m_selectedMediaPath_1; }
	inline void set_m_selectedMediaPath_1(String_t* value)
	{
		___m_selectedMediaPath_1 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___m_selectedMediaPath_1), (void*)value);
	}
};

struct Il2CppArrayBounds;

// System.Array


// System.MarshalByRefObject
struct MarshalByRefObject_tC4577953D0A44D0AB8597CFA868E01C858B1C9AF  : public RuntimeObject
{
public:
	// System.Object System.MarshalByRefObject::_identity
	RuntimeObject * ____identity_0;

public:
	inline static int32_t get_offset_of__identity_0() { return static_cast<int32_t>(offsetof(MarshalByRefObject_tC4577953D0A44D0AB8597CFA868E01C858B1C9AF, ____identity_0)); }
	inline RuntimeObject * get__identity_0() const { return ____identity_0; }
	inline RuntimeObject ** get_address_of__identity_0() { return &____identity_0; }
	inline void set__identity_0(RuntimeObject * value)
	{
		____identity_0 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____identity_0), (void*)value);
	}
};

// Native definition for P/Invoke marshalling of System.MarshalByRefObject
struct MarshalByRefObject_tC4577953D0A44D0AB8597CFA868E01C858B1C9AF_marshaled_pinvoke
{
	Il2CppIUnknown* ____identity_0;
};
// Native definition for COM marshalling of System.MarshalByRefObject
struct MarshalByRefObject_tC4577953D0A44D0AB8597CFA868E01C858B1C9AF_marshaled_com
{
	Il2CppIUnknown* ____identity_0;
};

// System.String
struct String_t  : public RuntimeObject
{
public:
	// System.Int32 System.String::m_stringLength
	int32_t ___m_stringLength_0;
	// System.Char System.String::m_firstChar
	Il2CppChar ___m_firstChar_1;

public:
	inline static int32_t get_offset_of_m_stringLength_0() { return static_cast<int32_t>(offsetof(String_t, ___m_stringLength_0)); }
	inline int32_t get_m_stringLength_0() const { return ___m_stringLength_0; }
	inline int32_t* get_address_of_m_stringLength_0() { return &___m_stringLength_0; }
	inline void set_m_stringLength_0(int32_t value)
	{
		___m_stringLength_0 = value;
	}

	inline static int32_t get_offset_of_m_firstChar_1() { return static_cast<int32_t>(offsetof(String_t, ___m_firstChar_1)); }
	inline Il2CppChar get_m_firstChar_1() const { return ___m_firstChar_1; }
	inline Il2CppChar* get_address_of_m_firstChar_1() { return &___m_firstChar_1; }
	inline void set_m_firstChar_1(Il2CppChar value)
	{
		___m_firstChar_1 = value;
	}
};

struct String_t_StaticFields
{
public:
	// System.String System.String::Empty
	String_t* ___Empty_5;

public:
	inline static int32_t get_offset_of_Empty_5() { return static_cast<int32_t>(offsetof(String_t_StaticFields, ___Empty_5)); }
	inline String_t* get_Empty_5() const { return ___Empty_5; }
	inline String_t** get_address_of_Empty_5() { return &___Empty_5; }
	inline void set_Empty_5(String_t* value)
	{
		___Empty_5 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___Empty_5), (void*)value);
	}
};


// System.ValueType
struct ValueType_t4D0C27076F7C36E76190FB3328E232BCB1CD1FFF  : public RuntimeObject
{
public:

public:
};

// Native definition for P/Invoke marshalling of System.ValueType
struct ValueType_t4D0C27076F7C36E76190FB3328E232BCB1CD1FFF_marshaled_pinvoke
{
};
// Native definition for COM marshalling of System.ValueType
struct ValueType_t4D0C27076F7C36E76190FB3328E232BCB1CD1FFF_marshaled_com
{
};

// NativeGallery/VideoProperties
struct VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409 
{
public:
	// System.Int32 NativeGallery/VideoProperties::width
	int32_t ___width_0;
	// System.Int32 NativeGallery/VideoProperties::height
	int32_t ___height_1;
	// System.Int64 NativeGallery/VideoProperties::duration
	int64_t ___duration_2;
	// System.Single NativeGallery/VideoProperties::rotation
	float ___rotation_3;

public:
	inline static int32_t get_offset_of_width_0() { return static_cast<int32_t>(offsetof(VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409, ___width_0)); }
	inline int32_t get_width_0() const { return ___width_0; }
	inline int32_t* get_address_of_width_0() { return &___width_0; }
	inline void set_width_0(int32_t value)
	{
		___width_0 = value;
	}

	inline static int32_t get_offset_of_height_1() { return static_cast<int32_t>(offsetof(VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409, ___height_1)); }
	inline int32_t get_height_1() const { return ___height_1; }
	inline int32_t* get_address_of_height_1() { return &___height_1; }
	inline void set_height_1(int32_t value)
	{
		___height_1 = value;
	}

	inline static int32_t get_offset_of_duration_2() { return static_cast<int32_t>(offsetof(VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409, ___duration_2)); }
	inline int64_t get_duration_2() const { return ___duration_2; }
	inline int64_t* get_address_of_duration_2() { return &___duration_2; }
	inline void set_duration_2(int64_t value)
	{
		___duration_2 = value;
	}

	inline static int32_t get_offset_of_rotation_3() { return static_cast<int32_t>(offsetof(VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409, ___rotation_3)); }
	inline float get_rotation_3() const { return ___rotation_3; }
	inline float* get_address_of_rotation_3() { return &___rotation_3; }
	inline void set_rotation_3(float value)
	{
		___rotation_3 = value;
	}
};


// System.Boolean
struct Boolean_tB53F6830F670160873277339AA58F15CAED4399C 
{
public:
	// System.Boolean System.Boolean::m_value
	bool ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Boolean_tB53F6830F670160873277339AA58F15CAED4399C, ___m_value_0)); }
	inline bool get_m_value_0() const { return ___m_value_0; }
	inline bool* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(bool value)
	{
		___m_value_0 = value;
	}
};

struct Boolean_tB53F6830F670160873277339AA58F15CAED4399C_StaticFields
{
public:
	// System.String System.Boolean::TrueString
	String_t* ___TrueString_5;
	// System.String System.Boolean::FalseString
	String_t* ___FalseString_6;

public:
	inline static int32_t get_offset_of_TrueString_5() { return static_cast<int32_t>(offsetof(Boolean_tB53F6830F670160873277339AA58F15CAED4399C_StaticFields, ___TrueString_5)); }
	inline String_t* get_TrueString_5() const { return ___TrueString_5; }
	inline String_t** get_address_of_TrueString_5() { return &___TrueString_5; }
	inline void set_TrueString_5(String_t* value)
	{
		___TrueString_5 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___TrueString_5), (void*)value);
	}

	inline static int32_t get_offset_of_FalseString_6() { return static_cast<int32_t>(offsetof(Boolean_tB53F6830F670160873277339AA58F15CAED4399C_StaticFields, ___FalseString_6)); }
	inline String_t* get_FalseString_6() const { return ___FalseString_6; }
	inline String_t** get_address_of_FalseString_6() { return &___FalseString_6; }
	inline void set_FalseString_6(String_t* value)
	{
		___FalseString_6 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___FalseString_6), (void*)value);
	}
};


// System.Byte
struct Byte_tF87C579059BD4633E6840EBBBEEF899C6E33EF07 
{
public:
	// System.Byte System.Byte::m_value
	uint8_t ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Byte_tF87C579059BD4633E6840EBBBEEF899C6E33EF07, ___m_value_0)); }
	inline uint8_t get_m_value_0() const { return ___m_value_0; }
	inline uint8_t* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(uint8_t value)
	{
		___m_value_0 = value;
	}
};


// System.Char
struct Char_tBF22D9FC341BE970735250BB6FF1A4A92BBA58B9 
{
public:
	// System.Char System.Char::m_value
	Il2CppChar ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Char_tBF22D9FC341BE970735250BB6FF1A4A92BBA58B9, ___m_value_0)); }
	inline Il2CppChar get_m_value_0() const { return ___m_value_0; }
	inline Il2CppChar* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(Il2CppChar value)
	{
		___m_value_0 = value;
	}
};

struct Char_tBF22D9FC341BE970735250BB6FF1A4A92BBA58B9_StaticFields
{
public:
	// System.Byte[] System.Char::categoryForLatin1
	ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___categoryForLatin1_3;

public:
	inline static int32_t get_offset_of_categoryForLatin1_3() { return static_cast<int32_t>(offsetof(Char_tBF22D9FC341BE970735250BB6FF1A4A92BBA58B9_StaticFields, ___categoryForLatin1_3)); }
	inline ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* get_categoryForLatin1_3() const { return ___categoryForLatin1_3; }
	inline ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821** get_address_of_categoryForLatin1_3() { return &___categoryForLatin1_3; }
	inline void set_categoryForLatin1_3(ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* value)
	{
		___categoryForLatin1_3 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___categoryForLatin1_3), (void*)value);
	}
};


// System.Double
struct Double_t358B8F23BDC52A5DD700E727E204F9F7CDE12409 
{
public:
	// System.Double System.Double::m_value
	double ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Double_t358B8F23BDC52A5DD700E727E204F9F7CDE12409, ___m_value_0)); }
	inline double get_m_value_0() const { return ___m_value_0; }
	inline double* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(double value)
	{
		___m_value_0 = value;
	}
};

struct Double_t358B8F23BDC52A5DD700E727E204F9F7CDE12409_StaticFields
{
public:
	// System.Double System.Double::NegativeZero
	double ___NegativeZero_7;

public:
	inline static int32_t get_offset_of_NegativeZero_7() { return static_cast<int32_t>(offsetof(Double_t358B8F23BDC52A5DD700E727E204F9F7CDE12409_StaticFields, ___NegativeZero_7)); }
	inline double get_NegativeZero_7() const { return ___NegativeZero_7; }
	inline double* get_address_of_NegativeZero_7() { return &___NegativeZero_7; }
	inline void set_NegativeZero_7(double value)
	{
		___NegativeZero_7 = value;
	}
};


// System.Enum
struct Enum_t2AF27C02B8653AE29442467390005ABC74D8F521  : public ValueType_t4D0C27076F7C36E76190FB3328E232BCB1CD1FFF
{
public:

public:
};

struct Enum_t2AF27C02B8653AE29442467390005ABC74D8F521_StaticFields
{
public:
	// System.Char[] System.Enum::enumSeperatorCharArray
	CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* ___enumSeperatorCharArray_0;

public:
	inline static int32_t get_offset_of_enumSeperatorCharArray_0() { return static_cast<int32_t>(offsetof(Enum_t2AF27C02B8653AE29442467390005ABC74D8F521_StaticFields, ___enumSeperatorCharArray_0)); }
	inline CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* get_enumSeperatorCharArray_0() const { return ___enumSeperatorCharArray_0; }
	inline CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2** get_address_of_enumSeperatorCharArray_0() { return &___enumSeperatorCharArray_0; }
	inline void set_enumSeperatorCharArray_0(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* value)
	{
		___enumSeperatorCharArray_0 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___enumSeperatorCharArray_0), (void*)value);
	}
};

// Native definition for P/Invoke marshalling of System.Enum
struct Enum_t2AF27C02B8653AE29442467390005ABC74D8F521_marshaled_pinvoke
{
};
// Native definition for COM marshalling of System.Enum
struct Enum_t2AF27C02B8653AE29442467390005ABC74D8F521_marshaled_com
{
};

// System.Int32
struct Int32_t585191389E07734F19F3156FF88FB3EF4800D102 
{
public:
	// System.Int32 System.Int32::m_value
	int32_t ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Int32_t585191389E07734F19F3156FF88FB3EF4800D102, ___m_value_0)); }
	inline int32_t get_m_value_0() const { return ___m_value_0; }
	inline int32_t* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(int32_t value)
	{
		___m_value_0 = value;
	}
};


// System.Int64
struct Int64_t7A386C2FF7B0280A0F516992401DDFCF0FF7B436 
{
public:
	// System.Int64 System.Int64::m_value
	int64_t ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Int64_t7A386C2FF7B0280A0F516992401DDFCF0FF7B436, ___m_value_0)); }
	inline int64_t get_m_value_0() const { return ___m_value_0; }
	inline int64_t* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(int64_t value)
	{
		___m_value_0 = value;
	}
};


// System.IntPtr
struct IntPtr_t 
{
public:
	// System.Void* System.IntPtr::m_value
	void* ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(IntPtr_t, ___m_value_0)); }
	inline void* get_m_value_0() const { return ___m_value_0; }
	inline void** get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(void* value)
	{
		___m_value_0 = value;
	}
};

struct IntPtr_t_StaticFields
{
public:
	// System.IntPtr System.IntPtr::Zero
	intptr_t ___Zero_1;

public:
	inline static int32_t get_offset_of_Zero_1() { return static_cast<int32_t>(offsetof(IntPtr_t_StaticFields, ___Zero_1)); }
	inline intptr_t get_Zero_1() const { return ___Zero_1; }
	inline intptr_t* get_address_of_Zero_1() { return &___Zero_1; }
	inline void set_Zero_1(intptr_t value)
	{
		___Zero_1 = value;
	}
};


// System.Single
struct Single_tDDDA9169C4E4E308AC6D7A824F9B28DC82204AE1 
{
public:
	// System.Single System.Single::m_value
	float ___m_value_0;

public:
	inline static int32_t get_offset_of_m_value_0() { return static_cast<int32_t>(offsetof(Single_tDDDA9169C4E4E308AC6D7A824F9B28DC82204AE1, ___m_value_0)); }
	inline float get_m_value_0() const { return ___m_value_0; }
	inline float* get_address_of_m_value_0() { return &___m_value_0; }
	inline void set_m_value_0(float value)
	{
		___m_value_0 = value;
	}
};


// System.Void
struct Void_t22962CB4C05B1D89B55A6E1139F0E87A90987017 
{
public:
	union
	{
		struct
		{
		};
		uint8_t Void_t22962CB4C05B1D89B55A6E1139F0E87A90987017__padding[1];
	};

public:
};


// UnityEngine.Rect
struct Rect_t35B976DE901B5423C11705E156938EA27AB402CE 
{
public:
	// System.Single UnityEngine.Rect::m_XMin
	float ___m_XMin_0;
	// System.Single UnityEngine.Rect::m_YMin
	float ___m_YMin_1;
	// System.Single UnityEngine.Rect::m_Width
	float ___m_Width_2;
	// System.Single UnityEngine.Rect::m_Height
	float ___m_Height_3;

public:
	inline static int32_t get_offset_of_m_XMin_0() { return static_cast<int32_t>(offsetof(Rect_t35B976DE901B5423C11705E156938EA27AB402CE, ___m_XMin_0)); }
	inline float get_m_XMin_0() const { return ___m_XMin_0; }
	inline float* get_address_of_m_XMin_0() { return &___m_XMin_0; }
	inline void set_m_XMin_0(float value)
	{
		___m_XMin_0 = value;
	}

	inline static int32_t get_offset_of_m_YMin_1() { return static_cast<int32_t>(offsetof(Rect_t35B976DE901B5423C11705E156938EA27AB402CE, ___m_YMin_1)); }
	inline float get_m_YMin_1() const { return ___m_YMin_1; }
	inline float* get_address_of_m_YMin_1() { return &___m_YMin_1; }
	inline void set_m_YMin_1(float value)
	{
		___m_YMin_1 = value;
	}

	inline static int32_t get_offset_of_m_Width_2() { return static_cast<int32_t>(offsetof(Rect_t35B976DE901B5423C11705E156938EA27AB402CE, ___m_Width_2)); }
	inline float get_m_Width_2() const { return ___m_Width_2; }
	inline float* get_address_of_m_Width_2() { return &___m_Width_2; }
	inline void set_m_Width_2(float value)
	{
		___m_Width_2 = value;
	}

	inline static int32_t get_offset_of_m_Height_3() { return static_cast<int32_t>(offsetof(Rect_t35B976DE901B5423C11705E156938EA27AB402CE, ___m_Height_3)); }
	inline float get_m_Height_3() const { return ___m_Height_3; }
	inline float* get_address_of_m_Height_3() { return &___m_Height_3; }
	inline void set_m_Height_3(float value)
	{
		___m_Height_3 = value;
	}
};


// NativeGallery/ImageOrientation
struct ImageOrientation_t4ABAD4A3AB26BEA5A239C6EAF63739EA28A31F96 
{
public:
	// System.Int32 NativeGallery/ImageOrientation::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(ImageOrientation_t4ABAD4A3AB26BEA5A239C6EAF63739EA28A31F96, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// NativeGallery/MediaType
struct MediaType_t5F50A393020647D0092C70BB38B27B727E30DA47 
{
public:
	// System.Int32 NativeGallery/MediaType::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(MediaType_t5F50A393020647D0092C70BB38B27B727E30DA47, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// NativeGallery/Permission
struct Permission_t6341CFA53A1724F8BB0232672375D0B2FB1DA36E 
{
public:
	// System.Int32 NativeGallery/Permission::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(Permission_t6341CFA53A1724F8BB0232672375D0B2FB1DA36E, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// NativeGallery/PermissionType
struct PermissionType_t924CA3D19EB0C2002B791DBC72CE045175AECF97 
{
public:
	// System.Int32 NativeGallery/PermissionType::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(PermissionType_t924CA3D19EB0C2002B791DBC72CE045175AECF97, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// System.Delegate
struct Delegate_t  : public RuntimeObject
{
public:
	// System.IntPtr System.Delegate::method_ptr
	Il2CppMethodPointer ___method_ptr_0;
	// System.IntPtr System.Delegate::invoke_impl
	intptr_t ___invoke_impl_1;
	// System.Object System.Delegate::m_target
	RuntimeObject * ___m_target_2;
	// System.IntPtr System.Delegate::method
	intptr_t ___method_3;
	// System.IntPtr System.Delegate::delegate_trampoline
	intptr_t ___delegate_trampoline_4;
	// System.IntPtr System.Delegate::extra_arg
	intptr_t ___extra_arg_5;
	// System.IntPtr System.Delegate::method_code
	intptr_t ___method_code_6;
	// System.Reflection.MethodInfo System.Delegate::method_info
	MethodInfo_t * ___method_info_7;
	// System.Reflection.MethodInfo System.Delegate::original_method_info
	MethodInfo_t * ___original_method_info_8;
	// System.DelegateData System.Delegate::data
	DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE * ___data_9;
	// System.Boolean System.Delegate::method_is_virtual
	bool ___method_is_virtual_10;

public:
	inline static int32_t get_offset_of_method_ptr_0() { return static_cast<int32_t>(offsetof(Delegate_t, ___method_ptr_0)); }
	inline Il2CppMethodPointer get_method_ptr_0() const { return ___method_ptr_0; }
	inline Il2CppMethodPointer* get_address_of_method_ptr_0() { return &___method_ptr_0; }
	inline void set_method_ptr_0(Il2CppMethodPointer value)
	{
		___method_ptr_0 = value;
	}

	inline static int32_t get_offset_of_invoke_impl_1() { return static_cast<int32_t>(offsetof(Delegate_t, ___invoke_impl_1)); }
	inline intptr_t get_invoke_impl_1() const { return ___invoke_impl_1; }
	inline intptr_t* get_address_of_invoke_impl_1() { return &___invoke_impl_1; }
	inline void set_invoke_impl_1(intptr_t value)
	{
		___invoke_impl_1 = value;
	}

	inline static int32_t get_offset_of_m_target_2() { return static_cast<int32_t>(offsetof(Delegate_t, ___m_target_2)); }
	inline RuntimeObject * get_m_target_2() const { return ___m_target_2; }
	inline RuntimeObject ** get_address_of_m_target_2() { return &___m_target_2; }
	inline void set_m_target_2(RuntimeObject * value)
	{
		___m_target_2 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___m_target_2), (void*)value);
	}

	inline static int32_t get_offset_of_method_3() { return static_cast<int32_t>(offsetof(Delegate_t, ___method_3)); }
	inline intptr_t get_method_3() const { return ___method_3; }
	inline intptr_t* get_address_of_method_3() { return &___method_3; }
	inline void set_method_3(intptr_t value)
	{
		___method_3 = value;
	}

	inline static int32_t get_offset_of_delegate_trampoline_4() { return static_cast<int32_t>(offsetof(Delegate_t, ___delegate_trampoline_4)); }
	inline intptr_t get_delegate_trampoline_4() const { return ___delegate_trampoline_4; }
	inline intptr_t* get_address_of_delegate_trampoline_4() { return &___delegate_trampoline_4; }
	inline void set_delegate_trampoline_4(intptr_t value)
	{
		___delegate_trampoline_4 = value;
	}

	inline static int32_t get_offset_of_extra_arg_5() { return static_cast<int32_t>(offsetof(Delegate_t, ___extra_arg_5)); }
	inline intptr_t get_extra_arg_5() const { return ___extra_arg_5; }
	inline intptr_t* get_address_of_extra_arg_5() { return &___extra_arg_5; }
	inline void set_extra_arg_5(intptr_t value)
	{
		___extra_arg_5 = value;
	}

	inline static int32_t get_offset_of_method_code_6() { return static_cast<int32_t>(offsetof(Delegate_t, ___method_code_6)); }
	inline intptr_t get_method_code_6() const { return ___method_code_6; }
	inline intptr_t* get_address_of_method_code_6() { return &___method_code_6; }
	inline void set_method_code_6(intptr_t value)
	{
		___method_code_6 = value;
	}

	inline static int32_t get_offset_of_method_info_7() { return static_cast<int32_t>(offsetof(Delegate_t, ___method_info_7)); }
	inline MethodInfo_t * get_method_info_7() const { return ___method_info_7; }
	inline MethodInfo_t ** get_address_of_method_info_7() { return &___method_info_7; }
	inline void set_method_info_7(MethodInfo_t * value)
	{
		___method_info_7 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___method_info_7), (void*)value);
	}

	inline static int32_t get_offset_of_original_method_info_8() { return static_cast<int32_t>(offsetof(Delegate_t, ___original_method_info_8)); }
	inline MethodInfo_t * get_original_method_info_8() const { return ___original_method_info_8; }
	inline MethodInfo_t ** get_address_of_original_method_info_8() { return &___original_method_info_8; }
	inline void set_original_method_info_8(MethodInfo_t * value)
	{
		___original_method_info_8 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___original_method_info_8), (void*)value);
	}

	inline static int32_t get_offset_of_data_9() { return static_cast<int32_t>(offsetof(Delegate_t, ___data_9)); }
	inline DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE * get_data_9() const { return ___data_9; }
	inline DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE ** get_address_of_data_9() { return &___data_9; }
	inline void set_data_9(DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE * value)
	{
		___data_9 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___data_9), (void*)value);
	}

	inline static int32_t get_offset_of_method_is_virtual_10() { return static_cast<int32_t>(offsetof(Delegate_t, ___method_is_virtual_10)); }
	inline bool get_method_is_virtual_10() const { return ___method_is_virtual_10; }
	inline bool* get_address_of_method_is_virtual_10() { return &___method_is_virtual_10; }
	inline void set_method_is_virtual_10(bool value)
	{
		___method_is_virtual_10 = value;
	}
};

// Native definition for P/Invoke marshalling of System.Delegate
struct Delegate_t_marshaled_pinvoke
{
	intptr_t ___method_ptr_0;
	intptr_t ___invoke_impl_1;
	Il2CppIUnknown* ___m_target_2;
	intptr_t ___method_3;
	intptr_t ___delegate_trampoline_4;
	intptr_t ___extra_arg_5;
	intptr_t ___method_code_6;
	MethodInfo_t * ___method_info_7;
	MethodInfo_t * ___original_method_info_8;
	DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE * ___data_9;
	int32_t ___method_is_virtual_10;
};
// Native definition for COM marshalling of System.Delegate
struct Delegate_t_marshaled_com
{
	intptr_t ___method_ptr_0;
	intptr_t ___invoke_impl_1;
	Il2CppIUnknown* ___m_target_2;
	intptr_t ___method_3;
	intptr_t ___delegate_trampoline_4;
	intptr_t ___extra_arg_5;
	intptr_t ___method_code_6;
	MethodInfo_t * ___method_info_7;
	MethodInfo_t * ___original_method_info_8;
	DelegateData_t1BF9F691B56DAE5F8C28C5E084FDE94F15F27BBE * ___data_9;
	int32_t ___method_is_virtual_10;
};

// System.Exception
struct Exception_t  : public RuntimeObject
{
public:
	// System.String System.Exception::_className
	String_t* ____className_1;
	// System.String System.Exception::_message
	String_t* ____message_2;
	// System.Collections.IDictionary System.Exception::_data
	RuntimeObject* ____data_3;
	// System.Exception System.Exception::_innerException
	Exception_t * ____innerException_4;
	// System.String System.Exception::_helpURL
	String_t* ____helpURL_5;
	// System.Object System.Exception::_stackTrace
	RuntimeObject * ____stackTrace_6;
	// System.String System.Exception::_stackTraceString
	String_t* ____stackTraceString_7;
	// System.String System.Exception::_remoteStackTraceString
	String_t* ____remoteStackTraceString_8;
	// System.Int32 System.Exception::_remoteStackIndex
	int32_t ____remoteStackIndex_9;
	// System.Object System.Exception::_dynamicMethods
	RuntimeObject * ____dynamicMethods_10;
	// System.Int32 System.Exception::_HResult
	int32_t ____HResult_11;
	// System.String System.Exception::_source
	String_t* ____source_12;
	// System.Runtime.Serialization.SafeSerializationManager System.Exception::_safeSerializationManager
	SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770 * ____safeSerializationManager_13;
	// System.Diagnostics.StackTrace[] System.Exception::captured_traces
	StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196* ___captured_traces_14;
	// System.IntPtr[] System.Exception::native_trace_ips
	IntPtrU5BU5D_t4DC01DCB9A6DF6C9792A6513595D7A11E637DCDD* ___native_trace_ips_15;

public:
	inline static int32_t get_offset_of__className_1() { return static_cast<int32_t>(offsetof(Exception_t, ____className_1)); }
	inline String_t* get__className_1() const { return ____className_1; }
	inline String_t** get_address_of__className_1() { return &____className_1; }
	inline void set__className_1(String_t* value)
	{
		____className_1 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____className_1), (void*)value);
	}

	inline static int32_t get_offset_of__message_2() { return static_cast<int32_t>(offsetof(Exception_t, ____message_2)); }
	inline String_t* get__message_2() const { return ____message_2; }
	inline String_t** get_address_of__message_2() { return &____message_2; }
	inline void set__message_2(String_t* value)
	{
		____message_2 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____message_2), (void*)value);
	}

	inline static int32_t get_offset_of__data_3() { return static_cast<int32_t>(offsetof(Exception_t, ____data_3)); }
	inline RuntimeObject* get__data_3() const { return ____data_3; }
	inline RuntimeObject** get_address_of__data_3() { return &____data_3; }
	inline void set__data_3(RuntimeObject* value)
	{
		____data_3 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____data_3), (void*)value);
	}

	inline static int32_t get_offset_of__innerException_4() { return static_cast<int32_t>(offsetof(Exception_t, ____innerException_4)); }
	inline Exception_t * get__innerException_4() const { return ____innerException_4; }
	inline Exception_t ** get_address_of__innerException_4() { return &____innerException_4; }
	inline void set__innerException_4(Exception_t * value)
	{
		____innerException_4 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____innerException_4), (void*)value);
	}

	inline static int32_t get_offset_of__helpURL_5() { return static_cast<int32_t>(offsetof(Exception_t, ____helpURL_5)); }
	inline String_t* get__helpURL_5() const { return ____helpURL_5; }
	inline String_t** get_address_of__helpURL_5() { return &____helpURL_5; }
	inline void set__helpURL_5(String_t* value)
	{
		____helpURL_5 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____helpURL_5), (void*)value);
	}

	inline static int32_t get_offset_of__stackTrace_6() { return static_cast<int32_t>(offsetof(Exception_t, ____stackTrace_6)); }
	inline RuntimeObject * get__stackTrace_6() const { return ____stackTrace_6; }
	inline RuntimeObject ** get_address_of__stackTrace_6() { return &____stackTrace_6; }
	inline void set__stackTrace_6(RuntimeObject * value)
	{
		____stackTrace_6 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____stackTrace_6), (void*)value);
	}

	inline static int32_t get_offset_of__stackTraceString_7() { return static_cast<int32_t>(offsetof(Exception_t, ____stackTraceString_7)); }
	inline String_t* get__stackTraceString_7() const { return ____stackTraceString_7; }
	inline String_t** get_address_of__stackTraceString_7() { return &____stackTraceString_7; }
	inline void set__stackTraceString_7(String_t* value)
	{
		____stackTraceString_7 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____stackTraceString_7), (void*)value);
	}

	inline static int32_t get_offset_of__remoteStackTraceString_8() { return static_cast<int32_t>(offsetof(Exception_t, ____remoteStackTraceString_8)); }
	inline String_t* get__remoteStackTraceString_8() const { return ____remoteStackTraceString_8; }
	inline String_t** get_address_of__remoteStackTraceString_8() { return &____remoteStackTraceString_8; }
	inline void set__remoteStackTraceString_8(String_t* value)
	{
		____remoteStackTraceString_8 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____remoteStackTraceString_8), (void*)value);
	}

	inline static int32_t get_offset_of__remoteStackIndex_9() { return static_cast<int32_t>(offsetof(Exception_t, ____remoteStackIndex_9)); }
	inline int32_t get__remoteStackIndex_9() const { return ____remoteStackIndex_9; }
	inline int32_t* get_address_of__remoteStackIndex_9() { return &____remoteStackIndex_9; }
	inline void set__remoteStackIndex_9(int32_t value)
	{
		____remoteStackIndex_9 = value;
	}

	inline static int32_t get_offset_of__dynamicMethods_10() { return static_cast<int32_t>(offsetof(Exception_t, ____dynamicMethods_10)); }
	inline RuntimeObject * get__dynamicMethods_10() const { return ____dynamicMethods_10; }
	inline RuntimeObject ** get_address_of__dynamicMethods_10() { return &____dynamicMethods_10; }
	inline void set__dynamicMethods_10(RuntimeObject * value)
	{
		____dynamicMethods_10 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____dynamicMethods_10), (void*)value);
	}

	inline static int32_t get_offset_of__HResult_11() { return static_cast<int32_t>(offsetof(Exception_t, ____HResult_11)); }
	inline int32_t get__HResult_11() const { return ____HResult_11; }
	inline int32_t* get_address_of__HResult_11() { return &____HResult_11; }
	inline void set__HResult_11(int32_t value)
	{
		____HResult_11 = value;
	}

	inline static int32_t get_offset_of__source_12() { return static_cast<int32_t>(offsetof(Exception_t, ____source_12)); }
	inline String_t* get__source_12() const { return ____source_12; }
	inline String_t** get_address_of__source_12() { return &____source_12; }
	inline void set__source_12(String_t* value)
	{
		____source_12 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____source_12), (void*)value);
	}

	inline static int32_t get_offset_of__safeSerializationManager_13() { return static_cast<int32_t>(offsetof(Exception_t, ____safeSerializationManager_13)); }
	inline SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770 * get__safeSerializationManager_13() const { return ____safeSerializationManager_13; }
	inline SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770 ** get_address_of__safeSerializationManager_13() { return &____safeSerializationManager_13; }
	inline void set__safeSerializationManager_13(SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770 * value)
	{
		____safeSerializationManager_13 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____safeSerializationManager_13), (void*)value);
	}

	inline static int32_t get_offset_of_captured_traces_14() { return static_cast<int32_t>(offsetof(Exception_t, ___captured_traces_14)); }
	inline StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196* get_captured_traces_14() const { return ___captured_traces_14; }
	inline StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196** get_address_of_captured_traces_14() { return &___captured_traces_14; }
	inline void set_captured_traces_14(StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196* value)
	{
		___captured_traces_14 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___captured_traces_14), (void*)value);
	}

	inline static int32_t get_offset_of_native_trace_ips_15() { return static_cast<int32_t>(offsetof(Exception_t, ___native_trace_ips_15)); }
	inline IntPtrU5BU5D_t4DC01DCB9A6DF6C9792A6513595D7A11E637DCDD* get_native_trace_ips_15() const { return ___native_trace_ips_15; }
	inline IntPtrU5BU5D_t4DC01DCB9A6DF6C9792A6513595D7A11E637DCDD** get_address_of_native_trace_ips_15() { return &___native_trace_ips_15; }
	inline void set_native_trace_ips_15(IntPtrU5BU5D_t4DC01DCB9A6DF6C9792A6513595D7A11E637DCDD* value)
	{
		___native_trace_ips_15 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___native_trace_ips_15), (void*)value);
	}
};

struct Exception_t_StaticFields
{
public:
	// System.Object System.Exception::s_EDILock
	RuntimeObject * ___s_EDILock_0;

public:
	inline static int32_t get_offset_of_s_EDILock_0() { return static_cast<int32_t>(offsetof(Exception_t_StaticFields, ___s_EDILock_0)); }
	inline RuntimeObject * get_s_EDILock_0() const { return ___s_EDILock_0; }
	inline RuntimeObject ** get_address_of_s_EDILock_0() { return &___s_EDILock_0; }
	inline void set_s_EDILock_0(RuntimeObject * value)
	{
		___s_EDILock_0 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___s_EDILock_0), (void*)value);
	}
};

// Native definition for P/Invoke marshalling of System.Exception
struct Exception_t_marshaled_pinvoke
{
	char* ____className_1;
	char* ____message_2;
	RuntimeObject* ____data_3;
	Exception_t_marshaled_pinvoke* ____innerException_4;
	char* ____helpURL_5;
	Il2CppIUnknown* ____stackTrace_6;
	char* ____stackTraceString_7;
	char* ____remoteStackTraceString_8;
	int32_t ____remoteStackIndex_9;
	Il2CppIUnknown* ____dynamicMethods_10;
	int32_t ____HResult_11;
	char* ____source_12;
	SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770 * ____safeSerializationManager_13;
	StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196* ___captured_traces_14;
	Il2CppSafeArray/*NONE*/* ___native_trace_ips_15;
};
// Native definition for COM marshalling of System.Exception
struct Exception_t_marshaled_com
{
	Il2CppChar* ____className_1;
	Il2CppChar* ____message_2;
	RuntimeObject* ____data_3;
	Exception_t_marshaled_com* ____innerException_4;
	Il2CppChar* ____helpURL_5;
	Il2CppIUnknown* ____stackTrace_6;
	Il2CppChar* ____stackTraceString_7;
	Il2CppChar* ____remoteStackTraceString_8;
	int32_t ____remoteStackIndex_9;
	Il2CppIUnknown* ____dynamicMethods_10;
	int32_t ____HResult_11;
	Il2CppChar* ____source_12;
	SafeSerializationManager_t4A754D86B0F784B18CBC36C073BA564BED109770 * ____safeSerializationManager_13;
	StackTraceU5BU5D_t855F09649EA34DEE7C1B6F088E0538E3CCC3F196* ___captured_traces_14;
	Il2CppSafeArray/*NONE*/* ___native_trace_ips_15;
};

// System.IO.FileAttributes
struct FileAttributes_t224B42F6F82954C94B51791913857C005C559876 
{
public:
	// System.Int32 System.IO.FileAttributes::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(FileAttributes_t224B42F6F82954C94B51791913857C005C559876, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// System.StringComparison
struct StringComparison_t02BAA95468CE9E91115C604577611FDF58FEDCF0 
{
public:
	// System.Int32 System.StringComparison::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(StringComparison_t02BAA95468CE9E91115C604577611FDF58FEDCF0, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// UnityEngine.Object
struct Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0  : public RuntimeObject
{
public:
	// System.IntPtr UnityEngine.Object::m_CachedPtr
	intptr_t ___m_CachedPtr_0;

public:
	inline static int32_t get_offset_of_m_CachedPtr_0() { return static_cast<int32_t>(offsetof(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0, ___m_CachedPtr_0)); }
	inline intptr_t get_m_CachedPtr_0() const { return ___m_CachedPtr_0; }
	inline intptr_t* get_address_of_m_CachedPtr_0() { return &___m_CachedPtr_0; }
	inline void set_m_CachedPtr_0(intptr_t value)
	{
		___m_CachedPtr_0 = value;
	}
};

struct Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_StaticFields
{
public:
	// System.Int32 UnityEngine.Object::OffsetOfInstanceIDInCPlusPlusObject
	int32_t ___OffsetOfInstanceIDInCPlusPlusObject_1;

public:
	inline static int32_t get_offset_of_OffsetOfInstanceIDInCPlusPlusObject_1() { return static_cast<int32_t>(offsetof(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_StaticFields, ___OffsetOfInstanceIDInCPlusPlusObject_1)); }
	inline int32_t get_OffsetOfInstanceIDInCPlusPlusObject_1() const { return ___OffsetOfInstanceIDInCPlusPlusObject_1; }
	inline int32_t* get_address_of_OffsetOfInstanceIDInCPlusPlusObject_1() { return &___OffsetOfInstanceIDInCPlusPlusObject_1; }
	inline void set_OffsetOfInstanceIDInCPlusPlusObject_1(int32_t value)
	{
		___OffsetOfInstanceIDInCPlusPlusObject_1 = value;
	}
};

// Native definition for P/Invoke marshalling of UnityEngine.Object
struct Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_marshaled_pinvoke
{
	intptr_t ___m_CachedPtr_0;
};
// Native definition for COM marshalling of UnityEngine.Object
struct Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_marshaled_com
{
	intptr_t ___m_CachedPtr_0;
};

// UnityEngine.TextureFormat
struct TextureFormat_t7C6B5101554065C47682E592D1E26079D4EC2DCE 
{
public:
	// System.Int32 UnityEngine.TextureFormat::value__
	int32_t ___value___2;

public:
	inline static int32_t get_offset_of_value___2() { return static_cast<int32_t>(offsetof(TextureFormat_t7C6B5101554065C47682E592D1E26079D4EC2DCE, ___value___2)); }
	inline int32_t get_value___2() const { return ___value___2; }
	inline int32_t* get_address_of_value___2() { return &___value___2; }
	inline void set_value___2(int32_t value)
	{
		___value___2 = value;
	}
};


// NativeGallery/ImageProperties
struct ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD 
{
public:
	// System.Int32 NativeGallery/ImageProperties::width
	int32_t ___width_0;
	// System.Int32 NativeGallery/ImageProperties::height
	int32_t ___height_1;
	// System.String NativeGallery/ImageProperties::mimeType
	String_t* ___mimeType_2;
	// NativeGallery/ImageOrientation NativeGallery/ImageProperties::orientation
	int32_t ___orientation_3;

public:
	inline static int32_t get_offset_of_width_0() { return static_cast<int32_t>(offsetof(ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD, ___width_0)); }
	inline int32_t get_width_0() const { return ___width_0; }
	inline int32_t* get_address_of_width_0() { return &___width_0; }
	inline void set_width_0(int32_t value)
	{
		___width_0 = value;
	}

	inline static int32_t get_offset_of_height_1() { return static_cast<int32_t>(offsetof(ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD, ___height_1)); }
	inline int32_t get_height_1() const { return ___height_1; }
	inline int32_t* get_address_of_height_1() { return &___height_1; }
	inline void set_height_1(int32_t value)
	{
		___height_1 = value;
	}

	inline static int32_t get_offset_of_mimeType_2() { return static_cast<int32_t>(offsetof(ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD, ___mimeType_2)); }
	inline String_t* get_mimeType_2() const { return ___mimeType_2; }
	inline String_t** get_address_of_mimeType_2() { return &___mimeType_2; }
	inline void set_mimeType_2(String_t* value)
	{
		___mimeType_2 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___mimeType_2), (void*)value);
	}

	inline static int32_t get_offset_of_orientation_3() { return static_cast<int32_t>(offsetof(ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD, ___orientation_3)); }
	inline int32_t get_orientation_3() const { return ___orientation_3; }
	inline int32_t* get_address_of_orientation_3() { return &___orientation_3; }
	inline void set_orientation_3(int32_t value)
	{
		___orientation_3 = value;
	}
};

// Native definition for P/Invoke marshalling of NativeGallery/ImageProperties
struct ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_pinvoke
{
	int32_t ___width_0;
	int32_t ___height_1;
	char* ___mimeType_2;
	int32_t ___orientation_3;
};
// Native definition for COM marshalling of NativeGallery/ImageProperties
struct ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_com
{
	int32_t ___width_0;
	int32_t ___height_1;
	Il2CppChar* ___mimeType_2;
	int32_t ___orientation_3;
};

// System.IO.MonoIOStat
struct MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124 
{
public:
	// System.IO.FileAttributes System.IO.MonoIOStat::fileAttributes
	int32_t ___fileAttributes_0;
	// System.Int64 System.IO.MonoIOStat::Length
	int64_t ___Length_1;
	// System.Int64 System.IO.MonoIOStat::CreationTime
	int64_t ___CreationTime_2;
	// System.Int64 System.IO.MonoIOStat::LastAccessTime
	int64_t ___LastAccessTime_3;
	// System.Int64 System.IO.MonoIOStat::LastWriteTime
	int64_t ___LastWriteTime_4;

public:
	inline static int32_t get_offset_of_fileAttributes_0() { return static_cast<int32_t>(offsetof(MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124, ___fileAttributes_0)); }
	inline int32_t get_fileAttributes_0() const { return ___fileAttributes_0; }
	inline int32_t* get_address_of_fileAttributes_0() { return &___fileAttributes_0; }
	inline void set_fileAttributes_0(int32_t value)
	{
		___fileAttributes_0 = value;
	}

	inline static int32_t get_offset_of_Length_1() { return static_cast<int32_t>(offsetof(MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124, ___Length_1)); }
	inline int64_t get_Length_1() const { return ___Length_1; }
	inline int64_t* get_address_of_Length_1() { return &___Length_1; }
	inline void set_Length_1(int64_t value)
	{
		___Length_1 = value;
	}

	inline static int32_t get_offset_of_CreationTime_2() { return static_cast<int32_t>(offsetof(MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124, ___CreationTime_2)); }
	inline int64_t get_CreationTime_2() const { return ___CreationTime_2; }
	inline int64_t* get_address_of_CreationTime_2() { return &___CreationTime_2; }
	inline void set_CreationTime_2(int64_t value)
	{
		___CreationTime_2 = value;
	}

	inline static int32_t get_offset_of_LastAccessTime_3() { return static_cast<int32_t>(offsetof(MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124, ___LastAccessTime_3)); }
	inline int64_t get_LastAccessTime_3() const { return ___LastAccessTime_3; }
	inline int64_t* get_address_of_LastAccessTime_3() { return &___LastAccessTime_3; }
	inline void set_LastAccessTime_3(int64_t value)
	{
		___LastAccessTime_3 = value;
	}

	inline static int32_t get_offset_of_LastWriteTime_4() { return static_cast<int32_t>(offsetof(MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124, ___LastWriteTime_4)); }
	inline int64_t get_LastWriteTime_4() const { return ___LastWriteTime_4; }
	inline int64_t* get_address_of_LastWriteTime_4() { return &___LastWriteTime_4; }
	inline void set_LastWriteTime_4(int64_t value)
	{
		___LastWriteTime_4 = value;
	}
};


// System.MulticastDelegate
struct MulticastDelegate_t  : public Delegate_t
{
public:
	// System.Delegate[] System.MulticastDelegate::delegates
	DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86* ___delegates_11;

public:
	inline static int32_t get_offset_of_delegates_11() { return static_cast<int32_t>(offsetof(MulticastDelegate_t, ___delegates_11)); }
	inline DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86* get_delegates_11() const { return ___delegates_11; }
	inline DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86** get_address_of_delegates_11() { return &___delegates_11; }
	inline void set_delegates_11(DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86* value)
	{
		___delegates_11 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___delegates_11), (void*)value);
	}
};

// Native definition for P/Invoke marshalling of System.MulticastDelegate
struct MulticastDelegate_t_marshaled_pinvoke : public Delegate_t_marshaled_pinvoke
{
	Delegate_t_marshaled_pinvoke** ___delegates_11;
};
// Native definition for COM marshalling of System.MulticastDelegate
struct MulticastDelegate_t_marshaled_com : public Delegate_t_marshaled_com
{
	Delegate_t_marshaled_com** ___delegates_11;
};

// System.SystemException
struct SystemException_t5380468142AA850BE4A341D7AF3EAB9C78746782  : public Exception_t
{
public:

public:
};


// UnityEngine.Component
struct Component_t05064EF382ABCAF4B8C94F8A350EA85184C26621  : public Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0
{
public:

public:
};


// UnityEngine.GameObject
struct GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F  : public Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0
{
public:

public:
};


// UnityEngine.Texture
struct Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4  : public Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0
{
public:

public:
};

struct Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4_StaticFields
{
public:
	// System.Int32 UnityEngine.Texture::GenerateAllMips
	int32_t ___GenerateAllMips_4;

public:
	inline static int32_t get_offset_of_GenerateAllMips_4() { return static_cast<int32_t>(offsetof(Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4_StaticFields, ___GenerateAllMips_4)); }
	inline int32_t get_GenerateAllMips_4() const { return ___GenerateAllMips_4; }
	inline int32_t* get_address_of_GenerateAllMips_4() { return &___GenerateAllMips_4; }
	inline void set_GenerateAllMips_4(int32_t value)
	{
		___GenerateAllMips_4 = value;
	}
};


// UnityEngine.UnityException
struct UnityException_t513F7D97037DB40AE78D7C3AAA2F9E011D050C28  : public Exception_t
{
public:

public:
};


// NativeGallery/MediaPickCallback
struct MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B  : public MulticastDelegate_t
{
public:

public:
};


// NativeGallery/MediaPickMultipleCallback
struct MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C  : public MulticastDelegate_t
{
public:

public:
};


// NativeGallery/MediaSaveCallback
struct MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D  : public MulticastDelegate_t
{
public:

public:
};


// System.ArgumentException
struct ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1  : public SystemException_t5380468142AA850BE4A341D7AF3EAB9C78746782
{
public:
	// System.String System.ArgumentException::m_paramName
	String_t* ___m_paramName_17;

public:
	inline static int32_t get_offset_of_m_paramName_17() { return static_cast<int32_t>(offsetof(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1, ___m_paramName_17)); }
	inline String_t* get_m_paramName_17() const { return ___m_paramName_17; }
	inline String_t** get_address_of_m_paramName_17() { return &___m_paramName_17; }
	inline void set_m_paramName_17(String_t* value)
	{
		___m_paramName_17 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___m_paramName_17), (void*)value);
	}
};


// System.AsyncCallback
struct AsyncCallback_t3F3DA3BEDAEE81DD1D24125DF8EB30E85EE14DA4  : public MulticastDelegate_t
{
public:

public:
};


// System.IO.FileSystemInfo
struct FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D  : public MarshalByRefObject_tC4577953D0A44D0AB8597CFA868E01C858B1C9AF
{
public:
	// System.IO.MonoIOStat System.IO.FileSystemInfo::_data
	MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124  ____data_1;
	// System.Int32 System.IO.FileSystemInfo::_dataInitialised
	int32_t ____dataInitialised_2;
	// System.String System.IO.FileSystemInfo::FullPath
	String_t* ___FullPath_3;
	// System.String System.IO.FileSystemInfo::OriginalPath
	String_t* ___OriginalPath_4;
	// System.String System.IO.FileSystemInfo::_displayPath
	String_t* ____displayPath_5;

public:
	inline static int32_t get_offset_of__data_1() { return static_cast<int32_t>(offsetof(FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D, ____data_1)); }
	inline MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124  get__data_1() const { return ____data_1; }
	inline MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124 * get_address_of__data_1() { return &____data_1; }
	inline void set__data_1(MonoIOStat_t819C03DA1902AA493BDBF4B55E76DCE6FB16A124  value)
	{
		____data_1 = value;
	}

	inline static int32_t get_offset_of__dataInitialised_2() { return static_cast<int32_t>(offsetof(FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D, ____dataInitialised_2)); }
	inline int32_t get__dataInitialised_2() const { return ____dataInitialised_2; }
	inline int32_t* get_address_of__dataInitialised_2() { return &____dataInitialised_2; }
	inline void set__dataInitialised_2(int32_t value)
	{
		____dataInitialised_2 = value;
	}

	inline static int32_t get_offset_of_FullPath_3() { return static_cast<int32_t>(offsetof(FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D, ___FullPath_3)); }
	inline String_t* get_FullPath_3() const { return ___FullPath_3; }
	inline String_t** get_address_of_FullPath_3() { return &___FullPath_3; }
	inline void set_FullPath_3(String_t* value)
	{
		___FullPath_3 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___FullPath_3), (void*)value);
	}

	inline static int32_t get_offset_of_OriginalPath_4() { return static_cast<int32_t>(offsetof(FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D, ___OriginalPath_4)); }
	inline String_t* get_OriginalPath_4() const { return ___OriginalPath_4; }
	inline String_t** get_address_of_OriginalPath_4() { return &___OriginalPath_4; }
	inline void set_OriginalPath_4(String_t* value)
	{
		___OriginalPath_4 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___OriginalPath_4), (void*)value);
	}

	inline static int32_t get_offset_of__displayPath_5() { return static_cast<int32_t>(offsetof(FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D, ____displayPath_5)); }
	inline String_t* get__displayPath_5() const { return ____displayPath_5; }
	inline String_t** get_address_of__displayPath_5() { return &____displayPath_5; }
	inline void set__displayPath_5(String_t* value)
	{
		____displayPath_5 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____displayPath_5), (void*)value);
	}
};


// System.IO.IOException
struct IOException_t60E052020EDE4D3075F57A1DCC224FF8864354BA  : public SystemException_t5380468142AA850BE4A341D7AF3EAB9C78746782
{
public:
	// System.String System.IO.IOException::_maybeFullPath
	String_t* ____maybeFullPath_17;

public:
	inline static int32_t get_offset_of__maybeFullPath_17() { return static_cast<int32_t>(offsetof(IOException_t60E052020EDE4D3075F57A1DCC224FF8864354BA, ____maybeFullPath_17)); }
	inline String_t* get__maybeFullPath_17() const { return ____maybeFullPath_17; }
	inline String_t** get_address_of__maybeFullPath_17() { return &____maybeFullPath_17; }
	inline void set__maybeFullPath_17(String_t* value)
	{
		____maybeFullPath_17 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____maybeFullPath_17), (void*)value);
	}
};


// UnityEngine.Behaviour
struct Behaviour_tBDC7E9C3C898AD8348891B82D3E345801D920CA8  : public Component_t05064EF382ABCAF4B8C94F8A350EA85184C26621
{
public:

public:
};


// UnityEngine.RenderTexture
struct RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6  : public Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4
{
public:

public:
};


// UnityEngine.Texture2D
struct Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C  : public Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4
{
public:

public:
};


// System.IO.DirectoryInfo
struct DirectoryInfo_t432CD06DF148701E930708371CB985BC0E8EF87F  : public FileSystemInfo_t6831B76FBA37F7181E4A5AEB28194730EB356A3D
{
public:
	// System.String System.IO.DirectoryInfo::current
	String_t* ___current_6;
	// System.String System.IO.DirectoryInfo::parent
	String_t* ___parent_7;

public:
	inline static int32_t get_offset_of_current_6() { return static_cast<int32_t>(offsetof(DirectoryInfo_t432CD06DF148701E930708371CB985BC0E8EF87F, ___current_6)); }
	inline String_t* get_current_6() const { return ___current_6; }
	inline String_t** get_address_of_current_6() { return &___current_6; }
	inline void set_current_6(String_t* value)
	{
		___current_6 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___current_6), (void*)value);
	}

	inline static int32_t get_offset_of_parent_7() { return static_cast<int32_t>(offsetof(DirectoryInfo_t432CD06DF148701E930708371CB985BC0E8EF87F, ___parent_7)); }
	inline String_t* get_parent_7() const { return ___parent_7; }
	inline String_t** get_address_of_parent_7() { return &___parent_7; }
	inline void set_parent_7(String_t* value)
	{
		___parent_7 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___parent_7), (void*)value);
	}
};


// System.IO.FileNotFoundException
struct FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431  : public IOException_t60E052020EDE4D3075F57A1DCC224FF8864354BA
{
public:
	// System.String System.IO.FileNotFoundException::_fileName
	String_t* ____fileName_18;
	// System.String System.IO.FileNotFoundException::_fusionLog
	String_t* ____fusionLog_19;

public:
	inline static int32_t get_offset_of__fileName_18() { return static_cast<int32_t>(offsetof(FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431, ____fileName_18)); }
	inline String_t* get__fileName_18() const { return ____fileName_18; }
	inline String_t** get_address_of__fileName_18() { return &____fileName_18; }
	inline void set__fileName_18(String_t* value)
	{
		____fileName_18 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____fileName_18), (void*)value);
	}

	inline static int32_t get_offset_of__fusionLog_19() { return static_cast<int32_t>(offsetof(FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431, ____fusionLog_19)); }
	inline String_t* get__fusionLog_19() const { return ____fusionLog_19; }
	inline String_t** get_address_of__fusionLog_19() { return &____fusionLog_19; }
	inline void set__fusionLog_19(String_t* value)
	{
		____fusionLog_19 = value;
		Il2CppCodeGenWriteBarrier((void**)(&____fusionLog_19), (void*)value);
	}
};


// UnityEngine.MonoBehaviour
struct MonoBehaviour_t4A60845CF505405AF8BE8C61CC07F75CADEF6429  : public Behaviour_tBDC7E9C3C898AD8348891B82D3E345801D920CA8
{
public:

public:
};


// NativeGalleryNamespace.NGMediaReceiveCallbackiOS
struct NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6  : public MonoBehaviour_t4A60845CF505405AF8BE8C61CC07F75CADEF6429
{
public:
	// NativeGallery/MediaPickCallback NativeGalleryNamespace.NGMediaReceiveCallbackiOS::callback
	MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback_5;
	// NativeGallery/MediaPickMultipleCallback NativeGalleryNamespace.NGMediaReceiveCallbackiOS::callbackMultiple
	MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callbackMultiple_6;
	// System.Single NativeGalleryNamespace.NGMediaReceiveCallbackiOS::nextBusyCheckTime
	float ___nextBusyCheckTime_7;

public:
	inline static int32_t get_offset_of_callback_5() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6, ___callback_5)); }
	inline MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * get_callback_5() const { return ___callback_5; }
	inline MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B ** get_address_of_callback_5() { return &___callback_5; }
	inline void set_callback_5(MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * value)
	{
		___callback_5 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___callback_5), (void*)value);
	}

	inline static int32_t get_offset_of_callbackMultiple_6() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6, ___callbackMultiple_6)); }
	inline MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * get_callbackMultiple_6() const { return ___callbackMultiple_6; }
	inline MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C ** get_address_of_callbackMultiple_6() { return &___callbackMultiple_6; }
	inline void set_callbackMultiple_6(MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * value)
	{
		___callbackMultiple_6 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___callbackMultiple_6), (void*)value);
	}

	inline static int32_t get_offset_of_nextBusyCheckTime_7() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6, ___nextBusyCheckTime_7)); }
	inline float get_nextBusyCheckTime_7() const { return ___nextBusyCheckTime_7; }
	inline float* get_address_of_nextBusyCheckTime_7() { return &___nextBusyCheckTime_7; }
	inline void set_nextBusyCheckTime_7(float value)
	{
		___nextBusyCheckTime_7 = value;
	}
};

struct NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields
{
public:
	// NativeGalleryNamespace.NGMediaReceiveCallbackiOS NativeGalleryNamespace.NGMediaReceiveCallbackiOS::instance
	NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * ___instance_4;
	// System.Boolean NativeGalleryNamespace.NGMediaReceiveCallbackiOS::<IsBusy>k__BackingField
	bool ___U3CIsBusyU3Ek__BackingField_8;

public:
	inline static int32_t get_offset_of_instance_4() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields, ___instance_4)); }
	inline NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * get_instance_4() const { return ___instance_4; }
	inline NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 ** get_address_of_instance_4() { return &___instance_4; }
	inline void set_instance_4(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * value)
	{
		___instance_4 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___instance_4), (void*)value);
	}

	inline static int32_t get_offset_of_U3CIsBusyU3Ek__BackingField_8() { return static_cast<int32_t>(offsetof(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields, ___U3CIsBusyU3Ek__BackingField_8)); }
	inline bool get_U3CIsBusyU3Ek__BackingField_8() const { return ___U3CIsBusyU3Ek__BackingField_8; }
	inline bool* get_address_of_U3CIsBusyU3Ek__BackingField_8() { return &___U3CIsBusyU3Ek__BackingField_8; }
	inline void set_U3CIsBusyU3Ek__BackingField_8(bool value)
	{
		___U3CIsBusyU3Ek__BackingField_8 = value;
	}
};


// NativeGalleryNamespace.NGMediaSaveCallbackiOS
struct NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8  : public MonoBehaviour_t4A60845CF505405AF8BE8C61CC07F75CADEF6429
{
public:
	// NativeGallery/MediaSaveCallback NativeGalleryNamespace.NGMediaSaveCallbackiOS::callback
	MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback_5;

public:
	inline static int32_t get_offset_of_callback_5() { return static_cast<int32_t>(offsetof(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8, ___callback_5)); }
	inline MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * get_callback_5() const { return ___callback_5; }
	inline MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D ** get_address_of_callback_5() { return &___callback_5; }
	inline void set_callback_5(MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * value)
	{
		___callback_5 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___callback_5), (void*)value);
	}
};

struct NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields
{
public:
	// NativeGalleryNamespace.NGMediaSaveCallbackiOS NativeGalleryNamespace.NGMediaSaveCallbackiOS::instance
	NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * ___instance_4;

public:
	inline static int32_t get_offset_of_instance_4() { return static_cast<int32_t>(offsetof(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields, ___instance_4)); }
	inline NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * get_instance_4() const { return ___instance_4; }
	inline NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 ** get_address_of_instance_4() { return &___instance_4; }
	inline void set_instance_4(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * value)
	{
		___instance_4 = value;
		Il2CppCodeGenWriteBarrier((void**)(&___instance_4), (void*)value);
	}
};

#ifdef __clang__
#pragma clang diagnostic pop
#endif
// System.Byte[]
struct ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) uint8_t m_Items[1];

public:
	inline uint8_t GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline uint8_t* GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, uint8_t value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
	}
	inline uint8_t GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline uint8_t* GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, uint8_t value)
	{
		m_Items[index] = value;
	}
};
// System.String[]
struct StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) String_t* m_Items[1];

public:
	inline String_t* GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline String_t** GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, String_t* value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier((void**)m_Items + index, (void*)value);
	}
	inline String_t* GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline String_t** GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, String_t* value)
	{
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier((void**)m_Items + index, (void*)value);
	}
};
// System.Char[]
struct CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) Il2CppChar m_Items[1];

public:
	inline Il2CppChar GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline Il2CppChar* GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, Il2CppChar value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
	}
	inline Il2CppChar GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline Il2CppChar* GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, Il2CppChar value)
	{
		m_Items[index] = value;
	}
};
// System.Delegate[]
struct DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86  : public RuntimeArray
{
public:
	ALIGN_FIELD (8) Delegate_t * m_Items[1];

public:
	inline Delegate_t * GetAt(il2cpp_array_size_t index) const
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items[index];
	}
	inline Delegate_t ** GetAddressAt(il2cpp_array_size_t index)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		return m_Items + index;
	}
	inline void SetAt(il2cpp_array_size_t index, Delegate_t * value)
	{
		IL2CPP_ARRAY_BOUNDS_CHECK(index, (uint32_t)(this)->max_length);
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier((void**)m_Items + index, (void*)value);
	}
	inline Delegate_t * GetAtUnchecked(il2cpp_array_size_t index) const
	{
		return m_Items[index];
	}
	inline Delegate_t ** GetAddressAtUnchecked(il2cpp_array_size_t index)
	{
		return m_Items + index;
	}
	inline void SetAtUnchecked(il2cpp_array_size_t index, Delegate_t * value)
	{
		m_Items[index] = value;
		Il2CppCodeGenWriteBarrier((void**)m_Items + index, (void*)value);
	}
};


// !!0 UnityEngine.GameObject::AddComponent<System.Object>()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject * GameObject_AddComponent_TisRuntimeObject_m80EDFEAC4927F588A7A702F81524EDBFA8603FE2_gshared (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * __this, const RuntimeMethod* method);

// System.String UnityEngine.Application::get_temporaryCachePath()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* Application_get_temporaryCachePath_m6769909A405A6A5A0477F8E5F312920C8115E50C (const RuntimeMethod* method);
// System.String System.IO.Path::Combine(System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* Path_Combine_mA495A18104786EB450EC0E44EE0FB7F9040C4311 (String_t* ___path10, String_t* ___path21, const RuntimeMethod* method);
// System.IO.DirectoryInfo System.IO.Directory::CreateDirectory(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR DirectoryInfo_t432CD06DF148701E930708371CB985BC0E8EF87F * Directory_CreateDirectory_m0C9CAA2ECA801C4D07EA35820DA0907402ED4D41 (String_t* ___path0, const RuntimeMethod* method);
// System.Int32 NativeGallery::_NativeGallery_CheckPermission(System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_CheckPermission_mEFBFF9179DB9AEE59ACAE58B4017E185DC99901A (int32_t ___readPermission0, int32_t ___permissionFreeMode1, const RuntimeMethod* method);
// System.Int32 NativeGallery::_NativeGallery_RequestPermission(System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_RequestPermission_m2EA30B3A1C054AE33C4CF089461AC0C09924AC0B (int32_t ___readPermission0, int32_t ___permissionFreeMode1, const RuntimeMethod* method);
// System.Boolean NativeGallery::IsMediaPickerBusy()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NativeGallery_IsMediaPickerBusy_m6FCFB28A795C6015E5F1B51B00FDFDBE22E9CC45 (const RuntimeMethod* method);
// System.Void NativeGallery::_NativeGallery_ShowLimitedLibraryPicker()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_ShowLimitedLibraryPicker_m9EF5EB7300BD49F0B2B5567A9FE2BD0BF5F9D809 (const RuntimeMethod* method);
// System.Int32 NativeGallery::_NativeGallery_CanOpenSettings()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_CanOpenSettings_m87481B92A27E8557F82EF70DDEE1F4F1474EBDF7 (const RuntimeMethod* method);
// System.Void NativeGallery::_NativeGallery_OpenSettings()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_OpenSettings_mAEDC55ADE8335C69F1FB1981EA1FF91D6710BAF7 (const RuntimeMethod* method);
// NativeGallery/Permission NativeGallery::SaveToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaType,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___mediaBytes0, String_t* ___album1, String_t* ___filename2, int32_t ___mediaType3, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback4, const RuntimeMethod* method);
// NativeGallery/Permission NativeGallery::SaveToGallery(System.String,System.String,System.String,NativeGallery/MediaType,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F (String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filename2, int32_t ___mediaType3, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback4, const RuntimeMethod* method);
// System.Boolean UnityEngine.Object::op_Equality(UnityEngine.Object,UnityEngine.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool Object_op_Equality_mBC2401774F3BE33E8CF6F0A8148E66C95D6CFF1C (Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 * ___x0, Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 * ___y1, const RuntimeMethod* method);
// System.Void System.ArgumentException::.ctor(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7 (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * __this, String_t* ___message0, const RuntimeMethod* method);
// System.Boolean System.String::EndsWith(System.String,System.StringComparison)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool String_EndsWith_m80B198568050D692B70AD8949AC6EDC3044ED811 (String_t* __this, String_t* ___value0, int32_t ___comparisonType1, const RuntimeMethod* method);
// System.Byte[] NativeGallery::GetTextureBytes(UnityEngine.Texture2D,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___texture0, bool ___isJpeg1, const RuntimeMethod* method);
// System.String System.String::Concat(System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE (String_t* ___str00, String_t* ___str11, const RuntimeMethod* method);
// System.Int32 NativeGallery::_NativeGallery_CanPickMultipleMedia()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_CanPickMultipleMedia_m7482F92F8449F098C78D1D2CB5CE26740E05240F (const RuntimeMethod* method);
// NativeGallery/Permission NativeGallery::GetMediaFromGallery(NativeGallery/MediaPickCallback,NativeGallery/MediaType,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, int32_t ___mediaType1, String_t* ___mime2, String_t* ___title3, const RuntimeMethod* method);
// NativeGallery/Permission NativeGallery::GetMultipleMediaFromGallery(NativeGallery/MediaPickMultipleCallback,NativeGallery/MediaType,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5 (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callback0, int32_t ___mediaType1, String_t* ___mime2, String_t* ___title3, const RuntimeMethod* method);
// System.Boolean NativeGalleryNamespace.NGMediaReceiveCallbackiOS::get_IsBusy()
IL2CPP_EXTERN_C inline  IL2CPP_METHOD_ATTR bool NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_inline (const RuntimeMethod* method);
// System.Boolean System.String::IsNullOrEmpty(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229 (String_t* ___value0, const RuntimeMethod* method);
// System.String System.IO.Path::GetExtension(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B (String_t* ___path0, const RuntimeMethod* method);
// System.Char System.String::get_Chars(System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Il2CppChar String_get_Chars_m14308AC3B95F8C1D9F1D1055B116B37D595F1D96 (String_t* __this, int32_t ___index0, const RuntimeMethod* method);
// System.Int32 System.String::get_Length()
IL2CPP_EXTERN_C inline  IL2CPP_METHOD_ATTR int32_t String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline (String_t* __this, const RuntimeMethod* method);
// System.String System.String::Substring(System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* String_Substring_m2C4AFF5E79DD8BADFD2DFBCF156BF728FBB8E1AE (String_t* __this, int32_t ___startIndex0, const RuntimeMethod* method);
// System.String System.String::ToLowerInvariant()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* String_ToLowerInvariant_m197BD65B6582DC546FF1BC398161EEFA708F799E (String_t* __this, const RuntimeMethod* method);
// System.Int32 NativeGallery::_NativeGallery_GetMediaTypeFromExtension(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_GetMediaTypeFromExtension_mB1772D19351F5B822C4FA29790E6A5E78C620EB5 (String_t* ___extension0, const RuntimeMethod* method);
// NativeGallery/Permission NativeGallery::RequestPermission(NativeGallery/PermissionType)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941 (int32_t ___permissionType0, const RuntimeMethod* method);
// System.Void UnityEngine.Debug::LogWarning(System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Debug_LogWarning_m37338644DC81F640CCDFEAE35A223F0E965F0568 (RuntimeObject * ___message0, const RuntimeMethod* method);
// System.String NativeGallery::GetTemporarySavePath(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery_GetTemporarySavePath_m351D4BFF627FA6826F36DA27EFEF5A5B79ECB0D9 (String_t* ___filename0, const RuntimeMethod* method);
// System.Void System.IO.File::WriteAllBytes(System.String,System.Byte[])
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void File_WriteAllBytes_m07F13C1CA0BD0960392C78AB99E0F19564F9B594 (String_t* ___path0, ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___bytes1, const RuntimeMethod* method);
// System.Void NativeGallery::SaveToGalleryInternal(System.String,System.String,NativeGallery/MediaType,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery_SaveToGalleryInternal_m0588F4885ED6F5590276A2CE811C19366734B185 (String_t* ___path0, String_t* ___album1, int32_t ___mediaType2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method);
// System.Boolean System.IO.File::Exists(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB (String_t* ___path0, const RuntimeMethod* method);
// System.Void System.IO.FileNotFoundException::.ctor(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void FileNotFoundException__ctor_mA72DAA77008E903BC162A8D32FDE7F874B27E858 (FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 * __this, String_t* ___message0, const RuntimeMethod* method);
// System.Void System.IO.File::Copy(System.String,System.String,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void File_Copy_m42EEC6C53F171AD23C837EAD48905F11D94C04BF (String_t* ___sourceFileName0, String_t* ___destFileName1, bool ___overwrite2, const RuntimeMethod* method);
// System.Void UnityEngine.Debug::LogError(System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Debug_LogError_m3BCF9B78263152261565DCA9DB7D55F0C391ED29 (RuntimeObject * ___message0, const RuntimeMethod* method);
// System.Void NativeGallery/MediaSaveCallback::Invoke(System.Boolean,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaSaveCallback_Invoke_m3999037DB5B5D6616E750064620751D8DB2A281F (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * __this, bool ___success0, String_t* ___path1, const RuntimeMethod* method);
// System.String System.IO.Path::GetFileName(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* Path_GetFileName_m2307E8E0B250632002840D9EC27DBABE9C4EB85E (String_t* ___path0, const RuntimeMethod* method);
// System.Void UnityEngine.Debug::Log(System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Debug_Log_m4B7C70BAFD477C6BDB59C88A0934F0B018D03708 (RuntimeObject * ___message0, const RuntimeMethod* method);
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::Initialize(NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaSaveCallbackiOS_Initialize_m53B8975819EF4C0612C5B00C3B03C496B1AE6464 (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback0, const RuntimeMethod* method);
// System.Void NativeGallery::_NativeGallery_ImageWriteToAlbum(System.String,System.String,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_ImageWriteToAlbum_m68ECB25739DB47C8883C8BE97ACDCDC2EA9F8C8F (String_t* ___path0, String_t* ___album1, int32_t ___permissionFreeMode2, const RuntimeMethod* method);
// System.Void NativeGallery::_NativeGallery_VideoWriteToAlbum(System.String,System.String,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_VideoWriteToAlbum_mE90E4AF81DCAC29B0AE6EC9BBE754CE6709CCE7D (String_t* ___path0, String_t* ___album1, int32_t ___permissionFreeMode2, const RuntimeMethod* method);
// System.String UnityEngine.Application::get_persistentDataPath()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* Application_get_persistentDataPath_m82E34156D8BD0A55CAC258CDFE8317FAD6945F5B (const RuntimeMethod* method);
// System.String System.IO.Path::GetFileNameWithoutExtension(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* Path_GetFileNameWithoutExtension_m90A3C4CEB8936011D1A392BB7E98991482E0C198 (String_t* ___path0, const RuntimeMethod* method);
// System.String System.String::Concat(System.Object,System.Object,System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* String_Concat_m2E1F71C491D2429CC80A28745488FEA947BB7AAC (RuntimeObject * ___arg00, RuntimeObject * ___arg11, RuntimeObject * ___arg22, const RuntimeMethod* method);
// System.Void NativeGallery/MediaPickCallback::Invoke(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickCallback_Invoke_m63EDCBEBE0133626823ADEA1566C8F71785D6B26 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * __this, String_t* ___path0, const RuntimeMethod* method);
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::Initialize(NativeGallery/MediaPickCallback,NativeGallery/MediaPickMultipleCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_Initialize_m42081AEDDFA2FFBF12D98CC91BFD1AA353CD10E8 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callbackMultiple1, const RuntimeMethod* method);
// System.String NativeGallery::get_SelectedMediaPath()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery_get_SelectedMediaPath_m73539045C11D3F6340EFF65DDC5EAA7F67DECD2C (const RuntimeMethod* method);
// System.Void NativeGallery::_NativeGallery_PickMedia(System.String,System.Int32,System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_PickMedia_m5241472884833F83137B5C3CFC6397556B732CDA (String_t* ___mediaSavePath0, int32_t ___mediaType1, int32_t ___permissionFreeMode2, int32_t ___selectionLimit3, const RuntimeMethod* method);
// System.Boolean NativeGallery::CanSelectMultipleFilesFromGallery()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NativeGallery_CanSelectMultipleFilesFromGallery_m0693426E1BE05221AEB29DB7E501488657554C58 (const RuntimeMethod* method);
// System.Void NativeGallery/MediaPickMultipleCallback::Invoke(System.String[])
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickMultipleCallback_Invoke_m730BAC86FDA2FF4E477B8EB143C4B245E47EF59E (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * __this, StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* ___paths0, const RuntimeMethod* method);
// System.Byte[] UnityEngine.ImageConversion::EncodeToPNG(UnityEngine.Texture2D)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ImageConversion_EncodeToPNG_m8D67A36A7D81F436CDA108CC5293E15A9CFD5617 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___tex0, const RuntimeMethod* method);
// System.Byte[] UnityEngine.ImageConversion::EncodeToJPG(UnityEngine.Texture2D,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ImageConversion_EncodeToJPG_mE289598FD45B6658A645B2CE359C4E6FC97BF875 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___tex0, int32_t ___quality1, const RuntimeMethod* method);
// System.Byte[] NativeGallery::GetTextureBytesFromCopy(UnityEngine.Texture2D,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* NativeGallery_GetTextureBytesFromCopy_m15D9F6E2A638A3E3E4C84A32EF0423A37EA42470 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___texture0, bool ___isJpeg1, const RuntimeMethod* method);
// UnityEngine.RenderTexture UnityEngine.RenderTexture::GetTemporary(System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * RenderTexture_GetTemporary_m02547EA84CDEB9038FCF1EEDD283AF24114C735F (int32_t ___width0, int32_t ___height1, const RuntimeMethod* method);
// UnityEngine.RenderTexture UnityEngine.RenderTexture::get_active()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * RenderTexture_get_active_m670416A37BF4239DE5A55F6138CAA1FEEF184957 (const RuntimeMethod* method);
// System.Void UnityEngine.Graphics::Blit(UnityEngine.Texture,UnityEngine.RenderTexture)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Graphics_Blit_mB042EC04307A5617038DA4210DE7BA4B3E529113 (Texture_t387FE83BB848001FD06B14707AEA6D5A0F6A95F4 * ___source0, RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * ___dest1, const RuntimeMethod* method);
// System.Void UnityEngine.RenderTexture::set_active(UnityEngine.RenderTexture)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void RenderTexture_set_active_m992E25C701DEFC8042B31022EA45F02A787A84F1 (RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * ___value0, const RuntimeMethod* method);
// System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32,UnityEngine.TextureFormat,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Texture2D__ctor_m22561E039BC96019757E6B2427BE09734AE2C44A (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * __this, int32_t ___width0, int32_t ___height1, int32_t ___textureFormat2, bool ___mipChain3, const RuntimeMethod* method);
// System.Void UnityEngine.Rect::.ctor(System.Single,System.Single,System.Single,System.Single)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Rect__ctor_m50B92C75005C9C5A0D05E6E0EBB43AFAF7C66280 (Rect_t35B976DE901B5423C11705E156938EA27AB402CE * __this, float ___x0, float ___y1, float ___width2, float ___height3, const RuntimeMethod* method);
// System.Void UnityEngine.Texture2D::ReadPixels(UnityEngine.Rect,System.Int32,System.Int32,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Texture2D_ReadPixels_m5664E184458C64BA89450F80F47705A2241E9BFE (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * __this, Rect_t35B976DE901B5423C11705E156938EA27AB402CE  ___source0, int32_t ___destX1, int32_t ___destY2, bool ___recalculateMipMaps3, const RuntimeMethod* method);
// System.Void UnityEngine.Texture2D::Apply(System.Boolean,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Texture2D_Apply_mCC17B1895AEB420CF75B1A50A62AB623C225A6C1 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * __this, bool ___updateMipmaps0, bool ___makeNoLongerReadable1, const RuntimeMethod* method);
// System.Void UnityEngine.Debug::LogException(System.Exception)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Debug_LogException_mBAA6702C240E37B2A834AA74E4FDC15A3A5589A9 (Exception_t * ___exception0, const RuntimeMethod* method);
// System.Void UnityEngine.Object::DestroyImmediate(UnityEngine.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Object_DestroyImmediate_mF6F4415EF22249D6E650FAA40E403283F19B7446 (Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 * ___obj0, const RuntimeMethod* method);
// System.Void UnityEngine.RenderTexture::ReleaseTemporary(UnityEngine.RenderTexture)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void RenderTexture_ReleaseTemporary_mFBA6F18138965049AA901D62A0080B1A087A38EA (RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * ___temp0, const RuntimeMethod* method);
// System.Int32 UnityEngine.SystemInfo::get_maxTextureSize()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t SystemInfo_get_maxTextureSize_m10A8228B83EE161D0DCCB9FB01279C245C47D0E3 (const RuntimeMethod* method);
// System.String NativeGallery::get_TemporaryImagePath()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery_get_TemporaryImagePath_m0C8232159D07C61BE9CF5A2275953E4F44DA5354 (const RuntimeMethod* method);
// System.String NativeGallery::_NativeGallery_LoadImageAtPath(System.String,System.String,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_LoadImageAtPath_mA0D2A6A62DC01256EF74FF5C236F6806BE3F8F2A (String_t* ___path0, String_t* ___temporaryFilePath1, int32_t ___maxSize2, const RuntimeMethod* method);
// System.Boolean System.String::op_Equality(System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE (String_t* ___a0, String_t* ___b1, const RuntimeMethod* method);
// System.Void UnityEngine.Texture2D::.ctor(System.Int32,System.Int32,UnityEngine.TextureFormat,System.Boolean,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Texture2D__ctor_m01B7AF7873AA43495B8216926C1768FEDDF4CE64 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * __this, int32_t ___width0, int32_t ___height1, int32_t ___textureFormat2, bool ___mipChain3, bool ___linear4, const RuntimeMethod* method);
// System.Byte[] System.IO.File::ReadAllBytes(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* File_ReadAllBytes_mF29468CED0B7B3B7C0971ACEBB16A38683718BEC (String_t* ___path0, const RuntimeMethod* method);
// System.Boolean UnityEngine.ImageConversion::LoadImage(UnityEngine.Texture2D,System.Byte[],System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool ImageConversion_LoadImage_mFB317291362399115F8D112D8CE9E8C1BF454C29 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___tex0, ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___data1, bool ___markNonReadable2, const RuntimeMethod* method);
// System.Boolean System.String::op_Inequality(System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool String_op_Inequality_m0BD184A74F453A72376E81CC6CAEE2556B80493E (String_t* ___a0, String_t* ___b1, const RuntimeMethod* method);
// System.Void System.IO.File::Delete(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void File_Delete_mBE814E569EAB07FAD140C6DCDB957F1CB8C85DE2 (String_t* ___path0, const RuntimeMethod* method);
// System.String NativeGallery::_NativeGallery_GetVideoThumbnail(System.String,System.String,System.Int32,System.Double)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_GetVideoThumbnail_m67187C1103D261E9F52143D7E917CA97939A3A0B (String_t* ___path0, String_t* ___thumbnailSavePath1, int32_t ___maxSize2, double ___captureTimeInSeconds3, const RuntimeMethod* method);
// UnityEngine.Texture2D NativeGallery::LoadImageAtPath(System.String,System.Int32,System.Boolean,System.Boolean,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07 (String_t* ___imagePath0, int32_t ___maxSize1, bool ___markTextureNonReadable2, bool ___generateMipmaps3, bool ___linearColorSpace4, const RuntimeMethod* method);
// System.String NativeGallery::_NativeGallery_GetImageProperties(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_GetImageProperties_m7208E7383AC627EEC8B87A63447B6B8261B22268 (String_t* ___path0, const RuntimeMethod* method);
// System.String[] System.String::Split(System.Char[])
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* String_Split_m13262358217AD2C119FD1B9733C3C0289D608512 (String_t* __this, CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* ___separator0, const RuntimeMethod* method);
// System.String System.String::Trim()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D (String_t* __this, const RuntimeMethod* method);
// System.Boolean System.Int32::TryParse(System.String,System.Int32&)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool Int32_TryParse_m03D31CAB7050E8286A8A90711C896B181006AD00 (String_t* ___s0, int32_t* ___result1, const RuntimeMethod* method);
// System.Void NativeGallery/ImageProperties::.ctor(System.Int32,System.Int32,System.String,NativeGallery/ImageOrientation)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ImageProperties__ctor_m4887094C011E2F53ABEF3389856C2B232A754A55 (ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD * __this, int32_t ___width0, int32_t ___height1, String_t* ___mimeType2, int32_t ___orientation3, const RuntimeMethod* method);
// System.String NativeGallery::_NativeGallery_GetVideoProperties(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_GetVideoProperties_m15490BBA47D7D480202BCF365228E91D891A5ECD (String_t* ___path0, const RuntimeMethod* method);
// System.Boolean System.Int64::TryParse(System.String,System.Int64&)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool Int64_TryParse_m5C60567D82BACC7D9C18F7A9A83025FC94AD0E95 (String_t* ___s0, int64_t* ___result1, const RuntimeMethod* method);
// System.Boolean System.Single::TryParse(System.String,System.Single&)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool Single_TryParse_m548E9EC17193999C07717FECFAD0A907980D566C (String_t* ___s0, float* ___result1, const RuntimeMethod* method);
// System.Void NativeGallery/VideoProperties::.ctor(System.Int32,System.Int32,System.Int64,System.Single)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void VideoProperties__ctor_mFEAE01935E87AE233A7EA239997ED5C325D732AA (VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409 * __this, int32_t ___width0, int32_t ___height1, int64_t ___duration2, float ___rotation3, const RuntimeMethod* method);
// System.Void UnityEngine.GameObject::.ctor(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void GameObject__ctor_mBB454E679AD9CF0B84D3609A01E6A9753ACF4686 (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * __this, String_t* ___name0, const RuntimeMethod* method);
// !!0 UnityEngine.GameObject::AddComponent<NativeGalleryNamespace.NGMediaReceiveCallbackiOS>()
inline NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_mB7F5F3B119B04E28416C77CEC62EDAAACC4CFC4D (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * __this, const RuntimeMethod* method)
{
	return ((  NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * (*) (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F *, const RuntimeMethod*))GameObject_AddComponent_TisRuntimeObject_m80EDFEAC4927F588A7A702F81524EDBFA8603FE2_gshared)(__this, method);
}
// UnityEngine.GameObject UnityEngine.Component::get_gameObject()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * Component_get_gameObject_m0B0570BA8DDD3CD78A9DB568EA18D7317686603C (Component_t05064EF382ABCAF4B8C94F8A350EA85184C26621 * __this, const RuntimeMethod* method);
// System.Void UnityEngine.Object::DontDestroyOnLoad(UnityEngine.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void Object_DontDestroyOnLoad_m4DC90770AD6084E4B1B8489C6B41205DC020C207 (Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 * ___target0, const RuntimeMethod* method);
// System.Single UnityEngine.Time::get_realtimeSinceStartup()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR float Time_get_realtimeSinceStartup_mCA1086EC9DFCF135F77BC46D3B7127711EA3DE03 (const RuntimeMethod* method);
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::set_IsBusy(System.Boolean)
IL2CPP_EXTERN_C inline  IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_inline (bool ___value0, const RuntimeMethod* method);
// System.Int32 NativeGalleryNamespace.NGMediaReceiveCallbackiOS::_NativeGallery_IsMediaPickerBusy()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NGMediaReceiveCallbackiOS__NativeGallery_IsMediaPickerBusy_m1A933706D0F7692B6903EE7A9B5FC9ADDA51F1A8 (const RuntimeMethod* method);
// System.String[] NativeGalleryNamespace.NGMediaReceiveCallbackiOS::SplitPaths(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* NGMediaReceiveCallbackiOS_SplitPaths_mB0EAF48CA4095A30E0204927DE5A2696A4A905B7 (NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * __this, String_t* ___paths0, const RuntimeMethod* method);
// System.Void UnityEngine.MonoBehaviour::.ctor()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MonoBehaviour__ctor_mEAEC84B222C60319D593E456D769B3311DFCEF97 (MonoBehaviour_t4A60845CF505405AF8BE8C61CC07F75CADEF6429 * __this, const RuntimeMethod* method);
// !!0 UnityEngine.GameObject::AddComponent<NativeGalleryNamespace.NGMediaSaveCallbackiOS>()
inline NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_mCA927EF486B961DDF90EF5835D3275EA5CAC5BFA (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * __this, const RuntimeMethod* method)
{
	return ((  NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * (*) (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F *, const RuntimeMethod*))GameObject_AddComponent_TisRuntimeObject_m80EDFEAC4927F588A7A702F81524EDBFA8603FE2_gshared)(__this, method);
}
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C int32_t DEFAULT_CALL _NativeGallery_CheckPermission(int32_t, int32_t);
// System.Int32 NativeGallery::_NativeGallery_CheckPermission(System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_CheckPermission_mEFBFF9179DB9AEE59ACAE58B4017E185DC99901A (int32_t ___readPermission0, int32_t ___permissionFreeMode1, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) (int32_t, int32_t);

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_CheckPermission)(___readPermission0, ___permissionFreeMode1);

	return returnValue;
}
IL2CPP_EXTERN_C int32_t DEFAULT_CALL _NativeGallery_RequestPermission(int32_t, int32_t);
// System.Int32 NativeGallery::_NativeGallery_RequestPermission(System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_RequestPermission_m2EA30B3A1C054AE33C4CF089461AC0C09924AC0B (int32_t ___readPermission0, int32_t ___permissionFreeMode1, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) (int32_t, int32_t);

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_RequestPermission)(___readPermission0, ___permissionFreeMode1);

	return returnValue;
}
IL2CPP_EXTERN_C void DEFAULT_CALL _NativeGallery_ShowLimitedLibraryPicker();
// System.Void NativeGallery::_NativeGallery_ShowLimitedLibraryPicker()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_ShowLimitedLibraryPicker_m9EF5EB7300BD49F0B2B5567A9FE2BD0BF5F9D809 (const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_ShowLimitedLibraryPicker)();

}
IL2CPP_EXTERN_C int32_t DEFAULT_CALL _NativeGallery_CanOpenSettings();
// System.Int32 NativeGallery::_NativeGallery_CanOpenSettings()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_CanOpenSettings_m87481B92A27E8557F82EF70DDEE1F4F1474EBDF7 (const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_CanOpenSettings)();

	return returnValue;
}
IL2CPP_EXTERN_C void DEFAULT_CALL _NativeGallery_OpenSettings();
// System.Void NativeGallery::_NativeGallery_OpenSettings()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_OpenSettings_mAEDC55ADE8335C69F1FB1981EA1FF91D6710BAF7 (const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_OpenSettings)();

}
IL2CPP_EXTERN_C int32_t DEFAULT_CALL _NativeGallery_CanPickMultipleMedia();
// System.Int32 NativeGallery::_NativeGallery_CanPickMultipleMedia()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_CanPickMultipleMedia_m7482F92F8449F098C78D1D2CB5CE26740E05240F (const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_CanPickMultipleMedia)();

	return returnValue;
}
IL2CPP_EXTERN_C int32_t DEFAULT_CALL _NativeGallery_GetMediaTypeFromExtension(char*);
// System.Int32 NativeGallery::_NativeGallery_GetMediaTypeFromExtension(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery__NativeGallery_GetMediaTypeFromExtension_mB1772D19351F5B822C4FA29790E6A5E78C620EB5 (String_t* ___extension0, const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) (char*);

	// Marshaling of parameter '___extension0' to native representation
	char* ____extension0_marshaled = NULL;
	____extension0_marshaled = il2cpp_codegen_marshal_string(___extension0);

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_GetMediaTypeFromExtension)(____extension0_marshaled);

	// Marshaling cleanup of parameter '___extension0' native representation
	il2cpp_codegen_marshal_free(____extension0_marshaled);
	____extension0_marshaled = NULL;

	return returnValue;
}
IL2CPP_EXTERN_C void DEFAULT_CALL _NativeGallery_ImageWriteToAlbum(char*, char*, int32_t);
// System.Void NativeGallery::_NativeGallery_ImageWriteToAlbum(System.String,System.String,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_ImageWriteToAlbum_m68ECB25739DB47C8883C8BE97ACDCDC2EA9F8C8F (String_t* ___path0, String_t* ___album1, int32_t ___permissionFreeMode2, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) (char*, char*, int32_t);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___album1' to native representation
	char* ____album1_marshaled = NULL;
	____album1_marshaled = il2cpp_codegen_marshal_string(___album1);

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_ImageWriteToAlbum)(____path0_marshaled, ____album1_marshaled, ___permissionFreeMode2);

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___album1' native representation
	il2cpp_codegen_marshal_free(____album1_marshaled);
	____album1_marshaled = NULL;

}
IL2CPP_EXTERN_C void DEFAULT_CALL _NativeGallery_VideoWriteToAlbum(char*, char*, int32_t);
// System.Void NativeGallery::_NativeGallery_VideoWriteToAlbum(System.String,System.String,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_VideoWriteToAlbum_mE90E4AF81DCAC29B0AE6EC9BBE754CE6709CCE7D (String_t* ___path0, String_t* ___album1, int32_t ___permissionFreeMode2, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) (char*, char*, int32_t);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___album1' to native representation
	char* ____album1_marshaled = NULL;
	____album1_marshaled = il2cpp_codegen_marshal_string(___album1);

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_VideoWriteToAlbum)(____path0_marshaled, ____album1_marshaled, ___permissionFreeMode2);

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___album1' native representation
	il2cpp_codegen_marshal_free(____album1_marshaled);
	____album1_marshaled = NULL;

}
IL2CPP_EXTERN_C void DEFAULT_CALL _NativeGallery_PickMedia(char*, int32_t, int32_t, int32_t);
// System.Void NativeGallery::_NativeGallery_PickMedia(System.String,System.Int32,System.Int32,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__NativeGallery_PickMedia_m5241472884833F83137B5C3CFC6397556B732CDA (String_t* ___mediaSavePath0, int32_t ___mediaType1, int32_t ___permissionFreeMode2, int32_t ___selectionLimit3, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc) (char*, int32_t, int32_t, int32_t);

	// Marshaling of parameter '___mediaSavePath0' to native representation
	char* ____mediaSavePath0_marshaled = NULL;
	____mediaSavePath0_marshaled = il2cpp_codegen_marshal_string(___mediaSavePath0);

	// Native function invocation
	reinterpret_cast<PInvokeFunc>(_NativeGallery_PickMedia)(____mediaSavePath0_marshaled, ___mediaType1, ___permissionFreeMode2, ___selectionLimit3);

	// Marshaling cleanup of parameter '___mediaSavePath0' native representation
	il2cpp_codegen_marshal_free(____mediaSavePath0_marshaled);
	____mediaSavePath0_marshaled = NULL;

}
IL2CPP_EXTERN_C char* DEFAULT_CALL _NativeGallery_GetImageProperties(char*);
// System.String NativeGallery::_NativeGallery_GetImageProperties(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_GetImageProperties_m7208E7383AC627EEC8B87A63447B6B8261B22268 (String_t* ___path0, const RuntimeMethod* method)
{
	typedef char* (DEFAULT_CALL *PInvokeFunc) (char*);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Native function invocation
	char* returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_GetImageProperties)(____path0_marshaled);

	// Marshaling of return value back from native representation
	String_t* _returnValue_unmarshaled = NULL;
	_returnValue_unmarshaled = il2cpp_codegen_marshal_string_result(returnValue);

	// Marshaling cleanup of return value native representation
	il2cpp_codegen_marshal_free(returnValue);
	returnValue = NULL;

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	return _returnValue_unmarshaled;
}
IL2CPP_EXTERN_C char* DEFAULT_CALL _NativeGallery_GetVideoProperties(char*);
// System.String NativeGallery::_NativeGallery_GetVideoProperties(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_GetVideoProperties_m15490BBA47D7D480202BCF365228E91D891A5ECD (String_t* ___path0, const RuntimeMethod* method)
{
	typedef char* (DEFAULT_CALL *PInvokeFunc) (char*);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Native function invocation
	char* returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_GetVideoProperties)(____path0_marshaled);

	// Marshaling of return value back from native representation
	String_t* _returnValue_unmarshaled = NULL;
	_returnValue_unmarshaled = il2cpp_codegen_marshal_string_result(returnValue);

	// Marshaling cleanup of return value native representation
	il2cpp_codegen_marshal_free(returnValue);
	returnValue = NULL;

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	return _returnValue_unmarshaled;
}
IL2CPP_EXTERN_C char* DEFAULT_CALL _NativeGallery_GetVideoThumbnail(char*, char*, int32_t, double);
// System.String NativeGallery::_NativeGallery_GetVideoThumbnail(System.String,System.String,System.Int32,System.Double)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_GetVideoThumbnail_m67187C1103D261E9F52143D7E917CA97939A3A0B (String_t* ___path0, String_t* ___thumbnailSavePath1, int32_t ___maxSize2, double ___captureTimeInSeconds3, const RuntimeMethod* method)
{
	typedef char* (DEFAULT_CALL *PInvokeFunc) (char*, char*, int32_t, double);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___thumbnailSavePath1' to native representation
	char* ____thumbnailSavePath1_marshaled = NULL;
	____thumbnailSavePath1_marshaled = il2cpp_codegen_marshal_string(___thumbnailSavePath1);

	// Native function invocation
	char* returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_GetVideoThumbnail)(____path0_marshaled, ____thumbnailSavePath1_marshaled, ___maxSize2, ___captureTimeInSeconds3);

	// Marshaling of return value back from native representation
	String_t* _returnValue_unmarshaled = NULL;
	_returnValue_unmarshaled = il2cpp_codegen_marshal_string_result(returnValue);

	// Marshaling cleanup of return value native representation
	il2cpp_codegen_marshal_free(returnValue);
	returnValue = NULL;

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___thumbnailSavePath1' native representation
	il2cpp_codegen_marshal_free(____thumbnailSavePath1_marshaled);
	____thumbnailSavePath1_marshaled = NULL;

	return _returnValue_unmarshaled;
}
IL2CPP_EXTERN_C char* DEFAULT_CALL _NativeGallery_LoadImageAtPath(char*, char*, int32_t);
// System.String NativeGallery::_NativeGallery_LoadImageAtPath(System.String,System.String,System.Int32)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery__NativeGallery_LoadImageAtPath_mA0D2A6A62DC01256EF74FF5C236F6806BE3F8F2A (String_t* ___path0, String_t* ___temporaryFilePath1, int32_t ___maxSize2, const RuntimeMethod* method)
{
	typedef char* (DEFAULT_CALL *PInvokeFunc) (char*, char*, int32_t);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Marshaling of parameter '___temporaryFilePath1' to native representation
	char* ____temporaryFilePath1_marshaled = NULL;
	____temporaryFilePath1_marshaled = il2cpp_codegen_marshal_string(___temporaryFilePath1);

	// Native function invocation
	char* returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_LoadImageAtPath)(____path0_marshaled, ____temporaryFilePath1_marshaled, ___maxSize2);

	// Marshaling of return value back from native representation
	String_t* _returnValue_unmarshaled = NULL;
	_returnValue_unmarshaled = il2cpp_codegen_marshal_string_result(returnValue);

	// Marshaling cleanup of return value native representation
	il2cpp_codegen_marshal_free(returnValue);
	returnValue = NULL;

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

	// Marshaling cleanup of parameter '___temporaryFilePath1' native representation
	il2cpp_codegen_marshal_free(____temporaryFilePath1_marshaled);
	____temporaryFilePath1_marshaled = NULL;

	return _returnValue_unmarshaled;
}
// System.String NativeGallery::get_TemporaryImagePath()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery_get_TemporaryImagePath_m0C8232159D07C61BE9CF5A2275953E4F44DA5354 (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_get_TemporaryImagePath_m0C8232159D07C61BE9CF5A2275953E4F44DA5354_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( m_temporaryImagePath == null )
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_0 = ((NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var))->get_m_temporaryImagePath_0();
		if (L_0)
		{
			goto IL_0026;
		}
	}
	{
		// m_temporaryImagePath = Path.Combine( Application.temporaryCachePath, "tmpImg" );
		String_t* L_1 = Application_get_temporaryCachePath_m6769909A405A6A5A0477F8E5F312920C8115E50C(/*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_2 = Path_Combine_mA495A18104786EB450EC0E44EE0FB7F9040C4311(L_1, _stringLiteralA04667285B0D56FA5C9AD66F9249C0C461B42CCD, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		((NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var))->set_m_temporaryImagePath_0(L_2);
		// Directory.CreateDirectory( Application.temporaryCachePath );
		String_t* L_3 = Application_get_temporaryCachePath_m6769909A405A6A5A0477F8E5F312920C8115E50C(/*hidden argument*/NULL);
		Directory_CreateDirectory_m0C9CAA2ECA801C4D07EA35820DA0907402ED4D41(L_3, /*hidden argument*/NULL);
	}

IL_0026:
	{
		// return m_temporaryImagePath;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_4 = ((NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var))->get_m_temporaryImagePath_0();
		return L_4;
	}
}
// System.String NativeGallery::get_SelectedMediaPath()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery_get_SelectedMediaPath_m73539045C11D3F6340EFF65DDC5EAA7F67DECD2C (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_get_SelectedMediaPath_m73539045C11D3F6340EFF65DDC5EAA7F67DECD2C_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( m_selectedMediaPath == null )
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_0 = ((NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var))->get_m_selectedMediaPath_1();
		if (L_0)
		{
			goto IL_0026;
		}
	}
	{
		// m_selectedMediaPath = Path.Combine( Application.temporaryCachePath, "pickedMedia" );
		String_t* L_1 = Application_get_temporaryCachePath_m6769909A405A6A5A0477F8E5F312920C8115E50C(/*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_2 = Path_Combine_mA495A18104786EB450EC0E44EE0FB7F9040C4311(L_1, _stringLiteral680C002DD68BA7790878A280403262AF039049BE, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		((NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var))->set_m_selectedMediaPath_1(L_2);
		// Directory.CreateDirectory( Application.temporaryCachePath );
		String_t* L_3 = Application_get_temporaryCachePath_m6769909A405A6A5A0477F8E5F312920C8115E50C(/*hidden argument*/NULL);
		Directory_CreateDirectory_m0C9CAA2ECA801C4D07EA35820DA0907402ED4D41(L_3, /*hidden argument*/NULL);
	}

IL_0026:
	{
		// return m_selectedMediaPath;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_4 = ((NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_StaticFields*)il2cpp_codegen_static_fields_for(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var))->get_m_selectedMediaPath_1();
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::CheckPermission(NativeGallery/PermissionType)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_CheckPermission_m6CBB87E6602B4B6BEAACADBCFAEBA442C7EEC4DB (int32_t ___permissionType0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_CheckPermission_m6CBB87E6602B4B6BEAACADBCFAEBA442C7EEC4DB_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t V_0 = 0;
	int32_t G_B3_0 = 0;
	{
		// int result = _NativeGallery_CheckPermission( permissionType == PermissionType.Read ? 1 : 0, PermissionFreeMode ? 1 : 0 );
		int32_t L_0 = ___permissionType0;
		if (!L_0)
		{
			goto IL_0006;
		}
	}
	{
		G_B3_0 = 0;
		goto IL_0007;
	}

IL_0006:
	{
		G_B3_0 = 1;
	}

IL_0007:
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_1 = NativeGallery__NativeGallery_CheckPermission_mEFBFF9179DB9AEE59ACAE58B4017E185DC99901A(G_B3_0, 1, /*hidden argument*/NULL);
		V_0 = L_1;
		// return result == 3 ? Permission.Granted : (Permission) result;
		int32_t L_2 = V_0;
		if ((((int32_t)L_2) == ((int32_t)3)))
		{
			goto IL_0014;
		}
	}
	{
		int32_t L_3 = V_0;
		return (int32_t)(L_3);
	}

IL_0014:
	{
		return (int32_t)(1);
	}
}
// NativeGallery/Permission NativeGallery::RequestPermission(NativeGallery/PermissionType)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941 (int32_t ___permissionType0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t V_0 = 0;
	int32_t G_B3_0 = 0;
	{
		// int result = _NativeGallery_RequestPermission( permissionType == PermissionType.Read ? 1 : 0, PermissionFreeMode ? 1 : 0 );
		int32_t L_0 = ___permissionType0;
		if (!L_0)
		{
			goto IL_0006;
		}
	}
	{
		G_B3_0 = 0;
		goto IL_0007;
	}

IL_0006:
	{
		G_B3_0 = 1;
	}

IL_0007:
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_1 = NativeGallery__NativeGallery_RequestPermission_m2EA30B3A1C054AE33C4CF089461AC0C09924AC0B(G_B3_0, 1, /*hidden argument*/NULL);
		V_0 = L_1;
		// return result == 3 ? Permission.Granted : (Permission) result;
		int32_t L_2 = V_0;
		if ((((int32_t)L_2) == ((int32_t)3)))
		{
			goto IL_0014;
		}
	}
	{
		int32_t L_3 = V_0;
		return (int32_t)(L_3);
	}

IL_0014:
	{
		return (int32_t)(1);
	}
}
// System.Void NativeGallery::TryExtendLimitedAccessPermission()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery_TryExtendLimitedAccessPermission_m0D1D92FB05B5C85A8AD0F96031B630C4D834B9CD (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_TryExtendLimitedAccessPermission_m0D1D92FB05B5C85A8AD0F96031B630C4D834B9CD_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( IsMediaPickerBusy() )
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		bool L_0 = NativeGallery_IsMediaPickerBusy_m6FCFB28A795C6015E5F1B51B00FDFDBE22E9CC45(/*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_0008;
		}
	}
	{
		// return;
		return;
	}

IL_0008:
	{
		// _NativeGallery_ShowLimitedLibraryPicker();
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_ShowLimitedLibraryPicker_m9EF5EB7300BD49F0B2B5567A9FE2BD0BF5F9D809(/*hidden argument*/NULL);
		// }
		return;
	}
}
// System.Boolean NativeGallery::CanOpenSettings()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NativeGallery_CanOpenSettings_m847639237A4E11935794EAE99D287AB837EC1BCA (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_CanOpenSettings_m847639237A4E11935794EAE99D287AB837EC1BCA_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return _NativeGallery_CanOpenSettings() == 1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery__NativeGallery_CanOpenSettings_m87481B92A27E8557F82EF70DDEE1F4F1474EBDF7(/*hidden argument*/NULL);
		return (bool)((((int32_t)L_0) == ((int32_t)1))? 1 : 0);
	}
}
// System.Void NativeGallery::OpenSettings()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery_OpenSettings_mAD76D7597380F0E0E5A7610CB9E13BE06237C38C (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_OpenSettings_mAD76D7597380F0E0E5A7610CB9E13BE06237C38C_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// _NativeGallery_OpenSettings();
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_OpenSettings_mAEDC55ADE8335C69F1FB1981EA1FF91D6710BAF7(/*hidden argument*/NULL);
		// }
		return;
	}
}
// NativeGallery/Permission NativeGallery::SaveImageToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveImageToGallery_m7E8E411A26713ABB577D2D7968EB77E4900D38CF (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___mediaBytes0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveImageToGallery_m7E8E411A26713ABB577D2D7968EB77E4900D38CF_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return SaveToGallery( mediaBytes, album, filename, MediaType.Image, callback );
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_0 = ___mediaBytes0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B(L_0, L_1, L_2, 1, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveImageToGallery(System.String,System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveImageToGallery_m2E70C422B2B25697A9DD2EDC296108098D8B3881 (String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveImageToGallery_m2E70C422B2B25697A9DD2EDC296108098D8B3881_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return SaveToGallery( existingMediaPath, album, filename, MediaType.Image, callback );
		String_t* L_0 = ___existingMediaPath0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F(L_0, L_1, L_2, 1, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveImageToGallery(UnityEngine.Texture2D,System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveImageToGallery_m728A6EF9F87538011C5F6A354B63A6785CAAD827 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___image0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveImageToGallery_m728A6EF9F87538011C5F6A354B63A6785CAAD827_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( image == null )
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_0 = ___image0;
		IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
		bool L_1 = Object_op_Equality_mBC2401774F3BE33E8CF6F0A8148E66C95D6CFF1C(L_0, (Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0014;
		}
	}
	{
		// throw new ArgumentException( "Parameter 'image' is null!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_2 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_2, _stringLiteral4CCBEFEEDADEDC4ABB85D0C8ADEF1A3BD2CF85B7, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_2, NativeGallery_SaveImageToGallery_m728A6EF9F87538011C5F6A354B63A6785CAAD827_RuntimeMethod_var);
	}

IL_0014:
	{
		// if( filename.EndsWith( ".jpeg", StringComparison.OrdinalIgnoreCase ) || filename.EndsWith( ".jpg", StringComparison.OrdinalIgnoreCase ) )
		String_t* L_3 = ___filename2;
		NullCheck(L_3);
		bool L_4 = String_EndsWith_m80B198568050D692B70AD8949AC6EDC3044ED811(L_3, _stringLiteral801DC5C3610D303D73C37E27B3D6F5AC9F7661DC, 5, /*hidden argument*/NULL);
		if (L_4)
		{
			goto IL_0030;
		}
	}
	{
		String_t* L_5 = ___filename2;
		NullCheck(L_5);
		bool L_6 = String_EndsWith_m80B198568050D692B70AD8949AC6EDC3044ED811(L_5, _stringLiteralDCDFD41CB6E96E78736DEB5F5ADD6F6311DA8E80, 5, /*hidden argument*/NULL);
		if (!L_6)
		{
			goto IL_0041;
		}
	}

IL_0030:
	{
		// return SaveToGallery( GetTextureBytes( image, true ), album, filename, MediaType.Image, callback );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_7 = ___image0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_8 = NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169(L_7, (bool)1, /*hidden argument*/NULL);
		String_t* L_9 = ___album1;
		String_t* L_10 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_11 = ___callback3;
		int32_t L_12 = NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B(L_8, L_9, L_10, 1, L_11, /*hidden argument*/NULL);
		return L_12;
	}

IL_0041:
	{
		// else if( filename.EndsWith( ".png", StringComparison.OrdinalIgnoreCase ) )
		String_t* L_13 = ___filename2;
		NullCheck(L_13);
		bool L_14 = String_EndsWith_m80B198568050D692B70AD8949AC6EDC3044ED811(L_13, _stringLiteral339F5868588CFC8FDA4A1EC94EAD8F737C5FCFC0, 5, /*hidden argument*/NULL);
		if (!L_14)
		{
			goto IL_0060;
		}
	}
	{
		// return SaveToGallery( GetTextureBytes( image, false ), album, filename, MediaType.Image, callback );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_15 = ___image0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_16 = NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169(L_15, (bool)0, /*hidden argument*/NULL);
		String_t* L_17 = ___album1;
		String_t* L_18 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_19 = ___callback3;
		int32_t L_20 = NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B(L_16, L_17, L_18, 1, L_19, /*hidden argument*/NULL);
		return L_20;
	}

IL_0060:
	{
		// return SaveToGallery( GetTextureBytes( image, false ), album, filename + ".png", MediaType.Image, callback );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_21 = ___image0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_22 = NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169(L_21, (bool)0, /*hidden argument*/NULL);
		String_t* L_23 = ___album1;
		String_t* L_24 = ___filename2;
		String_t* L_25 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(L_24, _stringLiteral339F5868588CFC8FDA4A1EC94EAD8F737C5FCFC0, /*hidden argument*/NULL);
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_26 = ___callback3;
		int32_t L_27 = NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B(L_22, L_23, L_25, 1, L_26, /*hidden argument*/NULL);
		return L_27;
	}
}
// NativeGallery/Permission NativeGallery::SaveVideoToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveVideoToGallery_mAC3763642892EFF5D73850E6BFC6D68419C1C2D1 (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___mediaBytes0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveVideoToGallery_mAC3763642892EFF5D73850E6BFC6D68419C1C2D1_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return SaveToGallery( mediaBytes, album, filename, MediaType.Video, callback );
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_0 = ___mediaBytes0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B(L_0, L_1, L_2, 2, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveVideoToGallery(System.String,System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveVideoToGallery_mBD422A019323B67BCB1D5B0753B4C839946072F9 (String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveVideoToGallery_mBD422A019323B67BCB1D5B0753B4C839946072F9_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return SaveToGallery( existingMediaPath, album, filename, MediaType.Video, callback );
		String_t* L_0 = ___existingMediaPath0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F(L_0, L_1, L_2, 2, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveAudioToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveAudioToGallery_m4D83A61947AF42B6241C79B033AB64DF853E41B8 (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___mediaBytes0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveAudioToGallery_m4D83A61947AF42B6241C79B033AB64DF853E41B8_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return SaveToGallery( mediaBytes, album, filename, MediaType.Audio, callback );
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_0 = ___mediaBytes0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B(L_0, L_1, L_2, 4, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// NativeGallery/Permission NativeGallery::SaveAudioToGallery(System.String,System.String,System.String,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveAudioToGallery_m74CDC661A74D900A6FF2CB2A89A7CF689F431242 (String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filename2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveAudioToGallery_m74CDC661A74D900A6FF2CB2A89A7CF689F431242_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return SaveToGallery( existingMediaPath, album, filename, MediaType.Audio, callback );
		String_t* L_0 = ___existingMediaPath0;
		String_t* L_1 = ___album1;
		String_t* L_2 = ___filename2;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_3 = ___callback3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_4 = NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F(L_0, L_1, L_2, 4, L_3, /*hidden argument*/NULL);
		return L_4;
	}
}
// System.Boolean NativeGallery::CanSelectMultipleFilesFromGallery()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NativeGallery_CanSelectMultipleFilesFromGallery_m0693426E1BE05221AEB29DB7E501488657554C58 (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_CanSelectMultipleFilesFromGallery_m0693426E1BE05221AEB29DB7E501488657554C58_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return _NativeGallery_CanPickMultipleMedia() == 1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery__NativeGallery_CanPickMultipleMedia_m7482F92F8449F098C78D1D2CB5CE26740E05240F(/*hidden argument*/NULL);
		return (bool)((((int32_t)L_0) == ((int32_t)1))? 1 : 0);
	}
}
// System.Boolean NativeGallery::CanSelectMultipleMediaTypesFromGallery()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NativeGallery_CanSelectMultipleMediaTypesFromGallery_m44F7254E9EA9FAD4C4D143DF10B8938B6CBD04F6 (const RuntimeMethod* method)
{
	{
		// return true;
		return (bool)1;
	}
}
// NativeGallery/Permission NativeGallery::GetImageFromGallery(NativeGallery/MediaPickCallback,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetImageFromGallery_mD6435483D1565EB83325A2FE7F9A162D8B8745B1 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetImageFromGallery_mD6435483D1565EB83325A2FE7F9A162D8B8745B1_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMediaFromGallery( callback, MediaType.Image, mime, title );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0(L_0, 1, L_1, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetVideoFromGallery(NativeGallery/MediaPickCallback,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetVideoFromGallery_mF01FF3520FAFD799864DB03E4D02AAB4FF3BA379 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetVideoFromGallery_mF01FF3520FAFD799864DB03E4D02AAB4FF3BA379_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMediaFromGallery( callback, MediaType.Video, mime, title );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0(L_0, 2, L_1, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetAudioFromGallery(NativeGallery/MediaPickCallback,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetAudioFromGallery_mA6BEF99F6634B9FA74AD00C5CABDE1D60026B994 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetAudioFromGallery_mA6BEF99F6634B9FA74AD00C5CABDE1D60026B994_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMediaFromGallery( callback, MediaType.Audio, mime, title );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0(L_0, 4, L_1, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetMixedMediaFromGallery(NativeGallery/MediaPickCallback,NativeGallery/MediaType,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMixedMediaFromGallery_m583F8C1E2148E4CAA21076BCB7DD6E3262B7E14A (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, int32_t ___mediaTypes1, String_t* ___title2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMixedMediaFromGallery_m583F8C1E2148E4CAA21076BCB7DD6E3262B7E14A_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMediaFromGallery( callback, mediaTypes, "*/*", title );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_0 = ___callback0;
		int32_t L_1 = ___mediaTypes1;
		String_t* L_2 = ___title2;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0(L_0, L_1, _stringLiteralFACB855C9CEF68CF9733F539BDE2B57586848293, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetImagesFromGallery(NativeGallery/MediaPickMultipleCallback,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetImagesFromGallery_mF48712C89BA085E981A4668C86008D338642096F (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetImagesFromGallery_mF48712C89BA085E981A4668C86008D338642096F_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMultipleMediaFromGallery( callback, MediaType.Image, mime, title );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5(L_0, 1, L_1, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetVideosFromGallery(NativeGallery/MediaPickMultipleCallback,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetVideosFromGallery_mC935A98C580F5B011F473115BCD0E9FBF1F01B9D (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetVideosFromGallery_mC935A98C580F5B011F473115BCD0E9FBF1F01B9D_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMultipleMediaFromGallery( callback, MediaType.Video, mime, title );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5(L_0, 2, L_1, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetAudiosFromGallery(NativeGallery/MediaPickMultipleCallback,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetAudiosFromGallery_mEEB9C527F473A66657CD3485F7E27287FD1124F8 (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callback0, String_t* ___title1, String_t* ___mime2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetAudiosFromGallery_mEEB9C527F473A66657CD3485F7E27287FD1124F8_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMultipleMediaFromGallery( callback, MediaType.Audio, mime, title );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_0 = ___callback0;
		String_t* L_1 = ___mime2;
		String_t* L_2 = ___title1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5(L_0, 4, L_1, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// NativeGallery/Permission NativeGallery::GetMixedMediasFromGallery(NativeGallery/MediaPickMultipleCallback,NativeGallery/MediaType,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMixedMediasFromGallery_m32F32D2150DD12E664B437066D6F2F5ACFAEEC81 (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callback0, int32_t ___mediaTypes1, String_t* ___title2, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMixedMediasFromGallery_m32F32D2150DD12E664B437066D6F2F5ACFAEEC81_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// return GetMultipleMediaFromGallery( callback, mediaTypes, "*/*", title );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_0 = ___callback0;
		int32_t L_1 = ___mediaTypes1;
		String_t* L_2 = ___title2;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_3 = NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5(L_0, L_1, _stringLiteralFACB855C9CEF68CF9733F539BDE2B57586848293, L_2, /*hidden argument*/NULL);
		return L_3;
	}
}
// System.Boolean NativeGallery::IsMediaPickerBusy()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NativeGallery_IsMediaPickerBusy_m6FCFB28A795C6015E5F1B51B00FDFDBE22E9CC45 (const RuntimeMethod* method)
{
	{
		// return NGMediaReceiveCallbackiOS.IsBusy;
		bool L_0 = NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_inline(/*hidden argument*/NULL);
		return L_0;
	}
}
// NativeGallery/MediaType NativeGallery::GetMediaTypeOfFile(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMediaTypeOfFile_mF7A9CA2D534917B15EF249627420E71D48365B57 (String_t* ___path0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMediaTypeOfFile_mF7A9CA2D534917B15EF249627420E71D48365B57_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	{
		// if( string.IsNullOrEmpty( path ) )
		String_t* L_0 = ___path0;
		bool L_1 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_0, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_000a;
		}
	}
	{
		// return (MediaType) 0;
		return (int32_t)(0);
	}

IL_000a:
	{
		// string extension = Path.GetExtension( path );
		String_t* L_2 = ___path0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_3 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_2, /*hidden argument*/NULL);
		V_0 = L_3;
		// if( string.IsNullOrEmpty( extension ) )
		String_t* L_4 = V_0;
		bool L_5 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_4, /*hidden argument*/NULL);
		if (!L_5)
		{
			goto IL_001b;
		}
	}
	{
		// return (MediaType) 0;
		return (int32_t)(0);
	}

IL_001b:
	{
		// if( extension[0] == '.' )
		String_t* L_6 = V_0;
		NullCheck(L_6);
		Il2CppChar L_7 = String_get_Chars_m14308AC3B95F8C1D9F1D1055B116B37D595F1D96(L_6, 0, /*hidden argument*/NULL);
		if ((!(((uint32_t)L_7) == ((uint32_t)((int32_t)46)))))
		{
			goto IL_0039;
		}
	}
	{
		// if( extension.Length == 1 )
		String_t* L_8 = V_0;
		NullCheck(L_8);
		int32_t L_9 = String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline(L_8, /*hidden argument*/NULL);
		if ((!(((uint32_t)L_9) == ((uint32_t)1))))
		{
			goto IL_0031;
		}
	}
	{
		// return (MediaType) 0;
		return (int32_t)(0);
	}

IL_0031:
	{
		// extension = extension.Substring( 1 );
		String_t* L_10 = V_0;
		NullCheck(L_10);
		String_t* L_11 = String_Substring_m2C4AFF5E79DD8BADFD2DFBCF156BF728FBB8E1AE(L_10, 1, /*hidden argument*/NULL);
		V_0 = L_11;
	}

IL_0039:
	{
		// return (MediaType) _NativeGallery_GetMediaTypeFromExtension( extension.ToLowerInvariant() );
		String_t* L_12 = V_0;
		NullCheck(L_12);
		String_t* L_13 = String_ToLowerInvariant_m197BD65B6582DC546FF1BC398161EEFA708F799E(L_12, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_14 = NativeGallery__NativeGallery_GetMediaTypeFromExtension_mB1772D19351F5B822C4FA29790E6A5E78C620EB5(L_13, /*hidden argument*/NULL);
		return (int32_t)(L_14);
	}
}
// NativeGallery/Permission NativeGallery::SaveToGallery(System.Byte[],System.String,System.String,NativeGallery/MediaType,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* ___mediaBytes0, String_t* ___album1, String_t* ___filename2, int32_t ___mediaType3, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t G_B13_0 = 0;
	int32_t G_B1_0 = 0;
	int32_t G_B3_0 = 0;
	int32_t G_B2_0 = 0;
	int32_t G_B4_0 = 0;
	int32_t G_B6_0 = 0;
	int32_t G_B5_0 = 0;
	int32_t G_B7_0 = 0;
	int32_t G_B9_0 = 0;
	int32_t G_B8_0 = 0;
	int32_t G_B10_0 = 0;
	int32_t G_B12_0 = 0;
	int32_t G_B11_0 = 0;
	{
		// Permission result = RequestPermission( PermissionType.Write );
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941(1, /*hidden argument*/NULL);
		// if( result == Permission.Granted )
		int32_t L_1 = L_0;
		G_B1_0 = L_1;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			G_B13_0 = L_1;
			goto IL_0075;
		}
	}
	{
		// if( mediaBytes == null || mediaBytes.Length == 0 )
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_2 = ___mediaBytes0;
		G_B2_0 = G_B1_0;
		if (!L_2)
		{
			G_B3_0 = G_B1_0;
			goto IL_0011;
		}
	}
	{
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_3 = ___mediaBytes0;
		NullCheck(L_3);
		G_B3_0 = G_B2_0;
		if ((((RuntimeArray*)L_3)->max_length))
		{
			G_B4_0 = G_B2_0;
			goto IL_001c;
		}
	}

IL_0011:
	{
		// throw new ArgumentException( "Parameter 'mediaBytes' is null or empty!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_4 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_4, _stringLiteral9396C555ED6F4114FE93CC622496F6970B922A31, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_4, NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B_RuntimeMethod_var);
	}

IL_001c:
	{
		// if( album == null || album.Length == 0 )
		String_t* L_5 = ___album1;
		G_B5_0 = G_B4_0;
		if (!L_5)
		{
			G_B6_0 = G_B4_0;
			goto IL_0027;
		}
	}
	{
		String_t* L_6 = ___album1;
		NullCheck(L_6);
		int32_t L_7 = String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline(L_6, /*hidden argument*/NULL);
		G_B6_0 = G_B5_0;
		if (L_7)
		{
			G_B7_0 = G_B5_0;
			goto IL_0032;
		}
	}

IL_0027:
	{
		// throw new ArgumentException( "Parameter 'album' is null or empty!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_8 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_8, _stringLiteralE16425C70B0BF8A4323B323DF6C309092ED0409B, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_8, NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B_RuntimeMethod_var);
	}

IL_0032:
	{
		// if( filename == null || filename.Length == 0 )
		String_t* L_9 = ___filename2;
		G_B8_0 = G_B7_0;
		if (!L_9)
		{
			G_B9_0 = G_B7_0;
			goto IL_003d;
		}
	}
	{
		String_t* L_10 = ___filename2;
		NullCheck(L_10);
		int32_t L_11 = String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline(L_10, /*hidden argument*/NULL);
		G_B9_0 = G_B8_0;
		if (L_11)
		{
			G_B10_0 = G_B8_0;
			goto IL_0048;
		}
	}

IL_003d:
	{
		// throw new ArgumentException( "Parameter 'filename' is null or empty!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_12 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_12, _stringLiteral94D6A6A95D604C88AC795D66235A6C9EDF2D412B, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_12, NativeGallery_SaveToGallery_m0196C4DDE362FF9540CDC1198FB24E772CC72E2B_RuntimeMethod_var);
	}

IL_0048:
	{
		// if( string.IsNullOrEmpty( Path.GetExtension( filename ) ) )
		String_t* L_13 = ___filename2;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_14 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_13, /*hidden argument*/NULL);
		bool L_15 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_14, /*hidden argument*/NULL);
		G_B11_0 = G_B10_0;
		if (!L_15)
		{
			G_B12_0 = G_B10_0;
			goto IL_005f;
		}
	}
	{
		// Debug.LogWarning( "'filename' doesn't have an extension, this might result in unexpected behaviour!" );
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_LogWarning_m37338644DC81F640CCDFEAE35A223F0E965F0568(_stringLiteralC68C6D5E83DA7C25F2861D5D19720D87BB3436B4, /*hidden argument*/NULL);
		G_B12_0 = G_B11_0;
	}

IL_005f:
	{
		// string path = GetTemporarySavePath( filename );
		String_t* L_16 = ___filename2;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_17 = NativeGallery_GetTemporarySavePath_m351D4BFF627FA6826F36DA27EFEF5A5B79ECB0D9(L_16, /*hidden argument*/NULL);
		// File.WriteAllBytes( path, mediaBytes );
		String_t* L_18 = L_17;
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_19 = ___mediaBytes0;
		File_WriteAllBytes_m07F13C1CA0BD0960392C78AB99E0F19564F9B594(L_18, L_19, /*hidden argument*/NULL);
		// SaveToGalleryInternal( path, album, mediaType, callback );
		String_t* L_20 = ___album1;
		int32_t L_21 = ___mediaType3;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_22 = ___callback4;
		NativeGallery_SaveToGalleryInternal_m0588F4885ED6F5590276A2CE811C19366734B185(L_18, L_20, L_21, L_22, /*hidden argument*/NULL);
		G_B13_0 = G_B12_0;
	}

IL_0075:
	{
		// return result;
		return G_B13_0;
	}
}
// NativeGallery/Permission NativeGallery::SaveToGallery(System.String,System.String,System.String,NativeGallery/MediaType,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F (String_t* ___existingMediaPath0, String_t* ___album1, String_t* ___filename2, int32_t ___mediaType3, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	String_t* V_1 = NULL;
	int32_t G_B14_0 = 0;
	int32_t G_B1_0 = 0;
	int32_t G_B3_0 = 0;
	int32_t G_B2_0 = 0;
	int32_t G_B5_0 = 0;
	int32_t G_B4_0 = 0;
	int32_t G_B6_0 = 0;
	int32_t G_B8_0 = 0;
	int32_t G_B7_0 = 0;
	int32_t G_B9_0 = 0;
	int32_t G_B13_0 = 0;
	int32_t G_B10_0 = 0;
	int32_t G_B12_0 = 0;
	int32_t G_B11_0 = 0;
	{
		// Permission result = RequestPermission( PermissionType.Write );
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941(1, /*hidden argument*/NULL);
		// if( result == Permission.Granted )
		int32_t L_1 = L_0;
		G_B1_0 = L_1;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			G_B14_0 = L_1;
			goto IL_009c;
		}
	}
	{
		// if( !File.Exists( existingMediaPath ) )
		String_t* L_2 = ___existingMediaPath0;
		bool L_3 = File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB(L_2, /*hidden argument*/NULL);
		G_B2_0 = G_B1_0;
		if (L_3)
		{
			G_B3_0 = G_B1_0;
			goto IL_0026;
		}
	}
	{
		// throw new FileNotFoundException( "File not found at " + existingMediaPath );
		String_t* L_4 = ___existingMediaPath0;
		String_t* L_5 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(_stringLiteral0A3CF76AA4D046F4E79CDE3341E93210C22D0D9E, L_4, /*hidden argument*/NULL);
		FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 * L_6 = (FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 *)il2cpp_codegen_object_new(FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_mA72DAA77008E903BC162A8D32FDE7F874B27E858(L_6, L_5, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_6, NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F_RuntimeMethod_var);
	}

IL_0026:
	{
		// if( album == null || album.Length == 0 )
		String_t* L_7 = ___album1;
		G_B4_0 = G_B3_0;
		if (!L_7)
		{
			G_B5_0 = G_B3_0;
			goto IL_0031;
		}
	}
	{
		String_t* L_8 = ___album1;
		NullCheck(L_8);
		int32_t L_9 = String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline(L_8, /*hidden argument*/NULL);
		G_B5_0 = G_B4_0;
		if (L_9)
		{
			G_B6_0 = G_B4_0;
			goto IL_003c;
		}
	}

IL_0031:
	{
		// throw new ArgumentException( "Parameter 'album' is null or empty!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_10 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_10, _stringLiteralE16425C70B0BF8A4323B323DF6C309092ED0409B, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_10, NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F_RuntimeMethod_var);
	}

IL_003c:
	{
		// if( filename == null || filename.Length == 0 )
		String_t* L_11 = ___filename2;
		G_B7_0 = G_B6_0;
		if (!L_11)
		{
			G_B8_0 = G_B6_0;
			goto IL_0047;
		}
	}
	{
		String_t* L_12 = ___filename2;
		NullCheck(L_12);
		int32_t L_13 = String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline(L_12, /*hidden argument*/NULL);
		G_B8_0 = G_B7_0;
		if (L_13)
		{
			G_B9_0 = G_B7_0;
			goto IL_0052;
		}
	}

IL_0047:
	{
		// throw new ArgumentException( "Parameter 'filename' is null or empty!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_14 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_14, _stringLiteral94D6A6A95D604C88AC795D66235A6C9EDF2D412B, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_14, NativeGallery_SaveToGallery_mCA157C2004B066C238FB2C87649FB4F9DFD8268F_RuntimeMethod_var);
	}

IL_0052:
	{
		// if( string.IsNullOrEmpty( Path.GetExtension( filename ) ) )
		String_t* L_15 = ___filename2;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_16 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_15, /*hidden argument*/NULL);
		bool L_17 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_16, /*hidden argument*/NULL);
		G_B10_0 = G_B9_0;
		if (!L_17)
		{
			G_B13_0 = G_B9_0;
			goto IL_0083;
		}
	}
	{
		// string originalExtension = Path.GetExtension( existingMediaPath );
		String_t* L_18 = ___existingMediaPath0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_19 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_18, /*hidden argument*/NULL);
		V_1 = L_19;
		// if( string.IsNullOrEmpty( originalExtension ) )
		String_t* L_20 = V_1;
		bool L_21 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_20, /*hidden argument*/NULL);
		G_B11_0 = G_B10_0;
		if (!L_21)
		{
			G_B12_0 = G_B10_0;
			goto IL_007a;
		}
	}
	{
		// Debug.LogWarning( "'filename' doesn't have an extension, this might result in unexpected behaviour!" );
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_LogWarning_m37338644DC81F640CCDFEAE35A223F0E965F0568(_stringLiteralC68C6D5E83DA7C25F2861D5D19720D87BB3436B4, /*hidden argument*/NULL);
		G_B13_0 = G_B11_0;
		goto IL_0083;
	}

IL_007a:
	{
		// filename += originalExtension;
		String_t* L_22 = ___filename2;
		String_t* L_23 = V_1;
		String_t* L_24 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(L_22, L_23, /*hidden argument*/NULL);
		___filename2 = L_24;
		G_B13_0 = G_B12_0;
	}

IL_0083:
	{
		// string path = GetTemporarySavePath( filename );
		String_t* L_25 = ___filename2;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_26 = NativeGallery_GetTemporarySavePath_m351D4BFF627FA6826F36DA27EFEF5A5B79ECB0D9(L_25, /*hidden argument*/NULL);
		V_0 = L_26;
		// File.Copy( existingMediaPath, path, true );
		String_t* L_27 = ___existingMediaPath0;
		String_t* L_28 = V_0;
		File_Copy_m42EEC6C53F171AD23C837EAD48905F11D94C04BF(L_27, L_28, (bool)1, /*hidden argument*/NULL);
		// SaveToGalleryInternal( path, album, mediaType, callback );
		String_t* L_29 = V_0;
		String_t* L_30 = ___album1;
		int32_t L_31 = ___mediaType3;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_32 = ___callback4;
		NativeGallery_SaveToGalleryInternal_m0588F4885ED6F5590276A2CE811C19366734B185(L_29, L_30, L_31, L_32, /*hidden argument*/NULL);
		G_B14_0 = G_B13_0;
	}

IL_009c:
	{
		// return result;
		return G_B14_0;
	}
}
// System.Void NativeGallery::SaveToGalleryInternal(System.String,System.String,NativeGallery/MediaType,NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery_SaveToGalleryInternal_m0588F4885ED6F5590276A2CE811C19366734B185 (String_t* ___path0, String_t* ___album1, int32_t ___mediaType2, MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_SaveToGalleryInternal_m0588F4885ED6F5590276A2CE811C19366734B185_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( mediaType == MediaType.Audio )
		int32_t L_0 = ___mediaType2;
		if ((!(((uint32_t)L_0) == ((uint32_t)4))))
		{
			goto IL_001a;
		}
	}
	{
		// Debug.LogError( "Saving audio files is not supported on iOS" );
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_LogError_m3BCF9B78263152261565DCA9DB7D55F0C391ED29(_stringLiteralFA339DE2EA366B99856105DBEB37AD37EDB2629C, /*hidden argument*/NULL);
		// if( callback != null )
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_1 = ___callback3;
		if (!L_1)
		{
			goto IL_0019;
		}
	}
	{
		// callback( false, null );
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_2 = ___callback3;
		NullCheck(L_2);
		MediaSaveCallback_Invoke_m3999037DB5B5D6616E750064620751D8DB2A281F(L_2, (bool)0, (String_t*)NULL, /*hidden argument*/NULL);
	}

IL_0019:
	{
		// return;
		return;
	}

IL_001a:
	{
		// Debug.Log( "Saving to Pictures: " + Path.GetFileName( path ) );
		String_t* L_3 = ___path0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_4 = Path_GetFileName_m2307E8E0B250632002840D9EC27DBABE9C4EB85E(L_3, /*hidden argument*/NULL);
		String_t* L_5 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(_stringLiteralDEA5175F6A97B90A17B319CCE2F424AB43E28258, L_4, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_Log_m4B7C70BAFD477C6BDB59C88A0934F0B018D03708(L_5, /*hidden argument*/NULL);
		// NGMediaSaveCallbackiOS.Initialize( callback );
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_6 = ___callback3;
		NGMediaSaveCallbackiOS_Initialize_m53B8975819EF4C0612C5B00C3B03C496B1AE6464(L_6, /*hidden argument*/NULL);
		// if( mediaType == MediaType.Image )
		int32_t L_7 = ___mediaType2;
		if ((!(((uint32_t)L_7) == ((uint32_t)1))))
		{
			goto IL_0042;
		}
	}
	{
		// _NativeGallery_ImageWriteToAlbum( path, album, PermissionFreeMode ? 1 : 0 );
		String_t* L_8 = ___path0;
		String_t* L_9 = ___album1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_ImageWriteToAlbum_m68ECB25739DB47C8883C8BE97ACDCDC2EA9F8C8F(L_8, L_9, 1, /*hidden argument*/NULL);
		return;
	}

IL_0042:
	{
		// else if( mediaType == MediaType.Video )
		int32_t L_10 = ___mediaType2;
		if ((!(((uint32_t)L_10) == ((uint32_t)2))))
		{
			goto IL_004e;
		}
	}
	{
		// _NativeGallery_VideoWriteToAlbum( path, album, PermissionFreeMode ? 1 : 0 );
		String_t* L_11 = ___path0;
		String_t* L_12 = ___album1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		NativeGallery__NativeGallery_VideoWriteToAlbum_mE90E4AF81DCAC29B0AE6EC9BBE754CE6709CCE7D(L_11, L_12, 1, /*hidden argument*/NULL);
	}

IL_004e:
	{
		// }
		return;
	}
}
// System.String NativeGallery::GetTemporarySavePath(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR String_t* NativeGallery_GetTemporarySavePath_m351D4BFF627FA6826F36DA27EFEF5A5B79ECB0D9 (String_t* ___filename0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetTemporarySavePath_m351D4BFF627FA6826F36DA27EFEF5A5B79ECB0D9_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	String_t* V_1 = NULL;
	int32_t V_2 = 0;
	String_t* V_3 = NULL;
	String_t* V_4 = NULL;
	{
		// string saveDir = Path.Combine( Application.persistentDataPath, "NGallery" );
		String_t* L_0 = Application_get_persistentDataPath_m82E34156D8BD0A55CAC258CDFE8317FAD6945F5B(/*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_1 = Path_Combine_mA495A18104786EB450EC0E44EE0FB7F9040C4311(L_0, _stringLiteralE35B1258A7DF335EB03C6AFAF41FE620F875441F, /*hidden argument*/NULL);
		V_0 = L_1;
		// Directory.CreateDirectory( saveDir );
		String_t* L_2 = V_0;
		Directory_CreateDirectory_m0C9CAA2ECA801C4D07EA35820DA0907402ED4D41(L_2, /*hidden argument*/NULL);
		// string path = Path.Combine( saveDir, filename );
		String_t* L_3 = V_0;
		String_t* L_4 = ___filename0;
		String_t* L_5 = Path_Combine_mA495A18104786EB450EC0E44EE0FB7F9040C4311(L_3, L_4, /*hidden argument*/NULL);
		V_1 = L_5;
		// if( File.Exists( path ) )
		String_t* L_6 = V_1;
		bool L_7 = File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB(L_6, /*hidden argument*/NULL);
		if (!L_7)
		{
			goto IL_0059;
		}
	}
	{
		// int fileIndex = 0;
		V_2 = 0;
		// string filenameWithoutExtension = Path.GetFileNameWithoutExtension( filename );
		String_t* L_8 = ___filename0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_9 = Path_GetFileNameWithoutExtension_m90A3C4CEB8936011D1A392BB7E98991482E0C198(L_8, /*hidden argument*/NULL);
		V_3 = L_9;
		// string extension = Path.GetExtension( filename );
		String_t* L_10 = ___filename0;
		String_t* L_11 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_10, /*hidden argument*/NULL);
		V_4 = L_11;
	}

IL_0038:
	{
		// path = Path.Combine( saveDir, string.Concat( filenameWithoutExtension, ++fileIndex, extension ) );
		String_t* L_12 = V_0;
		String_t* L_13 = V_3;
		int32_t L_14 = V_2;
		int32_t L_15 = ((int32_t)il2cpp_codegen_add((int32_t)L_14, (int32_t)1));
		V_2 = L_15;
		int32_t L_16 = L_15;
		RuntimeObject * L_17 = Box(Int32_t585191389E07734F19F3156FF88FB3EF4800D102_il2cpp_TypeInfo_var, &L_16);
		String_t* L_18 = V_4;
		String_t* L_19 = String_Concat_m2E1F71C491D2429CC80A28745488FEA947BB7AAC(L_13, L_17, L_18, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_20 = Path_Combine_mA495A18104786EB450EC0E44EE0FB7F9040C4311(L_12, L_19, /*hidden argument*/NULL);
		V_1 = L_20;
		// } while( File.Exists( path ) );
		String_t* L_21 = V_1;
		bool L_22 = File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB(L_21, /*hidden argument*/NULL);
		if (L_22)
		{
			goto IL_0038;
		}
	}

IL_0059:
	{
		// return path;
		String_t* L_23 = V_1;
		return L_23;
	}
}
// NativeGallery/Permission NativeGallery::GetMediaFromGallery(NativeGallery/MediaPickCallback,NativeGallery/MediaType,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, int32_t ___mediaType1, String_t* ___mime2, String_t* ___title3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMediaFromGallery_mC383E07B9E35CC3E92168E5FD9596AFB3F02F1C0_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t G_B6_0 = 0;
	int32_t G_B1_0 = 0;
	int32_t G_B2_0 = 0;
	int32_t G_B5_0 = 0;
	int32_t G_B3_0 = 0;
	int32_t G_B4_0 = 0;
	{
		// Permission result = RequestPermission( PermissionType.Read );
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941(0, /*hidden argument*/NULL);
		// if( result == Permission.Granted && !IsMediaPickerBusy() )
		int32_t L_1 = L_0;
		G_B1_0 = L_1;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			G_B6_0 = L_1;
			goto IL_0041;
		}
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		bool L_2 = NativeGallery_IsMediaPickerBusy_m6FCFB28A795C6015E5F1B51B00FDFDBE22E9CC45(/*hidden argument*/NULL);
		G_B2_0 = G_B1_0;
		if (L_2)
		{
			G_B6_0 = G_B1_0;
			goto IL_0041;
		}
	}
	{
		// if( mediaType == MediaType.Audio )
		int32_t L_3 = ___mediaType1;
		G_B3_0 = G_B2_0;
		if ((!(((uint32_t)L_3) == ((uint32_t)4))))
		{
			G_B5_0 = G_B2_0;
			goto IL_002a;
		}
	}
	{
		// Debug.LogError( "Picking audio files is not supported on iOS" );
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_LogError_m3BCF9B78263152261565DCA9DB7D55F0C391ED29(_stringLiteralAA060E67BCEBDAC58D595E0A4BCBBB8A8FCB0BCF, /*hidden argument*/NULL);
		// if( callback != null ) // Selecting audio files is not supported on iOS
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_4 = ___callback0;
		G_B4_0 = G_B3_0;
		if (!L_4)
		{
			G_B6_0 = G_B3_0;
			goto IL_0041;
		}
	}
	{
		// callback( null );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_5 = ___callback0;
		NullCheck(L_5);
		MediaPickCallback_Invoke_m63EDCBEBE0133626823ADEA1566C8F71785D6B26(L_5, (String_t*)NULL, /*hidden argument*/NULL);
		// }
		return G_B4_0;
	}

IL_002a:
	{
		// NGMediaReceiveCallbackiOS.Initialize( callback, null );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_6 = ___callback0;
		NGMediaReceiveCallbackiOS_Initialize_m42081AEDDFA2FFBF12D98CC91BFD1AA353CD10E8(L_6, (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C *)NULL, /*hidden argument*/NULL);
		// _NativeGallery_PickMedia( SelectedMediaPath, (int) ( mediaType & ~MediaType.Audio ), PermissionFreeMode ? 1 : 0, 1 );
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_7 = NativeGallery_get_SelectedMediaPath_m73539045C11D3F6340EFF65DDC5EAA7F67DECD2C(/*hidden argument*/NULL);
		int32_t L_8 = ___mediaType1;
		NativeGallery__NativeGallery_PickMedia_m5241472884833F83137B5C3CFC6397556B732CDA(L_7, ((int32_t)((int32_t)L_8&(int32_t)((int32_t)-5))), 1, 1, /*hidden argument*/NULL);
		G_B6_0 = G_B5_0;
	}

IL_0041:
	{
		// return result;
		return G_B6_0;
	}
}
// NativeGallery/Permission NativeGallery::GetMultipleMediaFromGallery(NativeGallery/MediaPickMultipleCallback,NativeGallery/MediaType,System.String,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5 (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callback0, int32_t ___mediaType1, String_t* ___mime2, String_t* ___title3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetMultipleMediaFromGallery_mFD007A33CEAE1E85C948101FCBDFE82B9FEB3CE5_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	int32_t G_B9_0 = 0;
	int32_t G_B1_0 = 0;
	int32_t G_B2_0 = 0;
	int32_t G_B7_0 = 0;
	int32_t G_B3_0 = 0;
	int32_t G_B6_0 = 0;
	int32_t G_B4_0 = 0;
	int32_t G_B5_0 = 0;
	int32_t G_B8_0 = 0;
	{
		// Permission result = RequestPermission( PermissionType.Read );
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		int32_t L_0 = NativeGallery_RequestPermission_mEADB867EE50805E34462DBB0D1D342DB237E7941(0, /*hidden argument*/NULL);
		// if( result == Permission.Granted && !IsMediaPickerBusy() )
		int32_t L_1 = L_0;
		G_B1_0 = L_1;
		if ((!(((uint32_t)L_1) == ((uint32_t)1))))
		{
			G_B9_0 = L_1;
			goto IL_0053;
		}
	}
	{
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		bool L_2 = NativeGallery_IsMediaPickerBusy_m6FCFB28A795C6015E5F1B51B00FDFDBE22E9CC45(/*hidden argument*/NULL);
		G_B2_0 = G_B1_0;
		if (L_2)
		{
			G_B9_0 = G_B1_0;
			goto IL_0053;
		}
	}
	{
		// if( CanSelectMultipleFilesFromGallery() )
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		bool L_3 = NativeGallery_CanSelectMultipleFilesFromGallery_m0693426E1BE05221AEB29DB7E501488657554C58(/*hidden argument*/NULL);
		G_B3_0 = G_B2_0;
		if (!L_3)
		{
			G_B7_0 = G_B2_0;
			goto IL_0049;
		}
	}
	{
		// if( mediaType == MediaType.Audio )
		int32_t L_4 = ___mediaType1;
		G_B4_0 = G_B3_0;
		if ((!(((uint32_t)L_4) == ((uint32_t)4))))
		{
			G_B6_0 = G_B3_0;
			goto IL_0031;
		}
	}
	{
		// Debug.LogError( "Picking audio files is not supported on iOS" );
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_LogError_m3BCF9B78263152261565DCA9DB7D55F0C391ED29(_stringLiteralAA060E67BCEBDAC58D595E0A4BCBBB8A8FCB0BCF, /*hidden argument*/NULL);
		// if( callback != null ) // Selecting audio files is not supported on iOS
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_5 = ___callback0;
		G_B5_0 = G_B4_0;
		if (!L_5)
		{
			G_B9_0 = G_B4_0;
			goto IL_0053;
		}
	}
	{
		// callback( null );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_6 = ___callback0;
		NullCheck(L_6);
		MediaPickMultipleCallback_Invoke_m730BAC86FDA2FF4E477B8EB143C4B245E47EF59E(L_6, (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)NULL, /*hidden argument*/NULL);
		// }
		return G_B5_0;
	}

IL_0031:
	{
		// NGMediaReceiveCallbackiOS.Initialize( null, callback );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_7 = ___callback0;
		NGMediaReceiveCallbackiOS_Initialize_m42081AEDDFA2FFBF12D98CC91BFD1AA353CD10E8((MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B *)NULL, L_7, /*hidden argument*/NULL);
		// _NativeGallery_PickMedia( SelectedMediaPath, (int) ( mediaType & ~MediaType.Audio ), PermissionFreeMode ? 1 : 0, 0 );
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_8 = NativeGallery_get_SelectedMediaPath_m73539045C11D3F6340EFF65DDC5EAA7F67DECD2C(/*hidden argument*/NULL);
		int32_t L_9 = ___mediaType1;
		NativeGallery__NativeGallery_PickMedia_m5241472884833F83137B5C3CFC6397556B732CDA(L_8, ((int32_t)((int32_t)L_9&(int32_t)((int32_t)-5))), 1, 0, /*hidden argument*/NULL);
		// }
		return G_B6_0;
	}

IL_0049:
	{
		// else if( callback != null )
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_10 = ___callback0;
		G_B8_0 = G_B7_0;
		if (!L_10)
		{
			G_B9_0 = G_B7_0;
			goto IL_0053;
		}
	}
	{
		// callback( null );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_11 = ___callback0;
		NullCheck(L_11);
		MediaPickMultipleCallback_Invoke_m730BAC86FDA2FF4E477B8EB143C4B245E47EF59E(L_11, (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)NULL, /*hidden argument*/NULL);
		G_B9_0 = G_B8_0;
	}

IL_0053:
	{
		// return result;
		return G_B9_0;
	}
}
// System.Byte[] NativeGallery::GetTextureBytes(UnityEngine.Texture2D,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___texture0, bool ___isJpeg1, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetTextureBytes_mCA7C5391E61FCA8CD8A337DCA1F6340E69DCB169_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* V_0 = NULL;
	Exception_t * __last_unhandled_exception = 0;
	NO_UNUSED_WARNING (__last_unhandled_exception);
	Exception_t * __exception_local = 0;
	NO_UNUSED_WARNING (__exception_local);
	void* __leave_targets_storage = alloca(sizeof(int32_t) * 3);
	il2cpp::utils::LeaveTargetStack __leave_targets(__leave_targets_storage);
	NO_UNUSED_WARNING (__leave_targets);
	ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* G_B3_0 = NULL;

IL_0000:
	try
	{ // begin try (depth: 1)
		{
			// return isJpeg ? texture.EncodeToJPG( 100 ) : texture.EncodeToPNG();
			bool L_0 = ___isJpeg1;
			if (L_0)
			{
				goto IL_000b;
			}
		}

IL_0003:
		{
			Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_1 = ___texture0;
			ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_2 = ImageConversion_EncodeToPNG_m8D67A36A7D81F436CDA108CC5293E15A9CFD5617(L_1, /*hidden argument*/NULL);
			G_B3_0 = L_2;
			goto IL_0013;
		}

IL_000b:
		{
			Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_3 = ___texture0;
			ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_4 = ImageConversion_EncodeToJPG_mE289598FD45B6658A645B2CE359C4E6FC97BF875(L_3, ((int32_t)100), /*hidden argument*/NULL);
			G_B3_0 = L_4;
		}

IL_0013:
		{
			V_0 = G_B3_0;
			goto IL_002c;
		}
	} // end try (depth: 1)
	catch(Il2CppExceptionWrapper& e)
	{
		__exception_local = (Exception_t *)e.ex;
		if(il2cpp_codegen_class_is_assignable_from (UnityException_t513F7D97037DB40AE78D7C3AAA2F9E011D050C28_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
			goto CATCH_0016;
		if(il2cpp_codegen_class_is_assignable_from (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
			goto CATCH_0021;
		throw e;
	}

CATCH_0016:
	{ // begin catch(UnityEngine.UnityException)
		// catch( UnityException )
		// return GetTextureBytesFromCopy( texture, isJpeg );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_5 = ___texture0;
		bool L_6 = ___isJpeg1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_7 = NativeGallery_GetTextureBytesFromCopy_m15D9F6E2A638A3E3E4C84A32EF0423A37EA42470(L_5, L_6, /*hidden argument*/NULL);
		V_0 = L_7;
		goto IL_002c;
	} // end catch (depth: 1)

CATCH_0021:
	{ // begin catch(System.ArgumentException)
		// catch( ArgumentException )
		// return GetTextureBytesFromCopy( texture, isJpeg );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_8 = ___texture0;
		bool L_9 = ___isJpeg1;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_10 = NativeGallery_GetTextureBytesFromCopy_m15D9F6E2A638A3E3E4C84A32EF0423A37EA42470(L_8, L_9, /*hidden argument*/NULL);
		V_0 = L_10;
		goto IL_002c;
	} // end catch (depth: 1)

IL_002c:
	{
		// }
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_11 = V_0;
		return L_11;
	}
}
// System.Byte[] NativeGallery::GetTextureBytesFromCopy(UnityEngine.Texture2D,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* NativeGallery_GetTextureBytesFromCopy_m15D9F6E2A638A3E3E4C84A32EF0423A37EA42470 (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * ___texture0, bool ___isJpeg1, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetTextureBytesFromCopy_m15D9F6E2A638A3E3E4C84A32EF0423A37EA42470_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * V_0 = NULL;
	RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * V_1 = NULL;
	RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * V_2 = NULL;
	ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* V_3 = NULL;
	Exception_t * __last_unhandled_exception = 0;
	NO_UNUSED_WARNING (__last_unhandled_exception);
	Exception_t * __exception_local = 0;
	NO_UNUSED_WARNING (__exception_local);
	void* __leave_targets_storage = alloca(sizeof(int32_t) * 4);
	il2cpp::utils::LeaveTargetStack __leave_targets(__leave_targets_storage);
	NO_UNUSED_WARNING (__leave_targets);
	int32_t G_B3_0 = 0;
	int32_t G_B3_1 = 0;
	int32_t G_B2_0 = 0;
	int32_t G_B2_1 = 0;
	int32_t G_B4_0 = 0;
	int32_t G_B4_1 = 0;
	int32_t G_B4_2 = 0;
	ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* G_B11_0 = NULL;
	{
		// Debug.LogWarning( "Saving non-readable textures is slower than saving readable textures" );
		IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
		Debug_LogWarning_m37338644DC81F640CCDFEAE35A223F0E965F0568(_stringLiteral6086A9E1FB0848F6D06CBF4F123D6CCC58A06F0D, /*hidden argument*/NULL);
		// Texture2D sourceTexReadable = null;
		V_0 = (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C *)NULL;
		// RenderTexture rt = RenderTexture.GetTemporary( texture.width, texture.height );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_0 = ___texture0;
		NullCheck(L_0);
		int32_t L_1 = VirtFuncInvoker0< int32_t >::Invoke(4 /* System.Int32 UnityEngine.Texture::get_width() */, L_0);
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_2 = ___texture0;
		NullCheck(L_2);
		int32_t L_3 = VirtFuncInvoker0< int32_t >::Invoke(6 /* System.Int32 UnityEngine.Texture::get_height() */, L_2);
		RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * L_4 = RenderTexture_GetTemporary_m02547EA84CDEB9038FCF1EEDD283AF24114C735F(L_1, L_3, /*hidden argument*/NULL);
		V_1 = L_4;
		// RenderTexture activeRT = RenderTexture.active;
		RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * L_5 = RenderTexture_get_active_m670416A37BF4239DE5A55F6138CAA1FEEF184957(/*hidden argument*/NULL);
		V_2 = L_5;
	}

IL_0024:
	try
	{ // begin try (depth: 1)
		try
		{ // begin try (depth: 2)
			{
				// Graphics.Blit( texture, rt );
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_6 = ___texture0;
				RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * L_7 = V_1;
				IL2CPP_RUNTIME_CLASS_INIT(Graphics_t6FB7A5D4561F3AB3C34BF334BB0BD8061BE763B1_il2cpp_TypeInfo_var);
				Graphics_Blit_mB042EC04307A5617038DA4210DE7BA4B3E529113(L_6, L_7, /*hidden argument*/NULL);
				// RenderTexture.active = rt;
				RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * L_8 = V_1;
				RenderTexture_set_active_m992E25C701DEFC8042B31022EA45F02A787A84F1(L_8, /*hidden argument*/NULL);
				// sourceTexReadable = new Texture2D( texture.width, texture.height, isJpeg ? TextureFormat.RGB24 : TextureFormat.RGBA32, false );
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_9 = ___texture0;
				NullCheck(L_9);
				int32_t L_10 = VirtFuncInvoker0< int32_t >::Invoke(4 /* System.Int32 UnityEngine.Texture::get_width() */, L_9);
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_11 = ___texture0;
				NullCheck(L_11);
				int32_t L_12 = VirtFuncInvoker0< int32_t >::Invoke(6 /* System.Int32 UnityEngine.Texture::get_height() */, L_11);
				bool L_13 = ___isJpeg1;
				G_B2_0 = L_12;
				G_B2_1 = L_10;
				if (L_13)
				{
					G_B3_0 = L_12;
					G_B3_1 = L_10;
					goto IL_0043;
				}
			}

IL_0040:
			{
				G_B4_0 = 4;
				G_B4_1 = G_B2_0;
				G_B4_2 = G_B2_1;
				goto IL_0044;
			}

IL_0043:
			{
				G_B4_0 = 3;
				G_B4_1 = G_B3_0;
				G_B4_2 = G_B3_1;
			}

IL_0044:
			{
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_14 = (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C *)il2cpp_codegen_object_new(Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C_il2cpp_TypeInfo_var);
				Texture2D__ctor_m22561E039BC96019757E6B2427BE09734AE2C44A(L_14, G_B4_2, G_B4_1, G_B4_0, (bool)0, /*hidden argument*/NULL);
				V_0 = L_14;
				// sourceTexReadable.ReadPixels( new Rect( 0, 0, texture.width, texture.height ), 0, 0, false );
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_15 = V_0;
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_16 = ___texture0;
				NullCheck(L_16);
				int32_t L_17 = VirtFuncInvoker0< int32_t >::Invoke(4 /* System.Int32 UnityEngine.Texture::get_width() */, L_16);
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_18 = ___texture0;
				NullCheck(L_18);
				int32_t L_19 = VirtFuncInvoker0< int32_t >::Invoke(6 /* System.Int32 UnityEngine.Texture::get_height() */, L_18);
				Rect_t35B976DE901B5423C11705E156938EA27AB402CE  L_20;
				memset((&L_20), 0, sizeof(L_20));
				Rect__ctor_m50B92C75005C9C5A0D05E6E0EBB43AFAF7C66280((&L_20), (0.0f), (0.0f), (((float)((float)L_17))), (((float)((float)L_19))), /*hidden argument*/NULL);
				NullCheck(L_15);
				Texture2D_ReadPixels_m5664E184458C64BA89450F80F47705A2241E9BFE(L_15, L_20, 0, 0, (bool)0, /*hidden argument*/NULL);
				// sourceTexReadable.Apply( false, false );
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_21 = V_0;
				NullCheck(L_21);
				Texture2D_Apply_mCC17B1895AEB420CF75B1A50A62AB623C225A6C1(L_21, (bool)0, (bool)0, /*hidden argument*/NULL);
				// }
				IL2CPP_LEAVE(0x97, FINALLY_008a);
			}
		} // end try (depth: 2)
		catch(Il2CppExceptionWrapper& e)
		{
			__exception_local = (Exception_t *)e.ex;
			if(il2cpp_codegen_class_is_assignable_from (Exception_t_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
				goto CATCH_007b;
			throw e;
		}

CATCH_007b:
		{ // begin catch(System.Exception)
			// Debug.LogException( e );
			IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
			Debug_LogException_mBAA6702C240E37B2A834AA74E4FDC15A3A5589A9(((Exception_t *)__exception_local), /*hidden argument*/NULL);
			// Object.DestroyImmediate( sourceTexReadable );
			Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_22 = V_0;
			IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
			Object_DestroyImmediate_mF6F4415EF22249D6E650FAA40E403283F19B7446(L_22, /*hidden argument*/NULL);
			// return null;
			V_3 = (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821*)NULL;
			IL2CPP_LEAVE(0xBE, FINALLY_008a);
		} // end catch (depth: 2)
	} // end try (depth: 1)
	catch(Il2CppExceptionWrapper& e)
	{
		__last_unhandled_exception = (Exception_t *)e.ex;
		goto FINALLY_008a;
	}

FINALLY_008a:
	{ // begin finally (depth: 1)
		// RenderTexture.active = activeRT;
		RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * L_23 = V_2;
		RenderTexture_set_active_m992E25C701DEFC8042B31022EA45F02A787A84F1(L_23, /*hidden argument*/NULL);
		// RenderTexture.ReleaseTemporary( rt );
		RenderTexture_tBC47D853E3DA6511CD6C49DBF78D47B890FCD2F6 * L_24 = V_1;
		RenderTexture_ReleaseTemporary_mFBA6F18138965049AA901D62A0080B1A087A38EA(L_24, /*hidden argument*/NULL);
		// }
		IL2CPP_END_FINALLY(138)
	} // end finally (depth: 1)
	IL2CPP_CLEANUP(138)
	{
		IL2CPP_RETHROW_IF_UNHANDLED(Exception_t *)
		IL2CPP_JUMP_TBL(0x97, IL_0097)
		IL2CPP_JUMP_TBL(0xBE, IL_00be)
	}

IL_0097:
	{
	}

IL_0098:
	try
	{ // begin try (depth: 1)
		try
		{ // begin try (depth: 2)
			{
				// return isJpeg ? sourceTexReadable.EncodeToJPG( 100 ) : sourceTexReadable.EncodeToPNG();
				bool L_25 = ___isJpeg1;
				if (L_25)
				{
					goto IL_00a3;
				}
			}

IL_009b:
			{
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_26 = V_0;
				ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_27 = ImageConversion_EncodeToPNG_m8D67A36A7D81F436CDA108CC5293E15A9CFD5617(L_26, /*hidden argument*/NULL);
				G_B11_0 = L_27;
				goto IL_00ab;
			}

IL_00a3:
			{
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_28 = V_0;
				ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_29 = ImageConversion_EncodeToJPG_mE289598FD45B6658A645B2CE359C4E6FC97BF875(L_28, ((int32_t)100), /*hidden argument*/NULL);
				G_B11_0 = L_29;
			}

IL_00ab:
			{
				V_3 = G_B11_0;
				IL2CPP_LEAVE(0xBE, FINALLY_00b7);
			}
		} // end try (depth: 2)
		catch(Il2CppExceptionWrapper& e)
		{
			__exception_local = (Exception_t *)e.ex;
			if(il2cpp_codegen_class_is_assignable_from (Exception_t_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
				goto CATCH_00ae;
			throw e;
		}

CATCH_00ae:
		{ // begin catch(System.Exception)
			// Debug.LogException( e );
			IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
			Debug_LogException_mBAA6702C240E37B2A834AA74E4FDC15A3A5589A9(((Exception_t *)__exception_local), /*hidden argument*/NULL);
			// return null;
			V_3 = (ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821*)NULL;
			IL2CPP_LEAVE(0xBE, FINALLY_00b7);
		} // end catch (depth: 2)
	} // end try (depth: 1)
	catch(Il2CppExceptionWrapper& e)
	{
		__last_unhandled_exception = (Exception_t *)e.ex;
		goto FINALLY_00b7;
	}

FINALLY_00b7:
	{ // begin finally (depth: 1)
		// Object.DestroyImmediate( sourceTexReadable );
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_30 = V_0;
		IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
		Object_DestroyImmediate_mF6F4415EF22249D6E650FAA40E403283F19B7446(L_30, /*hidden argument*/NULL);
		// }
		IL2CPP_END_FINALLY(183)
	} // end finally (depth: 1)
	IL2CPP_CLEANUP(183)
	{
		IL2CPP_RETHROW_IF_UNHANDLED(Exception_t *)
		IL2CPP_JUMP_TBL(0xBE, IL_00be)
	}

IL_00be:
	{
		// }
		ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_31 = V_3;
		return L_31;
	}
}
// UnityEngine.Texture2D NativeGallery::LoadImageAtPath(System.String,System.Int32,System.Boolean,System.Boolean,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07 (String_t* ___imagePath0, int32_t ___maxSize1, bool ___markTextureNonReadable2, bool ___generateMipmaps3, bool ___linearColorSpace4, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	String_t* V_1 = NULL;
	int32_t V_2 = 0;
	Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * V_3 = NULL;
	Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * V_4 = NULL;
	Exception_t * __last_unhandled_exception = 0;
	NO_UNUSED_WARNING (__last_unhandled_exception);
	Exception_t * __exception_local = 0;
	NO_UNUSED_WARNING (__exception_local);
	void* __leave_targets_storage = alloca(sizeof(int32_t) * 5);
	il2cpp::utils::LeaveTargetStack __leave_targets(__leave_targets_storage);
	NO_UNUSED_WARNING (__leave_targets);
	int32_t G_B10_0 = 0;
	{
		// if( string.IsNullOrEmpty( imagePath ) )
		String_t* L_0 = ___imagePath0;
		bool L_1 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_0, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0013;
		}
	}
	{
		// throw new ArgumentException( "Parameter 'imagePath' is null or empty!" );
		ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 * L_2 = (ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1 *)il2cpp_codegen_object_new(ArgumentException_tEDCD16F20A09ECE461C3DA766C16EDA8864057D1_il2cpp_TypeInfo_var);
		ArgumentException__ctor_m9A85EF7FEFEC21DDD525A67E831D77278E5165B7(L_2, _stringLiteral377ED966B3A8FCCD3BE787DDE011557F2EC947F9, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_2, NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07_RuntimeMethod_var);
	}

IL_0013:
	{
		// if( !File.Exists( imagePath ) )
		String_t* L_3 = ___imagePath0;
		bool L_4 = File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB(L_3, /*hidden argument*/NULL);
		if (L_4)
		{
			goto IL_002c;
		}
	}
	{
		// throw new FileNotFoundException( "File not found at " + imagePath );
		String_t* L_5 = ___imagePath0;
		String_t* L_6 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(_stringLiteral0A3CF76AA4D046F4E79CDE3341E93210C22D0D9E, L_5, /*hidden argument*/NULL);
		FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 * L_7 = (FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 *)il2cpp_codegen_object_new(FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_mA72DAA77008E903BC162A8D32FDE7F874B27E858(L_7, L_6, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_7, NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07_RuntimeMethod_var);
	}

IL_002c:
	{
		// if( maxSize <= 0 )
		int32_t L_8 = ___maxSize1;
		if ((((int32_t)L_8) > ((int32_t)0)))
		{
			goto IL_0037;
		}
	}
	{
		// maxSize = SystemInfo.maxTextureSize;
		int32_t L_9 = SystemInfo_get_maxTextureSize_m10A8228B83EE161D0DCCB9FB01279C245C47D0E3(/*hidden argument*/NULL);
		___maxSize1 = L_9;
	}

IL_0037:
	{
		// string loadPath = _NativeGallery_LoadImageAtPath( imagePath, TemporaryImagePath, maxSize );
		String_t* L_10 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_11 = NativeGallery_get_TemporaryImagePath_m0C8232159D07C61BE9CF5A2275953E4F44DA5354(/*hidden argument*/NULL);
		int32_t L_12 = ___maxSize1;
		String_t* L_13 = NativeGallery__NativeGallery_LoadImageAtPath_mA0D2A6A62DC01256EF74FF5C236F6806BE3F8F2A(L_10, L_11, L_12, /*hidden argument*/NULL);
		V_0 = L_13;
		// string extension = Path.GetExtension( imagePath ).ToLowerInvariant();
		String_t* L_14 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_15 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_14, /*hidden argument*/NULL);
		NullCheck(L_15);
		String_t* L_16 = String_ToLowerInvariant_m197BD65B6582DC546FF1BC398161EEFA708F799E(L_15, /*hidden argument*/NULL);
		V_1 = L_16;
		// TextureFormat format = ( extension == ".jpg" || extension == ".jpeg" ) ? TextureFormat.RGB24 : TextureFormat.RGBA32;
		String_t* L_17 = V_1;
		bool L_18 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_17, _stringLiteralDCDFD41CB6E96E78736DEB5F5ADD6F6311DA8E80, /*hidden argument*/NULL);
		if (L_18)
		{
			goto IL_006d;
		}
	}
	{
		String_t* L_19 = V_1;
		bool L_20 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_19, _stringLiteral801DC5C3610D303D73C37E27B3D6F5AC9F7661DC, /*hidden argument*/NULL);
		if (L_20)
		{
			goto IL_006d;
		}
	}
	{
		G_B10_0 = 4;
		goto IL_006e;
	}

IL_006d:
	{
		G_B10_0 = 3;
	}

IL_006e:
	{
		V_2 = G_B10_0;
		// Texture2D result = new Texture2D( 2, 2, format, generateMipmaps, linearColorSpace );
		int32_t L_21 = V_2;
		bool L_22 = ___generateMipmaps3;
		bool L_23 = ___linearColorSpace4;
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_24 = (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C *)il2cpp_codegen_object_new(Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C_il2cpp_TypeInfo_var);
		Texture2D__ctor_m01B7AF7873AA43495B8216926C1768FEDDF4CE64(L_24, 2, 2, L_21, L_22, L_23, /*hidden argument*/NULL);
		V_3 = L_24;
	}

IL_007b:
	try
	{ // begin try (depth: 1)
		try
		{ // begin try (depth: 2)
			{
				// if( !result.LoadImage( File.ReadAllBytes( loadPath ), markTextureNonReadable ) )
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_25 = V_3;
				String_t* L_26 = V_0;
				ByteU5BU5D_tD06FDBE8142446525DF1C40351D523A228373821* L_27 = File_ReadAllBytes_mF29468CED0B7B3B7C0971ACEBB16A38683718BEC(L_26, /*hidden argument*/NULL);
				bool L_28 = ___markTextureNonReadable2;
				bool L_29 = ImageConversion_LoadImage_mFB317291362399115F8D112D8CE9E8C1BF454C29(L_25, L_27, L_28, /*hidden argument*/NULL);
				if (L_29)
				{
					goto IL_0095;
				}
			}

IL_008a:
			{
				// Object.DestroyImmediate( result );
				Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_30 = V_3;
				IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
				Object_DestroyImmediate_mF6F4415EF22249D6E650FAA40E403283F19B7446(L_30, /*hidden argument*/NULL);
				// return null;
				V_4 = (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C *)NULL;
				IL2CPP_LEAVE(0xBE, FINALLY_00a7);
			}

IL_0095:
			{
				// }
				IL2CPP_LEAVE(0xBC, FINALLY_00a7);
			}
		} // end try (depth: 2)
		catch(Il2CppExceptionWrapper& e)
		{
			__exception_local = (Exception_t *)e.ex;
			if(il2cpp_codegen_class_is_assignable_from (Exception_t_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
				goto CATCH_0097;
			throw e;
		}

CATCH_0097:
		{ // begin catch(System.Exception)
			// Debug.LogException( e );
			IL2CPP_RUNTIME_CLASS_INIT(Debug_t7B5FCB117E2FD63B6838BC52821B252E2BFB61C4_il2cpp_TypeInfo_var);
			Debug_LogException_mBAA6702C240E37B2A834AA74E4FDC15A3A5589A9(((Exception_t *)__exception_local), /*hidden argument*/NULL);
			// Object.DestroyImmediate( result );
			Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_31 = V_3;
			IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
			Object_DestroyImmediate_mF6F4415EF22249D6E650FAA40E403283F19B7446(L_31, /*hidden argument*/NULL);
			// return null;
			V_4 = (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C *)NULL;
			IL2CPP_LEAVE(0xBE, FINALLY_00a7);
		} // end catch (depth: 2)
	} // end try (depth: 1)
	catch(Il2CppExceptionWrapper& e)
	{
		__last_unhandled_exception = (Exception_t *)e.ex;
		goto FINALLY_00a7;
	}

FINALLY_00a7:
	{ // begin finally (depth: 1)
		{
			// if( loadPath != imagePath )
			String_t* L_32 = V_0;
			String_t* L_33 = ___imagePath0;
			bool L_34 = String_op_Inequality_m0BD184A74F453A72376E81CC6CAEE2556B80493E(L_32, L_33, /*hidden argument*/NULL);
			if (!L_34)
			{
				goto IL_00bb;
			}
		}

IL_00b0:
		try
		{ // begin try (depth: 2)
			// File.Delete( loadPath );
			String_t* L_35 = V_0;
			File_Delete_mBE814E569EAB07FAD140C6DCDB957F1CB8C85DE2(L_35, /*hidden argument*/NULL);
			// }
			goto IL_00bb;
		} // end try (depth: 2)
		catch(Il2CppExceptionWrapper& e)
		{
			__exception_local = (Exception_t *)e.ex;
			if(il2cpp_codegen_class_is_assignable_from (RuntimeObject_il2cpp_TypeInfo_var, il2cpp_codegen_object_class(e.ex)))
				goto CATCH_00b8;
			throw e;
		}

CATCH_00b8:
		{ // begin catch(System.Object)
			// catch { }
			// catch { }
			goto IL_00bb;
		} // end catch (depth: 2)

IL_00bb:
		{
			// }
			IL2CPP_END_FINALLY(167)
		}
	} // end finally (depth: 1)
	IL2CPP_CLEANUP(167)
	{
		IL2CPP_RETHROW_IF_UNHANDLED(Exception_t *)
		IL2CPP_JUMP_TBL(0xBE, IL_00be)
		IL2CPP_JUMP_TBL(0xBC, IL_00bc)
	}

IL_00bc:
	{
		// return result;
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_36 = V_3;
		return L_36;
	}

IL_00be:
	{
		// }
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_37 = V_4;
		return L_37;
	}
}
// UnityEngine.Texture2D NativeGallery::GetVideoThumbnail(System.String,System.Int32,System.Double,System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * NativeGallery_GetVideoThumbnail_m5A493C4668050765D590020321E5CF2CB662C5AD (String_t* ___videoPath0, int32_t ___maxSize1, double ___captureTimeInSeconds2, bool ___markTextureNonReadable3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetVideoThumbnail_m5A493C4668050765D590020321E5CF2CB662C5AD_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	{
		// if( maxSize <= 0 )
		int32_t L_0 = ___maxSize1;
		if ((((int32_t)L_0) > ((int32_t)0)))
		{
			goto IL_000b;
		}
	}
	{
		// maxSize = SystemInfo.maxTextureSize;
		int32_t L_1 = SystemInfo_get_maxTextureSize_m10A8228B83EE161D0DCCB9FB01279C245C47D0E3(/*hidden argument*/NULL);
		___maxSize1 = L_1;
	}

IL_000b:
	{
		// string thumbnailPath = _NativeGallery_GetVideoThumbnail( videoPath, TemporaryImagePath + ".png", maxSize, captureTimeInSeconds );
		String_t* L_2 = ___videoPath0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_3 = NativeGallery_get_TemporaryImagePath_m0C8232159D07C61BE9CF5A2275953E4F44DA5354(/*hidden argument*/NULL);
		String_t* L_4 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(L_3, _stringLiteral339F5868588CFC8FDA4A1EC94EAD8F737C5FCFC0, /*hidden argument*/NULL);
		int32_t L_5 = ___maxSize1;
		double L_6 = ___captureTimeInSeconds2;
		String_t* L_7 = NativeGallery__NativeGallery_GetVideoThumbnail_m67187C1103D261E9F52143D7E917CA97939A3A0B(L_2, L_4, L_5, L_6, /*hidden argument*/NULL);
		V_0 = L_7;
		// if( !string.IsNullOrEmpty( thumbnailPath ) )
		String_t* L_8 = V_0;
		bool L_9 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_8, /*hidden argument*/NULL);
		if (L_9)
		{
			goto IL_0036;
		}
	}
	{
		// return LoadImageAtPath( thumbnailPath, maxSize, markTextureNonReadable );
		String_t* L_10 = V_0;
		int32_t L_11 = ___maxSize1;
		bool L_12 = ___markTextureNonReadable3;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C * L_13 = NativeGallery_LoadImageAtPath_m96B94578F0E4E327B126D9C77AC240A80BA12F07(L_10, L_11, L_12, (bool)1, (bool)0, /*hidden argument*/NULL);
		return L_13;
	}

IL_0036:
	{
		// return null;
		return (Texture2D_tBBF96AC337723E2EF156DF17E09D4379FD05DE1C *)NULL;
	}
}
// NativeGallery/ImageProperties NativeGallery::GetImageProperties(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD  NativeGallery_GetImageProperties_m2137D3FC3927982C0D837306DF96C0F64A0A3AC2 (String_t* ___imagePath0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetImageProperties_m2137D3FC3927982C0D837306DF96C0F64A0A3AC2_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	String_t* V_3 = NULL;
	int32_t V_4 = 0;
	StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* V_5 = NULL;
	int32_t V_6 = 0;
	String_t* V_7 = NULL;
	{
		// if( !File.Exists( imagePath ) )
		String_t* L_0 = ___imagePath0;
		bool L_1 = File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB(L_0, /*hidden argument*/NULL);
		if (L_1)
		{
			goto IL_0019;
		}
	}
	{
		// throw new FileNotFoundException( "File not found at " + imagePath );
		String_t* L_2 = ___imagePath0;
		String_t* L_3 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(_stringLiteral0A3CF76AA4D046F4E79CDE3341E93210C22D0D9E, L_2, /*hidden argument*/NULL);
		FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 * L_4 = (FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 *)il2cpp_codegen_object_new(FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_mA72DAA77008E903BC162A8D32FDE7F874B27E858(L_4, L_3, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_4, NativeGallery_GetImageProperties_m2137D3FC3927982C0D837306DF96C0F64A0A3AC2_RuntimeMethod_var);
	}

IL_0019:
	{
		// string value = _NativeGallery_GetImageProperties( imagePath );
		String_t* L_5 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_6 = NativeGallery__NativeGallery_GetImageProperties_m7208E7383AC627EEC8B87A63447B6B8261B22268(L_5, /*hidden argument*/NULL);
		V_0 = L_6;
		// int width = 0, height = 0;
		V_1 = 0;
		// int width = 0, height = 0;
		V_2 = 0;
		// string mimeType = null;
		V_3 = (String_t*)NULL;
		// ImageOrientation orientation = ImageOrientation.Unknown;
		V_4 = (-1);
		// if( !string.IsNullOrEmpty( value ) )
		String_t* L_7 = V_0;
		bool L_8 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_7, /*hidden argument*/NULL);
		if (L_8)
		{
			goto IL_011d;
		}
	}
	{
		// string[] properties = value.Split( '>' );
		String_t* L_9 = V_0;
		CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* L_10 = (CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2*)(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2*)SZArrayNew(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2_il2cpp_TypeInfo_var, (uint32_t)1);
		CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* L_11 = L_10;
		NullCheck(L_11);
		(L_11)->SetAt(static_cast<il2cpp_array_size_t>(0), (Il2CppChar)((int32_t)62));
		NullCheck(L_9);
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_12 = String_Split_m13262358217AD2C119FD1B9733C3C0289D608512(L_9, L_11, /*hidden argument*/NULL);
		V_5 = L_12;
		// if( properties != null && properties.Length >= 4 )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_13 = V_5;
		if (!L_13)
		{
			goto IL_011d;
		}
	}
	{
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_14 = V_5;
		NullCheck(L_14);
		if ((((int32_t)(((int32_t)((int32_t)(((RuntimeArray*)L_14)->max_length))))) < ((int32_t)4)))
		{
			goto IL_011d;
		}
	}
	{
		// if( !int.TryParse( properties[0].Trim(), out width ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_15 = V_5;
		NullCheck(L_15);
		int32_t L_16 = 0;
		String_t* L_17 = (L_15)->GetAt(static_cast<il2cpp_array_size_t>(L_16));
		NullCheck(L_17);
		String_t* L_18 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_17, /*hidden argument*/NULL);
		bool L_19 = Int32_TryParse_m03D31CAB7050E8286A8A90711C896B181006AD00(L_18, (int32_t*)(&V_1), /*hidden argument*/NULL);
		if (L_19)
		{
			goto IL_006c;
		}
	}
	{
		// width = 0;
		V_1 = 0;
	}

IL_006c:
	{
		// if( !int.TryParse( properties[1].Trim(), out height ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_20 = V_5;
		NullCheck(L_20);
		int32_t L_21 = 1;
		String_t* L_22 = (L_20)->GetAt(static_cast<il2cpp_array_size_t>(L_21));
		NullCheck(L_22);
		String_t* L_23 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_22, /*hidden argument*/NULL);
		bool L_24 = Int32_TryParse_m03D31CAB7050E8286A8A90711C896B181006AD00(L_23, (int32_t*)(&V_2), /*hidden argument*/NULL);
		if (L_24)
		{
			goto IL_0080;
		}
	}
	{
		// height = 0;
		V_2 = 0;
	}

IL_0080:
	{
		// mimeType = properties[2].Trim();
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_25 = V_5;
		NullCheck(L_25);
		int32_t L_26 = 2;
		String_t* L_27 = (L_25)->GetAt(static_cast<il2cpp_array_size_t>(L_26));
		NullCheck(L_27);
		String_t* L_28 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_27, /*hidden argument*/NULL);
		V_3 = L_28;
		// if( mimeType.Length == 0 )
		String_t* L_29 = V_3;
		NullCheck(L_29);
		int32_t L_30 = String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline(L_29, /*hidden argument*/NULL);
		if (L_30)
		{
			goto IL_0107;
		}
	}
	{
		// string extension = Path.GetExtension( imagePath ).ToLowerInvariant();
		String_t* L_31 = ___imagePath0;
		IL2CPP_RUNTIME_CLASS_INIT(Path_t0B99A4B924A6FDF08814FFA8DD4CD121ED1A0752_il2cpp_TypeInfo_var);
		String_t* L_32 = Path_GetExtension_mAB8DB12AA3F147A487ED6AFECF8CD0043402957B(L_31, /*hidden argument*/NULL);
		NullCheck(L_32);
		String_t* L_33 = String_ToLowerInvariant_m197BD65B6582DC546FF1BC398161EEFA708F799E(L_32, /*hidden argument*/NULL);
		V_7 = L_33;
		// if( extension == ".png" )
		String_t* L_34 = V_7;
		bool L_35 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_34, _stringLiteral339F5868588CFC8FDA4A1EC94EAD8F737C5FCFC0, /*hidden argument*/NULL);
		if (!L_35)
		{
			goto IL_00b5;
		}
	}
	{
		// mimeType = "image/png";
		V_3 = _stringLiteral34D71611DCE9C30419B3C3EA42DC9426E931CDDE;
		goto IL_0107;
	}

IL_00b5:
	{
		// else if( extension == ".jpg" || extension == ".jpeg" )
		String_t* L_36 = V_7;
		bool L_37 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_36, _stringLiteralDCDFD41CB6E96E78736DEB5F5ADD6F6311DA8E80, /*hidden argument*/NULL);
		if (L_37)
		{
			goto IL_00d1;
		}
	}
	{
		String_t* L_38 = V_7;
		bool L_39 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_38, _stringLiteral801DC5C3610D303D73C37E27B3D6F5AC9F7661DC, /*hidden argument*/NULL);
		if (!L_39)
		{
			goto IL_00d9;
		}
	}

IL_00d1:
	{
		// mimeType = "image/jpeg";
		V_3 = _stringLiteral60C283FF6EF6CAD8B67415AE1A3C6BABD3477040;
		goto IL_0107;
	}

IL_00d9:
	{
		// else if( extension == ".gif" )
		String_t* L_40 = V_7;
		bool L_41 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_40, _stringLiteral64CC1194405FA366D9AE015C627F4609DEAC4879, /*hidden argument*/NULL);
		if (!L_41)
		{
			goto IL_00ef;
		}
	}
	{
		// mimeType = "image/gif";
		V_3 = _stringLiteralB3F0D81387C1211E197E16C94BFDA6583BC874F9;
		goto IL_0107;
	}

IL_00ef:
	{
		// else if( extension == ".bmp" )
		String_t* L_42 = V_7;
		bool L_43 = String_op_Equality_m139F0E4195AE2F856019E63B241F36F016997FCE(L_42, _stringLiteral48022311225DF803178B78ACBDB71930DBF6C39C, /*hidden argument*/NULL);
		if (!L_43)
		{
			goto IL_0105;
		}
	}
	{
		// mimeType = "image/bmp";
		V_3 = _stringLiteralA6E98DBB2BD82CB83A4EB01F4DFB5062494F8E28;
		goto IL_0107;
	}

IL_0105:
	{
		// mimeType = null;
		V_3 = (String_t*)NULL;
	}

IL_0107:
	{
		// if( int.TryParse( properties[3].Trim(), out orientationInt ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_44 = V_5;
		NullCheck(L_44);
		int32_t L_45 = 3;
		String_t* L_46 = (L_44)->GetAt(static_cast<il2cpp_array_size_t>(L_45));
		NullCheck(L_46);
		String_t* L_47 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_46, /*hidden argument*/NULL);
		bool L_48 = Int32_TryParse_m03D31CAB7050E8286A8A90711C896B181006AD00(L_47, (int32_t*)(&V_6), /*hidden argument*/NULL);
		if (!L_48)
		{
			goto IL_011d;
		}
	}
	{
		// orientation = (ImageOrientation) orientationInt;
		int32_t L_49 = V_6;
		V_4 = L_49;
	}

IL_011d:
	{
		// return new ImageProperties( width, height, mimeType, orientation );
		int32_t L_50 = V_1;
		int32_t L_51 = V_2;
		String_t* L_52 = V_3;
		int32_t L_53 = V_4;
		ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD  L_54;
		memset((&L_54), 0, sizeof(L_54));
		ImageProperties__ctor_m4887094C011E2F53ABEF3389856C2B232A754A55((&L_54), L_50, L_51, L_52, L_53, /*hidden argument*/NULL);
		return L_54;
	}
}
// NativeGallery/VideoProperties NativeGallery::GetVideoProperties(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409  NativeGallery_GetVideoProperties_mE8CA6471D0D5BD3854AD736ACE114D070BEEC450 (String_t* ___videoPath0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NativeGallery_GetVideoProperties_mE8CA6471D0D5BD3854AD736ACE114D070BEEC450_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	String_t* V_0 = NULL;
	int32_t V_1 = 0;
	int32_t V_2 = 0;
	int64_t V_3 = 0;
	float V_4 = 0.0f;
	StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* V_5 = NULL;
	{
		// if( !File.Exists( videoPath ) )
		String_t* L_0 = ___videoPath0;
		bool L_1 = File_Exists_m6B9BDD8EEB33D744EB0590DD27BC0152FAFBD1FB(L_0, /*hidden argument*/NULL);
		if (L_1)
		{
			goto IL_0019;
		}
	}
	{
		// throw new FileNotFoundException( "File not found at " + videoPath );
		String_t* L_2 = ___videoPath0;
		String_t* L_3 = String_Concat_mB78D0094592718DA6D5DB6C712A9C225631666BE(_stringLiteral0A3CF76AA4D046F4E79CDE3341E93210C22D0D9E, L_2, /*hidden argument*/NULL);
		FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 * L_4 = (FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431 *)il2cpp_codegen_object_new(FileNotFoundException_t0B3F0AE5C94A781A7E2ABBD786F91C229B703431_il2cpp_TypeInfo_var);
		FileNotFoundException__ctor_mA72DAA77008E903BC162A8D32FDE7F874B27E858(L_4, L_3, /*hidden argument*/NULL);
		IL2CPP_RAISE_MANAGED_EXCEPTION(L_4, NativeGallery_GetVideoProperties_mE8CA6471D0D5BD3854AD736ACE114D070BEEC450_RuntimeMethod_var);
	}

IL_0019:
	{
		// string value = _NativeGallery_GetVideoProperties( videoPath );
		String_t* L_5 = ___videoPath0;
		IL2CPP_RUNTIME_CLASS_INIT(NativeGallery_t90106A8880BA5F109729987632572E633A0CDA87_il2cpp_TypeInfo_var);
		String_t* L_6 = NativeGallery__NativeGallery_GetVideoProperties_m15490BBA47D7D480202BCF365228E91D891A5ECD(L_5, /*hidden argument*/NULL);
		V_0 = L_6;
		// int width = 0, height = 0;
		V_1 = 0;
		// int width = 0, height = 0;
		V_2 = 0;
		// long duration = 0L;
		V_3 = (((int64_t)((int64_t)0)));
		// float rotation = 0f;
		V_4 = (0.0f);
		// if( !string.IsNullOrEmpty( value ) )
		String_t* L_7 = V_0;
		bool L_8 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_7, /*hidden argument*/NULL);
		if (L_8)
		{
			goto IL_00aa;
		}
	}
	{
		// string[] properties = value.Split( '>' );
		String_t* L_9 = V_0;
		CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* L_10 = (CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2*)(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2*)SZArrayNew(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2_il2cpp_TypeInfo_var, (uint32_t)1);
		CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* L_11 = L_10;
		NullCheck(L_11);
		(L_11)->SetAt(static_cast<il2cpp_array_size_t>(0), (Il2CppChar)((int32_t)62));
		NullCheck(L_9);
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_12 = String_Split_m13262358217AD2C119FD1B9733C3C0289D608512(L_9, L_11, /*hidden argument*/NULL);
		V_5 = L_12;
		// if( properties != null && properties.Length >= 4 )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_13 = V_5;
		if (!L_13)
		{
			goto IL_00aa;
		}
	}
	{
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_14 = V_5;
		NullCheck(L_14);
		if ((((int32_t)(((int32_t)((int32_t)(((RuntimeArray*)L_14)->max_length))))) < ((int32_t)4)))
		{
			goto IL_00aa;
		}
	}
	{
		// if( !int.TryParse( properties[0].Trim(), out width ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_15 = V_5;
		NullCheck(L_15);
		int32_t L_16 = 0;
		String_t* L_17 = (L_15)->GetAt(static_cast<il2cpp_array_size_t>(L_16));
		NullCheck(L_17);
		String_t* L_18 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_17, /*hidden argument*/NULL);
		bool L_19 = Int32_TryParse_m03D31CAB7050E8286A8A90711C896B181006AD00(L_18, (int32_t*)(&V_1), /*hidden argument*/NULL);
		if (L_19)
		{
			goto IL_0068;
		}
	}
	{
		// width = 0;
		V_1 = 0;
	}

IL_0068:
	{
		// if( !int.TryParse( properties[1].Trim(), out height ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_20 = V_5;
		NullCheck(L_20);
		int32_t L_21 = 1;
		String_t* L_22 = (L_20)->GetAt(static_cast<il2cpp_array_size_t>(L_21));
		NullCheck(L_22);
		String_t* L_23 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_22, /*hidden argument*/NULL);
		bool L_24 = Int32_TryParse_m03D31CAB7050E8286A8A90711C896B181006AD00(L_23, (int32_t*)(&V_2), /*hidden argument*/NULL);
		if (L_24)
		{
			goto IL_007c;
		}
	}
	{
		// height = 0;
		V_2 = 0;
	}

IL_007c:
	{
		// if( !long.TryParse( properties[2].Trim(), out duration ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_25 = V_5;
		NullCheck(L_25);
		int32_t L_26 = 2;
		String_t* L_27 = (L_25)->GetAt(static_cast<il2cpp_array_size_t>(L_26));
		NullCheck(L_27);
		String_t* L_28 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_27, /*hidden argument*/NULL);
		bool L_29 = Int64_TryParse_m5C60567D82BACC7D9C18F7A9A83025FC94AD0E95(L_28, (int64_t*)(&V_3), /*hidden argument*/NULL);
		if (L_29)
		{
			goto IL_0091;
		}
	}
	{
		// duration = 0L;
		V_3 = (((int64_t)((int64_t)0)));
	}

IL_0091:
	{
		// if( !float.TryParse( properties[3].Trim(), out rotation ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_30 = V_5;
		NullCheck(L_30);
		int32_t L_31 = 3;
		String_t* L_32 = (L_30)->GetAt(static_cast<il2cpp_array_size_t>(L_31));
		NullCheck(L_32);
		String_t* L_33 = String_Trim_mB52EB7876C7132358B76B7DC95DEACA20722EF4D(L_32, /*hidden argument*/NULL);
		bool L_34 = Single_TryParse_m548E9EC17193999C07717FECFAD0A907980D566C(L_33, (float*)(&V_4), /*hidden argument*/NULL);
		if (L_34)
		{
			goto IL_00aa;
		}
	}
	{
		// rotation = 0f;
		V_4 = (0.0f);
	}

IL_00aa:
	{
		// if( rotation == -90f )
		float L_35 = V_4;
		if ((!(((float)L_35) == ((float)(-90.0f)))))
		{
			goto IL_00ba;
		}
	}
	{
		// rotation = 270f;
		V_4 = (270.0f);
	}

IL_00ba:
	{
		// return new VideoProperties( width, height, duration, rotation );
		int32_t L_36 = V_1;
		int32_t L_37 = V_2;
		int64_t L_38 = V_3;
		float L_39 = V_4;
		VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409  L_40;
		memset((&L_40), 0, sizeof(L_40));
		VideoProperties__ctor_mFEAE01935E87AE233A7EA239997ED5C325D732AA((&L_40), L_36, L_37, L_38, L_39, /*hidden argument*/NULL);
		return L_40;
	}
}
// System.Void NativeGallery::.cctor()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NativeGallery__cctor_mAD04E1FB7C2C0E478F0F02EAD5D280C1D01F5BE6 (const RuntimeMethod* method)
{
	{
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// Conversion methods for marshalling of: NativeGallery/ImageProperties
IL2CPP_EXTERN_C void ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshal_pinvoke(const ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD& unmarshaled, ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_pinvoke& marshaled)
{
	marshaled.___width_0 = unmarshaled.get_width_0();
	marshaled.___height_1 = unmarshaled.get_height_1();
	marshaled.___mimeType_2 = il2cpp_codegen_marshal_string(unmarshaled.get_mimeType_2());
	marshaled.___orientation_3 = unmarshaled.get_orientation_3();
}
IL2CPP_EXTERN_C void ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshal_pinvoke_back(const ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_pinvoke& marshaled, ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD& unmarshaled)
{
	int32_t unmarshaled_width_temp_0 = 0;
	unmarshaled_width_temp_0 = marshaled.___width_0;
	unmarshaled.set_width_0(unmarshaled_width_temp_0);
	int32_t unmarshaled_height_temp_1 = 0;
	unmarshaled_height_temp_1 = marshaled.___height_1;
	unmarshaled.set_height_1(unmarshaled_height_temp_1);
	unmarshaled.set_mimeType_2(il2cpp_codegen_marshal_string_result(marshaled.___mimeType_2));
	int32_t unmarshaled_orientation_temp_3 = 0;
	unmarshaled_orientation_temp_3 = marshaled.___orientation_3;
	unmarshaled.set_orientation_3(unmarshaled_orientation_temp_3);
}
// Conversion method for clean up from marshalling of: NativeGallery/ImageProperties
IL2CPP_EXTERN_C void ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshal_pinvoke_cleanup(ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_pinvoke& marshaled)
{
	il2cpp_codegen_marshal_free(marshaled.___mimeType_2);
	marshaled.___mimeType_2 = NULL;
}
// Conversion methods for marshalling of: NativeGallery/ImageProperties
IL2CPP_EXTERN_C void ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshal_com(const ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD& unmarshaled, ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_com& marshaled)
{
	marshaled.___width_0 = unmarshaled.get_width_0();
	marshaled.___height_1 = unmarshaled.get_height_1();
	marshaled.___mimeType_2 = il2cpp_codegen_marshal_bstring(unmarshaled.get_mimeType_2());
	marshaled.___orientation_3 = unmarshaled.get_orientation_3();
}
IL2CPP_EXTERN_C void ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshal_com_back(const ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_com& marshaled, ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD& unmarshaled)
{
	int32_t unmarshaled_width_temp_0 = 0;
	unmarshaled_width_temp_0 = marshaled.___width_0;
	unmarshaled.set_width_0(unmarshaled_width_temp_0);
	int32_t unmarshaled_height_temp_1 = 0;
	unmarshaled_height_temp_1 = marshaled.___height_1;
	unmarshaled.set_height_1(unmarshaled_height_temp_1);
	unmarshaled.set_mimeType_2(il2cpp_codegen_marshal_bstring_result(marshaled.___mimeType_2));
	int32_t unmarshaled_orientation_temp_3 = 0;
	unmarshaled_orientation_temp_3 = marshaled.___orientation_3;
	unmarshaled.set_orientation_3(unmarshaled_orientation_temp_3);
}
// Conversion method for clean up from marshalling of: NativeGallery/ImageProperties
IL2CPP_EXTERN_C void ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshal_com_cleanup(ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD_marshaled_com& marshaled)
{
	il2cpp_codegen_marshal_free_bstring(marshaled.___mimeType_2);
	marshaled.___mimeType_2 = NULL;
}
// System.Void NativeGallery/ImageProperties::.ctor(System.Int32,System.Int32,System.String,NativeGallery/ImageOrientation)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void ImageProperties__ctor_m4887094C011E2F53ABEF3389856C2B232A754A55 (ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD * __this, int32_t ___width0, int32_t ___height1, String_t* ___mimeType2, int32_t ___orientation3, const RuntimeMethod* method)
{
	{
		// this.width = width;
		int32_t L_0 = ___width0;
		__this->set_width_0(L_0);
		// this.height = height;
		int32_t L_1 = ___height1;
		__this->set_height_1(L_1);
		// this.mimeType = mimeType;
		String_t* L_2 = ___mimeType2;
		__this->set_mimeType_2(L_2);
		// this.orientation = orientation;
		int32_t L_3 = ___orientation3;
		__this->set_orientation_3(L_3);
		// }
		return;
	}
}
IL2CPP_EXTERN_C  void ImageProperties__ctor_m4887094C011E2F53ABEF3389856C2B232A754A55_AdjustorThunk (RuntimeObject * __this, int32_t ___width0, int32_t ___height1, String_t* ___mimeType2, int32_t ___orientation3, const RuntimeMethod* method)
{
	int32_t _offset = 1;
	ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD * _thisAdjusted = reinterpret_cast<ImageProperties_t4DA708E8E70CE3231F7E847959B135125D49CEBD *>(__this + _offset);
	ImageProperties__ctor_m4887094C011E2F53ABEF3389856C2B232A754A55(_thisAdjusted, ___width0, ___height1, ___mimeType2, ___orientation3, method);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C  void DelegatePInvokeWrapper_MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * __this, String_t* ___path0, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc)(char*);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(((RuntimeDelegate*)__this)->method->nativeFunction);

	// Marshaling of parameter '___path0' to native representation
	char* ____path0_marshaled = NULL;
	____path0_marshaled = il2cpp_codegen_marshal_string(___path0);

	// Native function invocation
	il2cppPInvokeFunc(____path0_marshaled);

	// Marshaling cleanup of parameter '___path0' native representation
	il2cpp_codegen_marshal_free(____path0_marshaled);
	____path0_marshaled = NULL;

}
// System.Void NativeGallery/MediaPickCallback::.ctor(System.Object,System.IntPtr)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickCallback__ctor_m5495FA5584F7658867EB24041BE5394AC6CEA2E2 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * __this, RuntimeObject * ___object0, intptr_t ___method1, const RuntimeMethod* method)
{
	__this->set_method_ptr_0(il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1));
	__this->set_method_3(___method1);
	__this->set_m_target_2(___object0);
}
// System.Void NativeGallery/MediaPickCallback::Invoke(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickCallback_Invoke_m63EDCBEBE0133626823ADEA1566C8F71785D6B26 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * __this, String_t* ___path0, const RuntimeMethod* method)
{
	DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86* delegateArrayToInvoke = __this->get_delegates_11();
	Delegate_t** delegatesToInvoke;
	il2cpp_array_size_t length;
	if (delegateArrayToInvoke != NULL)
	{
		length = delegateArrayToInvoke->max_length;
		delegatesToInvoke = reinterpret_cast<Delegate_t**>(delegateArrayToInvoke->GetAddressAtUnchecked(0));
	}
	else
	{
		length = 1;
		delegatesToInvoke = reinterpret_cast<Delegate_t**>(&__this);
	}

	for (il2cpp_array_size_t i = 0; i < length; i++)
	{
		Delegate_t* currentDelegate = delegatesToInvoke[i];
		Il2CppMethodPointer targetMethodPointer = currentDelegate->get_method_ptr_0();
		RuntimeObject* targetThis = currentDelegate->get_m_target_2();
		RuntimeMethod* targetMethod = (RuntimeMethod*)(currentDelegate->get_method_3());
		if (!il2cpp_codegen_method_is_virtual(targetMethod))
		{
			il2cpp_codegen_raise_execution_engine_exception_if_method_is_not_found(targetMethod);
		}
		bool ___methodIsStatic = MethodIsStatic(targetMethod);
		int ___parameterCount = il2cpp_codegen_method_parameter_count(targetMethod);
		if (___methodIsStatic)
		{
			if (___parameterCount == 1)
			{
				// open
				typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___path0, targetMethod);
			}
			else
			{
				// closed
				typedef void (*FunctionPointerType) (void*, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___path0, targetMethod);
			}
		}
		else if (___parameterCount != 1)
		{
			// open
			if (il2cpp_codegen_method_is_virtual(targetMethod) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker0::Invoke(targetMethod, ___path0);
					else
						GenericVirtActionInvoker0::Invoke(targetMethod, ___path0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), ___path0);
					else
						VirtActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), ___path0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___path0, targetMethod);
			}
		}
		else
		{
			// closed
			if (targetThis != NULL && il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker1< String_t* >::Invoke(targetMethod, targetThis, ___path0);
					else
						GenericVirtActionInvoker1< String_t* >::Invoke(targetMethod, targetThis, ___path0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker1< String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), targetThis, ___path0);
					else
						VirtActionInvoker1< String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), targetThis, ___path0);
				}
			}
			else
			{
				if (targetThis == NULL && il2cpp_codegen_class_is_value_type(il2cpp_codegen_method_get_declaring_type(targetMethod)))
				{
					typedef void (*FunctionPointerType) (RuntimeObject*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)((reinterpret_cast<RuntimeObject*>(___path0) - 1), targetMethod);
				}
				if (targetThis == NULL)
				{
					typedef void (*FunctionPointerType) (String_t*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)(___path0, targetMethod);
				}
				else
				{
					typedef void (*FunctionPointerType) (void*, String_t*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)(targetThis, ___path0, targetMethod);
				}
			}
		}
	}
}
// System.IAsyncResult NativeGallery/MediaPickCallback::BeginInvoke(System.String,System.AsyncCallback,System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* MediaPickCallback_BeginInvoke_m5F6FF67412BD926940C530B4A8DE87E3E85CC656 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * __this, String_t* ___path0, AsyncCallback_t3F3DA3BEDAEE81DD1D24125DF8EB30E85EE14DA4 * ___callback1, RuntimeObject * ___object2, const RuntimeMethod* method)
{
	void *__d_args[2] = {0};
	__d_args[0] = ___path0;
	return (RuntimeObject*)il2cpp_codegen_delegate_begin_invoke((RuntimeDelegate*)__this, __d_args, (RuntimeDelegate*)___callback1, (RuntimeObject*)___object2);
}
// System.Void NativeGallery/MediaPickCallback::EndInvoke(System.IAsyncResult)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickCallback_EndInvoke_m2E13DE6F43B8B1AAAEBE6B30721B16C786E82F56 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * __this, RuntimeObject* ___result0, const RuntimeMethod* method)
{
	il2cpp_codegen_delegate_end_invoke((Il2CppAsyncResult*) ___result0, 0);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C  void DelegatePInvokeWrapper_MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * __this, StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* ___paths0, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc)(char**);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(((RuntimeDelegate*)__this)->method->nativeFunction);

	// Marshaling of parameter '___paths0' to native representation
	char** ____paths0_marshaled = NULL;
	if (___paths0 != NULL)
	{
		il2cpp_array_size_t ____paths0_Length = (___paths0)->max_length;
		____paths0_marshaled = il2cpp_codegen_marshal_allocate_array<char*>(____paths0_Length + 1);
		(____paths0_marshaled)[____paths0_Length] = NULL;
		for (int32_t i = 0; i < ARRAY_LENGTH_AS_INT32(____paths0_Length); i++)
		{
			(____paths0_marshaled)[i] = il2cpp_codegen_marshal_string((___paths0)->GetAtUnchecked(static_cast<il2cpp_array_size_t>(i)));
		}
	}
	else
	{
		____paths0_marshaled = NULL;
	}

	// Native function invocation
	il2cppPInvokeFunc(____paths0_marshaled);

	// Marshaling cleanup of parameter '___paths0' native representation
	if (____paths0_marshaled != NULL)
	{
		const il2cpp_array_size_t ____paths0_marshaled_CleanupLoopCount = (___paths0 != NULL) ? (___paths0)->max_length : 0;
		for (int32_t i = 0; i < ARRAY_LENGTH_AS_INT32(____paths0_marshaled_CleanupLoopCount); i++)
		{
			il2cpp_codegen_marshal_free((____paths0_marshaled)[i]);
			(____paths0_marshaled)[i] = NULL;
		}
		il2cpp_codegen_marshal_free(____paths0_marshaled);
		____paths0_marshaled = NULL;
	}

}
// System.Void NativeGallery/MediaPickMultipleCallback::.ctor(System.Object,System.IntPtr)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickMultipleCallback__ctor_m15B0526E89B314C03FF2F4884A37DF8CE170C76C (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * __this, RuntimeObject * ___object0, intptr_t ___method1, const RuntimeMethod* method)
{
	__this->set_method_ptr_0(il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1));
	__this->set_method_3(___method1);
	__this->set_m_target_2(___object0);
}
// System.Void NativeGallery/MediaPickMultipleCallback::Invoke(System.String[])
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickMultipleCallback_Invoke_m730BAC86FDA2FF4E477B8EB143C4B245E47EF59E (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * __this, StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* ___paths0, const RuntimeMethod* method)
{
	DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86* delegateArrayToInvoke = __this->get_delegates_11();
	Delegate_t** delegatesToInvoke;
	il2cpp_array_size_t length;
	if (delegateArrayToInvoke != NULL)
	{
		length = delegateArrayToInvoke->max_length;
		delegatesToInvoke = reinterpret_cast<Delegate_t**>(delegateArrayToInvoke->GetAddressAtUnchecked(0));
	}
	else
	{
		length = 1;
		delegatesToInvoke = reinterpret_cast<Delegate_t**>(&__this);
	}

	for (il2cpp_array_size_t i = 0; i < length; i++)
	{
		Delegate_t* currentDelegate = delegatesToInvoke[i];
		Il2CppMethodPointer targetMethodPointer = currentDelegate->get_method_ptr_0();
		RuntimeObject* targetThis = currentDelegate->get_m_target_2();
		RuntimeMethod* targetMethod = (RuntimeMethod*)(currentDelegate->get_method_3());
		if (!il2cpp_codegen_method_is_virtual(targetMethod))
		{
			il2cpp_codegen_raise_execution_engine_exception_if_method_is_not_found(targetMethod);
		}
		bool ___methodIsStatic = MethodIsStatic(targetMethod);
		int ___parameterCount = il2cpp_codegen_method_parameter_count(targetMethod);
		if (___methodIsStatic)
		{
			if (___parameterCount == 1)
			{
				// open
				typedef void (*FunctionPointerType) (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___paths0, targetMethod);
			}
			else
			{
				// closed
				typedef void (*FunctionPointerType) (void*, StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___paths0, targetMethod);
			}
		}
		else if (___parameterCount != 1)
		{
			// open
			if (il2cpp_codegen_method_is_virtual(targetMethod) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker0::Invoke(targetMethod, ___paths0);
					else
						GenericVirtActionInvoker0::Invoke(targetMethod, ___paths0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), ___paths0);
					else
						VirtActionInvoker0::Invoke(il2cpp_codegen_method_get_slot(targetMethod), ___paths0);
				}
			}
			else
			{
				typedef void (*FunctionPointerType) (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___paths0, targetMethod);
			}
		}
		else
		{
			// closed
			if (targetThis != NULL && il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker1< StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* >::Invoke(targetMethod, targetThis, ___paths0);
					else
						GenericVirtActionInvoker1< StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* >::Invoke(targetMethod, targetThis, ___paths0);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker1< StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), targetThis, ___paths0);
					else
						VirtActionInvoker1< StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), targetThis, ___paths0);
				}
			}
			else
			{
				if (targetThis == NULL && il2cpp_codegen_class_is_value_type(il2cpp_codegen_method_get_declaring_type(targetMethod)))
				{
					typedef void (*FunctionPointerType) (RuntimeObject*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)((reinterpret_cast<RuntimeObject*>(___paths0) - 1), targetMethod);
				}
				if (targetThis == NULL)
				{
					typedef void (*FunctionPointerType) (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)(___paths0, targetMethod);
				}
				else
				{
					typedef void (*FunctionPointerType) (void*, StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)(targetThis, ___paths0, targetMethod);
				}
			}
		}
	}
}
// System.IAsyncResult NativeGallery/MediaPickMultipleCallback::BeginInvoke(System.String[],System.AsyncCallback,System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* MediaPickMultipleCallback_BeginInvoke_m18DB72EF4E445DC8F905985178A25633F448D6A4 (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * __this, StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* ___paths0, AsyncCallback_t3F3DA3BEDAEE81DD1D24125DF8EB30E85EE14DA4 * ___callback1, RuntimeObject * ___object2, const RuntimeMethod* method)
{
	void *__d_args[2] = {0};
	__d_args[0] = ___paths0;
	return (RuntimeObject*)il2cpp_codegen_delegate_begin_invoke((RuntimeDelegate*)__this, __d_args, (RuntimeDelegate*)___callback1, (RuntimeObject*)___object2);
}
// System.Void NativeGallery/MediaPickMultipleCallback::EndInvoke(System.IAsyncResult)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaPickMultipleCallback_EndInvoke_m80B97AAEBA775D79793C7A9FC5B39EA547ABA8BA (MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * __this, RuntimeObject* ___result0, const RuntimeMethod* method)
{
	il2cpp_codegen_delegate_end_invoke((Il2CppAsyncResult*) ___result0, 0);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
IL2CPP_EXTERN_C  void DelegatePInvokeWrapper_MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * __this, bool ___success0, String_t* ___path1, const RuntimeMethod* method)
{
	typedef void (DEFAULT_CALL *PInvokeFunc)(int32_t, char*);
	PInvokeFunc il2cppPInvokeFunc = reinterpret_cast<PInvokeFunc>(((RuntimeDelegate*)__this)->method->nativeFunction);

	// Marshaling of parameter '___path1' to native representation
	char* ____path1_marshaled = NULL;
	____path1_marshaled = il2cpp_codegen_marshal_string(___path1);

	// Native function invocation
	il2cppPInvokeFunc(static_cast<int32_t>(___success0), ____path1_marshaled);

	// Marshaling cleanup of parameter '___path1' native representation
	il2cpp_codegen_marshal_free(____path1_marshaled);
	____path1_marshaled = NULL;

}
// System.Void NativeGallery/MediaSaveCallback::.ctor(System.Object,System.IntPtr)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaSaveCallback__ctor_m889D9FBC8154B2B57CEBE9AA06EDE7CE53397EB7 (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * __this, RuntimeObject * ___object0, intptr_t ___method1, const RuntimeMethod* method)
{
	__this->set_method_ptr_0(il2cpp_codegen_get_method_pointer((RuntimeMethod*)___method1));
	__this->set_method_3(___method1);
	__this->set_m_target_2(___object0);
}
// System.Void NativeGallery/MediaSaveCallback::Invoke(System.Boolean,System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaSaveCallback_Invoke_m3999037DB5B5D6616E750064620751D8DB2A281F (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * __this, bool ___success0, String_t* ___path1, const RuntimeMethod* method)
{
	DelegateU5BU5D_tDFCDEE2A6322F96C0FE49AF47E9ADB8C4B294E86* delegateArrayToInvoke = __this->get_delegates_11();
	Delegate_t** delegatesToInvoke;
	il2cpp_array_size_t length;
	if (delegateArrayToInvoke != NULL)
	{
		length = delegateArrayToInvoke->max_length;
		delegatesToInvoke = reinterpret_cast<Delegate_t**>(delegateArrayToInvoke->GetAddressAtUnchecked(0));
	}
	else
	{
		length = 1;
		delegatesToInvoke = reinterpret_cast<Delegate_t**>(&__this);
	}

	for (il2cpp_array_size_t i = 0; i < length; i++)
	{
		Delegate_t* currentDelegate = delegatesToInvoke[i];
		Il2CppMethodPointer targetMethodPointer = currentDelegate->get_method_ptr_0();
		RuntimeObject* targetThis = currentDelegate->get_m_target_2();
		RuntimeMethod* targetMethod = (RuntimeMethod*)(currentDelegate->get_method_3());
		if (!il2cpp_codegen_method_is_virtual(targetMethod))
		{
			il2cpp_codegen_raise_execution_engine_exception_if_method_is_not_found(targetMethod);
		}
		bool ___methodIsStatic = MethodIsStatic(targetMethod);
		int ___parameterCount = il2cpp_codegen_method_parameter_count(targetMethod);
		if (___methodIsStatic)
		{
			if (___parameterCount == 2)
			{
				// open
				typedef void (*FunctionPointerType) (bool, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(___success0, ___path1, targetMethod);
			}
			else
			{
				// closed
				typedef void (*FunctionPointerType) (void*, bool, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___success0, ___path1, targetMethod);
			}
		}
		else
		{
			// closed
			if (targetThis != NULL && il2cpp_codegen_method_is_virtual(targetMethod) && !il2cpp_codegen_object_is_of_sealed_type(targetThis) && il2cpp_codegen_delegate_has_invoker((Il2CppDelegate*)__this))
			{
				if (il2cpp_codegen_method_is_generic_instance(targetMethod))
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						GenericInterfaceActionInvoker2< bool, String_t* >::Invoke(targetMethod, targetThis, ___success0, ___path1);
					else
						GenericVirtActionInvoker2< bool, String_t* >::Invoke(targetMethod, targetThis, ___success0, ___path1);
				}
				else
				{
					if (il2cpp_codegen_method_is_interface_method(targetMethod))
						InterfaceActionInvoker2< bool, String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), il2cpp_codegen_method_get_declaring_type(targetMethod), targetThis, ___success0, ___path1);
					else
						VirtActionInvoker2< bool, String_t* >::Invoke(il2cpp_codegen_method_get_slot(targetMethod), targetThis, ___success0, ___path1);
				}
			}
			else
			{
				if (targetThis == NULL && il2cpp_codegen_class_is_value_type(il2cpp_codegen_method_get_declaring_type(targetMethod)))
				{
					typedef void (*FunctionPointerType) (RuntimeObject*, String_t*, const RuntimeMethod*);
					((FunctionPointerType)targetMethodPointer)((reinterpret_cast<RuntimeObject*>(&___success0) - 1), ___path1, targetMethod);
				}
				typedef void (*FunctionPointerType) (void*, bool, String_t*, const RuntimeMethod*);
				((FunctionPointerType)targetMethodPointer)(targetThis, ___success0, ___path1, targetMethod);
			}
		}
	}
}
// System.IAsyncResult NativeGallery/MediaSaveCallback::BeginInvoke(System.Boolean,System.String,System.AsyncCallback,System.Object)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR RuntimeObject* MediaSaveCallback_BeginInvoke_m399CA83C99E784BED783143A9A349263685A4A1C (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * __this, bool ___success0, String_t* ___path1, AsyncCallback_t3F3DA3BEDAEE81DD1D24125DF8EB30E85EE14DA4 * ___callback2, RuntimeObject * ___object3, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (MediaSaveCallback_BeginInvoke_m399CA83C99E784BED783143A9A349263685A4A1C_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	void *__d_args[3] = {0};
	__d_args[0] = Box(Boolean_tB53F6830F670160873277339AA58F15CAED4399C_il2cpp_TypeInfo_var, &___success0);
	__d_args[1] = ___path1;
	return (RuntimeObject*)il2cpp_codegen_delegate_begin_invoke((RuntimeDelegate*)__this, __d_args, (RuntimeDelegate*)___callback2, (RuntimeObject*)___object3);
}
// System.Void NativeGallery/MediaSaveCallback::EndInvoke(System.IAsyncResult)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void MediaSaveCallback_EndInvoke_m18FD403EC2650BF1868A67AF71869778A5C364F1 (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * __this, RuntimeObject* ___result0, const RuntimeMethod* method)
{
	il2cpp_codegen_delegate_end_invoke((Il2CppAsyncResult*) ___result0, 0);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void NativeGallery/VideoProperties::.ctor(System.Int32,System.Int32,System.Int64,System.Single)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void VideoProperties__ctor_mFEAE01935E87AE233A7EA239997ED5C325D732AA (VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409 * __this, int32_t ___width0, int32_t ___height1, int64_t ___duration2, float ___rotation3, const RuntimeMethod* method)
{
	{
		// this.width = width;
		int32_t L_0 = ___width0;
		__this->set_width_0(L_0);
		// this.height = height;
		int32_t L_1 = ___height1;
		__this->set_height_1(L_1);
		// this.duration = duration;
		int64_t L_2 = ___duration2;
		__this->set_duration_2(L_2);
		// this.rotation = rotation;
		float L_3 = ___rotation3;
		__this->set_rotation_3(L_3);
		// }
		return;
	}
}
IL2CPP_EXTERN_C  void VideoProperties__ctor_mFEAE01935E87AE233A7EA239997ED5C325D732AA_AdjustorThunk (RuntimeObject * __this, int32_t ___width0, int32_t ___height1, int64_t ___duration2, float ___rotation3, const RuntimeMethod* method)
{
	int32_t _offset = 1;
	VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409 * _thisAdjusted = reinterpret_cast<VideoProperties_t3F6D823A49ED4974B6CBF9B267BA6165DE2A8409 *>(__this + _offset);
	VideoProperties__ctor_mFEAE01935E87AE233A7EA239997ED5C325D732AA(_thisAdjusted, ___width0, ___height1, ___duration2, ___rotation3, method);
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Boolean NativeGalleryNamespace.NGMediaReceiveCallbackiOS::get_IsBusy()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR bool NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536 (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// public static bool IsBusy { get; private set; }
		bool L_0 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_U3CIsBusyU3Ek__BackingField_8();
		return L_0;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::set_IsBusy(System.Boolean)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1 (bool ___value0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// public static bool IsBusy { get; private set; }
		bool L_0 = ___value0;
		((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->set_U3CIsBusyU3Ek__BackingField_8(L_0);
		return;
	}
}
IL2CPP_EXTERN_C int32_t DEFAULT_CALL _NativeGallery_IsMediaPickerBusy();
// System.Int32 NativeGalleryNamespace.NGMediaReceiveCallbackiOS::_NativeGallery_IsMediaPickerBusy()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR int32_t NGMediaReceiveCallbackiOS__NativeGallery_IsMediaPickerBusy_m1A933706D0F7692B6903EE7A9B5FC9ADDA51F1A8 (const RuntimeMethod* method)
{
	typedef int32_t (DEFAULT_CALL *PInvokeFunc) ();

	// Native function invocation
	int32_t returnValue = reinterpret_cast<PInvokeFunc>(_NativeGallery_IsMediaPickerBusy)();

	return returnValue;
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::Initialize(NativeGallery/MediaPickCallback,NativeGallery/MediaPickMultipleCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_Initialize_m42081AEDDFA2FFBF12D98CC91BFD1AA353CD10E8 (MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * ___callback0, MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * ___callbackMultiple1, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_Initialize_m42081AEDDFA2FFBF12D98CC91BFD1AA353CD10E8_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( IsBusy )
		bool L_0 = NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_inline(/*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_0008;
		}
	}
	{
		// return;
		return;
	}

IL_0008:
	{
		// if( instance == null )
		NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * L_1 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_instance_4();
		IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
		bool L_2 = Object_op_Equality_mBC2401774F3BE33E8CF6F0A8148E66C95D6CFF1C(L_1, (Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 *)NULL, /*hidden argument*/NULL);
		if (!L_2)
		{
			goto IL_0038;
		}
	}
	{
		// instance = new GameObject( "NGMediaReceiveCallbackiOS" ).AddComponent<NGMediaReceiveCallbackiOS>();
		GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * L_3 = (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F *)il2cpp_codegen_object_new(GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F_il2cpp_TypeInfo_var);
		GameObject__ctor_mBB454E679AD9CF0B84D3609A01E6A9753ACF4686(L_3, _stringLiteralF1786D5D9BDB111F25FFD27805EA7BA70D7D856E, /*hidden argument*/NULL);
		NullCheck(L_3);
		NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * L_4 = GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_mB7F5F3B119B04E28416C77CEC62EDAAACC4CFC4D(L_3, /*hidden argument*/GameObject_AddComponent_TisNGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_mB7F5F3B119B04E28416C77CEC62EDAAACC4CFC4D_RuntimeMethod_var);
		((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->set_instance_4(L_4);
		// DontDestroyOnLoad( instance.gameObject );
		NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * L_5 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_instance_4();
		NullCheck(L_5);
		GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * L_6 = Component_get_gameObject_m0B0570BA8DDD3CD78A9DB568EA18D7317686603C(L_5, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
		Object_DontDestroyOnLoad_m4DC90770AD6084E4B1B8489C6B41205DC020C207(L_6, /*hidden argument*/NULL);
	}

IL_0038:
	{
		// instance.callback = callback;
		NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * L_7 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_instance_4();
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_8 = ___callback0;
		NullCheck(L_7);
		L_7->set_callback_5(L_8);
		// instance.callbackMultiple = callbackMultiple;
		NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * L_9 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_instance_4();
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_10 = ___callbackMultiple1;
		NullCheck(L_9);
		L_9->set_callbackMultiple_6(L_10);
		// instance.nextBusyCheckTime = Time.realtimeSinceStartup + 1f;
		NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * L_11 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_instance_4();
		float L_12 = Time_get_realtimeSinceStartup_mCA1086EC9DFCF135F77BC46D3B7127711EA3DE03(/*hidden argument*/NULL);
		NullCheck(L_11);
		L_11->set_nextBusyCheckTime_7(((float)il2cpp_codegen_add((float)L_12, (float)(1.0f))));
		// IsBusy = true;
		NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_inline((bool)1, /*hidden argument*/NULL);
		// }
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::Update()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_Update_m1A6AA508217661179E1CA9EBB9C2B217C595E1F0 (NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * __this, const RuntimeMethod* method)
{
	MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * V_0 = NULL;
	MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * V_1 = NULL;
	{
		// if( IsBusy )
		bool L_0 = NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_inline(/*hidden argument*/NULL);
		if (!L_0)
		{
			goto IL_0062;
		}
	}
	{
		// if( Time.realtimeSinceStartup >= nextBusyCheckTime )
		float L_1 = Time_get_realtimeSinceStartup_mCA1086EC9DFCF135F77BC46D3B7127711EA3DE03(/*hidden argument*/NULL);
		float L_2 = __this->get_nextBusyCheckTime_7();
		if ((!(((float)L_1) >= ((float)L_2))))
		{
			goto IL_0062;
		}
	}
	{
		// nextBusyCheckTime = Time.realtimeSinceStartup + 1f;
		float L_3 = Time_get_realtimeSinceStartup_mCA1086EC9DFCF135F77BC46D3B7127711EA3DE03(/*hidden argument*/NULL);
		__this->set_nextBusyCheckTime_7(((float)il2cpp_codegen_add((float)L_3, (float)(1.0f))));
		// if( _NativeGallery_IsMediaPickerBusy() == 0 )
		int32_t L_4 = NGMediaReceiveCallbackiOS__NativeGallery_IsMediaPickerBusy_m1A933706D0F7692B6903EE7A9B5FC9ADDA51F1A8(/*hidden argument*/NULL);
		if (L_4)
		{
			goto IL_0062;
		}
	}
	{
		// IsBusy = false;
		NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_inline((bool)0, /*hidden argument*/NULL);
		// NativeGallery.MediaPickCallback _callback = callback;
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_5 = __this->get_callback_5();
		V_0 = L_5;
		// callback = null;
		__this->set_callback_5((MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B *)NULL);
		// NativeGallery.MediaPickMultipleCallback _callbackMultiple = callbackMultiple;
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_6 = __this->get_callbackMultiple_6();
		V_1 = L_6;
		// callbackMultiple = null;
		__this->set_callbackMultiple_6((MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C *)NULL);
		// if( _callback != null )
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_7 = V_0;
		if (!L_7)
		{
			goto IL_0058;
		}
	}
	{
		// _callback( null );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_8 = V_0;
		NullCheck(L_8);
		MediaPickCallback_Invoke_m63EDCBEBE0133626823ADEA1566C8F71785D6B26(L_8, (String_t*)NULL, /*hidden argument*/NULL);
	}

IL_0058:
	{
		// if( _callbackMultiple != null )
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_9 = V_1;
		if (!L_9)
		{
			goto IL_0062;
		}
	}
	{
		// _callbackMultiple( null );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_10 = V_1;
		NullCheck(L_10);
		MediaPickMultipleCallback_Invoke_m730BAC86FDA2FF4E477B8EB143C4B245E47EF59E(L_10, (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)NULL, /*hidden argument*/NULL);
	}

IL_0062:
	{
		// }
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::OnMediaReceived(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_OnMediaReceived_mE581298E1CD3A848D949748888DF25323D09E13C (NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * __this, String_t* ___path0, const RuntimeMethod* method)
{
	MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * V_0 = NULL;
	{
		// IsBusy = false;
		NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_inline((bool)0, /*hidden argument*/NULL);
		// if( string.IsNullOrEmpty( path ) )
		String_t* L_0 = ___path0;
		bool L_1 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_0, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0011;
		}
	}
	{
		// path = null;
		___path0 = (String_t*)NULL;
	}

IL_0011:
	{
		// NativeGallery.MediaPickCallback _callback = callback;
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_2 = __this->get_callback_5();
		V_0 = L_2;
		// callback = null;
		__this->set_callback_5((MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B *)NULL);
		// if( _callback != null )
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_3 = V_0;
		if (!L_3)
		{
			goto IL_0029;
		}
	}
	{
		// _callback( path );
		MediaPickCallback_tEB6DF9DBF07DFCE70B19B5F7F900A8E1D1A24C0B * L_4 = V_0;
		String_t* L_5 = ___path0;
		NullCheck(L_4);
		MediaPickCallback_Invoke_m63EDCBEBE0133626823ADEA1566C8F71785D6B26(L_4, L_5, /*hidden argument*/NULL);
	}

IL_0029:
	{
		// }
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::OnMultipleMediaReceived(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_OnMultipleMediaReceived_m17497E466555E528CEB539BC746DDB7B18ABB452 (NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * __this, String_t* ___paths0, const RuntimeMethod* method)
{
	StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* V_0 = NULL;
	MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * V_1 = NULL;
	{
		// IsBusy = false;
		NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_inline((bool)0, /*hidden argument*/NULL);
		// string[] _paths = SplitPaths( paths );
		String_t* L_0 = ___paths0;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_1 = NGMediaReceiveCallbackiOS_SplitPaths_mB0EAF48CA4095A30E0204927DE5A2696A4A905B7(__this, L_0, /*hidden argument*/NULL);
		V_0 = L_1;
		// if( _paths != null && _paths.Length == 0 )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_2 = V_0;
		if (!L_2)
		{
			goto IL_0017;
		}
	}
	{
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_3 = V_0;
		NullCheck(L_3);
		if ((((RuntimeArray*)L_3)->max_length))
		{
			goto IL_0017;
		}
	}
	{
		// _paths = null;
		V_0 = (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)NULL;
	}

IL_0017:
	{
		// NativeGallery.MediaPickMultipleCallback _callbackMultiple = callbackMultiple;
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_4 = __this->get_callbackMultiple_6();
		V_1 = L_4;
		// callbackMultiple = null;
		__this->set_callbackMultiple_6((MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C *)NULL);
		// if( _callbackMultiple != null )
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_5 = V_1;
		if (!L_5)
		{
			goto IL_002f;
		}
	}
	{
		// _callbackMultiple( _paths );
		MediaPickMultipleCallback_t94C832404A22FC87CA4D16514282CB5E75D3EF9C * L_6 = V_1;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_7 = V_0;
		NullCheck(L_6);
		MediaPickMultipleCallback_Invoke_m730BAC86FDA2FF4E477B8EB143C4B245E47EF59E(L_6, L_7, /*hidden argument*/NULL);
	}

IL_002f:
	{
		// }
		return;
	}
}
// System.String[] NativeGalleryNamespace.NGMediaReceiveCallbackiOS::SplitPaths(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* NGMediaReceiveCallbackiOS_SplitPaths_mB0EAF48CA4095A30E0204927DE5A2696A4A905B7 (NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * __this, String_t* ___paths0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_SplitPaths_mB0EAF48CA4095A30E0204927DE5A2696A4A905B7_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* V_0 = NULL;
	StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* V_1 = NULL;
	int32_t V_2 = 0;
	int32_t V_3 = 0;
	StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* V_4 = NULL;
	int32_t V_5 = 0;
	int32_t V_6 = 0;
	{
		// string[] result = null;
		V_0 = (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)NULL;
		// if( !string.IsNullOrEmpty( paths ) )
		String_t* L_0 = ___paths0;
		bool L_1 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_0, /*hidden argument*/NULL);
		if (L_1)
		{
			goto IL_0087;
		}
	}
	{
		// string[] pathsSplit = paths.Split( '>' );
		String_t* L_2 = ___paths0;
		CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* L_3 = (CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2*)(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2*)SZArrayNew(CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2_il2cpp_TypeInfo_var, (uint32_t)1);
		CharU5BU5D_t4CC6ABF0AD71BEC97E3C2F1E9C5677E46D3A75C2* L_4 = L_3;
		NullCheck(L_4);
		(L_4)->SetAt(static_cast<il2cpp_array_size_t>(0), (Il2CppChar)((int32_t)62));
		NullCheck(L_2);
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_5 = String_Split_m13262358217AD2C119FD1B9733C3C0289D608512(L_2, L_4, /*hidden argument*/NULL);
		V_1 = L_5;
		// int validPathCount = 0;
		V_2 = 0;
		// for( int i = 0; i < pathsSplit.Length; i++ )
		V_3 = 0;
		goto IL_0034;
	}

IL_0022:
	{
		// if( !string.IsNullOrEmpty( pathsSplit[i] ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_6 = V_1;
		int32_t L_7 = V_3;
		NullCheck(L_6);
		int32_t L_8 = L_7;
		String_t* L_9 = (L_6)->GetAt(static_cast<il2cpp_array_size_t>(L_8));
		bool L_10 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_9, /*hidden argument*/NULL);
		if (L_10)
		{
			goto IL_0030;
		}
	}
	{
		// validPathCount++;
		int32_t L_11 = V_2;
		V_2 = ((int32_t)il2cpp_codegen_add((int32_t)L_11, (int32_t)1));
	}

IL_0030:
	{
		// for( int i = 0; i < pathsSplit.Length; i++ )
		int32_t L_12 = V_3;
		V_3 = ((int32_t)il2cpp_codegen_add((int32_t)L_12, (int32_t)1));
	}

IL_0034:
	{
		// for( int i = 0; i < pathsSplit.Length; i++ )
		int32_t L_13 = V_3;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_14 = V_1;
		NullCheck(L_14);
		if ((((int32_t)L_13) < ((int32_t)(((int32_t)((int32_t)(((RuntimeArray*)L_14)->max_length)))))))
		{
			goto IL_0022;
		}
	}
	{
		// if( validPathCount == 0 )
		int32_t L_15 = V_2;
		if (L_15)
		{
			goto IL_0046;
		}
	}
	{
		// pathsSplit = new string[0];
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_16 = (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)SZArrayNew(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E_il2cpp_TypeInfo_var, (uint32_t)0);
		V_1 = L_16;
		goto IL_0085;
	}

IL_0046:
	{
		// else if( validPathCount != pathsSplit.Length )
		int32_t L_17 = V_2;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_18 = V_1;
		NullCheck(L_18);
		if ((((int32_t)L_17) == ((int32_t)(((int32_t)((int32_t)(((RuntimeArray*)L_18)->max_length)))))))
		{
			goto IL_0085;
		}
	}
	{
		// string[] validPaths = new string[validPathCount];
		int32_t L_19 = V_2;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_20 = (StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E*)SZArrayNew(StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E_il2cpp_TypeInfo_var, (uint32_t)L_19);
		V_4 = L_20;
		// for( int i = 0, j = 0; i < pathsSplit.Length; i++ )
		V_5 = 0;
		// for( int i = 0, j = 0; i < pathsSplit.Length; i++ )
		V_6 = 0;
		goto IL_007b;
	}

IL_005c:
	{
		// if( !string.IsNullOrEmpty( pathsSplit[i] ) )
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_21 = V_1;
		int32_t L_22 = V_5;
		NullCheck(L_21);
		int32_t L_23 = L_22;
		String_t* L_24 = (L_21)->GetAt(static_cast<il2cpp_array_size_t>(L_23));
		bool L_25 = String_IsNullOrEmpty_m06A85A206AC2106D1982826C5665B9BD35324229(L_24, /*hidden argument*/NULL);
		if (L_25)
		{
			goto IL_0075;
		}
	}
	{
		// validPaths[j++] = pathsSplit[i];
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_26 = V_4;
		int32_t L_27 = V_6;
		int32_t L_28 = L_27;
		V_6 = ((int32_t)il2cpp_codegen_add((int32_t)L_28, (int32_t)1));
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_29 = V_1;
		int32_t L_30 = V_5;
		NullCheck(L_29);
		int32_t L_31 = L_30;
		String_t* L_32 = (L_29)->GetAt(static_cast<il2cpp_array_size_t>(L_31));
		NullCheck(L_26);
		ArrayElementTypeCheck (L_26, L_32);
		(L_26)->SetAt(static_cast<il2cpp_array_size_t>(L_28), (String_t*)L_32);
	}

IL_0075:
	{
		// for( int i = 0, j = 0; i < pathsSplit.Length; i++ )
		int32_t L_33 = V_5;
		V_5 = ((int32_t)il2cpp_codegen_add((int32_t)L_33, (int32_t)1));
	}

IL_007b:
	{
		// for( int i = 0, j = 0; i < pathsSplit.Length; i++ )
		int32_t L_34 = V_5;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_35 = V_1;
		NullCheck(L_35);
		if ((((int32_t)L_34) < ((int32_t)(((int32_t)((int32_t)(((RuntimeArray*)L_35)->max_length)))))))
		{
			goto IL_005c;
		}
	}
	{
		// pathsSplit = validPaths;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_36 = V_4;
		V_1 = L_36;
	}

IL_0085:
	{
		// result = pathsSplit;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_37 = V_1;
		V_0 = L_37;
	}

IL_0087:
	{
		// return result;
		StringU5BU5D_t933FB07893230EA91C40FF900D5400665E87B14E* L_38 = V_0;
		return L_38;
	}
}
// System.Void NativeGalleryNamespace.NGMediaReceiveCallbackiOS::.ctor()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS__ctor_mB4FC86A67E10A4E924BBB37C25F1657F3BBA1C6D (NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6 * __this, const RuntimeMethod* method)
{
	{
		MonoBehaviour__ctor_mEAEC84B222C60319D593E456D769B3311DFCEF97(__this, /*hidden argument*/NULL);
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
#ifdef __clang__
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Winvalid-offsetof"
#pragma clang diagnostic ignored "-Wunused-variable"
#endif
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::Initialize(NativeGallery/MediaSaveCallback)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaSaveCallbackiOS_Initialize_m53B8975819EF4C0612C5B00C3B03C496B1AE6464 (MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * ___callback0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaSaveCallbackiOS_Initialize_m53B8975819EF4C0612C5B00C3B03C496B1AE6464_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// if( instance == null )
		NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * L_0 = ((NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var))->get_instance_4();
		IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
		bool L_1 = Object_op_Equality_mBC2401774F3BE33E8CF6F0A8148E66C95D6CFF1C(L_0, (Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0 *)NULL, /*hidden argument*/NULL);
		if (!L_1)
		{
			goto IL_0032;
		}
	}
	{
		// instance = new GameObject( "NGMediaSaveCallbackiOS" ).AddComponent<NGMediaSaveCallbackiOS>();
		GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * L_2 = (GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F *)il2cpp_codegen_object_new(GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F_il2cpp_TypeInfo_var);
		GameObject__ctor_mBB454E679AD9CF0B84D3609A01E6A9753ACF4686(L_2, _stringLiteralF339FE7C9DD4741BECBD12D0DE696B820BDAC3AB, /*hidden argument*/NULL);
		NullCheck(L_2);
		NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * L_3 = GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_mCA927EF486B961DDF90EF5835D3275EA5CAC5BFA(L_2, /*hidden argument*/GameObject_AddComponent_TisNGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_mCA927EF486B961DDF90EF5835D3275EA5CAC5BFA_RuntimeMethod_var);
		((NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var))->set_instance_4(L_3);
		// DontDestroyOnLoad( instance.gameObject );
		NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * L_4 = ((NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var))->get_instance_4();
		NullCheck(L_4);
		GameObject_tBD1244AD56B4E59AAD76E5E7C9282EC5CE434F0F * L_5 = Component_get_gameObject_m0B0570BA8DDD3CD78A9DB568EA18D7317686603C(L_4, /*hidden argument*/NULL);
		IL2CPP_RUNTIME_CLASS_INIT(Object_tAE11E5E46CD5C37C9F3E8950C00CD8B45666A2D0_il2cpp_TypeInfo_var);
		Object_DontDestroyOnLoad_m4DC90770AD6084E4B1B8489C6B41205DC020C207(L_5, /*hidden argument*/NULL);
		// }
		goto IL_004f;
	}

IL_0032:
	{
		// else if( instance.callback != null )
		NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * L_6 = ((NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var))->get_instance_4();
		NullCheck(L_6);
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_7 = L_6->get_callback_5();
		if (!L_7)
		{
			goto IL_004f;
		}
	}
	{
		// instance.callback( false, null );
		NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * L_8 = ((NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var))->get_instance_4();
		NullCheck(L_8);
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_9 = L_8->get_callback_5();
		NullCheck(L_9);
		MediaSaveCallback_Invoke_m3999037DB5B5D6616E750064620751D8DB2A281F(L_9, (bool)0, (String_t*)NULL, /*hidden argument*/NULL);
	}

IL_004f:
	{
		// instance.callback = callback;
		NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * L_10 = ((NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8_il2cpp_TypeInfo_var))->get_instance_4();
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_11 = ___callback0;
		NullCheck(L_10);
		L_10->set_callback_5(L_11);
		// }
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::OnMediaSaveCompleted(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaSaveCallbackiOS_OnMediaSaveCompleted_mD0040CCC3CD6C4D534E79FC07EA41ED56600C26F (NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * __this, String_t* ___message0, const RuntimeMethod* method)
{
	MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * V_0 = NULL;
	{
		// NativeGallery.MediaSaveCallback _callback = callback;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_0 = __this->get_callback_5();
		V_0 = L_0;
		// callback = null;
		__this->set_callback_5((MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D *)NULL);
		// if( _callback != null )
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_1 = V_0;
		if (!L_1)
		{
			goto IL_0019;
		}
	}
	{
		// _callback( true, null );
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_2 = V_0;
		NullCheck(L_2);
		MediaSaveCallback_Invoke_m3999037DB5B5D6616E750064620751D8DB2A281F(L_2, (bool)1, (String_t*)NULL, /*hidden argument*/NULL);
	}

IL_0019:
	{
		// }
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::OnMediaSaveFailed(System.String)
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaSaveCallbackiOS_OnMediaSaveFailed_m8E6855BB0B605D7188C4120B735B5A52611E550B (NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * __this, String_t* ___error0, const RuntimeMethod* method)
{
	MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * V_0 = NULL;
	{
		// NativeGallery.MediaSaveCallback _callback = callback;
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_0 = __this->get_callback_5();
		V_0 = L_0;
		// callback = null;
		__this->set_callback_5((MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D *)NULL);
		// if( _callback != null )
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_1 = V_0;
		if (!L_1)
		{
			goto IL_0019;
		}
	}
	{
		// _callback( false, null );
		MediaSaveCallback_tB112A30BAF7BB21A3F1057DA1835FD93C329058D * L_2 = V_0;
		NullCheck(L_2);
		MediaSaveCallback_Invoke_m3999037DB5B5D6616E750064620751D8DB2A281F(L_2, (bool)0, (String_t*)NULL, /*hidden argument*/NULL);
	}

IL_0019:
	{
		// }
		return;
	}
}
// System.Void NativeGalleryNamespace.NGMediaSaveCallbackiOS::.ctor()
IL2CPP_EXTERN_C IL2CPP_METHOD_ATTR void NGMediaSaveCallbackiOS__ctor_mE027269E879CEC10217E50AC572B907B8C3B9B29 (NGMediaSaveCallbackiOS_t4C8650ADECE070C754608BEE6CFCD3BDBC273EC8 * __this, const RuntimeMethod* method)
{
	{
		MonoBehaviour__ctor_mEAEC84B222C60319D593E456D769B3311DFCEF97(__this, /*hidden argument*/NULL);
		return;
	}
}
#ifdef __clang__
#pragma clang diagnostic pop
#endif
IL2CPP_EXTERN_C inline  IL2CPP_METHOD_ATTR bool NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536_inline (const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_get_IsBusy_m36C9106061246C630D2C30C35FB73892A3861536NativeGallery_Runtime_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// public static bool IsBusy { get; private set; }
		bool L_0 = ((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->get_U3CIsBusyU3Ek__BackingField_8();
		return L_0;
	}
}
IL2CPP_EXTERN_C inline  IL2CPP_METHOD_ATTR int32_t String_get_Length_mD48C8A16A5CF1914F330DCE82D9BE15C3BEDD018_inline (String_t* __this, const RuntimeMethod* method)
{
	{
		int32_t L_0 = __this->get_m_stringLength_0();
		return L_0;
	}
}
IL2CPP_EXTERN_C inline  IL2CPP_METHOD_ATTR void NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1_inline (bool ___value0, const RuntimeMethod* method)
{
	static bool s_Il2CppMethodInitialized;
	if (!s_Il2CppMethodInitialized)
	{
		il2cpp_codegen_initialize_method (NGMediaReceiveCallbackiOS_set_IsBusy_m0312368402058D21796A193B9D454B53E106E1D1NativeGallery_Runtime_MetadataUsageId);
		s_Il2CppMethodInitialized = true;
	}
	{
		// public static bool IsBusy { get; private set; }
		bool L_0 = ___value0;
		((NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_StaticFields*)il2cpp_codegen_static_fields_for(NGMediaReceiveCallbackiOS_t0622024E2281E3B0D59F4990FC43D1CC10A9E8D6_il2cpp_TypeInfo_var))->set_U3CIsBusyU3Ek__BackingField_8(L_0);
		return;
	}
}
