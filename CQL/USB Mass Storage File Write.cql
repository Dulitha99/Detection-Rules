#event_simpleName=/.*FileWritten/
| IsOnRemovableDisk=1

| rename(DiskParentDeviceInstanceId, as=DeviceInstanceId)

| join(
    {
        #event_simpleName=DcUsbDeviceConnected
        | DevicePropertyDeviceDescription="USB Mass Storage Device"
    },
    field=DeviceInstanceId,
    include=[
        DeviceManufacturer,
        DeviceProduct,
        DeviceSerialNumber,
        DeviceVendorId,
        DeviceProductId,
        DevicePropertyDeviceDescription,
        DevicePropertyClassName,
        DeviceUsbClass,
        DeviceUsbVersion,
        DeviceTimeStamp,
        DcPolicyAction,
        DeviceUserName,
        DeviceUserDomain
    ]
)

| groupBy(
    [
        aid,
        ComputerName,
        UserName,
        DeviceInstanceId
    ],
    function=[
        count(as=FilesWritten),
        sum(Size, as=TotalBytesWritten),
        collect(TargetFileName),
        collect(FileName),
        collect(Size),
        collect(ContextBaseFileName),
        collect(DeviceManufacturer),
        collect(DeviceProduct),
        collect(DeviceSerialNumber),
        collect(DeviceVendorId),
        collect(DeviceProductId),
        collect(DevicePropertyDeviceDescription),
        collect(DevicePropertyClassName),
        collect(DcPolicyAction),
        collect(DeviceUserName),
        collect(DeviceUserDomain),
        collect(LocalAddressIP4),
        min(timestamp, as=FirstWriteTime),
        max(timestamp, as=LastWriteTime)
    ]
)

| TotalBytesWritten > 5242880
