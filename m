Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2CCC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yW2AlnZH3P68RTs2Trer/EvQB+AM0oI9rRCrjMjDNVI=; b=Mj5MkqtWkz7chjjNKBpKh3YM1P
	SGlBbAthp1hwbWznP3Y1C7r2Zz0rMxd4wZJD/OefKBbARPxqpX5hijgSgfB4iI/agkhes1m9ZFb8X
	c+Q/vK4MBb91lm9OrAdKjgkhV/qMaawahEhLJQ87gvDbHmVzko1Nh1Nv0Vbta4BWMB80hTz+RkP6b
	F/+0VG6epaIYX9MRBNpTuPXEQf6PVRF2RmRQbLE2f7LOPwEeCjZVZWzwfiglcuHO7lljjx1kVv4p4
	eSboHUjGy3nkFBnGofYvkr7vYUzhwW2QKlau9LPgjEPa+mewDQiVNLyG+AcsknWHXfdte/sXm+S7A
	j2GUp8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OK3-00000006QRw-42od;
	Mon, 28 Apr 2025 13:14:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Nqt-00000006FJz-2119
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:44:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4285E1516;
	Mon, 28 Apr 2025 05:44:41 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B9463F66E;
	Mon, 28 Apr 2025 05:44:45 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:44:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: sram: sunxi-sram: Add A523
 compatible
Message-ID: <20250428134435.76e19d29@donnerap.manchester.arm.com>
In-Reply-To: <20250428122156-GYA56330@gentoo>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
	<20250424-01-sun55i-emac0-v2-1-833f04d23e1d@gentoo.org>
	<20250428-vegan-stoic-flamingo-1d1a2a@kuoka>
	<20250428122156-GYA56330@gentoo>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_054451_614231_9AB0DCD5 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, 28 Apr 2025 12:21:56 +0000
Yixun Lan <dlan@gentoo.org> wrote:

> Hi Krzysztof,
>=20
> On 09:21 Mon 28 Apr     , Krzysztof Kozlowski wrote:
> > On Thu, Apr 24, 2025 at 06:08:39PM GMT, Yixun Lan wrote: =20
> > > The Allwinner A523 family of SoCs have their "system control" registe=
rs
> > > compatible to the A64 SoC, so add the new SoC specific compatible str=
ing.
> > >=20
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml=
     | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a=
10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,s=
un4i-a10-system-control.yaml
> > > index a7236f7db4ec34d44c4e2268f76281ef8ed83189..e7f7cf72719ea884d48ff=
f69620467ff2834913b 100644
> > > --- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-syst=
em-control.yaml
> > > +++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-syst=
em-control.yaml
> > > @@ -50,6 +50,7 @@ properties:
> > >            - enum:
> > >                - allwinner,sun50i-a100-system-control
> > >                - allwinner,sun50i-h6-system-control
> > > +              - allwinner,sun55i-a523-system-control
> > >            - const: allwinner,sun50i-a64-system-control =20
> >=20
> > No update for the children (sram)?
> >  =20
> No, I don't think there is sub node for sram
> From address map of A527, there is total 4KB size space of
> this section which unlikely has sram available.

That's something else, though. This system controller here *also* contains
a register to switch access to SRAM blocks between the CPU and the devices.
The actual SRAM blocks are somewhere else (hence the empty ranges;
property), check the H616 for instance:
	syscon: syscon@3000000 {
		compatible =3D "allwinner,sun50i-h616-system-control";
		reg =3D <0x03000000 0x1000>;
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		ranges;

		sram_c: sram@28000 {
			compatible =3D "mmio-sram";
			reg =3D <0x00028000 0x30000>;

Krzysztof, we haven't worked out the SRAM regions yet, we typically add
them only when we need them. I think the display engine is a prominent
user, and support for that is quite a bit out at the moment.

=46rom a compatibility standpoint it should be fine to leave this empty for
now, if I am not mistaken?

Cheers,
Andre

> but I do see some BROM/SRAM space from 0x0000 0000 - 0x0006 3FFF ..
> (which should not be relavant to this patch series..)
>=20


