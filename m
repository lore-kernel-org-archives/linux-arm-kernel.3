Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D33E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQuPWUe/i3J0DiWhv5TFa0VBBVmVEoaWf2ZG4+Ov7mk=; b=pkgru3YQazqLUT5hiRjQzcRRsB
	by9UhBqxrtwmys1eAkDufwaFz6yP0gxzt1tit3CQ8kxojB4iBAVOKzMF23qSj05bf7rhP0yvwGaHm
	Gf9IYpy8pVMlR3ivk9j8ajHIZ1bSbSVrfEKmUvLcE/QozBbkgsj9PwNab5+Zn/E4F8ZbGNByZDYr6
	yrW/jy8YJwsV+s+OUx6lpE1u9bqb9/xzeTnZwaalOmlW0+OT9BGyPpBtl1nOlArgMYCP2zDZWy2G9
	xb5r0eqMz1OmG0FhM/ULbb7JVxS1RUItJuvIOU9eV4dWBcOSDkTToaXBRyD2H+b27XkT9QbX54pkx
	zQPxybMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCSM-0000000GGwu-3XLf;
	Thu, 05 Dec 2024 14:03:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCMx-0000000GFuk-2iNt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:58:16 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tJCMh-0000kQ-S9; Thu, 05 Dec 2024 14:57:59 +0100
Message-ID: <361b3a14-db86-4c3c-9f07-4ebc1dd40d0e@pengutronix.de>
Date: Thu, 5 Dec 2024 14:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm: dts: st: stm32mp151a-prtt1l: Fix QSPI
 configuration
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20240806120517.406714-1-o.rempel@pengutronix.de>
 <20dc2cd4-7684-4894-9db3-23c3f4abd661@pengutronix.de>
 <a483fb50-f978-4e48-b38e-6d79632540f1@foss.st.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <a483fb50-f978-4e48-b38e-6d79632540f1@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_055815_682370_CAF04A9C 
X-CRM114-Status: GOOD (  20.61  )
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

Hello Alex,

On 29.10.24 16:39, Alexandre TORGUE wrote:
> On 8/7/24 11:38, Ahmad Fatoum wrote:
>> Hello Oleksij,
>>
>> On 06.08.24 14:05, Oleksij Rempel wrote:
>> There's bias-disable in stm32mp15-pinctrl.dtsi. You may want to add
>> a /delete-property/ for that to make sure, it's not up to the driver
>> which one has priority.
>>
>>>           drive-push-pull;
>>>           slew-rate = <1>;
>>
>> These are already in qspi_bk1_pins_a. If repeating those is ok, why
>> not go a step further and just duplicate the pinmux property and stay
>> clear of this issue altogether, provided Alex is amenable to changing
>> his mind regarding pinctrl groups in board device trees.
> 
> I still prefer to have pin configuration defined in pinctrl dtsi file and I'll continue like this for ST board. The reason is that we try to reuse as much as possible pins when we create a new board and so it is easier to maintain if we declare them only one time.

I can see the point for ST evaluation kits as ST customer hardware
will often copy the reference designs.

> But, I'm not blocked for "other" boards based on STM32 SoC. I mean, if it is simpler for you and above all if it avoid issues/complexities then, you can declare some pin groups in your board dts file. In this case we need to take care of the IO groups label name.

That's good to hear and what I wanted to clarify. Especially for things like
ADCs, there are so many possible permutations that there is no point for
boards to add their pinctrl group to the main DTSI instead of just listing
their specific pin configuration in the board DTS.

Thanks,
Ahmad

> 
> regards
> alex
> 
>>
>>
>> Cheers,
>> Ahmad
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

