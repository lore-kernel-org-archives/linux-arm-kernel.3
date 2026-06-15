Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0771CCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItjGFL5Ra84+rUb38ksEFbRSdUFKv7nWgVro2pCBeCI=; b=QPcCT5xFM4Zzd0VFTrWDexXEas
	xCLoUcEmMl6xjz7ooB4XCkuDfc/mahQHoAlrpG/CmTTL30UiGFYobzNp36Oc2+Y1tQFOWT+OkLUg2
	y2nB1A0sE9wsEAc/+oEHylAakyjWub3l1W7Vd5IV1d4DJd7zzscmhK/xB/fUtBcKtrekzFhxsgmAj
	dC0gDldYT6GzwYty2tvjBzjeb4CVaWJvwZcEAL72qwjpz7Kd6MQspZFdyV6KgqWjS61AvuIcdzrb1
	rqWMVRfH+Ys0VUgP0aSkIaCYBBvRN0fsvW/WuSS0RSgPg2npDvnXdsuB4YGR02ry6rMb4pU4C1iyu
	0sNVgtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ293-0000000Dp0p-2xPD;
	Mon, 15 Jun 2026 07:54:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ291-0000000Dp0I-0wjF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:54:08 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wZ28k-0006Kb-3t; Mon, 15 Jun 2026 09:53:50 +0200
Message-ID: <f0b7d0a0-9b75-4d63-bc1a-f0891c86b2b9@pengutronix.de>
Date: Mon, 15 Jun 2026 09:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Leonard_G=C3=B6hrs?=
 <l.goehrs@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
 <20260611204341.147f1afb@pumpkin>
 <b4fd25b6-52e3-4b5e-8440-69545bce43e8@pengutronix.de>
 <20260612075342.6615d66c@pumpkin>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260612075342.6615d66c@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_005407_277633_CE783C02 
X-CRM114-Status: GOOD (  26.06  )
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

Hello David,

On 6/12/26 8:53 AM, David Laight wrote:
> On Thu, 11 Jun 2026 22:33:18 +0200
> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
> 
>> Hi David,
>>
>> On 6/11/26 21:43, David Laight wrote:
>>> On Thu, 11 Jun 2026 20:12:32 +0200
>>> Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>   
>>>> The LXA boards are the only STM32 boards that set stdout-path = &uart*
>>>> instead of explicitly specifying a baud rate.
>>>>
>>>> This would mean the default of 9600 is used, but it goes unnoticed when
>>>> booting normally as barebox fixes up a console= line that includes a
>>>> baud rate.
>>>>
>>>> When EFI booting GRUB however, GRUB will not pass along the console=
>>>> line and thus the board ends up with a 9600 baud Linux console,
>>>> confusing users.  
>>>
>>> Is it possible to determine the current baud rate (by reading the hardware
>>> register) and default to that value.
>>> Then if grub has initialised the uart the kernel will use the same
>>> baud rate.  
>>
>> I think so, yes. In addition to the register divider configuration, one
>> would need the input clock rate as well, but that's not a problem.
>>
>> Do you know if any drivers already do this?
> 
> I've seen it done somewhere, certainly x86, but possibly NetBSD.
> That would have been preserving the baud rate set by the bios.
> You don't want the baud rate changing half way through the boot sequence.

I agree in general, but in this case here, the BIOS defaults to 115200:

https://github.com/linux-automation/meta-lxatac/blob/wrynose/meta-lxatac-bsp/recipes-bsp/barebox/files/lxatac/defconfig#L171
https://elixir.bootlin.com/barebox/v2026.06.0/source/common/console.c#L349

Cheers,
Ahmad

> 
> 	David
> 
>>
>> Nevertheless, I would like the LXA device trees changed, even if only
>> to align them with all other existing STM32 device trees.
>>
>> Cheers,
>> Ahmad
>>
>>
>>>
>>> 	David
>>>   
>>>>
>>>> This series fixes this. As the device trees were added at different
>>>> times, they are fixed each in a separate commit with its own Fixes: tag.
>>>>
>>>> ---
>>>> Ahmad Fatoum (3):
>>>>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>>>>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>>>>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
>>>>
>>>>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>>>>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>>>>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>>> ---
>>>> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
>>>> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
>>>>
>>>> Best regards,
>>>> --  
>>>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>>
>>>>  
>>>
>>>   
>>
>>
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


