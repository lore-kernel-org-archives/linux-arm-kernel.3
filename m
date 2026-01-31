Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A556D79742
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 06:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0+sAGqB2yhj2oDmerbSlM2FR61cb3QdCFDcKvvINYo=; b=SDQPIpqVjlOCiqSec0MyczQFzp
	hBSikhknCwwFho3GSq3K9nMUSduFb/UBOpv8JkVL9gVLWMHk65HZVElvmiT6bvn71+kzNvJW0Zi3Q
	vWlhv6TQwBay77FOJEXT7VaEZJofre4zgbhWuLMO9zq43Kvo6Fk3Y6wwAfj/mk8qlRjFJvsEHlTx8
	4ATKfT+vz7mnTeiAXuqLBrlcUoU48sbIxQLvScr1rvNoDYnDjNEcJdw342Ts2T4eMNQoyVODFNV/Z
	kBUWV/oMZNvjw7RNjRVD3R/sjPPjewB8HqjdGw3+Vwb8KnCpzDRnK+pPrMlH0eaVW3n/Rco2Sxggn
	DvlvTcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4RC-00000002MQK-3VBi;
	Sat, 31 Jan 2026 06:26:30 +0000
Received: from mail-m19731119.qiye.163.com ([220.197.31.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm4R9-00000002MPk-10T0;
	Sat, 31 Jan 2026 06:26:29 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32a366f45;
	Sat, 31 Jan 2026 14:26:14 +0800 (GMT+08:00)
Message-ID: <d552639a-331e-436d-8baf-62546253aa62@rock-chips.com>
Date: Sat, 31 Jan 2026 14:26:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 evb1
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Stephen Chen <stephen@radxa.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260121031548.402-1-kernel@airkyi.com>
 <20260121031548.402-2-kernel@airkyi.com>
 <b87d0c82-b8b7-4e14-85c3-c4ba88aa4000@lunn.ch>
 <81D509A8F65F0243+c7b58aef-95a4-4f2a-a423-7e8b2c0bbeab@airkyi.com>
 <55c9b522-e43d-4df3-9f7a-3f2976b72854@lunn.ch>
 <f5e79cfe-6ea3-44c5-bb86-41cccef1401f@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <f5e79cfe-6ea3-44c5-bb86-41cccef1401f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c12bb0e0403abkunme89cdd3e6e3494
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0tLGFZOGkMfSU1OShgYTEtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fPmlXqpYaif+Alwx00473YixZd4FG1mKGYUX0cT/qaI8GyodiABrpI65MUYvdc7WDSRBI+E9+twWsYX0iXCBU4kQRIFA1hKnBG+Eo4cruwJXzniNEii4oKN3HJbUNhlcXo0+bXg9DCU8D8l8cb/uygMBWfJzuU6B4eN6LILi7w0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=s0+sAGqB2yhj2oDmerbSlM2FR61cb3QdCFDcKvvINYo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_222627_969295_75837398 
X-CRM114-Status: GOOD (  15.63  )
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

On 1/22/2026 11:16 AM, Chaoyi Chen wrote:
> Hi Andrew,
> 
> On 1/22/2026 10:40 AM, Andrew Lunn wrote:
>> On Thu, Jan 22, 2026 at 09:38:17AM +0800, Chaoyi Chen wrote:
>>> Hi Andrew,
>>>
>>> On 1/21/2026 8:55 PM, Andrew Lunn wrote:
>>>>> @@ -721,6 +719,7 @@ rgmii_phy0: ethernet-phy@1 {
>>>>>  		reset-assert-us = <20000>;
>>>>>  		reset-deassert-us = <100000>;
>>>>>  		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
>>>>> +		tx-internal-delay-ps = <1950>;
>>>>
>>>> The PHY should add 2000ps, as required by the RGMII standard. The
>>>> difference is so small there is no need for tx-internal-delay.
>>>>
>>>
>>> Thank you for the clarification. I chose 1950 here because I find that
>>> the MotorComm yt8xxx Ethernet PHY binding only offer the options of 
>>> 1950 or 2100. 
>>>
>>>> In most cases, 'rmgii-id' should be sufficient, unless the PCB is
>>>> badly designed.
>>>>
>>>
>>> I suspect the ROCK 4D board might be an exception. Sebastian once
>>> reported that it wouldn't work properly under "rgmii-id". Well, I'm
>>> not sure what strategy to adopt in this case.
>>
>> Please check the report. And also, check what the PHY is doing for
>> delays if you don't specify the property. Is it defaulting to near
>> 2000ps?
>>
> 
> It is RTL8211F PHY. The origin report is here:
> 
> https://lore.kernel.org/all/20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org/
> 
> The RTL8211F binding doesn't provide any indication of the default
> delay value. I'll checking datasheet to see if it's mentioned there.
> 

If "rgmii-id" is set, the RTL8211F driver adds the 2ns delay:

[0] https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/net/phy/realtek/realtek_main.c#L602

Sebastian, could you try testing how much extra delay the GMAC still
needs to add for the ROCK4D to work correctly, assuming the PHY
already has a 2 ns delay when "rgmii-id" is set?

-- 
Best, 
Chaoyi

