Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243D2E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb3n1nsNJMcoSFIkmzKS2rMqgizIUNC22FVriH9Ctx8=; b=qTMAbn9EVnXrO/r63cKnZv89kD
	lPj+iNNFoPqZ7N7JIsaAEAarWMEA39UL0CF/oDoEEjJk3Q9fK/zLaqfMS7w0aS9IDO3e6eZr3Dwo6
	ZjYNJSIpkZKgRVfPHhecUpPKR6TSySLmz+D56AiMCOhcGcoSi1FaEVCBYs/7euACCUrrBEQ47vvYR
	BpPufJzd3O+DrDwurL3wt3TS+JpVNgXXXnOY5R8nMor8DfgJFK0HeykaoXBz4wQT2XPA2mYm2CkLI
	Cd5g7wilBtb4ZD3SfBtyt/de0hLrZxrOfpFrjYzVtBrr5Bm4iqLPT9b+bLl5mPtfTFiVT8rnv8JBX
	831+v9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXc2d-0000000DVgP-10mH;
	Mon, 22 Dec 2025 09:17:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXc2Z-0000000DVeI-2oMn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:17:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 70F141A2368;
	Mon, 22 Dec 2025 09:17:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45E13606C1;
	Mon, 22 Dec 2025 09:17:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1A9F10AB0140;
	Mon, 22 Dec 2025 10:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766395033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Nb3n1nsNJMcoSFIkmzKS2rMqgizIUNC22FVriH9Ctx8=;
	b=nTppoy4S3vb8RSx5dHoCVBs3MXIZ2NgxoLdtn1i8P8i1fdxV4vdc4cR2J2qN9amyRoVqXJ
	OBFsKphvKmjZVcVt3RYEywq7VOfV4M3+Y/fxpEmjxj7P0YlIj93AqDO8QtPukY9KNfD+Wt
	B2ETiMQ354F2eq08es+qA/AxHcAlZ5AIWHRY/gL7gtG23KWSLCL2JR+kaqP62I92Zxmzre
	fLtmndNOLpuCnnWD0qA9pJaq9S8kBnNsFLWkQ1eyfWApvjDpZdgYQefCd1FaQcPYSsPy/x
	+nVUdpaHs4vIheaYaHvjJPu5qfRWFGKrTMyVdKfyEPdGjIzLwws2moyJaut9CQ==
Message-ID: <160e221e-98a8-4097-8340-94ac7d208136@bootlin.com>
Date: Mon, 22 Dec 2025 10:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
 <6113404.MhkbZ0Pkbq@jernej-laptop>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <6113404.MhkbZ0Pkbq@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_011719_907397_C4054CD4 
X-CRM114-Status: GOOD (  27.36  )
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

Hi Jernej,

Le 21/12/2025 à 20:12, Jernej Škrabec a écrit :
> Dne sreda, 17. december 2025 ob 09:25:00 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> Allwinner H616 PWM controller is quite different from the A10 one.
>>
>> It can drive 6 PWM channels, and like for the A10, each channel has a
>> bypass that permits to output a clock, bypassing the PWM logic, when
>> enabled.
>>
>> But, the channels are paired 2 by 2, sharing a first set of
>> MUX/prescaler/gate.
>> Then, for each channel, there's another prescaler (that will be bypassed
>> if the bypass is enabled for this channel).
>>
>> It looks like that:
>>              _____      ______      ________
>> OSC24M --->|     |    |      |    |        |
>> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>>             |_____|    |______|    |________|
>>                            ________
>>                           |        |
>>                        +->| /div_k |---> PWM_clock_x
>>                        |  |________|
>>                        |    ______
>>                        |   |      |
>>                        +-->| Gate |----> PWM_bypass_clock_x
>>                        |   |______|
>> PWM_clock_src_xy -----+   ________
>>                        |  |        |
>>                        +->| /div_k |---> PWM_clock_y
>>                        |  |________|
>>                        |    ______
>>                        |   |      |
>>                        +-->| Gate |----> PWM_bypass_clock_y
>>                            |______|
>>
>> Where xy can be 0/1, 2/3, 4/5
>>
>> PWM_clock_x/y serve for the PWM purpose.
>> PWM_bypass_clock_x/y serve for the clock-provider purpose.
>> The common clock framework has been used to manage those clocks.
>>
>> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
>> This is needed for example by the embedded AC300 PHY which clock comes
>> from PMW5 pin (PB12).
> 
> No. Drop all clocks related code and make this pure PWM driver, like pwm-sun4i
> is. For AC300, AC200 or whatever other device may need clock produced by PWM,
> pwm-clock can be used like this:
> 
> ac300_pwm_clk: ac300-clk {
> 	compatible = "pwm-clock";
> 	#clock-cells = <0>;
> 	clock-frequency = <24000000>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&pwm1_pin>;
> 	pwms = <&pwm 1 42 0>;
> };
> 
> ac300 {
> 	...
> 	clocks = <&ac300_pwm_clk>;
> 	...
> };
Yes, that was my first move, but after trying quite hard, I came to the 
conclusion that pwm-clock is not fit for this precise case.
If we had only one source clock, this would be a perfect fit though.

Here's the problem: the pwm-clock request a period from the PWM driver, 
without any clue that it actually wants a clock at a specific frequency, 
and not a PWM signal with duty cycle capability.
So, the PWM driver doesn't know if it can use the bypass or not, it 
doesn't even have the real accurate frequency information (23809524 Hz 
instead of 24MHz) because the pwm_apply only deals with periods.
With pwm-clock, we loose a precious information along the way (that we 
actually want a clock and not a PWM signal).
That's ok with simple PWM drivers that don't have multiple input clocks, 
but in this case, without this information, we can't know for sure which 
clock to use.
And here, for instance, if pwm-clock requests 42ns, the logic is to 
select the highest clock (100MHz), with no prescaler, and a duty cycle 
value of 2/4 => we have 25MHz instead of 24MHz.
And that's a perfectly fine choice for a PMW, because we still can 
change the duty cycle in the range [0-4]/4.
But obviously for a clock, we don't care about the duty cycle, but more 
about the clock accuracy.
When I tried to use pwm-clock, I ended up making assumptions on what was 
the intended use (if the asked period is 42 with a duty cycle of 50% 
maybe the consumer wants a clock), but that was too hack-ish.

That's why I put aside the pwm-clock and I went for this instead.


Thanks for the review!

Regards,
Richard

> 
> Best regards,
> Jernej
> 
>>
>> This series is based onto v6.19-rc1
>>
>> Changes since v1:
>> - rebase onto v6.19-rc1
>> - add missing headers
>> - remove MODULE_ALIAS (suggested by Krzysztof)
>> - use sun4i-pwm binding instead of creating a new one (suggested by Krzysztof)
>> - retrieve the parent clocks from the devicetree
>> - switch num_parents to unsigned int
>>
>> Richard Genoud (4):
>>    dt-bindings: pwm: allwinner: add h616 pwm compatible
>>    pwm: sun50i: Add H616 PWM support
>>    arm64: dts: allwinner: h616: add PWM controller
>>    MAINTAINERS: Add entry on Allwinner H616 PWM driver
>>
>>   .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  19 +-
>>   MAINTAINERS                                   |   5 +
>>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
>>   drivers/pwm/Kconfig                           |  12 +
>>   drivers/pwm/Makefile                          |   1 +
>>   drivers/pwm/pwm-sun50i-h616.c                 | 892 ++++++++++++++++++
>>   6 files changed, 975 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/pwm/pwm-sun50i-h616.c
>>
>>
>> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

