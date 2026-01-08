Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33252D185C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkQu0ywfCqJZE+WsNbm/KDvp35VhTZ7L4bvh8V9tH10=; b=HstN6t+GqCeniqZ4bUE0V+MDKW
	qIgutGROGr04Trl+FJ/k4qvlLK16onxk+cnFlgjE9PEKh612e3BYJfHTIhJ5ksQt4RVeoa0bnwf5D
	L5t8xFDjhK87a16ppzQkjAaJc5ct80Lpy/rQisvq/Al93z/dTRtHz6gG6xxhcQqI/mxe8n/HW9aWq
	Sha3KpiR65HqxrMUMh0ocnwMP89KwJCU8Dvf9lVU2Z8424CSTKNtZPxgEJ5wIRoiiXNOb0hbgHqfm
	2J9KmSPmcRnVSVe46v+ItbzPwp2hRk9fTzV0rfytuF5GsfZ4cNJop2tAOiTAjyanpsnYdJVK26Crq
	oFTwI6tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnSu-0000000Gexy-12HC;
	Thu, 08 Jan 2026 10:42:04 +0000
Received: from mail-m155116.qiye.163.com ([101.71.155.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnSp-0000000GewM-1aQ5;
	Thu, 08 Jan 2026 10:42:02 +0000
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ff3a2c57;
	Thu, 8 Jan 2026 18:41:47 +0800 (GMT+08:00)
Message-ID: <c6fac95c-dd7a-4fdc-a93f-8ebac731d499@rock-chips.com>
Date: Thu, 8 Jan 2026 18:41:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
To: Quentin Schulz <quentin.schulz@cherry.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Alexey Charkov <alchark@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107070322.323-1-kernel@airkyi.com>
 <20260107070322.323-3-kernel@airkyi.com>
 <afe968a0-f14b-423d-81a7-c1046d2b32bb@cherry.de>
 <1b08bc47-70be-48fb-a05e-1101e633a776@rock-chips.com>
 <0d99140e-8f57-4a7a-a492-92efa30292d8@cherry.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <0d99140e-8f57-4a7a-a492-92efa30292d8@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9b9d32bee703abkunmbf4c270613cd5e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09JSFYZGBkeHxgYQkJJSk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=L1nQBYywUwxdSotoHvJ/6KJvzPK4O/1TyunGOLwEFOiieurKqEntt9HT5ltPIF6PQEJ0TivS0yH+cR1SqlPfp7wg1kmC9JDepjy84i4Q6LOOg++QM/3oPZl99+kefEJFdD74t8iWu1eDfnHc0JyHP8LvuWCDm4Mu29Hwkn0pC5k=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=rkQu0ywfCqJZE+WsNbm/KDvp35VhTZ7L4bvh8V9tH10=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_024200_811910_F626C1D2 
X-CRM114-Status: GOOD (  30.47  )
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

Hi Quentin,

On 1/8/2026 6:07 PM, Quentin Schulz wrote:
> Hi Chaoyi,
> 
> On 1/8/26 7:27 AM, Chaoyi Chen wrote:
>> Hi Quentin,
>>
>> Thank you for your patient review.
>>
>> On 1/7/2026 11:46 PM, Quentin Schulz wrote:
>>> Hi Chaoyi,
>>>
>>> On 1/7/26 8:03 AM, Chaoyi Chen wrote:
> 
> [...]
> 
>>>> +        stdout-path = "serial0:1500000n8";
>>>> +    };
>>>> +
>>>> +    adc_keys: adc-keys {
>>>
>>> Are we expecting to extend this node from another DT? Why the label?
>>>
>>> Won't comment on all other labeled-but-no-phandle-use instances, please check.
>>>
>>
>> I think one exception is the regulator labels. Even though their
>> phandles are unused, they match the names on the schematic, so it
>> seems meaningful to keep them.
>>
> 
> Can't you use the regulator-name property for that? Or a comment if you realllly want it to be somewhere in the DTS? If I remember correctly, labels make it to the DTB when building it with symbols (-@, enabled whenever there's a DTSO for the board; see __symbols__ node when decompiling), this will unnecessarily bloat the final DTB.
>

Oh, it make sense.

>>>> +    vcc3v3_rtc_s5: regulator-vcc3v3-rtc-s5 {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vcc3v3_rtc_s5";
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>> +        regulator-min-microvolt = <3300000>;
>>>> +        regulator-max-microvolt = <3300000>;
>>>> +        vin-supply = <&vcc_sys>;
>>>
>>> If this is for the rtc, shouldn't we declare this dependency in the RTC device node and not have it always-on?
>>>
>>
>> I checked other boards that use the hym8563 device and couldn't find
>> a similar approach. Could you give an example?
>>
> 
> If this is truly always on by hardware design, then I guess it's "fine". That other boards aren't doing isn't much of an argument, as they may not need it. Typically, you could need to update the driver (and its binding) to accept and control power supplies so that you can link the two together in the device tree. I'm assuming for an RTC it doesn't make much sense to have its power supply controllable as it likely needs to be powered even when the device is turned off (otherwise the RTC stops counting :) ).
>

Yes, this seems unnecessary, which is why I'm asking if you've
encountered similar designs before.

>>>> +    };
>>>> +
>>>> +    vcc3v3_sata_pwren: vcc3v3-sata-pwren {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vcc3v3_sata_pwren";
>>>> +        enable-active-high;
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>
>>> Why do we have this always-on? Seems like we're missing a dependency on this regulator in the SATA controller?
>>>
>>
>> In v1 we set the pinctrl inside the SATA node. To keep the pins from
>> being reused by mistake we added this regulator in v2.
>>
> 
> This is a controllable regulator, which seems to be dedicated to SATA (from the name of it). Why isn't it something that the SATA controller controls?
> 
> You have ahci-supply, target-supply and phy-supply in ahci-common.yaml DT binding that may be appropriate for this regulator.
>

Thank you for provide these info. I will try to add them in v3.

> The issue is if this regulator is probed *after* your SATA device, SATA probably won't work. Imagine REGULATOR_FIXED_VOLTAGE=m (or even =n, but then you likely have other issues) and your SATA controller driver is built-in, this will be broken.
> 
> Remove the always-on and set the proper link in the SATA controller device node so that this is handled properly.
>

Oh! I did overlook that point! I will try to do it in v3.

>>>> +        gpio = <&gpio4 RK_PC7 GPIO_ACTIVE_HIGH>;
>>>> +        pinctrl-names = "default";
>>>> +        pinctrl-0 = <&satapm_pwren>;
>>>> +    };
>>>> +
>>>> +    vcc5v0_device: regulator-vcc5v0-device {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vcc5v0_device";
>>>> +        regulator-always-on;
>>>> +        regulator-boot-on;
>>>> +        regulator-min-microvolt = <5000000>;
>>>> +        regulator-max-microvolt = <5000000>;
>>>> +        vin-supply = <&vcc12v_dcin>;
>>>> +    };
>>>> +
>>>> +    vcc5v0_host: regulator-vcc5v0-host {
>>>> +        compatible = "regulator-fixed";
>>>> +        regulator-name = "vcc5v0_host";
>>>> +        regulator-boot-on;
>>>> +        regulator-always-on;
>>>> +        regulator-min-microvolt = <5000000>;
>>>> +        regulator-max-microvolt = <5000000>;
>>>> +        enable-active-high;
>>>> +        gpio = <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;
>>>> +        vin-supply = <&vcc5v0_device>;
>>>> +        pinctrl-names = "default";
>>>> +        pinctrl-0 = <&usb_host_pwren>;
>>>> +    };
>>>> +
>>>
>>> I assume both of the above are related to USB operating in host or device mode? Maybe there's a way to have something more useful to the user in regulator-name (and possibly the regulator node name) so that they have an idea what this pertains to?
>>
>> It's a good idea. Actually, we have two regulators here, one for USB0
>> and another for USB1. I'll try to rename them in v2.
>>
> 
> Are you sure? vcc5v0_device is a supply for vcc5v0_host, so it'd be odd that in order for USB1 to work, you need USB0 powered?

No, the "vcc5v0_device" serves as the vin-supply for both
"VCC5V0_USB3_HOST0" and "VCC5V0_USB3_HOST1". 
And "VCC5V0_USB3_HOSTx" is supply for USB VBUS.

All the names marked here are those shown in the schematic. As you
suggested, it would be better to set regulator-name to the schematic
name "VCC5V0_USB3_HOSTx" and use "usbx_vbus" for the label.

-- 
Best, 
Chaoyi

