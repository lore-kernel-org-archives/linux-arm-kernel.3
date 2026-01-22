Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB73BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 03:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otU8zUr9ysKQV+4+LBuLVMkqTGH9KAp1Ay6GIjsLfwE=; b=rE/cwit0/KXGIWeLKyNH3Xp63T
	B0Y7UlCtvLBf8SXNVL9UsDWAdGV95Z+jYAxAwXUuWI/rxM0yEClSiRwo0tjo6nSr5dUwUmhLSBEmz
	gANvFzuGHsKaQVlzxrTNQB1OyUdu5Lwcc5Jrnc8ZF2yfktwkKA+yakwP3eznMLAaDL7CvNXZVEdsO
	DqLMoLaNbU/q1/hLH12eenI4jx+zhIBOJ6vMn+Nz23BOvWlQGDck09K9e7cthYSDALVTSPwQa/6hE
	TJSow1aUF2BSZSsOeZWw6j7Ck1Le6YXpJGULAIhALgWtm7SZWHt18IyD1gGUUibM7N4QXOYLhst12
	23Bb5bGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilBq-00000006MLs-25Ak;
	Thu, 22 Jan 2026 03:16:58 +0000
Received: from mail-m49213.qiye.163.com ([45.254.49.213])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vilBm-00000006ML1-2jC3;
	Thu, 22 Jan 2026 03:16:56 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31880f758;
	Thu, 22 Jan 2026 11:16:42 +0800 (GMT+08:00)
Message-ID: <f5e79cfe-6ea3-44c5-bb86-41cccef1401f@rock-chips.com>
Date: Thu, 22 Jan 2026 11:16:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Change gmac phy-mode to
 rgmii-id for rk3576 evb1
To: Andrew Lunn <andrew@lunn.ch>, Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <55c9b522-e43d-4df3-9f7a-3f2976b72854@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9be3b44a0503abkunm4f6e7110cdce0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ01NH1YeHksfTR9IHU9KSB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CWuMnatJ8Tcc1M4hC3AcKcGHbh93rgCX1uDfNICI078TwKATK3jjawFmBnnprZV8+FUIjouoLASDsgfiwDcGuOmEBWvt9SLMAz+vONf9o2hWM3syTXqUckq8GhrtlKd2wGAdFuWWiKWZfKnzWjlIoOzWBp34eK7K5PifJNXwFLQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=otU8zUr9ysKQV+4+LBuLVMkqTGH9KAp1Ay6GIjsLfwE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_191655_232703_A4328F97 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Andrew,

On 1/22/2026 10:40 AM, Andrew Lunn wrote:
> On Thu, Jan 22, 2026 at 09:38:17AM +0800, Chaoyi Chen wrote:
>> Hi Andrew,
>>
>> On 1/21/2026 8:55 PM, Andrew Lunn wrote:
>>>> @@ -721,6 +719,7 @@ rgmii_phy0: ethernet-phy@1 {
>>>>  		reset-assert-us = <20000>;
>>>>  		reset-deassert-us = <100000>;
>>>>  		reset-gpios = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
>>>> +		tx-internal-delay-ps = <1950>;
>>>
>>> The PHY should add 2000ps, as required by the RGMII standard. The
>>> difference is so small there is no need for tx-internal-delay.
>>>
>>
>> Thank you for the clarification. I chose 1950 here because I find that
>> the MotorComm yt8xxx Ethernet PHY binding only offer the options of 
>> 1950 or 2100. 
>>
>>> In most cases, 'rmgii-id' should be sufficient, unless the PCB is
>>> badly designed.
>>>
>>
>> I suspect the ROCK 4D board might be an exception. Sebastian once
>> reported that it wouldn't work properly under "rgmii-id". Well, I'm
>> not sure what strategy to adopt in this case.
> 
> Please check the report. And also, check what the PHY is doing for
> delays if you don't specify the property. Is it defaulting to near
> 2000ps?
> 

It is RTL8211F PHY. The origin report is here:

https://lore.kernel.org/all/20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org/

The RTL8211F binding doesn't provide any indication of the default
delay value. I'll checking datasheet to see if it's mentioned there.

-- 
Best, 
Chaoyi

