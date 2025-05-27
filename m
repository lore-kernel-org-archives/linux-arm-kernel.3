Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D503CC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ymGiX9iyVOsMBSukcX0/uY45fw765M1SF/+hPK5GddE=; b=gIHS+Ou8HwSxA3Bq8+H+UIONU/
	+EDGO+3KlC/6psLXKpPBQBDyag7qKhtl0EQpXhmXFIodYBsKkmW7HYJfNfRGvRObcvK0FLT0/SwD7
	2uENYRB9a78RARBn8WkLQ3QZdt7TZHb92kW0dfc18BbLYt86iJnO4OKx2dQiHJa0Qs1ByvRhokbSQ
	zNh4FuqZXoGupSc6Io6BuHxMHqtK+a8K1eoj+85Vw0FyeINd/m6KOWcrc/QL71/Ub1ROsRmW2sXVW
	OXG/GtLIHvsTF8Lgp4Bds+zf07ipjPMzOlKFvLfyNQ2SM5MdXzcSLWqX9O/bVkUFkhdSRWoaXTfVa
	eyoF5IPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJs2c-0000000AW9V-1c9H;
	Tue, 27 May 2025 11:00:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJs0U-0000000AVrP-00bN;
	Tue, 27 May 2025 10:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF657A4F60F;
	Tue, 27 May 2025 10:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7993C4CEE9;
	Tue, 27 May 2025 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748343484;
	bh=GC5C7zbKUnZcDna9TO8AoelSUAb7IBX5gcIqpNzeGXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RVn6lR1w1gEpGotxwsdvtghHbGqxhHBsB5y8KdVfByJQcpmBAYpkvmbn0hGQ6c3eL
	 ADAmmoETfpZftjAg9NvaEcCEzTKtKOx2HJ+OZxn+8yjl+imt+lsTZZ3tCBH8sFXe/A
	 CEPEnRbY1yTbY1TpZmTEc1iWfGJ+7jv6/cFP/nsdn4zJYg6yS0d19gRxseJjm6+A+x
	 TVHbLbZ+bHzehB2hqlTqTrYH7dsnDkkokBSk75whcTOKXA1kEb7HepAAUlgyFap4Vc
	 Z799xBogZk5bX8VVwcaAIQstcb/7PC6zasYg/0yYnDUkZTbF04NGVuULAK8XsVSt6f
	 z31igUilUWgkQ==
Message-ID: <966635ca-ea10-4e19-a088-62e4b35bc697@kernel.org>
Date: Tue, 27 May 2025 12:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mfd: rk806: allow to customize PMIC
 reset method
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Daniel Semkowicz <dse@thaumatec.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250526-rk8xx-rst-fun-v1-0-ea894d9474e0@cherry.de>
 <20250526-rk8xx-rst-fun-v1-1-ea894d9474e0@cherry.de>
 <79903ad6-0228-41a3-b733-415cc43ec786@kernel.org>
 <d1fab35d-a4e7-449d-9666-0c651e44929a@cherry.de>
 <8ca5a908-467f-4738-8bfa-185f3eecc399@kernel.org>
 <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <1cf00dfe-c987-46ee-9cdf-a9ba243740ad@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_035806_183930_3EACF400 
X-CRM114-Status: GOOD (  34.68  )
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

On 27/05/2025 11:26, Quentin Schulz wrote:
> Hi Krzysztof,
> 
> On 5/27/25 11:08 AM, Krzysztof Kozlowski wrote:
>> On 27/05/2025 10:48, Quentin Schulz wrote:
>>> Hi Krzysztof,
>>>
>>> On 5/27/25 10:25 AM, Krzysztof Kozlowski wrote:
>>>> On 26/05/2025 19:05, Quentin Schulz wrote:
>>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>>
>>>>> The RK806 PMIC (and RK809, RK817; but those aren't handled here) has a
>>>>> bitfield for configuring the restart/reset behavior (which I assume
>>>>> Rockchip calls "function") whenever the PMIC is reset (at least by
>>>>> software; c.f. DEV_RST in the datasheet).
>>>>>
>>>>> For RK806, the following values are possible for RST_FUN:
>>>>>
>>>>> 0b00 means "restart PMU"
>>>>> 0b01 means "Reset all the power off reset registers, forcing
>>>>>               the state to switch to ACTIVE mode"
>>>>> 0b10 means "Reset all the power off reset registers, forcing
>>>>>               the state to switch to ACTIVE mode, and simultaneously
>>>>>               pull down the RESETB PIN for 5mS before releasing"
>>>>> 0b11 means the same as for 0b10 just above.
>>>>>
>>>>> I don't believe this is suitable for a subsystem-generic property hence
>>>>> let's make it a vendor property called rockchip,rst-fun.
>>>>>
>>>>> The first few sentences in the description of the property are
>>>>> voluntarily generic so they could be copied to the DT binding for
>>>>> RK809/RK817 whenever someone wants to implement that for those PMIC.
>>>>>
>>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>>> ---
>>>>>    .../devicetree/bindings/mfd/rockchip,rk806.yaml    | 24 ++++++++++++++++++++++
>>>>>    1 file changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>>>>> index 3c2b06629b75ea94f90712470bf14ed7fc16d68d..0f931a6da93f7596eac89c5f0deb8ee3bd934c31 100644
>>>>> --- a/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mfd/rockchip,rk806.yaml
>>>>> @@ -31,6 +31,30 @@ properties:
>>>>>    
>>>>>      system-power-controller: true
>>>>>    
>>>>> +  rockchip,rst-fun:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    enum: [0, 1, 2, 3]
>>>>> +    description:
>>>>> +      RST_FUN value to set for the PMIC.
>>>>> +
>>>>> +      This is the value in the RST_FUN bitfield according to the
>>>>> +      datasheet. I.e. if RST_FUN is bits 6 and 7 and the desired value
>>>>> +      of RST_FUN is 1, this property needs to be set to 1 (and not 64,
>>>>> +      0x40, or BIT(6)).
>>>>> +
>>>>> +      The meaning of this value is specific to the PMIC and is
>>>>> +      explained in the datasheet.
>>>>
>>>> And why would that be exactly board-level configuration? IOW, I expect
>>>> all boards to be reset in the same - correct and optimal - way. Looks
>>>> close to SW policy.
>>>>
>>>
>>> All RK3588 boards except ours in downstream kernel have their RST_FUN
>>> set to 1, we need 0 and I cannot talk for what's the actual expected
>>> behavior for other vendors' boards. I do not feel confident
>>> indiscriminately changing the PMIC reset behavior for all boards using
>>> RK806 (which also includes RK3576 boards). Hence why I made that a property.
>>>
>>> Additionally, if all boards were "to be reset in the same - correct and
>>
>> I don't know if they have to, but that's what I would assume in general.
>> Unless you say there is some specific hardware aspect of your boards,
>> but so far you just described the register.
>>
> 
> The cover letter

We do not read cover letters, except when looking for changelogs.

This patch must stand on its own.

> 
>>> optimal - way", why would Rockchip even have a register for that in the
>>> PMIC? It's not an IP they bought (as far as I could tell), so there's
>>
>> To allow SW to make a choice. Just like 1000 other registers for every
>> other device which we do not add to DT.
>>
>>> likely a purpose to it. Especially if they also change the
>>> silicon-default in their own downstream fork AND provide you with a way
>>> to change their new default from Device Tree.
>>>
>>> We can hardcode the change in the driver without using DT, but I wager
>>> we're going to see a revert in a few releases because it broke some
>>> devices. It may break in subtle ways as well, for example our boards
>>> seem to be working just fine except that because the PMIC doesn't
>>> entirely reset the power rails, our companion microcontroller doesn't
>>> detect the reboot.
>>>
>>> If it's deemed a SW policy by the DT binding people, is there a way to
>>> customize this without having it hardcoded to the same value for all
>>> users of RK806 and without relying on module params?
>>
>> sysfs, reboot mode etc. I don't know what is the right here, because you
>> did not explain the actual hardware issue being fixed here. You only
>> described that bootloader does something, so you want to write something
>> else there.
>>
> 
> We have a companion microcontroller on the PCB of both products which 
> needs to detect if the board was reset. When the board is reset, the MCU 
> FW does a few things, like essentially resetting its internal logic such 
> as the PWM controller (so the beeper stops beeping), watchdogs and 
> reinit most user-exposed registers so that it's like "fresh" out of 
> reset (even though it actually wasn't reset since it's continuously 
> powered, not from the PMIC).

So you miss some wiring to the MCU?

> 
> To detect a reboot, it senses one of the power rails (DCDC8; vcc_3v3_s3 
> on our boards) from the PMIC. This power rail is only "restarted" when 
> RST_FUN is set to 0 ("restart PMU" mode) according to our experiments.
> 
> I assume it is possible other boards do not want this (all?) power rail 
> to be quickly interrupted when rebooting? But that I do not know.

Maybe that's your hardware characteristic which you want to encode in
DT. Don't focus on registers, focus on how the hardware or entire system
is done or different.

Best regards,
Krzysztof

