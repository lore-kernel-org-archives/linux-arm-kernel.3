Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A67E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxDN94VjY5Tfw/+YeGpHbdFHDGKXquQPEXNHLfYwjCk=; b=XRj+1+eUwkNDRxvoIen/2+xBdj
	kbzXeps+KeUQOD5uMAsESDz3tIXPlZQ/EEyVisiUwAAC2WnjQ7EuWLu5d6dSo14HgDLIhkelPPwPh
	dlqZqmctUCgjZyMS9yRHKeunZbYv/OEE9Oguu0yag83l2TfDnU7uvF9u+snjpwLEwZwkIsjiTaTrZ
	i158rWqAfHC3ctW3lrNaIaPkHmfDH4nCdFZ8mWWKw3lIsZMtJdKrs9NsjlTmFlfla/lH36tLPfrGd
	tCCngrOCOZR8+Uea4KgkVOFeqI4xivzxPKDRN1CW8+WP3yoJL/H2t/nVjrbKVZTWpsqF7ahBvqgZw
	m6dTCtUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSMbm-00000005omg-01VU;
	Mon, 30 Dec 2024 20:43:26 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSMaa-00000005oir-0QdX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 20:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1735591324; x=1736196124; i=wahrenst@gmx.net;
	bh=xxDN94VjY5Tfw/+YeGpHbdFHDGKXquQPEXNHLfYwjCk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UkfuTfcsPKxtQzHUDjxymT/lXKCqIzKBJEc46ApcALfIPAk6zHvwtbvu5RdUSJsb
	 8qv3lp7Q46+D6fEgB55K23+Kx9Qw8UNNFCnNDfHkIbCXiIO2MN2OCPdYvYEsFKzQO
	 XwM2U+6bSwVKYlyFMHgRZGTZxmzoFJJQxlf9DoKzm2P+q+nxNAo8pQnMlkqasyoaM
	 NQA/8EzC1QLJ/J/8qpgsU17Je4gSVdUR6C37A3lWhhRqeCtr/P1cYUdtbRfsQfqwB
	 REJg/2FsVSGk7mWuWNsw4ZwvxPBoLpbdcwUV1thgcTxYIUD5HXW6hnNmbI5aQnWqE
	 mgVSUA6BJTZZSnIodg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHEJ-1tyhSS3L9n-00euVP; Mon, 30
 Dec 2024 21:42:03 +0100
Message-ID: <c2b6aa36-69f9-4056-84fb-8c6e0b3cc84c@gmx.net>
Date: Mon, 30 Dec 2024 21:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pcie-brcmstb: failed to enter low-power link state (L23)
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>, Jonathan Bell <jonathan@raspberrypi.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kernel-list@raspberrypi.com
References: <ee21345c-6baa-45fb-8807-1c836ac36963@gmx.net>
 <fc99b12d-b8b0-44d7-ac23-07454164fe79@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <fc99b12d-b8b0-44d7-ac23-07454164fe79@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EG1kbc/GXu8FkCb2JWqZBak7XIo8IucBeaLLaY3bayW2Gp/+za9
 ZGOdpm5UXxQXC43wTmgE9TaPLkLatTUfHj7pDF4vtzoztldVCU+mRnWHNMgYPwbNM99IH5U
 s0j4BX4+c9JR24JDCL41MZkNBU1hCS1kjhDcLlSOleHu3IhbcxGcYQMKdc7IX+yDfOWWi6Q
 7CrdTr2ZlZNkLKNwRxf+A==
UI-OutboundReport: notjunk:1;M01:P0:QVF3Y7vHATY=;neE9x04i0+KtGLQWVoFiNhpcNZH
 WTWHvONjU9JbsbFH3UImi5S4fb6fOOzsqjBBS4mE1oejBObwG8EBgKQSUjg5WCb2hGem4viML
 8V/QSRDNrWNjtgxqce3XsLk0HrVDJZ0EydiSsisKs3FiafNHvc3HPsxs3vaqK2q+9s6vPzZrS
 c+epejoEszTW2AeGg+mcE8yjh+EsLEljjyfdf6P/uiU7V8Zyi1Jn6HWmn2Vh6bRoTMPCjCc1a
 4gulnBVicaVTFGJW4iKPjSWLxY2sOa7nfuF0sbJ8tXovwbpoj9sypMY1ap+Lqny0tgYPY1vS3
 OCLOcGgfxIUTRYX6ldztrWB6nYLyn3gqHZjUHsEPJlbXslilnponBoVYXhWISA+algXu2n2Ws
 Er1dEHyS4JIBOzh8x5ltB/A7FxaKuzgLdlvkPvXKnqi916ODnZjgnsjcEOJmgQpkhUqY6xMdn
 esjCelUzJ5niamf4AG36tSJHDaF9tW3KQtc0Eh4NYzaDQIM/OS6dhUxZ8nkqexiPiZY1lJkjK
 qsNph+ciXPmfugWMzIlimEEI7JCp6lZ3hIK/2i6g0CojSGGFHUMqEAyRIJpKyd7aNUpo74zat
 f047nCA0uSDIjVluCpk3YWgddZNZ0novZjbQnhCTiODPnm8R3lWTK807kTXswtWQ8tgpnLYZv
 Daobfs9ZxJwKwP1LyNR3MA/eYSnosDJ3f+gNchA75daoRYqF+A8vuGRkk6tNXnBf0SNU+lYnt
 nv0uF6SVe2e5ucd7dP+V09tkxFqSJxjUxPT8+cXiq+8UjdJUIC3g7/sNYWET8hUS3iXeDrpYg
 tJArpXeAQtnaEGvlSlXCSTa5ClmaCTk35E/E0B/qsKvUzSX5IJBp5a9euPob1hWlrRJ6Vwe6v
 QpN2EwsOSZgObBaFVIkjOlvMCWaq0foGCyKrtAN8RP2rHyU5N7zejOAmJyLzlNptejXmgx7iO
 VtiFuYj47jkZQw4DUPnhsVDEU8ZQsmTDOujL+w1YQeWodeoVLrgvM8vBJMLw97XOxVK/Ei491
 Xi1Zl+mur+fzcLSlB9Iw/2yuzEVPase91y4wlE/AW3XO43dy69ry/fUrHurUeZvypOpuxLC1Y
 pQHo1BD/9MV+bv3N6xsH8xQ2V8Ilcu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_124212_435243_778CAF7B 
X-CRM114-Status: GOOD (  16.05  )
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

Hi Florian,

Am 30.12.24 um 19:47 schrieb Florian Fainelli:
> Hi Stefan,
>
> On 12/27/24 04:44, Stefan Wahren wrote:
>> Hi,
>> I did some experiments with s2idle on Raspberry Pi 4 (8 GB RAM,
>> arm64/defconfig) and noticed that pcie-brcmstb fails to enter L23 state
>> during suspend. I don't have any clue about PCI or this specific IP.
>>
>> Here is my current working branch [1], because s2idle on BCM2711
>> currently requires some quirks.
>>
>> In order to help, I just added a simple dump of possible relevant
>> registers at the begin of brcm_pcie_enter_l23():
>>
>> [=C2=A0=C2=A0 46.822440] PM: suspend entry (s2idle)
>> [=C2=A0=C2=A0 47.050887] Filesystems sync: 0.228 seconds
>> [=C2=A0=C2=A0 47.152159] Freezing user space processes
>> [=C2=A0=C2=A0 47.154443] Freezing user space processes completed (elaps=
ed 0.002
>> seconds)
>> [=C2=A0=C2=A0 47.154472] OOM killer disabled.
>> [=C2=A0=C2=A0 47.154475] Freezing remaining freezable tasks
>> [=C2=A0=C2=A0 47.155742] Freezing remaining freezable tasks completed (=
elapsed
>> 0.001 seconds)
>> [=C2=A0=C2=A0 48.797565] PM: suspend of devices complete after 1641.374=
 msecs
>> [=C2=A0=C2=A0 48.797580] PM: start suspend of devices complete after 16=
41.829
>> msecs
>> [=C2=A0=C2=A0 48.798059] PM: late suspend of devices complete after 0.4=
73 msecs
>> [=C2=A0=C2=A0 48.810510] brcm-pcie fd500000.pcie:
>> PCIE_RC_CFG_PRIV1_LINK_CAPABILITY: 00315e12
>> [=C2=A0=C2=A0 48.810519] brcm-pcie fd500000.pcie: PCIE_RC_CFG_PRIV1_ROO=
T_CAP:
>> 0000000f
>> [=C2=A0=C2=A0 48.810523] brcm-pcie fd500000.pcie: PCIE_MISC_HARD_PCIE_H=
ARD_DEBUG:
>> 00200000
>> [=C2=A0=C2=A0 48.810528] brcm-pcie fd500000.pcie: PCIE_MISC_MISC_CTRL: =
88003480
>> [=C2=A0=C2=A0 48.810532] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_CTRL: =
00000000
>> [=C2=A0=C2=A0 48.810535] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_STATUS=
: 000000b0
>> [=C2=A0=C2=A0 48.846632] brcm-pcie fd500000.pcie: failed to enter low-p=
ower
>> link state
>> [=C2=A0=C2=A0 48.846640] xhci_hcd 0000:01:00.0: Possible wake-up device=
;
>> regulators will not be disabled
>> [=C2=A0=C2=A0 48.846725] PM: noirq suspend of devices complete after 48=
.628 msecs
>> [=C2=A0=C2=A0 48.846730] PM: suspend-to-idle
>> [=C2=A0=C2=A0 53.672017] PM: Triggering wakeup from IRQ 25
>> [=C2=A0=C2=A0 53.672032] PM: resume from suspend-to-idle
>>
>> Does BCM2711 support L23 mode?
>
> AFAICT it does, but the end-point might not, and this is not
> considered a fatal error, in fact we should probably demote this message=
.
Agree, this match my observations with the CM4, which didn't have any
PCI end point connected and didn't show this error.

In case L23 state is optional, i agree this shouldn't be an error
message. Maybe the comments for this functions should be extended.

I reported this issue, because i thought this is the root cause why the
XHCI controller isn't available after resume. Seems to be a red hering.

> Would you have the lspci -vvv of the XHCI controller, too?

Sure

pi@raspberrypi:~$ lspci -vvv
00:00.0 PCI bridge: Broadcom Inc. and subsidiaries BCM2711 PCIe Bridge
(rev 10) (prog-if 00 [Normal decode])
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device tree node:
/sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O- Mem+ BusMaster+ =
SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB=
2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt: pin A routed to IRQ=
 39
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bus: primary=3D00, secondary=
=3D01, subordinate=3D01, sec-latency=3D0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I/O behind bridge: 00000000-00=
000fff [size=3D4K]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory behind bridge: f8000000=
-f80fffff [size=3D1M]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Prefetchable memory behind bri=
dge:
00000000fff00000-00000000000fffff [disabled]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Secondary status: 66MHz- FastB=
2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BridgeCtl: Parity- SERR- NoISA=
- VGA- VGA16- MAbort- >Reset-
FastB2B-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: <access denied>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: pcieport

01:00.0 USB controller: VIA Technologies, Inc. VL805 USB 3.0 Host
Controller (rev 01) (prog-if 30 [XHCI])
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: VIA Technologies, I=
nc. VL805 USB 3.0 Host Controller
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device tree node:
/sys/firmware/devicetree/base/scb/pcie@7d500000/pci@0,0/usb@0,0
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Control: I/O- Mem+ BusMaster+ =
SpecCycle- MemWINV- VGASnoop-
ParErr+ Stepping- SERR+ FastB2B- DisINTx+
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Status: Cap+ 66MHz- UDF- FastB=
2B- ParErr- DEVSEL=3Dfast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Latency: 0, Cache Line Size: 6=
4 bytes
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Interrupt: pin A routed to IRQ=
 41
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Region 0: Memory at 600000000 =
(64-bit, non-prefetchable) [size=3D4K]
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: <access denied>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: xhci_hcd


