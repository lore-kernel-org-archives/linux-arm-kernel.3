Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E42C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 23:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNcOsk5TzziHvnFgJb5+muu5cjxZ1SD7xj6l5W6y5jM=; b=lVQ06WDoYV3O4OpkNSdwVpmbsg
	AQgXYmDRITFYIDEsGFfB1DV/zhxFWAkU3kvb3m1Dp30mXTpdloam1aQ/dE2HYnHIH3tM16fTHghGQ
	/XolbHp6uVe0RZ3TZMOpL6Jrzs+IgxAe4e3OxtMsPa7DsitmAW7rhPPPtW/LBuWdS//ZUyr08/PJl
	VPqRgG3UpcGfzEKmt6M6sain3sgkCF4eAVgAHdM4wz17fecKyKerLLePy4X/nWC7nKcvgYLxViBri
	eTd+33tFtNjNGZtDr984y1JcJQ4DecFSRyOSLIK5MVE490CHuguhhJzlOdZwpQPrbzQP2yuZ/gQQW
	/4pFWznA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u85Y0-0000000FWWC-3DcY;
	Thu, 24 Apr 2025 23:00:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u85W8-0000000FWGC-3kXh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 22:58:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E369D2F;
	Thu, 24 Apr 2025 15:57:57 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76533F59E;
	Thu, 24 Apr 2025 15:58:00 -0700 (PDT)
Date: Thu, 24 Apr 2025 23:56:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Yixun Lan <dlan@gentoo.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 clabbe.montjoie@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
Message-ID: <20250424235658.0c662e67@minigeek.lan>
In-Reply-To: <4643958.LvFx2qVVIh@jernej-laptop>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
	<4ba3e7b8-e680-40fa-b159-5146a16a9415@lunn.ch>
	<20250424150037.0f09a867@donnerap.manchester.arm.com>
	<4643958.LvFx2qVVIh@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_155805_018961_CFF2CDC7 
X-CRM114-Status: GOOD (  39.24  )
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

On Thu, 24 Apr 2025 20:38:34 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> cc: Corentin LABBE
>=20
> Dne =C4=8Detrtek, 24. april 2025 ob 16:00:37 Srednjeevropski poletni =C4=
=8Das je Andre Przywara napisal(a):
> > On Thu, 24 Apr 2025 14:57:27 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >=20
> > Hi Andrew,
> >  =20
> > > > > Just to be clear, you tried it with "rgmii-id" and the same <300>=
 and
> > > > > <400> values?   =20
> > > >=20
> > > > Yes, sorry, I wasn't clear: I used rgmii-id, then experimented with=
 those
> > > > values.   =20
> > >=20
> > > O.K, great.
> > >=20
> > > I do suspect the delays are not actually in pico seconds. But without
> > > a data sheet, it is hard to know.
> > >=20
> > >        if (!of_property_read_u32(node, "allwinner,rx-delay-ps", &val)=
) {
> > >                 if (val % 100) {
> > >                         dev_err(dev, "rx-delay must be a multiple of =
100\n");
> > >                         return -EINVAL;
> > >                 }
> > >                 val /=3D 100;
> > >                 dev_dbg(dev, "set rx-delay to %x\n", val);
> > >                 if (val <=3D gmac->variant->rx_delay_max) {
> > >                         reg &=3D ~(gmac->variant->rx_delay_max <<
> > >                                  SYSCON_ERXDC_SHIFT);
> > >                         reg |=3D (val << SYSCON_ERXDC_SHIFT);
> > >=20
> > > So the code divides by 100 and writes it to a register. But:
> > >=20
> > > static const struct emac_variant emac_variant_h3 =3D {
> > >         .rx_delay_max =3D 31,
> > >=20
> > >=20
> > > static const struct emac_variant emac_variant_r40 =3D {
> > >         .rx_delay_max =3D 7,
> > > };
> > >=20
> > > With the change from 7 to 31, did the range get extended by a factor
> > > of 4, or did the step go down by a factor of 4, and the / 100 should
> > > be / 25? I suppose the git history might have the answer in the commit
> > > message, but i'm too lazy to go look. =20
> >=20
> > IIRC this picosecond mapping was somewhat made up, to match common DT
> > properties. The manual just says:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 12:10  R/W  default: 0x0 ETXDC: Configure EMAC Transmit Clock Delay Cha=
in.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > So the unit is really unknown, but is probably some kind of internal cy=
cle count.
> > The change from 7 to 31 is purely because the bitfield grew from 3 to 5
> > bits. We don't know if the underlying unit changed on the way.
> > Those values are just copied from whatever the board vendor came up wit=
h,
> > we then multiply them by 100 and put them in the mainline DT. Welcome to
> > the world of Allwinner ;-) =20
>=20
> IIRC Corentin asked Allwinner about units and their response was in 100 p=
s.
>=20
> In my experience, vendor DT has proper delays specified, just 7 instead of
> 700, for example. What they get wrong, or better said, don't care, is phy
> mode. It's always set to rgmii because phy driver most of the time ignores
> this value and phy IC just uses mode set using resistors.

Ah, right, I dimly remembered there was some hardware setting, but your
mentioning of those strap resistors now tickled my memory!

So according to the Radxa board schematic, RGMII0-RXD0/RXDLY is pulled
up to VCCIO via 4.7K, while RGMII0-RXD1/TXDLY is pulled to GND (also via
4K7). According to the Motorcom YT8531 datasheet this means that RX
delay is enabled, but TX delay is not.
The Avaota board uses the same setup, albeit with an RTL8211F-CG PHY,
but its datasheet confirms it uses the same logic.

So does this mean we should say rgmii-rxid, so that the MAC adds the TX
delay? Does the stmmac driver actually support this? I couldn't find
this part by quickly checking the code.

Cheers,
Andre

> Proper way here
> would be to check schematic and set phy mode according to that. This meth=
od
> always works, except for one board, which had resistors set wrong and
> phy mode configured over phy driver was actually fix for it.
>=20
> Best regards,
> Jernej
>=20
> >=20
> > And git history doesn't help, it's all already in the first commit for =
this
> > driver. I remember some discussions on the mailing list, almost 10 years
> > ago, but this requires even more digging ...
> >=20
> > Cheers,
> > Andre
> >=20
> >=20
> >  =20
> > >=20
> > > I briefly tried "rgmii", and I couldn't get a lease, so I quite =20
> > > > confident it's rgmii-id, as you said. The vendor DTs just use "rgmi=
i", but
> > > > they might hack the delay up another way (and I cannot be asked to =
look at
> > > > that awful code).
> > > >=20
> > > > Cheers,
> > > > Andre   =20
> >=20
> >  =20
>=20
>=20
>=20
>=20
>=20


