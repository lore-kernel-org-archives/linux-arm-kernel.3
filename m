Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9482ED6ACF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFSjqU+E9Tllr6VdY3HJzR6MRcUOhvaX/RiBXCqTiz4=; b=vQWMnG+GU1Qnwd7aeTa7hhs6cG
	Yxivkg4onNwmAHYj3HytuPYqJPrtMTNKkbqeR2LWSGX7JYzGjgy4Wi1Y12pvIBFBkxCOrF/RqjSNq
	xGXiO72zIn3x+vE5VxAR4BgVI32+ioIel7kAvGxzXa0HlIhCoDZRVtP49El1qanc7FXQHDDQdpQom
	7OoikzBznHfuHKPwEYb5tO/4STjYkIz5bsC8VUdxO9k/xxdAI7RktTkeDY9VI9FPstuvvlZlQzzNg
	HVuh65pnKCrjehfzhwHh3wfsRXycvTMVaoWWR2b/eKD2eFYRRP7/fUzaecd0mVTO/zWXvAWeT9WHL
	7k08YfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKqe-0000000Dcaa-2Z1X;
	Wed, 27 Nov 2024 16:25:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKpg-0000000DcPv-08m2;
	Wed, 27 Nov 2024 16:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76C05A403C2;
	Wed, 27 Nov 2024 16:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A38C4CECC;
	Wed, 27 Nov 2024 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732724643;
	bh=udtlpz3tEcbApivtbF+WFTwB2TmLD0gnoCjWl9TRfMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEdy+yMwJNPcRsJ3zI0ESXkzdU3UZahNeW8N6y+xU8hSJhMM9cJQ2SchBQoNyf9LH
	 WopgHitWxqX131k+5F8HTJbHlkQ9Be/Hbs5lIyaeSRVWP7Lp81UKhts6L/Z1MirigU
	 L0PhLJs6YvAdkZ3WI9/6R9R/0QvZ6/AMFxlgJnBXYVyNcpKlEY4IarmOhxj+7pGt2y
	 yLdi+TnJS74VgH/cF1Kok2pjlhAWr4M0MN+ru/T2D1I47apsXjl0FvQGoBrDp2V4dJ
	 b6SbC3kE+VB6+5XeIixYsbMnJItReDz+22UbvrhyYJjhPcHBM1jpNky/+Zo5WrWmB7
	 EbLGbYUOvyzSA==
Date: Wed, 27 Nov 2024 16:23:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
	sebastian.reichel@collabora.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	dse@thaumatec.com, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Rockchip MIPI C-/D-PHY
 schema
Message-ID: <20241127-impromptu-tiptoeing-6c1b9ed2c93f@spud>
References: <20241126131736.465111-1-heiko@sntech.de>
 <20241126131736.465111-2-heiko@sntech.de>
 <20241126-pastrami-gusty-8b9df32ae00c@spud>
 <2213231.Mh6RI2rZIc@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/LUGouHf4SBUTfca"
Content-Disposition: inline
In-Reply-To: <2213231.Mh6RI2rZIc@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_082404_207839_C689456E 
X-CRM114-Status: GOOD (  19.86  )
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


--/LUGouHf4SBUTfca
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 07:38:35PM +0100, Heiko St=FCbner wrote:
> Hey Conor,
>=20
> Am Dienstag, 26. November 2024, 18:44:14 CET schrieb Conor Dooley:
> > On Tue, Nov 26, 2024 at 02:17:34PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > >=20
> > > Add dt-binding schema for the MIPI C-/D-PHY found on
> > > Rockchip RK3588 SoCs.
> > >=20
> > > Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> > > Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > > ---
> > >  .../phy/rockchip,rk3588-mipi-dcphy.yaml       | 87 +++++++++++++++++=
++
> > >  1 file changed, 87 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk=
3588-mipi-dcphy.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mi=
pi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-=
dcphy.yaml
> > > new file mode 100644
> > > index 000000000000..c8ff5ba22a86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcph=
y.yaml
> > > @@ -0,0 +1,87 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/rockchip,rk3588-mipi-dcphy.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip MIPI D-/C-PHY with Samsung IP block
> > > +
> > > +maintainers:
> > > +  - Guochun Huang <hero.huang@rock-chips.com>
> > > +  - Heiko Stuebner <heiko@sntech.de>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - rockchip,rk3576-mipi-dcphy
> > > +      - rockchip,rk3588-mipi-dcphy
> >=20
> > How many phys do each of these SoCs have?
>=20
> - rk3588 has two - each with a separate GRF for additional settings [0]
> - rk3576 has one
>=20
>=20
> Heiko
>=20
> [0] https://lore.kernel.org/lkml/D5F5C1RWVHG5.TSHPO29TXYEF@cknow.org/T/
> The register layout in each GRF area is identical, but each DC-PHY gets
> its own separate GRF io-mem block.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/LUGouHf4SBUTfca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dHnQAKCRB4tDGHoIJi
0sKHAQDyRrsdu04AIYeIKa/yoWGVW61Dgmc8zuF3PJhupjpSvwD/aP5gCI9OX1aZ
S3VqhYXp9SVFwvFVnquSYL7+DHuA3gc=
=nL8k
-----END PGP SIGNATURE-----

--/LUGouHf4SBUTfca--

