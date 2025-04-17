Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E31EC369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 02:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrKLwquI8zlHwCmcvYouUws+LNMJVPBRxnJSH3TqZEo=; b=13u0/ws0IYuSw2tYSO1/dlj9Je
	8vOtMwH2lqTmI3T0quLjpJ84kbZ5Foc4zESCyBjb2Bt9mG4NQWn55Mo6fFPTGNIt/fpgvKRcjPq9b
	VCAyKvSUTZwjgLVoo0VAZ0wCquCDEulLTJCliQUxEPT5MN73O8wPY3cDGS2r5Gmu1Zw9U68rQ5fu6
	73mnJ1NcH+Wy+AsnbKfMRiqh6eLsmYy7R5Vate/punyBR+jV1Spov4FndCJeM/RrxtcEoVd8OEYQL
	L0yehuNLhiBzJNRuUQ8sMYcdfsIZ4m4iOC0XmSt6E16fpXdFuBHfrNif2Dt+HgWtBXqeSAHrD6KD3
	rZ8jwGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Esq-0000000BWSF-3kLf;
	Thu, 17 Apr 2025 02:21:44 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Eqx-0000000BWGl-31wA;
	Thu, 17 Apr 2025 02:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=wrKLwquI8zlHwCmcvYouUws+LNMJVPBRxnJSH3TqZEo=;
	b=TxHfXf0JNkDJq28oDhfkuSjz3NcQoj1Jh1u0c3idb0dCKsdxpeC39NTfPjeCqX
	rXyyizFUt+M5nFntEaPeVIdpJcnk5IM7tGum9evxpnx4yb986HMrIjKbhrcpQkMQ
	oHBPqNC0HJT2V+MjJsmkpLov3bZqG5ToAl4l1r6Ld2vUg=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3Xw0eZQBoZg1+AQ--.60903S2;
	Thu, 17 Apr 2025 10:19:13 +0800 (CST)
Message-ID: <bb40385c-6839-484c-90b2-d6c7ecb95ba9@163.com>
Date: Thu, 17 Apr 2025 10:19:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, thomas.richard@bootlin.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250416204051.GA78956@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250416204051.GA78956@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3Xw0eZQBoZg1+AQ--.60903S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3uFyrXF4DZrWkKF1rXFW5KFg_yoWDuw4kpF
	WqqFsrKrW8JayagFs2yF48CF4Utrn2yay3Kr9xW34Uta12grWDt3sI9rn8Z3WxAr1F93W2
	yrWDt3yIqrn8JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uq0PhUUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwUyo2gAY2hPoAAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_191948_201656_C5631F55 
X-CRM114-Status: GOOD (  36.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2025/4/17 04:40, Bjorn Helgaas wrote:
> On Wed, Apr 16, 2025 at 11:19:26PM +0800, Hans Zhang wrote:
>> The RK3588's PCIe controller defaults to a 128-byte max payload size,
>> but its hardware capability actually supports 256 bytes. This results
>> in suboptimal performance with devices that support larger payloads.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> index c624b7ebd118..5bbb536a2576 100644
>> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
>> @@ -477,6 +477,22 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static void rockchip_pcie_set_max_payload(struct rockchip_pcie *rockchip)
>> +{
>> +	struct dw_pcie *pci = &rockchip->pci;
>> +	u32 dev_cap, dev_ctrl;
>> +	u16 offset;
>> +
>> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +	dev_cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCAP);
>> +	dev_cap &= PCI_EXP_DEVCAP_PAYLOAD;
>> +
>> +	dev_ctrl = dw_pcie_readl_dbi(pci, offset + PCI_EXP_DEVCTL);
>> +	dev_ctrl &= ~PCI_EXP_DEVCTL_PAYLOAD;
>> +	dev_ctrl |= dev_cap << 5;
>> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_DEVCTL, dev_ctrl);
>> +}
> 
> I can't really complain too much about this since meson does basically
> the same thing, but there are some things I don't like about this:
> 
>    - I don't think it's safe to set MPS higher in all cases.  If we set
>      the Root Port MPS=256, and an Endpoint only supports MPS=128, the
>      Endpoint may do a 256-byte DMA read (assuming its MRRS>=256).  In
>      that case the RP may respond with a 256-byte payload the Endpoint
>      can't handle.  The generic code in pci_configure_mps() might be
>      smart enough to avoid that situation, but I'm not confident about
>      it.  Maybe I could be convinced.
> 

Dear Bjorn,

Thank you very much for your reply. If we set the Root Port MPS=256, and 
an Endpoint only supports MPS=128. Finally, Root Port is also set to 
MPS=128 in pci_configure_mps.


lspci information before the patch was submitted:

root@firefly:~# lspci -vvv
00:00.0 PCI bridge: Fuzhou Rockchip Electronics Co., Ltd Device 3588 
(rev 01) (prog-if 00 [Normal decode])
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 73
         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
         I/O behind bridge: 0000f000-00000fff [disabled]
         Memory behind bridge: f0200000-f02fffff [size=1M]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         Expansion ROM at f0300000 [virtual] [disabled] [size=64K]
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2-,D3hot+,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable+ Count=16/32 Maskable+ 64bit+
                 Address: 00000000fe670040  Data: 0000
                 Masking: fffffeff  Pending: 00000000
         Capabilities: [70] Express (v2) Root Port (Slot-), MSI 08
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag+ RBE+
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 512 bytes


01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd 
Device a80c (prog-if 02 [NVM Express])
         Subsystem: Samsung Electronics Co Ltd Device a801
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 72
         Region 0: Memory at f0200000 (64-bit, non-prefetchable) [size=16K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable- Count=1/32 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [70] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 0.000W
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 128 bytes, MaxReadReq 512 bytes



lspci information after the patch was submitted:
root@firefly:~# lspci -vvv
00:00.0 PCI bridge: Fuzhou Rockchip Electronics Co., Ltd Device 3588 
(rev 01) (prog-if 00 [Normal decode])
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 73
         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
         I/O behind bridge: 0000f000-00000fff [disabled]
         Memory behind bridge: f0200000-f02fffff [size=1M]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         Expansion ROM at f0300000 [virtual] [disabled] [size=64K]
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2-,D3hot+,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable+ Count=16/32 Maskable+ 64bit+
                 Address: 00000000fe670040  Data: 0000
                 Masking: fffffeff  Pending: 00000000
         Capabilities: [70] Express (v2) Root Port (Slot-), MSI 08
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag+ RBE+
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes

01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd 
Device a80c (prog-if 02 [NVM Express])
         Subsystem: Samsung Electronics Co Ltd Device a801
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 72
         Region 0: Memory at f0200000 (64-bit, non-prefetchable) [size=16K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable- Count=1/32 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [70] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 0.000W
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes



Here are my tests and the NVMe SSD worked fine.

root@firefly:~# df -h
Filesystem           Size  Used Avail Use% Mounted on
......
/dev/nvme0n1         916G   28K  870G   1% /root/nvme
......
root@firefly:~#
root@firefly:~# ls -l nvme/
total 16
drwx------ 2 root root 16384 Dec 24 06:34 lost+found
root@firefly:~#
root@firefly:~# cd nvme/
root@firefly:~/nvme# time dd if=/dev/zero of=test bs=1M count=1024
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.875072 s, 1.2 GB/s

real    0m0.881s
user    0m0.001s
sys     0m0.874s
root@firefly:~/nvme# ls -l
total 1048596
drwx------ 2 root root      16384 Dec 24 06:34 lost+found
-rw-r--r-- 1 root root 1073741824 Apr 17 02:11 test
root@firefly:~/nvme# time cp -rf test test1

real    0m0.901s
user    0m0.005s
sys     0m0.889s
root@firefly:~/nvme# ls -lh
total 2.1G
drwx------ 2 root root  16K Dec 24 06:34 lost+found
-rw-r--r-- 1 root root 1.0G Apr 17 02:11 test
-rw-r--r-- 1 root root 1.0G Apr 17 02:12 test1



>    - There's nothing rockchip-specific about this.
> 
>    - It's very similar to meson_set_max_payload(), so it'd be nice to
>      share that code somehow.

The next version will be added to DWC.

> 
>    - The commit log is specific about Max_Payload_Size Supported being
>      256 bytes, but the patch actually reads the value from Device
>      Capabilities.
The commit log will be modified.

> 
>    - I'd like to see FIELD_PREP()/FIELD_GET() used when possible.
>      PCIE_LTSSM_STATUS_MASK is probably the only other place.
> 

Will change.

> These would be material for a separate patch:
> 

Thank you very much for your reminding and advice. I will submit another 
patch separately for modification.

>    - The #defines for register offsets and bits are kind of a mess,
>      e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
>      PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
>      PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
>      names, and they're not even defined together.
> 
>    - Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
>      PCIE_RDLH_LINK_UP_CHGED, which are in
>      PCIE_CLIENT_INTR_STATUS_MISC.
> 
>    - PCIE_LTSSM_ENABLE_ENHANCE is apparently in
>      PCIE_CLIENT_HOT_RESET_CTRL?  Sure wouldn't guess that from the
>      names or the order of #defines.
> 
>    - PCIE_CLIENT_GENERAL_DEBUG isn't used at all.

Will delete.


Best regard,
Hans

> 
>>   static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>>   				      struct rockchip_pcie *rockchip)
>>   {
>> @@ -511,6 +527,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>>   	pp->ops = &rockchip_pcie_host_ops;
>>   	pp->use_linkup_irq = true;
>>   
>> +	rockchip_pcie_set_max_payload(rockchip);
>> +
>>   	ret = dw_pcie_host_init(pp);
>>   	if (ret) {
>>   		dev_err(dev, "failed to initialize host\n");
>>
>> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
>> -- 
>> 2.25.1
>>


