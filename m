Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6B8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qut7dtNiJ0EjOhPsNaw96lXsUIuxlOfalPVxYzFJpjE=; b=W35TrJHpybH819X0MvXjP1O6f1
	fVTOS/asIFcUrTAA0dVvB9bIMo/hERo2juAQ4ni02LwWNNJolFQSFHwY6GOaHykaiE3ABWGLwihYn
	e12kbFtxnfQ5wN5j8uWEwmMOQFhvC7LhFNXpeQWJd02jy61IHwzfAO/paYO7zinT2er7/Bznz9sDr
	9hrtXlWWQ86YTWpXFxZjrRWFXLfXuBUbUofEGLWOphUfAAYnMx+1Ajv24cEef97H7jTauCk8e1T9D
	T8VJ6LMPnFDzorQM9kvHqa1eGP3gLdT9qLq4CrzGJM1RFkvVEJoYjXhe/rITvfiGZtfXHrYNklr0K
	v5ajE0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbH57-0000000ETM6-1Rxs;
	Fri, 24 Jan 2025 10:38:33 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbH3k-0000000ETHS-21Yk;
	Fri, 24 Jan 2025 10:37:09 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737715026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qut7dtNiJ0EjOhPsNaw96lXsUIuxlOfalPVxYzFJpjE=;
	b=Y2m7JB18UVW2v/MAOSH+OVb7u4Hh6y+MVpWW22Nem84MrECxywTcgUdUUgMV94srqTzNKW
	tuwLyeA4A55lbOVIjtUWBJqCiXcRpeDmL5WnOYJ6BcJkeALU+yumIoYaNe+qJ6rgkYCh6K
	UHGDAt0XBYObNFqqGZoK1UN44FdpXNQOjaM0kyCPhDVMRaUacs3+XIulRF7uxbZtwFrs3T
	H8uFGVZLsgz3laMWT7F32C+/Ovps2X/ZqyhEGuGCVVfHk/if/UroELY9OTK4SJmZfX2cOf
	HHLhbYw3uEWkpNw150PTUL53OQsItUFnrcdNelKzY3zu5SRA01Pr5WSnMz3hIg==
Date: Fri, 24 Jan 2025 11:37:05 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, devicetree@vger.kernel.org, Sebastian Reichel
 <sebastian.reichel@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix broken tsadc pinctrl binding
 for rk3588
In-Reply-To: <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
 <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
Message-ID: <61b494b209d7360d0f36adbf6d5443a4@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_023708_831693_75629ED4 
X-CRM114-Status: GOOD (  30.95  )
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

On 2025-01-24 11:25, Alexey Charkov wrote:
> On Fri, Jan 24, 2025 at 2:06 PM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> On 2025-01-24 09:33, Alexey Charkov wrote:
>> > On Fri, Jan 24, 2025 at 9:26 AM Alexander Shiyan
>> > <eagle.alexander923@gmail.com> wrote:
>> >>
>> >> There is no pinctrl "gpio" and "otpout" (probably designed as
>> >> "output")
>> >> handling in the tsadc driver.
>> >> Let's use proper binding "default" and "sleep".
>> >
>> > This looks reasonable, however I've tried it on my Radxa Rock 5C and
>> > the driver still doesn't claim GPIO0 RK_PA1 even with this change. As
>> > a result, a simulated thermal runaway condition (I've changed the
>> > tshut temperature to 65000 and tshut mode to 1) doesn't trigger a PMIC
>> > reset, even though a direct `gpioset 0 1=0` does.
>> >
>> > Are any additional changes needed to the driver itself?
>> 
>> I've been digging through this patch the whole TSADC/OTP thing in the
>> last couple of hours, and AFAIK some parts of the upstream driver are
>> still missing, in comparison with the downstream driver.
>> 
>> I've got some small suggestions for the patch itself, but the issue
>> you observed is obviously of higher priority, and I've singled it out
>> as well while digging through the code.
>> 
>> Could you, please, try the patch below quickly, to see is it going to
>> fix the issue you observed?  I've got some "IRL stuff" to take care of
>> today, so I can't test it myself, and it would be great to know is it
>> the right path to the proper fix.
>> 
>> diff --git i/drivers/thermal/rockchip_thermal.c
>> w/drivers/thermal/rockchip_thermal.c
>> index f551df48eef9..62f0e14a8d98 100644
>> --- i/drivers/thermal/rockchip_thermal.c
>> +++ w/drivers/thermal/rockchip_thermal.c
>> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct
>> platform_device *pdev)
>>          thermal->chip->initialize(thermal->grf, thermal->regs,
>>                                    thermal->tshut_polarity);
>> 
>> +       if (thermal->tshut_mode == TSHUT_MODE_GPIO)
>> +               pinctrl_select_default_state(dev);
>> +       else
>> +               pinctrl_select_sleep_state(dev);
> 
> I believe no 'else' block is needed here, because if tshut_mode is not
> TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so there's
> no reason for the driver to mess with its pinctrl state. I'd rather
> put a mirroring block to put the pin back to its 'sleep' state in the
> removal function for the TSHUT_MODE_GPIO case.

You're right, but the "else block" is what the downstream driver does,
so I think it's better to simply stay on the safe side and follow that
logic in the upstream driver.  Is it really needed?  Perhaps not, but
it also shouldn't hurt.

> Will try and revert.

Awesome, thanks!

> P.S. Just looked at the downstream driver, and it actually calls
> TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpout" was
> not a typo in the first place. So maybe the right approach here is not
> to change the device tree but rather fix the "gpio" / "otpout" pinctrl
> state handling in the driver.

Indeed, "otpout" wasn't a typo, and I've already addressed that in my
comments to Alexander's patch.  Will send that response a bit later.

I think it's actually better to accept the approach in Alexander's
patch, because the whole thing applies to other Rockchip SoCs as well,
not just to the RK3588(S).

