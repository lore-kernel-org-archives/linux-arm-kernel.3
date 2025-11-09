Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7591CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CU4GWDfqf7B/dHmSi6jT8bWs5J1549k8lMdwIA0fCI=; b=iK6lo9TKdHTSqdSTZuEIDfAHsa
	as3aUPelD2Afsqmo5upOxMjfYM7EWp85w6S2CX6KRvkp3uqfeXqF5A24AVQw9n4z9y9n88KgudApH
	r6Vufquy+Ec2UtpQB64kgLckQrqJ0xe1ZnuMHVVzmd9bEYC4qJmRQQ/XbeCereyKH51S24xz7QdyE
	Cl0KN4qg0JUzoNhwV/H4OVCF3F4JvbWkmlPxtLoJGugGHhcKQHk3um45EYs5LiIHaGJTqsdhFQ7+I
	TnWOfvYBXYaQ2X/dGJeSxYSTnH9lBAEsGz/UEOcrjNIXfSaIu1+38HqyVTVqHkTPOesujm/k5aivF
	gc8USP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEpI-00000004V1G-20Mp;
	Sun, 09 Nov 2025 23:28:04 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIEpE-00000004Uzj-3H5x;
	Sun, 09 Nov 2025 23:28:02 +0000
X-QQ-mid: zesmtpip3t1762730819tde5730c0
X-QQ-Originating-IP: /NgVUa1Hm4yKathG8PIGfyt70MVAaoYNOhhfCI6iCDE=
Received: from [IPV6:240f:10b:7440:1:64e0:6ba: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Nov 2025 07:26:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12146803779019856956
Message-ID: <F8B2B6FA2884D69A+b7da13f2-0ffb-4308-b1ba-0549bc461be8@radxa.com>
Date: Mon, 10 Nov 2025 08:26:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: FUKAUMI Naoki <naoki@radxa.com>
Subject: [RESEND] Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Damien Le Moal
 <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 mani@kernel.org
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen> <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
 <aRCI5kG16_1erMME@ryzen>
Content-Language: en-US
In-Reply-To: <aRCI5kG16_1erMME@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Nz/pxMdGViHbyWXcHNbEYZo1XbVmN8eRFvyTYz1ZzkMzNrecsMN3HERM
	H1V5SRwNVMlPisNI0dYRpIkTMMtEEhcz5RWEhBA+OerTKLvq6i70aUdPK4fjLl71swc90bR
	MMPqpwscZvYqbCEfPHC5fOZcS6aH2LfKVAK1eUsVz+Y/DSRQy0Oy8MS5B3dSz8D+PHF00Ir
	mGdOscNAkwJeub18BCxv4hN4ltKbR/JdQ1PeYsOxAQt7xstaK6rgVzbhIjkbC2oRf/iI0bN
	bs0bz1oDGioEdetsApxTKOEhBKGi7P8jpMpqa+7Rn0SEu1MqloRr9y/f9RSAXNIrFjM+Rhy
	L32TSTGY+u4NhwLYsZKRtNMrkmEib99MPLUF3UJltcyCh9qrwq0NFYMg/xMsmsSUdIk3O3m
	9DcFIhFfUvOE5ZdLbr67V2gDDKdpz3HAAklNqpzEc+ohh4IlOicBSZm7kPGFrHy40Am2c71
	pnQGrtwWoH16rKA8rox0MhFrwHKkXLUvDOTRb+Z9oiagCtIiE2ouqwxMR+d21RhKnxvjBUh
	Raj1MtJa7ixDFHSreQlo564vijA/6XmR15acCGWGCrhHWgukpK7UN0LUM8bVAhgEpuDxvZN
	b2LsuHK6RZJXxaf+VFNvtvZvz1aaDKdL7XLuKij5sfFjx3MKdgKjz7lKe91+C0w785tzasV
	D8HHgu2Iu7OJRYS0pb1IRnApyXC5AdD3yQlcRNBIiqGtF1Y+ygK2mYjbrEDOf4dgsLPa5Oj
	dmXJ1igIGVmO7urBRhEbIqp/LgzzZBlBG7M+bGT5sA5Iik+NYPwwL7w4aS+ot6Io1cFettp
	pLc0FcGoED3oM+glELWbf644T9HVgZMljNYSitRmYpIMiRO4t97I/av4yZUAT4ZlEMBFliC
	pSgUbhk23RlflkxjMOCfWRfBzHKxu9dWMT+52l6gw0e4yxrE65ILq9Qc+g56z9+XBp/1AzN
	JQ9SDhMq+BFcEcG1t56DUC41wBpKDdurTYuIDfP2Rftt1zWXwYGq7tFuzpDECsed56RCs82
	H59jX//Un59R4q4b3LiGI09nVjzu/W6hiSvEG0Zk17FLepZc7S
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_152801_383282_01A05876 
X-CRM114-Status: GOOD (  21.27  )
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

(RESEND: fix mani's email address)

Hi Niklas,

On 11/9/25 21:28, Niklas Cassel wrote:
> On Sun, Nov 09, 2025 at 01:42:23PM +0900, FUKAUMI Naoki wrote:
>> Hi Niklas,
>>
>> On 11/8/25 22:27, Niklas Cassel wrote:
>> (snip)> (And btw. please test with the latest 6.18-rc, as, from experience,
>> the
>>> ASPM problems in earlier RCs can result in some weird problems that are
>>> not immediately deduced to be caused by the ASPM enablement.)
>>
>> Here is dmesg from v6.18-rc4:
>>   https://gist.github.com/RadxaNaoki/40e1d049bff4f1d2d4773a5ba0ed9dff
> 
> Same problem as before:
> [    1.732538] pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732645] pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
> [    1.732651] pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732661] pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
> [    1.732840] pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732947] pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
> [    1.732952] pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.732962] pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
> [    1.733134] pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733246] pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
> [    1.733255] pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733266] pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
> [    1.733438] pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733544] pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
> [    1.733550] pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
> [    1.733560] pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
> [    1.733571] pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
> [    1.733575] pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
> [    1.733585] pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
> [    1.733596] pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46
> 
> 
> Seems like the ASM2806 switch, for some reason, is not ready.
> 
> One change that Diederik pointed out is that in the "good" case,
> the link is always in Gen1 speed.
> 
> Perhaps you could build with CONFIG_PCI_QUIRKS=y and try this patch:
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..ac134d95a97f 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -96,6 +96,7 @@ int pcie_failed_link_retrain(struct pci_dev *dev)
>   {
>   	static const struct pci_device_id ids[] = {
>   		{ PCI_VDEVICE(ASMEDIA, 0x2824) }, /* ASMedia ASM2824 */
> +		{ PCI_VDEVICE(ASMEDIA, 0x2806) }, /* ASMedia ASM2806 */
>   		{}
>   	};
>   	u16 lnksta, lnkctl2;

It doesn't help with either probing behind the bridge or the link speed.

> If that does not work, perhaps you could try this patch
> (assuming that all Rock 5C:s have a ASM2806 on pcie2x1l2):

ROCK 5C has a PCIe FPC connector and I'm using Dual 2.5G Router HAT.
  https://radxa.com/products/rock5/5c#techspec
  https://radxa.com/products/accessories/dual-2-5g-router-hat

Regarding the link speed, I initially suspected the FPC connector and/or 
cable might be the issue. However, I tried the Dual 2.5G Router HAT with 
the ROCK 5A (which uses a different cable), and I got the same result.

BTW, the link speed varies between 2Gb/s and 4Gb/s depending on the 
reboot. (with or without quirk)

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> index dd7317bab613..26f8539d934a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
> @@ -452,6 +452,7 @@ &pcie2x1l2 {
>   	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
>   	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
>   	vpcie3v3-supply = <&pcie2x1l2_3v3>;
> +	max-link-speed = <1>;
>   	status = "okay";
>   };
> 
> 
> 
> Kind regards,
> Niklas
> 


