Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3565CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz2thKifJmuimuViZo05mWoG7e6CD2hwI+lB9tLFrT0=; b=jenyWYhU/gUy9HiWHvo5LdpuQS
	l6BgZJzRvAyCsdM+uVwNds1+ptdqPXlmxwlCsLeOsGc32PfaSQRzgey/DtV6yFZFJQQXsFH3xWkW/
	E29ys89r9SU3L5K8LyRRYwMQKC1ebNW1wmllRuoVD/kd+jrbMoDWohTDWu3dgs8EBAjInNaKw3hvN
	JroMYy56/p9hzSrCtoR6RrvfPWu4qHf96Rt1VFvXyk5KqHW92OpoGzGA+djP98qFMieK4ord5tGUV
	4Ad9iktWCIldnAaKRJBa3F4LXBfYU5Gy6jBlacjB+79iLte9GWkE9Ke/oO+fVjnrTqizsJRP8hrDt
	AyMgexjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Rw-00000009ZSE-1HDu;
	Fri, 15 May 2026 21:52:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0Rt-00000009ZRh-2S8Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:52:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48101BCB;
	Fri, 15 May 2026 14:51:54 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 371183F85F;
	Fri, 15 May 2026 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778881920; bh=w/NSnWPxO2pPbEQZolqzwkIT6PojPrmpavCWj0wqYGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nCPJZG/ymBaYmcyERMbxLdIsHQoNGJJEJxaWy2/8f+2GnZIHlMZ+4GS5187VVvwoY
	 IH2pP9VPYV9gZM+MXD1JIlOMUxGgO/ZclmXl4a955uYPg0wdQKJNQFcQLflkdYlRLM
	 krq3CmKprRwSY7QjrDU8svR6X78wpShjn/zYDMXo=
Date: Fri, 15 May 2026 23:51:12 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Message-ID: <20260515235112.3d2a0c5e@ryzen.lan>
In-Reply-To: <CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
	<CAGb2v64u4sqwiiQcEBg-XvmJ2DLEpSj-_AWNbp14RAp-GXP7OA@mail.gmail.com>
	<ee9fca66-d079-4ad7-9cb3-5077e8a4f6d6@arm.com>
	<CAGb2v66drOyBgNU0hFo356MKTFnggNmyzrANok+-U31NzZCUEw@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_145201_817296_1D39271C 
X-CRM114-Status: GOOD (  36.43  )
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

On Sat, 16 May 2026 00:12:17 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> On Wed, May 13, 2026 at 5:19=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > Hi Chen-Yu,
> >
> > thanks for chipping in!
> >
> > On 5/13/26 07:21, Chen-Yu Tsai wrote: =20
> > > Hi,
> > >
> > > On Tue, May 12, 2026 at 6:18=E2=80=AFAM Andre Przywara <andre.przywar=
a@arm.com> wrote: =20
> > >>
> > >> The Cubie A5E board comes with 16MiB of SPI NOR flash.
> > >>
> > >> Enable the SPI0 DT node and describe the configuration.
> > >>
> > >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > >> ---
> > >>   .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++=
++++
> > >>   1 file changed, 15 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts=
 b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > >> index bfdf1728cd14b..7ad22fc85d1fd 100644
> > >> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > >> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > >> @@ -344,6 +344,21 @@ &r_pio {
> > >>          vcc-pm-supply =3D <&reg_aldo3>;
> > >>   };
> > >>
> > >> +&spi0  {
> > >> +       pinctrl-names =3D "default";
> > >> +       pinctrl-0 =3D <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
> > >> +                   <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>; =20
> > >
> > > This whole thing needs to be an overlay. The HOLD and WP pins
> > > conflict with eMMC usage, so it seems that Radxa only populates
> > > one or the other.
> > >
> > > If you look at the pictures on their official website, you'll see the
> > > SPI NOR chip populated, but not the eMMC chip. On the linux-sunxi wiki
> > > page, you'll see the opposite. =20
> >
> > Well, I have a hard time spotting any actual eMMC SKUs in the shops any=
way.
> > But you are right, the hold and WP pins conflict with eMMC, whereas the
> > other pins are not.
> > =20
> > > And you probably want to enable QSPI, like Sashiko mentioned. =20
> >
> > Well, in the interest of keeping this simple and enabling the usage of
> > SPI flash for all the users out there, I'd rather drop the extra pins.
> > This is mostly really useful for booting the firmware, maybe loading a
> > tiny kernel or other data once, so performance is not a big concern in
> > this use case. The BootROM surely does not use QSPI. =20
>=20
> Given that the pins are tied on physically, if someone then enables mmc2
> for a potentially present eMMC, the two pins could be toggled by the
> MMC controller, causing the flash to misbehave. I'm slightly concerned
> about this possibility.

That's a good point, but that means it's really a hardware design
issue: you cannot have SPI together with eMMC on this board.

I don't know if Radxa ships the eMMC SKUs without SPI flash, I
will try to query Tom Cubie about this.

I would prefer to go with SPI flash, at least for now: I think that's
what most users have, and the eMMC versions are rare so far? Since we
don't have an eMMC node in the DT anyway, that should be fine for now.
If someone adds eMMC support later, we would need to figure this out.
We could mark one as disabled, and leave it up to users (or U-Boot)
to decide which to enable.
On the H6 there is a similar problem: PC5 is both SPI0_CS and MMC2_CMD,
so on the PineH64 we disable the SPI flash, in favour of eMMC, which is
more useful for users (but sunxi-fel SPI access and U-Boot SPI loading
work nevertheless). But given the apparent prevalence of SPI boards vs.
those with eMMC for the Cubie A5E, I would go with SPI on this one.

Does that make sense? Any thoughts?

Cheers,
Andre

> > And as you say, if people are really interested in the last bit of
> > performance, they can use an overlay.
> >
> > Cheers,
> > Andre
> > =20
> > >
> > >
> > > ChenYu
> > >
> > > =20
> > >> +       status =3D "okay";
> > >> +
> > >> +       flash@0 {
> > >> +               compatible =3D "winbond,w25q128", "jedec,spi-nor";
> > >> +               reg =3D <0>;
> > >> +               spi-max-frequency =3D <40000000>;
> > >> +               #address-cells =3D <1>;
> > >> +               #size-cells =3D <1>;
> > >> +       };
> > >> +};
> > >> +
> > >>   &uart0 {
> > >>          pinctrl-names =3D "default";
> > >>          pinctrl-0 =3D <&uart0_pb_pins>;
> > >> --
> > >> 2.46.4
> > >> =20
> > > =20
> > =20
>=20


