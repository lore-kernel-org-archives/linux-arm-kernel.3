Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3CC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 13:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jf8oucjaK1PUq9ygRMGbT8F3uX6pkwlA/IWYUxxq5uo=; b=YoppnY3Eylt/U0lMw9JrOJKQNQ
	VoN5mKbmH4G1Yqi5OkFOORdLZvD29iogcdyIM9l4pWH3jRb4vPU2LhFx+v7VqM9NOWEsZh0HWtnKr
	oIYbLOr98sy+yAUWvXJoebe2rkV0Rryk6PFAeEPbb/jhMwzhR/xEeigL2hWiBvKo8WV7TZhX/92Lk
	KBUMLjS7gzh9ndsZ8fbR8nndh82CIhRtRilPvDqxEvmDsJnqixhGgY7qbaqoDzysygXjVt5Ozn9g4
	mVrAnAKfGTXN1OvguqhS72Tamfx2208q5HTu1qrCBqqZocKegferjr3y+obEeFqSygdr3tR8I11Ny
	WBVeM7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3b8x-0000000FxEg-1qdo;
	Sat, 12 Apr 2025 13:43:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3b78-0000000Fx5G-0Jmt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 13:41:44 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1u3b6o-0001Jb-4t; Sat, 12 Apr 2025 15:41:22 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1u3b6k-004b7M-3B;
	Sat, 12 Apr 2025 15:41:19 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 7F9563F66F8;
	Sat, 12 Apr 2025 13:41:18 +0000 (UTC)
Date: Sat, 12 Apr 2025 15:41:17 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, upstream@lists.phytec.de, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
Message-ID: <20250412-tentacled-rugged-bee-fd7e9c-mkl@pengutronix.de>
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-11-primoz.fiser@norik.com>
 <Z/fifUQ4M2doQbHx@lizhi-Precision-Tower-5810>
 <ef74e49d-c413-4719-a174-42df91384469@norik.com>
 <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gxqnwwxty7chqrbx"
Content-Disposition: inline
In-Reply-To: <Z/knehHQeTTUXgr3@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_064142_120500_D27E2845 
X-CRM114-Status: GOOD (  20.50  )
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


--gxqnwwxty7chqrbx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 10/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 CAN support
MIME-Version: 1.0

On 11.04.2025 10:30:18, Frank Li wrote:
> On Fri, Apr 11, 2025 at 10:08:21AM +0200, Primoz Fiser wrote:
> > Hi Frank,
> >
> > On 10. 04. 25 17:23, Frank Li wrote:
> > > On Thu, Apr 10, 2025 at 11:02:48AM +0200, Primoz Fiser wrote:
> > >> Add support for CAN networking on phyBOARD-Segin-i.MX93 via the flex=
can1
> > >> interface. The CAN1_EN regulator enables the SN65HVD234 CAN transcei=
ver
> > >> chip.
> > >
> > > Can you use drivers/phy/phy-can-transceiver.c to enable CAN phy inste=
ad
> > > of use hacked regulator-flexcan1-en.
> >
> > Sorry can't do.
> >
> > This doesn't align with other i.MX PHYTEC products using flexcan such as
> > imx8mp-phyboard-pollux-rdk.dts.
> >
> > Even the i.MX93 EVK uses the same mechanism.
>=20
> I think previous method is NOT good enough. Suggest involve CAN and PHY
> maintainer to discuss these.

Since d80bfde3c57a ("can: flexcan: add transceiver capabilities"), which
git mainline with v6.15-rc1 there is proper PHY support in the flexcan
driver. So from my point of view, there's no need to stick to regulator
hack.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--gxqnwwxty7chqrbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmf6bXoACgkQDHRl3/mQ
kZwtKQf/UtcudIKJDifikEV0AghboYKzi7fNrlv6P2KToZkTzAEVzcIRd+nmtol3
I1/xj7uJeFMIXZcjIFT/jvdLx7xot2SkQS0p1y3C96NMbeh6aAj9rtA0VYFN7y0C
PIQXb1K5YC4a4bZjcJO+JaJ2yE3PlZbwOKLP668zJyc+QCrg0bkLVsoYR4/x6liQ
nKQ2+qV40GzfUf00Z6qX4fCjZbRo7g49HWktiizh4pkbryBu7A1+f2Nrl3AN2ZCM
C7wafDh0zsN0DedbscwTJTVR1tQ1yP3YDwmQ2bYw2qs4wXqfnGTawgu7G38C4JO9
UM3PFskg4VWWndjcTNIKkc6L6VryyA==
=mCyB
-----END PGP SIGNATURE-----

--gxqnwwxty7chqrbx--

