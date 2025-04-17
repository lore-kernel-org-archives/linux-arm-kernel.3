Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38320C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hL2lxyNLK9Lw4I33AnMedhe2Sg2bxSiO1M7Cg/oEGJ4=; b=rxoindYrtX3VXyLnNUZpN/5w8Z
	lUyP54GrNcY6Iz/Ft6DWwl6ax3vk+Av8vZ7H+6zZh2X/zz6LCxDJ6uBT8xht0qVwIwyPpQwvYbxA0
	MUQ+RdNj2B9Bp925ZoLGmi/nxrV/TwPmvVa1HQdE3Xvz3q4s6QvL8KvTZx9VGMqJPKJfCSpt3uUVP
	RGWaLQairjyGsX73zwzETUxG6RdIVxTP25AHaI1LiuVMny6p3GNcLn6zyYMMHdJ8kEcGQyQWcmpGJ
	AViIqz6hATw8H8A6llxE92BP5piMoiLR4SE9dacS7SuoxJRQ32KXzWaMmETAajGpFSVQunx8CWdJv
	iQlcwbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LtZ-0000000CWGb-3Vu9;
	Thu, 17 Apr 2025 09:50:57 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Lri-0000000CVz0-2Yx0;
	Thu, 17 Apr 2025 09:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=hL2lxyNLK9Lw4I33AnMedhe2Sg2bxSiO1M7Cg/oEGJ4=;
	b=iCgWg4Nl0Gcm7cXFrN1Rp8Xwwn2SKnMrvwUHYk/cEwmHbwPOl6cpJKmFwMZJPs
	lyn4MS/HYP+bHx8pgmz3s/HnqwSp3dQz91/nhA4eD9y6O4n5byZAtdZLLkYcwGvx
	x9LJt2GB+AsfDZF0frdf66ZWReyiHBUXXD1I8I8Es9FAk=
Received: from [192.168.142.52] (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3_+lVzgBo48jBAQ--.33700S2;
	Thu, 17 Apr 2025 17:48:07 +0800 (CST)
Message-ID: <4c2a94b4-e483-426f-b7d8-ed98ac474c63@163.com>
Date: Thu, 17 Apr 2025 17:48:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org,
 kw@linux.com, bhelgaas@google.com, heiko@sntech.de,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 thomas.richard@bootlin.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250416151926.140202-1-18255117159@163.com>
 <aACoEpueUHBLjgbb@ryzen>
 <85643fe4-c7df-4d64-e852-60b66892470a@rock-chips.com>
 <aACsJPkSDOHbRAJM@ryzen>
 <ca283065-a48c-3b39-e70d-03d4c6c8a956@rock-chips.com>
 <aACyRp8S9c8azlw9@ryzen> <52a2f6dc-1e13-4473-80f2-989379df4e95@163.com>
 <aAC-VTqJpCqcz6NK@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aAC-VTqJpCqcz6NK@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD3_+lVzgBo48jBAQ--.33700S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrykWF1rZrWrAryDGr1rZwb_yoW5uFy7pF
	Z0gF45Kr48XayIgr4kAa18KFyUtr9xAFWaqr98W3yqvw17uryrKryq9a90ya4Uurn3Ja4f
	ArWkZrWYqF15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uf739UUUUU=
X-Originating-IP: [222.71.101.198]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxoyo2gAxuH92gAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_024903_038558_519E00B3 
X-CRM114-Status: GOOD (  19.72  )
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



On 2025/4/17 16:39, Niklas Cassel wrote:
> On Thu, Apr 17, 2025 at 04:07:51PM +0800, Hans Zhang wrote:
>> On 2025/4/17 15:48, Niklas Cassel wrote:
>>
>> Hi Niklas and Shawn,
>>
>> Thank you very much for your discussion and reply.
>>
>> I tested it on RK3588 and our platform. By setting pci=pcie_bus_safe, the
>> maximum MPS will be automatically matched in the end.
>>
>> So is my patch no longer needed? For RK3588, does the customer have to
>> configure CONFIG_PCIE_BUS_SAFE or pci=pcie_bus_safe?
>>
>> Also, for pci-meson.c, can the meson_set_max_payload be deleted?
> 
> I think the only reason why this works is because
> pcie_bus_configure_settings(), in the case of
> pcie_bus_config == PCIE_BUS_SAFE, will walk the bus and set MPS in
> the bridge to the lowest of the downstream devices:
> https://github.com/torvalds/linux/blob/v6.15-rc2/drivers/pci/probe.c#L2994-L2999
> 
> 
> So Hans, if you look at lspci for the other RCs/bridges that don't
> have any downstream devices connected, do they also show DevCtl.MPS 256B
> or do they still show 128B ?
> 

Hi Niklas,

It will show DevCtl.MPS 256B.


oot@firefly:~# lspci
00:00.0 PCI bridge: Fuzhou Rockchip Electronics Co., Ltd Device 3588 
(rev 01)
root@firefly:~# lspci -vvv
00:00.0 PCI bridge: Fuzhou Rockchip Electronics Co., Ltd Device 3588 
(rev 01) (prog-if 00 [Normal decode])
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 79
         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
         I/O behind bridge: 0000f000-00000fff [disabled]
         Memory behind bridge: fff00000-000fffff [disabled]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         Expansion ROM at f0200000 [virtual] [disabled] [size=64K]
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

Best regards,
Hans

> 
> One could argue that for all policies (execept for maybe PCIE_BUS_TUNE_OFF),
> pcie_bus_configure_settings() should start off by initializing DevCtl.MPS to
> DevCap.MPS (for the bridge itself), and after that pcie_bus_configure_settings()
> can override it depending on policy, e.g. set MPS to 128B in case of
> pcie_bus_config == PCIE_BUS_PEER2PEER, or walk the bus in case of
> pcie_bus_config == PCIE_BUS_SAFE.
> 
> That way, we should be able to remove the setting for pci-meson.c as well.
> 
> Bjorn, thoughts?
> 
> 
> Kind regards,
> Niklas


