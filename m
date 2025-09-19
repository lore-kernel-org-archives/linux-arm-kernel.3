Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EF1CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaMJMX/umNULrcGEgKJlRZR7C4PD7YTrpkq40L4KBHc=; b=iDyx4+pNfYvqJ7H9nnOZzsPhRC
	Usaq5HakxG8yKuU6J1P5JpkvD2dpXsUPJpTgEop/3ESCTfsRvKCzJJmyRoKOHZdFr1KwiNX0FpqJU
	dImOUyiXiaD/4Vb6Hn59bdBiZGwGs6+2FqcjWVeB1FZvYMdHblePu+pUGTG45Xo5b41kkxc4x4rdj
	XcJiTQNfQXyvu9B6JCXXAS84Hn1NUVBMQlywvrGqwjXjxkmfe47r8MbYA3ZReIamQzmXVWWjpVS5L
	imGu+G2KC5sGM+4694fhNzjrl9KPeIttC19dH3f5Xi34EGFi5bayFsNrK3q6j57LArP29uZaYrh8W
	WANBrczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYBM-00000002WOG-0Xkb;
	Fri, 19 Sep 2025 10:17:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYBJ-00000002WNm-2ob5;
	Fri, 19 Sep 2025 10:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:Cc;
	bh=AaMJMX/umNULrcGEgKJlRZR7C4PD7YTrpkq40L4KBHc=; b=m97FghaklI6Mh+XLjeYg/ACj+Y
	59uf6lQkpa4JFaU5j+EH/ZzQjNRhgbdhVreCHInAydmdAgSlJJfW4kKoRNHVYOpbp5FcNigPqgTfA
	pCI/hl18DgxzPsWSlB3JUmD3PbKulXmf3dAMX/xHCUS+RryKRAhoSqjx+QH3ff/m9o8VwvuGUP+YH
	nJUNBn2H0lkhvtS74t31UFhEaC0yV4bX36LO9x9qGeyvZBPNpRXTXYA/9+p22GGdbcQJo6b8nIs+Y
	ADYHuy5ccq4UckYxaBuQCjxDGCm49OzOzGTU6NIqvxIcWEy4AuZYKrI6hjlVkQqsNWSb7hr3JRpd9
	ZeV8SDlw==;
Received: from i53875b0f.versanet.de ([83.135.91.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzYBG-0007nN-9m; Fri, 19 Sep 2025 12:17:30 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ed W <lists@wildgooses.com>,
 FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO3
Date: Fri, 19 Sep 2025 12:17:29 +0200
Message-ID: <1971910.g5d078U9FE@diego>
In-Reply-To: <0DB47BC84E90B0E6+694b1274-4826-4ec1-9aa2-ca8aa790f61a@radxa.com>
References: <20250917114932.25994-1-lists@wildgooses.com> <2325560.3ZeAukHxDK@diego>
 <0DB47BC84E90B0E6+694b1274-4826-4ec1-9aa2-ca8aa790f61a@radxa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_031733_739782_4DA703D0 
X-CRM114-Status: GOOD (  32.07  )
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

Am Freitag, 19. September 2025, 01:57:57 Mitteleurop=C3=A4ische Sommerzeit =
schrieb FUKAUMI Naoki:
> Hi Heiko, Ed,
>=20
> On 9/19/25 01:18, Heiko St=C3=BCbner wrote:
> > Am Donnerstag, 18. September 2025, 17:23:04 Mitteleurop=C3=A4ische Somm=
erzeit schrieb Ed W:
> >> On 18/09/2025 05:53, FUKAUMI Naoki wrote:
> >>> Hi Ed,
> >>>
> >>> Thank you very much for your work.
> >>>
> >>> On 9/17/25 20:49, Ed Wildgoose wrote:
> >>>> The rk3566 has multiplexed pins and the uarts can be moved to a choi=
ce
> >>>> of 2 pin groups. The default rk356x-base.dtsi appears to default to =
mux0
> >>>> for all uarts, however, specific hardware might choose to implement
> >>>> alternatives
> >>>>
> >>>> The Radxa zero 3 shows that is uses M1 for uarts:
> >>>> - uart4
> >>>> - uart5
> >>>> - uart9
> >>>>
> >>>> These aren't normally enabled, but we should at least correct the
> >>>> default pinctrl definitions. Without these changes there will be
> >>>> conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.
> >>>
> >>> Sorry, but why do we need these definitions for disabled nodes?
> >>>
> >>> Or why don't we do similar definitions for nodes other than uart?
> >>> For example, PWM12, I2S3, and SPI3 also use M1. Are they not related =
to SD/eMMC and therefore
> >>> don't need to be defined?
> >>>
> >>> If users want to use UARTs on pin headers, they will refer to the cor=
rect documentation[1] to
> >>> determine which pins are UARTs and will of course write the correct p=
inctrl definition.
> >>>
> >>> [1] https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-int=
erface#gpio-interface
> >>>
> >>> Best regards,
> >>>
> >>
> >>
> >> Personally, and I'm saying this as a user who is technical enough to f=
ix the definitions, it took me
> >> quite a few days to figure out what was wrong with the definitions and=
 understand the intricate tree
> >> of dtsi includes, to finally figure out why I couldn't just do a "stat=
us =3D "okay";" to enable the
> >> UARTs... (which is roughly what is shown in several radxa supplied ove=
rlays to enable uarts on
> >> various boards)
> >>
> >> So my vote would be to correctly define all the hardware for a given b=
oard. Then users can simply do
> >> a status=3D"okay" to enable and off they go.
> >=20
> > And I'd agree with that argument. Setting up the needed pinctrl settings
> > for the peripherals described in the device documentation
> > ( https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interfa=
ce#gpio-interface )
> >=20
> > is the sensible thing to do. While keeping the peripherals itself disab=
led
> > and for the user to decide which peripheral to enable.
>=20
> I'm not strongly opposed to this policy, but I thought if you're going=20
> to do this, you should do it for everything, not just UARTs.

yes, exactly
So patches for the other header peripherals welcome :-) .

But still it's nice to do it in steps like this one, as it makes reviewing =
easier.


Heiko



