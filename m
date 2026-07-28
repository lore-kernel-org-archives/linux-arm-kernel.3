Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3B7C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cc5wg12tqwTBOwJ67VWXEAgClJcA4TpX/SK+bdEQpI0=; b=W0nDgZHE3BBVO5MS0XQOl/slTv
	0RZqtI6eqP6nr8wp4tWmbcDCNzEVzcgjK+0i318hIXZUzLtFS4h0pqgFqMQ0Qyw+JqeYPj8L6TeO3
	BANGy2Y4rMAobI5acYuAaJMgiTGCgcP9iSSVJAsVO+iXMXf4B8CuNoZ6ziuX1PUrcpEd8YvQBrmUx
	kAAW4r70MQi2chZMj+vTjgwtn1rORoulq3wNQz5irlgsMj7vfDNVeb4Q+KnBy869lDgBlqmvXeW3g
	CBOPUyxaHc6UDnlkNETeR1RDnZvYf03dmIa6fwNulNp2C3dpZFKbzPEH3JpmdYUHCZUC9ikplKkdQ
	RxZUtxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woj3k-00000005Xd5-043T;
	Tue, 28 Jul 2026 14:45:32 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woj3h-00000005Xbv-1jiZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:45:30 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=eZwInGNsa6ReMfcqs8CTGI43ZysY8pZMj1Sidd+d1AfcQ7BHSVl/733uR9lN06EUrJs6OV2z20wJ2ztqJ7S6/DoH0Q6VnZ5kxmwLAYkBzBBZPLmJHmLrsF8Ua3U7QqlZVlcq6K6jjdmK61xNhxjVj+qX0vDaWXclKwSf1QwAjEKSQJ/DwtJfTZgPn66hM8TA6o28Fc2NpLEPIzibPNU9KeLmf0yWpbWIQfxHr0kLkXmVPXVLm3f/DfNdvKSDQm9TR5eR0f3WuqmMJek7nCHnC/QsGQaFSBz7EGJfK2g1gfUCLoDOvqYFX9sXozjSIaCAXmo7FNToUUtrs36k3OhslA==; s=purelymail3; d=rcpassos.me; v=1; bh=O+EunIaQuvuAl6mYIdHtaHmtFznc9bUOIDoAFlXeg5s=; h=Received:Date:From:To:Subject;
DKIM-Signature: a=rsa-sha256; b=jlzYklcQXD/DOKtZIA648V4a8hSY2EscTLMzkfsMWamDA0RNShxDdDla6ILuZtDLkOKwbpOICG2Ke06cQnEh/6/XIazK3s3jvqOfP99O8e4dxfE03zpzbQa16ay80R+iRI7YjX3FzvveUh0fpht2G7ik+Xrsh529fRvwvO23zT81AbajB4ARWAGWgzRACgSGs3swjrMkb/p+JURiSUrYaxunZB1h5lISQwCMm8eyfMsVBfew+PjvZgIOk2wYfRvMo55hloe/quKIl7c1odtb+P1zL3eeIu7W2Q4hGLLTAbfAlQQl5e3IFYBT8FdMBcUiyiDajzBnyKFQwbdnMHd0Nw==; s=purelymail3; d=purelymail.com; v=1; bh=O+EunIaQuvuAl6mYIdHtaHmtFznc9bUOIDoAFlXeg5s=; h=Feedback-ID:Received:Date:From:To:Subject;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2061556761;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 28 Jul 2026 14:45:08 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 11:45:03 -0300
Message-Id: <DKAA9VN5E4DS.2U03T6V5HEAAE@rcpassos.me>
Cc: "Luiz Augusto von Dentz" <luiz.von.dentz@intel.com>,
 =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?utf-8?b?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?utf-8?b?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Rong Zhang" <i@rong.moe>, "Rafael Passos" <rafael@rcpassos.me>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
X-Mailer: aerc 0.21.0
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
 <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
 <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
 <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
 <F16A2A9A-A43F-45FE-8CC0-44A129360D47@rong.moe>
 <DKA8F33O8HID.2UV2DWTLE6S48@rcpassos.me>
 <133c4858657c55b31affd4bff1cbd68f812de5e1.camel@rong.moe>
In-Reply-To: <133c4858657c55b31affd4bff1cbd68f812de5e1.camel@rong.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_074529_535250_EB7942E0 
X-CRM114-Status: GOOD (  15.11  )
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

Hi Rong,

On Tue Jul 28, 2026 at 11:00 AM -03, Rong Zhang wrote:
>> I believe its a hub connected to the chipset.
>>=20
>> /:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, =
480M
>>     | ...
>>     |__ Port 008: Dev 004, If 0, Class=3DWireless, Driver=3Dbtusb, 480M
>>=20
>> In the block diagram on the manual [1], Key "E" Wifi is tied
>> to the AMD PROM21 CHipset.
>
> Yes, and no.
>
> The block diagram indicates that the NIC card's PCIe interface (note the
> "x1") is connected to the chipset, without any mention of its USB
> interface.
>
> Based on the bus number (001), it's more likely a root hub of the SoC
> instead of the chipset.
>
> You can check the root hub's PCI path with
>
>    realpath /sys/bus/usb/devices/usb1
>
> Then you can cross-check with the PCI topology, i.e., `lspci -tnnnvvv'.

Interesting!

lspci -tnnnvvv
-[0000:00]-+-00.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge=
 Root Complex [1022:14d8]
           +-00.2  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge=
 IOMMU [1022:14d9]
           +-01.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge=
 Dummy Host Bridge [1022:14da]
           +-01.1-[01-03]----00.0-[02-03]----00.0-[03]--+-00.0  Advanced Mi=
cro Devices, Inc. [AMD/ATI] Navi 21 [Radeon RX 6800/6800 XT / 6900 XT] [100=
2:73bf]
           |                                            \-00.1  Advanced Mi=
cro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
           +-02.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge=
 Dummy Host Bridge [1022:14da]
           +-02.1-[04-0e]----00.0-[05-0e]--+-00.0-[06]--
           |                               +-02.0-[07]----00.0  MEDIATEK Co=
rp. MT7925 (RZ717) Wi-Fi 7 160MHz [14c3:0717]
           |                               +-03.0-[08]----00.0  Realtek Sem=
iconductor Co., Ltd. RTL8125 2.5GbE Controller [10ec:8125]
           ...


realpath /sys/bus/usb/devices/usb1
/sys/devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:0d:00.0=
/usb1
                ------               --------------------
                /                    |
        This matches the             \--and this matches the chain before
        root complex                    the MT7925.

Am I on the right path ?

>> It is integrated (soldered) to my motherboard.
>
> Huh? How can an M.2 "Key E WiFi" expansion card being soldered to a
> "vertical M.2 socket"?
>
> AFAIK, once the metal shield(s) are unscrewed, it should be replaceable,
> see
> https://www.techpowerup.com/review/asrock-b850-steel-legend-wi-fi/4.html
>
> But it doesn't matter anyway since the issue has gone ;-)

Oh ! Its vertical ! You nailed it!
I assumed it was soldered because there was no space there for a
horizontal layout (and I didnt try unscrewing it). Neat!

Thanks,
Rafael Passos


