Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E3FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/85cBozlC2xgCBTAbhplu80kMsNDggD57qUAZNnBQxI=; b=DtPAhdsrBw37L4+xjlFmnMODeA
	oeEZGpDSk6cA/YgecsxNz4NkWhRplQaLtdEOiiLwjPMWbbayumG+vG1lJUMmESy0VObtl6I2loiHN
	BHw05B/f1Mbk+lRy884hCgDx4MQLx60wOM3d0pYxofYi+BANnwz7l9GBAG4vhcqFy4W+gsx3isFDI
	OzXUt5JGwXZomrTxFHL4qeyQJfMJKVbU7fRhS+UBSuxUDSFwqE0xR0TcVPB+U3aRS98xbrpdAZwbt
	duF5iRGG4vc1X2Hfh+SBF2/ZTdh+T7hj5ghLiMyqEHQa6JUQmLIP8NcJjr63/uh5MyvasUeORnkzD
	TkdsUO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pQ-00000007IHG-40Og;
	Tue, 10 Jun 2025 15:23:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwwt-00000006dBL-1dj5;
	Tue, 10 Jun 2025 11:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/85cBozlC2xgCBTAbhplu80kMsNDggD57qUAZNnBQxI=; b=tsBVOirOAvOm71dK34kUlVeUNi
	ouTxpOtMJtNNtzjjiUEZWob1gPEsFEEPEOqcSoM3KdScCZBo/7t+WyOcGCd2XMRbdY1ROI9/wzWBN
	IrOADU6laOx8+wUXbBcCZD80AN35RejZHuXm2s/ozUkfql+al0+JYH7sPfNgaSxItrTm9KzOOKEm4
	cxB7A8agEwhqAIL5dAPt3k6iOEIV0pRtKFkGYxnS+cZ2yFOIFZ8MA2LMf9wjET5/DDQMl7o4h0dFz
	hIkIEhaE7GXDXV6L4a/19zTHLwBBvfxmudLReOsyXQEYiMdIrYadRoijTI4tS1XIDp+pgYdMNw/xf
	6pdcmNtA==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOwwq-0000iK-Fz; Tue, 10 Jun 2025 13:15:20 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Peter Robinson <pbrobinson@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Peter Geis <pgwipeout@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add overlay for RockPro64 screen
Date: Tue, 10 Jun 2025 13:15:19 +0200
Message-ID: <7187768.GXAFRqVoOG@diego>
In-Reply-To: <78773d27-d815-4fac-a131-275bde51788d@kernel.org>
References: <20250518215944.178582-1-pbrobinson@gmail.com>
 <62276efe-13ca-448c-ad1d-ec0a8657737f@kernel.org>
 <78773d27-d815-4fac-a131-275bde51788d@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_041523_454661_94A53D55 
X-CRM114-Status: GOOD (  22.43  )
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

Am Dienstag, 10. Juni 2025, 12:48:50 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Krzysztof Kozlowski:
> On 10/06/2025 12:44, Krzysztof Kozlowski wrote:
> > On 18/05/2025 23:59, Peter Robinson wrote:
> >> The Pine64 touch panel is a panel consisting of the Feiyang fy07024di2=
6a30d
> >> panel with a Goodix gt911 touch screen. Add a device tree overlay to
> >> allow the display to be easily used on the device.
> >>
> >> This was previously included in the main device tree but left disabled
> >> by default which still required rebuilding the DT to use the device, n=
ow
> >> overlays can go upstream the overlay is the best way to handle the
> >> add on devices.
> >>
> >> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/Makefile         |  9 ++
> >>  .../dts/rockchip/rk3399-rockpro64-screen.dtso | 89 +++++++++++++++++++
> >>  2 files changed, 98 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-scre=
en.dtso
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/d=
ts/rockchip/Makefile
> >> index 3e8771ef69ba1..c7b13bff3ac20 100644
> >> --- a/arch/arm64/boot/dts/rockchip/Makefile
> >> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> >> @@ -77,6 +77,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rock-pi-4c.d=
tb
> >>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rock960.dtb
> >>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64-v2.dtb
> >>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64.dtb
> >> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-rockpro64-screen.dtso
> >=20
> >=20
> > This was absolutely never built as reported by Naresh. You should never
> > sent patches which are at least built tested... although they should be
> > actually tested as well, but if code does not build actual testing is
> > impossible.
>=20
> Huh, I was wrong - this actually builds, just cannot execute install targ=
et.

I did build it as well after applying - but still managed to overlook the d=
tso vs. dtbo
But I'm surprised that still built yesterday

I'll amend the commit for the dtso -> dtbo change.


Heiko



