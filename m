Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228CEC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Th1bsXYbOdZNBdF4HpkqWzJZdFEbTYJpHy2+yVwfjLk=; b=AKMjzTztNn2Y8DaQIqGuKV50i/
	aw3LThxeuYQaOmqNJcHc2xbF3r/j+wN07ICsBczjWcfgIfY3dE86Pkfwzdf01FgcDyZGLPwwzFO+s
	sqhubcaIB/HPl0H6zY4wnpFhBPi6Hprwcng0ieGzsB+JXAh0ZL8PPo3e3FlOqquAgtwwaRkr+Y4Sc
	f5HLz43LG6RMYbxkvukDOX2isjcoTB8DD8CZSNEf+C/4kS9rCrZAaLs8XX2zCvh+eACYIwkMHOt7Z
	4WWc16Vy1CbPABkG2XwaWRAT9e2SoNhQk6ecbeyRTpTvOrVQDOTbrpnl9tEQ7HGHMJFHIifX3xip/
	fSd/F+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM51v-00000007Rbq-3f0W;
	Mon, 02 Jun 2025 13:16:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4zk-00000007RPn-13HA;
	Mon, 02 Jun 2025 13:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Th1bsXYbOdZNBdF4HpkqWzJZdFEbTYJpHy2+yVwfjLk=; b=Zltz4DYEAJKKQbIDz9XRJRi/AJ
	59wjiN/h8OXZGaXQGB0452s2iFnI1zU+IPY1w8k5EKp4u81L8YgToJme/4Y7pK4jA7yez7TWCegkN
	OQGc6sZvsIGtymAkACMrMnE+3y/Vp/fxEgFVrLGadY4xXOxOmQoQjzfqn8Jw08rbA0Dys9bFKdTiw
	G2mLBp2M1MzNsCfMVOOIWHQmWJHz3hU0XprPlfMM2WzxPYznBwsqZaI8KwuAnwKZ6jyx/ju6Onc+R
	+P9cVvuKJ90OZhDAIq7vBruure411VR6UT/1AJtSwfuDuniO2L7l0hC3GCGZge3bprxpiH4EYriKg
	Pip1Md9A==;
Received: from i53875a2b.versanet.de ([83.135.90.43] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uM4zc-00038Y-5g; Mon, 02 Jun 2025 15:14:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 4/7] soc: rockchip: add mfpwm driver
Date: Mon, 02 Jun 2025 15:14:19 +0200
Message-ID: <1970051.6tgchFWduM@diego>
In-Reply-To: <13790724.uLZWGnKmhe@workhorse>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
 <2188729.OBFZWjSADL@diego> <13790724.uLZWGnKmhe@workhorse>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_061428_309231_BF9781F6 
X-CRM114-Status: GOOD (  31.03  )
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

Am Montag, 2. Juni 2025, 14:15:45 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Nicolas Frattaroli:
> On Saturday, 31 May 2025 23:48:29 Central European Summer Time Heiko St=
=C3=BCbner wrote:
> > Am Dienstag, 8. April 2025, 14:32:16 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Nicolas Frattaroli:

> > On a more general note, what is the differentiation to an MFD here?
> >=20
> > Like you can already bind dt-nodes to MFD subdevices, and can implement
> > the exclusivity API thing on top of a general mfd device, to make sure =
only
> > one mfd-cell gets activated at one time.
> >=20
> > Other than that, this looks like it reimplements MFDs?
>=20
> What initially made me not make this an MFD was Uwe Kleine-K=C3=B6nig exp=
ressing
> some doubts, which lead me to alternatives like the auxiliary bus. Readin=
g the
> auxiliary bus docs I found:
>=20
>   A key requirement for utilizing the auxiliary bus is that there is no
>   dependency on a physical bus, device, register accesses or regmap suppo=
rt.
>   These individual devices split from the core cannot live on the platform
>   bus as they are not physical devices that are controlled by DT/ACPI. The
>   same argument applies for not using MFD in this scenario as MFD relies =
on
>   individual function devices being physical devices.

Interestingly the 5 year old LWN article seems to have been overtaken by
real-world usage ;-) .

I see pinctrl/pinctrl-ep93xx.c using regmaps (and thus registers), similarly
in gpu/drm/bridge/ti-sn65dsi86.c and a number more.


> Additionally, LWN[1] about the auxiliary bus, which I've read up on durin=
g my
> ill-fated journey into that version of the driver, also goes further into=
 why
> MFD is sometimes a bad fit:

[...] LWN excerpt [...]

> The individual function devices may be all pointing at the same physical
> device here, but they're not distinct parts of the device. However, there
> still *is* a physical device, which convinced me that auxiliary bus wasn't
> the right one either, and the idea for just using the platform bus came
> during a work meeting. If someone with experience on aux bus vs platform =
bus
> (what this uses) vs MFD, then feel free to chime in. Unfortunately, as is=
 the
> norm, I can't seem to find much in terms of MFD documentation. Needing to=
 know
> what type of exclusion they guarantee and what type of abstractions they =
bring
> with them that would make them more useful than my solution would need so=
me
> justification in more than just an auto-generated header listing.

I think MFD itself does not provide any exclusivity - aka allowing definiti=
ons
that combinations of sub-devices cannot be used at the same time.

But as I see it right now, you have sort of a mfd-device in there, creating
all the sub-devices and then the aquire/release logic on top making sure
only one device is ever active at the same time.

Right now I really don't see (prone to code-blindness though) why the
aquire/release logic could not live in a mfd-device.


> I am very inclined to start pretending things that aren't documented do
> not actually exist in the kernel, because it's very annoying to have to
> constantly deal with this.

Sadly the "ostrich method" won't work ;-)

So as a way forward, I'd suggest you posting your v2, so that all the
current review comments get addressed and amending the
cover-letter with the aux-bux / mfd discussion thing (ideally in a
somewhat highlighed block so that people skimming along will notice)
and include the relevant people:

=2D for aux-bux get_maintainer.pl says:
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (maintainer:AUXILIARY BUS D=
RIVER)
Dave Ertman <david.m.ertman@intel.com> (reviewer:AUXILIARY BUS DRIVER)
Ira Weiny <ira.weiny@intel.com> (reviewer:AUXILIARY BUS DRIVER)
Leon Romanovsky <leon@kernel.org> (reviewer:AUXILIARY BUS DRIVER)

=2D and for MFD it's of course Lee:
Lee Jones <lee@kernel.org> (maintainer:MULTIFUNCTION DEVICES (MFD))


Heiko


> [1]: https://lwn.net/Articles/840416/





