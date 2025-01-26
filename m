Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181D9C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cElRMI26kDUSrPRrVyetsiiM/S0G4rSifs7vMEkuMyM=; b=kzKfgbrhqP09zy2EqeNr8/qZES
	Tdt97qIetVxFU3SibzJUaks/dHLsEWlIGnbzG7VAuJFbHwxzPxIS3mb3teLwxpgIalf0+K7Co2eGi
	L2duPs3kr0P6f3TudV88eOy4WFbcs/FosQEqjUrMoifi8f3Ohn57AKjjjyZDpmEQU37rIu7/NfrK0
	qSR0zFh5I47tTB2kmNV5OpwJVRGXflbAQjEQe/X0wg2Kd32pc7JCoCNSMtpgj0qG7A/tj4RQmghoK
	2LGyk7w7bhzo9oiadQ/QlqTAcBIfpt1FLozSJ+YKp6V/x5pJ/bzDaNJdTVH0IyTFHfoGtG6xGYn/6
	og12+zWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbvst-0000000H9SM-2VNg;
	Sun, 26 Jan 2025 06:12:39 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbvqq-0000000H9JJ-0JJF;
	Sun, 26 Jan 2025 06:10:33 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737871830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cElRMI26kDUSrPRrVyetsiiM/S0G4rSifs7vMEkuMyM=;
	b=BoSYA+YN8DT70FM/64U/Q+bBiO35QdHpf2DFaywph2W9xYyJWIts4K5wjUescUkk4usIm+
	TOoQzB/ftyB+qevWHicX1H8OmXRYYzI07gN7AnqLaUEgv4NMEddRPpZVyyN9VrYTmMKHwa
	30eFNwTpDdQCdKVlrG1lYKTVK54ryoEYagkqUqSXt/cU4sstvuzubBlEoOAaMb9REkr2eS
	BuwYrO57pnyBqlRdBwbJBTe1q8cnsXZ8RQAOOAUxAtMjDzBHLIvmKSRSTtvQ/N7E5um9pW
	Wd1OReYHbtLte7RXrw/IsWieNfQ9CT6mS0oaOO80UqYK+lwWulf2NuyxTxdY2g==
Date: Sun, 26 Jan 2025 07:10:30 +0100
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
In-Reply-To: <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
References: <20250124052611.3705-1-eagle.alexander923@gmail.com>
 <CABjd4YwA8P9LVuDviO6xydkHpuuOY7XT0pk1oa+FDqOo=uZN4A@mail.gmail.com>
 <a76f315f023a3f8f5435e0681119b4eb@manjaro.org>
 <CABjd4Ywh_AkbXHonx-8vL-hNY5LMLJge5e4oqxvUG+qe6OF-Og@mail.gmail.com>
 <61b494b209d7360d0f36adbf6d5443a4@manjaro.org>
 <CABjd4Yx0p0B=e00MjCpDDq8Z=0FtM0s9EN86WdvRimt-_+kh2w@mail.gmail.com>
 <CABjd4Yy14bpjzvFyc8et-=pmds5uwzfxNqcs7L=+XRXBogZEsQ@mail.gmail.com>
Message-ID: <5bfe48fd72e2a82f5b2d8b00d8a79d35@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_221032_394749_6350784D 
X-CRM114-Status: GOOD (  41.20  )
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

On 2025-01-24 20:44, Alexey Charkov wrote:
> On Fri, Jan 24, 2025 at 9:23 PM Alexey Charkov <alchark@gmail.com> 
> wrote:
>> On Fri, Jan 24, 2025 at 2:37 PM Dragan Simic <dsimic@manjaro.org> 
>> wrote:
>> > On 2025-01-24 11:25, Alexey Charkov wrote:
>> > > On Fri, Jan 24, 2025 at 2:06 PM Dragan Simic <dsimic@manjaro.org>
>> > > wrote:
>> > >> On 2025-01-24 09:33, Alexey Charkov wrote:
>> > >> > On Fri, Jan 24, 2025 at 9:26 AM Alexander Shiyan
>> > >> > <eagle.alexander923@gmail.com> wrote:
>> > >> >>
>> > >> >> There is no pinctrl "gpio" and "otpout" (probably designed as
>> > >> >> "output")
>> > >> >> handling in the tsadc driver.
>> > >> >> Let's use proper binding "default" and "sleep".
>> > >> >
>> > >> > This looks reasonable, however I've tried it on my Radxa Rock 5C and
>> > >> > the driver still doesn't claim GPIO0 RK_PA1 even with this change. As
>> > >> > a result, a simulated thermal runaway condition (I've changed the
>> > >> > tshut temperature to 65000 and tshut mode to 1) doesn't trigger a PMIC
>> > >> > reset, even though a direct `gpioset 0 1=0` does.
>> > >> >
>> > >> > Are any additional changes needed to the driver itself?
>> > >>
>> > >> I've been digging through this patch the whole TSADC/OTP thing in the
>> > >> last couple of hours, and AFAIK some parts of the upstream driver are
>> > >> still missing, in comparison with the downstream driver.
>> > >>
>> > >> I've got some small suggestions for the patch itself, but the issue
>> > >> you observed is obviously of higher priority, and I've singled it out
>> > >> as well while digging through the code.
>> > >>
>> > >> Could you, please, try the patch below quickly, to see is it going to
>> > >> fix the issue you observed?  I've got some "IRL stuff" to take care of
>> > >> today, so I can't test it myself, and it would be great to know is it
>> > >> the right path to the proper fix.
>> > >>
>> > >> diff --git i/drivers/thermal/rockchip_thermal.c
>> > >> w/drivers/thermal/rockchip_thermal.c
>> > >> index f551df48eef9..62f0e14a8d98 100644
>> > >> --- i/drivers/thermal/rockchip_thermal.c
>> > >> +++ w/drivers/thermal/rockchip_thermal.c
>> > >> @@ -1568,6 +1568,11 @@ static int rockchip_thermal_probe(struct
>> > >> platform_device *pdev)
>> > >>          thermal->chip->initialize(thermal->grf, thermal->regs,
>> > >>                                    thermal->tshut_polarity);
>> > >>
>> > >> +       if (thermal->tshut_mode == TSHUT_MODE_GPIO)
>> > >> +               pinctrl_select_default_state(dev);
>> > >> +       else
>> > >> +               pinctrl_select_sleep_state(dev);
>> > >
>> > > I believe no 'else' block is needed here, because if tshut_mode is not
>> > > TSHUT_MODE_GPIO then the TSADC doesn't use this pin at all, so there's
>> > > no reason for the driver to mess with its pinctrl state. I'd rather
>> > > put a mirroring block to put the pin back to its 'sleep' state in the
>> > > removal function for the TSHUT_MODE_GPIO case.
>> >
>> > You're right, but the "else block" is what the downstream driver does,
>> 
>> Does it though? It only handles the TSHUT_MODE_GPIO case as far as I
>> can tell (or TSHUT_MODE_OTP in downstream driver lingo) [1]
>> 
>> [1] 
>> https://github.com/radxa/kernel/blob/edb3eeeaa4643ecac6f4185d6d391c574735fca1/drivers/thermal/rockchip_thermal.c#L2564
>> 
>> > so I think it's better to simply stay on the safe side and follow that
>> > logic in the upstream driver.  Is it really needed?  Perhaps not, but
>> > it also shouldn't hurt.
>> >
>> > > Will try and revert.
>> >
>> > Awesome, thanks!
>> >
>> > > P.S. Just looked at the downstream driver, and it actually calls
>> > > TSHUT_MODE_GPIO TSHUT_MODE_OTP instead, so it seems that "otpout" was
>> > > not a typo in the first place. So maybe the right approach here is not
>> > > to change the device tree but rather fix the "gpio" / "otpout" pinctrl
>> > > state handling in the driver.
>> >
>> > Indeed, "otpout" wasn't a typo, and I've already addressed that in my
>> > comments to Alexander's patch.  Will send that response a bit later.
>> >
>> > I think it's actually better to accept the approach in Alexander's
>> > patch, because the whole thing applies to other Rockchip SoCs as well,
>> > not just to the RK3588(S).
>> 
>> Anyway, I've just tried it after including the changes below, and
>> while /sys/kernel/debug/pinctrl/pinctrl-handles shows the expected
>> pinctrls under tsadc, the driver still doesn't seem to be triggering a
>> PMIC reset. Weird. Any thoughts welcome.
> 
> I found the culprit. "otpout" (or "default" if we follow Alexander's
> suggested approach) pinctrl state should refer to the &tsadc_shut_org
> config instead of &tsadc_shut - then the PMIC reset works.

Huh, thanks for debugging, but this is quite confusing.  Let me dig
through everything again later today.

