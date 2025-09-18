Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AE2CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ninNeWEmz3Wj53O9s8gF8RXSPwXAfvqBAcR4jaHa4D8=; b=se4e0sxHgHa79NOCBadVKxs2Mb
	gpncbYO+zqG/YSxC5jA33Ref8Q69APpXZOPafRJ50JzyWK1mRelBWTlN67xuZaygiOG37bawfg59K
	kb+ar8JvhyShG/rwE54vdNZyZmwOo/0K/5c3e3sALth0uJKkGevRfbAeyAy7LpZGvnf4jtdLc3Qp5
	/yskvj6BXM3/8rZSa1OyFhLVxCaTBz2br+1eF7LqgBExM5A4I3hWmT19Pa49j8YYdaTLp0lvGDRlD
	FWezYEQjgQV+IRlGU8V6pwmRzh1PmhSs0rIwpn+LKOulXYsVR+3VivnZlVU+wy2Ekq7Xf+zP+oIma
	+RsxantQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHL5-00000000aXg-3JZh;
	Thu, 18 Sep 2025 16:18:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHL3-00000000aW5-1hAI;
	Thu, 18 Sep 2025 16:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:Cc;
	bh=ninNeWEmz3Wj53O9s8gF8RXSPwXAfvqBAcR4jaHa4D8=; b=IzQ3gB5kMzVaoDZubjbNyvLEeH
	Y8EdbjZaPEGufSFgqArSrQWsXjOqXDcS29gAZ0vIGFDLDkHN+tf/zsQhU0pD36a1MgA+ZpUDJE92u
	TMd9BLoua4CEivJdq133lp8O5VUx88Rm8pLgrCW+KaT2T4U0tv5AceP3RTE96YEw4AX/19Ut89mPq
	QxMBbt6IMKZAo30UAWTzK6I366Wcdo2yrHONbkGAv6g6foGiicswPvLocRMlPKepzB4l0xpe8PtKb
	MGjZV2tx4y3/53XQaQvvjmhvVTIX1EnNlHLeuXy/69Z99/kyJBdLOYuiuRQETLMdTMvvbQS0U55Au
	TKnxHl6Q==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzHKw-0001xW-Pd; Thu, 18 Sep 2025 18:18:22 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: FUKAUMI Naoki <naoki@radxa.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ed W <lists@wildgooses.com>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO3
Date: Thu, 18 Sep 2025 18:18:22 +0200
Message-ID: <2325560.3ZeAukHxDK@diego>
In-Reply-To: <adbc2396-d5f0-4dd6-a65e-0dd78a58b9a4@wildgooses.com>
References: <20250917114932.25994-1-lists@wildgooses.com>
 <FBB5B30DE8FEABD7+59ee6f48-2ad1-45dd-8cf1-8b58a03513a9@radxa.com>
 <adbc2396-d5f0-4dd6-a65e-0dd78a58b9a4@wildgooses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_091829_449965_E8920087 
X-CRM114-Status: GOOD (  29.92  )
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

Am Donnerstag, 18. September 2025, 17:23:04 Mitteleurop=C3=A4ische Sommerze=
it schrieb Ed W:
> On 18/09/2025 05:53, FUKAUMI Naoki wrote:
> > Hi Ed,
> >
> > Thank you very much for your work.
> >
> > On 9/17/25 20:49, Ed Wildgoose wrote:
> >> The rk3566 has multiplexed pins and the uarts can be moved to a choice
> >> of 2 pin groups. The default rk356x-base.dtsi appears to default to mu=
x0
> >> for all uarts, however, specific hardware might choose to implement
> >> alternatives
> >>
> >> The Radxa zero 3 shows that is uses M1 for uarts:
> >> - uart4
> >> - uart5
> >> - uart9
> >>
> >> These aren't normally enabled, but we should at least correct the
> >> default pinctrl definitions. Without these changes there will be
> >> conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.
> >
> > Sorry, but why do we need these definitions for disabled nodes?
> >
> > Or why don't we do similar definitions for nodes other than uart?
> > For example, PWM12, I2S3, and SPI3 also use M1. Are they not related to=
 SD/eMMC and therefore
> > don't need to be defined?
> >
> > If users want to use UARTs on pin headers, they will refer to the corre=
ct documentation[1] to
> > determine which pins are UARTs and will of course write the correct pin=
ctrl definition.
> >
> > [1] https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-inter=
face#gpio-interface
> >
> > Best regards,
> >
>=20
>=20
> Personally, and I'm saying this as a user who is technical enough to fix =
the definitions, it took me
> quite a few days to figure out what was wrong with the definitions and un=
derstand the intricate tree
> of dtsi includes, to finally figure out why I couldn't just do a "status =
=3D "okay";" to enable the
> UARTs... (which is roughly what is shown in several radxa supplied overla=
ys to enable uarts on
> various boards)
>=20
> So my vote would be to correctly define all the hardware for a given boar=
d. Then users can simply do
> a status=3D"okay" to enable and off they go.

And I'd agree with that argument. Setting up the needed pinctrl settings
for the peripherals described in the device documentation
( https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interface#g=
pio-interface )

is the sensible thing to do. While keeping the peripherals itself disabled
and for the user to decide which peripheral to enable.

Heiko



