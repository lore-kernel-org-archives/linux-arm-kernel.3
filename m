Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC023D44149
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpnbMKxrEd/92FzSGRgQG+BUDZSd3g31Xk5DTCxA3Fo=; b=ouRwMq3aoXgWhD3k/MfyzaLG21
	6ksSeXLLJCtwKp+gd2UOBI9h9DJf304TY6yGClSTO6J90Ld+rfk+DEIyNMapSlCyQU0dODvc7ptd+
	663k68guD8xeb/GlYfHrBI+W9OoR1LeiA1D530AqQKT+z/TkSITwcBZ9iYh70ZqO8xvoxbry8/ma3
	UIybzDDIuflgbp/ZbafGgI+cRg4bmCTwV24kOPEu4g2/QpNV14Lzt6BeLcbO/uV8qPRblz32NMKBW
	sfiw2mTMKv3QI496oZz5gkvZtZbcfwqYFd9B8fpbJLBP6sYgCkaUfBrEWXifAp8G5SbIrqqvQPEtC
	4CSPxeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTytS-00000000HuU-1xIH;
	Fri, 12 Dec 2025 08:52:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTytP-00000000HtX-1jNz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 08:52:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77B23C1935D;
	Fri, 12 Dec 2025 08:52:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81504606DF;
	Fri, 12 Dec 2025 08:52:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EB3A103C8C8B;
	Fri, 12 Dec 2025 09:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765529567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dpnbMKxrEd/92FzSGRgQG+BUDZSd3g31Xk5DTCxA3Fo=;
	b=M1yjPg9J+9muV+mGaXWjHEpEB8kPYNU0mxz3j2MPylOHDAf1GZIVKa3XR/Uq1wdQxphknu
	8WK9IWMYyYUnEZe++tinnnDQCnGb54YGG4k5gtvfoWE0jD8h/Fnt0aPHIsPpQH//5rS+ZW
	hZR+5HL9zSgHdJ2sPwT13beOMHP8RXEkeBDhfsHMYvD/Ir4GZQzV4oPc4atqBsHNF5YVGJ
	svOFwmOmtL+JxmBQgTmVoZ4zqQpAkZ4YE3+YXKsRkO9PvU0ngBLGZCkgmOoJj63m932sDG
	GJp6FKJ1BoJ2SAa/wdo3zwpsNRsBnVEA1tfAVL4xAM4g1/QKX6DYo5sEevh+Eg==
Message-ID: <1c8fe534-4b87-46a7-9806-9cbbe5560545@bootlin.com>
Date: Fri, 12 Dec 2025 09:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: pwm: sunxi: add PWM controller for
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251205100239.1563353-1-richard.genoud@bootlin.com>
 <20251205100239.1563353-2-richard.genoud@bootlin.com>
 <20251208-gorgeous-capuchin-of-protection-4ad0c2@quoll>
 <4d34658b-874d-4681-95c1-616f5b385550@bootlin.com>
 <93224408-6b09-4cec-8e84-a66d9ef138e6@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <93224408-6b09-4cec-8e84-a66d9ef138e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_005251_605295_296D5097 
X-CRM114-Status: GOOD (  13.42  )
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

Le 12/12/2025 à 09:25, Krzysztof Kozlowski a écrit :
> On 12/12/2025 08:50, Richard GENOUD wrote:
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Bus Clock
>>>> +
>>>
>>> Are you sure there is no first clock? Really, really sure? If you add it
>>> later, I would be pretty sad, because that's unnecessary duplication of
>>> binidngs....
>> I surely don't want to make you sad :)
>>
>> Having a second look at the sun4i binding, I think there's a way to use it.
>> The sun4i, as you said, has a module clock (OSC24M) and an optional bus
>> clock.
>> Here, the bus clock is mandatory, but the H616 PWM uses OSC24M and APB1
>> as clock sources.
>>
>> So, I guess that if we add something like that:
>>      clocks:
>>        minItems: 1
>>        items:
>>          - description: Module Clock
>>          - description: Bus Clock
>> +      - description: APB Clock
>>
>>      clock-names:
>>        minItems: 1
>>        items:
>>          - const: mod
>>          - const: bus
>> +      - const: apb
>>
>>      resets:
>>        maxItems: 1
>>
>> In the sun4i pwm binding, we could re-use it for the H616 pwm right?
>> (APB clock is maybe not the best name, could be secondary module clock)
> 
> 
> apb is probably the bus clock, so you don't need to change the bindings
> at all.
Indeed, your're right!
So the only difference will the the #clock-cells for h616.
I'll send a v2 using the sun4i binding.

Thanks!

Regards,
Richard

> 
> Best regards,
> Krzysztof


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

