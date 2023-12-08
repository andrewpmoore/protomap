import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';


// Define the callback signatures
typedef OnReceivedBufferC = Int32 Function(Pointer<Void> inst, Pointer<Uint8> buffer, Uint32 size);
typedef OnReceivedBufferDart = int Function(Pointer<Void> inst, Pointer<Uint8> buffer, int size);

typedef IprsRemoteDllInitCoreC = Int32 Function();
typedef IprsRemoteDllInitCoreDart = int Function();

typedef IprsRemoteDllTerminateCoreC = Int32 Function();
typedef IprsRemoteDllTerminateCoreDart = int Function();

typedef IprsRemoteDllExecuteC = Int32 Function(Pointer<Utf8> instruction);
typedef IprsRemoteDllExecuteDart = int Function(Pointer<Utf8> instruction);

typedef IprsRemoteDllSetReceiverC = Void Function(Pointer<Void> inst, Pointer<NativeFunction<OnReceivedBufferC>> receivedBufCb);
typedef IprsRemoteDllSetReceiverDart = void Function(Pointer<Void> inst, Pointer<NativeFunction<OnReceivedBufferC>> receivedBufCb);



class FFIBridge {

  static late DynamicLibrary nativeIprsLib;
  static late Function iprsRemoteDllInitCore;
  static late Function iprsRemoteDllSetReceiver;
  static late Function iprsRemoteDllExecute;
  static late Function iprsRemoteDllTerminateCore;

  bool initialize() {
    nativeIprsLib = Platform.isMacOS || Platform.isIOS
        ? DynamicLibrary.process() // macos and ios
        : (DynamicLibrary.open(Platform.isWindows // windows
        ? 'iprs_remote_dll.dll'
        : 'iprs_remote.so')); // android and linux

    // Declare the C/C++ functions
    final int Function() iprsRemoteDllInitCore = nativeIprsLib
        .lookup<NativeFunction<IprsRemoteDllInitCoreC>>('iprsRemoteDllInitCore').asFunction();

    final int Function() iprsRemoteDllTerminateCore = nativeIprsLib
        .lookup<NativeFunction<IprsRemoteDllTerminateCoreC>>('iprsRemoteDllTerminateCore').asFunction();

    final int Function(Pointer<Utf8> instruction) iprsRemoteDllExecute = nativeIprsLib
        .lookup<NativeFunction<IprsRemoteDllExecuteC>>('iprsRemoteDllExecute').asFunction();

    final void Function(Pointer<Void> inst, Pointer<NativeFunction<OnReceivedBufferC>> receivedBufCb) iprsRemoteDllSetReceiver = nativeIprsLib
        .lookup<NativeFunction<IprsRemoteDllSetReceiverC>>('iprsRemoteDllSetReceiver').asFunction();

    return true;
  }

  bool initIPRSClientConnection()
  {
    // Initialise IPRS
    int err = iprsRemoteDllInitCore();
    // if(ECIERR_OK != err) {
    //   TCHAR tszText[256];
    //   _stprintf(tszText, L"Error %u initializing core (%s)\n", err, ecierr_text(err));
    //   MessageBox(NULL, tszText, L"Error", MB_OK | MB_ICONEXCLAMATION);
    //   return false;
    // }
    iprsRemoteDllSetReceiver(this, onReceivedBuffer);

    iprsRemoteDllExecute(this, "set username vince");

    return true;
  }


  bool onReceivedBuffer(void inst, String buffer, int size)
  {
    print(buffer);
    return true;
  }
}
