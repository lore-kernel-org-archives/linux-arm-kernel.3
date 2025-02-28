Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13949C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECLerjzv+H/miryyyI3JVrdXALKCrkwjtOhpAWLsV8c=; b=Xw6u52m98+NLsihbkpa680e6FX
	W+zk6Whks0vsuPUFRNBYmXqqAd9TO8NSvXZGBst65I6PksO6UW8KYuuIHXBDrzyaJlN0gNHVIXGOI
	k8oxt7KyooBjEVh9ggvEKvMoRMN12axglwgimgrOOPl/n8PxpEceXws9QcG2p8kGaLpkd3iUPDmGU
	tpzdpJsMaIg6AdmgTZt+Me9xgnlUivkuGUIrQbteAc0wtc2MAiN533wDBs/vYdgwkga8+N3QfJxZK
	T0uUcYYCfOtUvxj0FQjz3lQuPbx+D1SoNsgTCy7qTVrAeMRCPiNvUNjGsP5SbeW9/fw36HExjO3mI
	xTkcy7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvYa-0000000A8hs-3Tos;
	Fri, 28 Feb 2025 08:17:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvT6-0000000A7Ne-1ahI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 08:11:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnvSx-0001Ku-9e; Fri, 28 Feb 2025 09:11:27 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnvSw-003GJi-2L;
	Fri, 28 Feb 2025 09:11:26 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 5BA913CDEE4;
	Fri, 28 Feb 2025 08:11:26 +0000 (UTC)
Date: Fri, 28 Feb 2025 09:11:24 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <20250228-astonishing-didactic-guillemot-9c78ff-mkl@pengutronix.de>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
 <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
 <20250227-monumental-whale-of-security-b1c84e-mkl@pengutronix.de>
 <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6hsk4jscu4czxbb"
Content-Disposition: inline
In-Reply-To: <Z8CWsI/DKZtDBkzE@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_001136_418139_87EAE15F 
X-CRM114-Status: GOOD (  36.64  )
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


--t6hsk4jscu4czxbb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
MIME-Version: 1.0

On 27.02.2025 11:45:36, Frank Li wrote:
> On Thu, Feb 27, 2025 at 11:57:54AM +0100, Marc Kleine-Budde wrote:
> > On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
> > >
> > > On 21.02.2025 21:56, Frank Li wrote:
> > > > On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
> > > >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > > >>
> > > >> AIPS5 is actually AIPSTZ5 as it offers some security-related
> > > >> configurations. Since these configurations need to be applied befo=
re
> > > >> accessing any of the peripherals on the bus, it's better to make A=
IPSTZ5
> > > >> be their parent instead of keeping AIPS5 and adding a child node f=
or
> > > >> AIPSTZ5. Also, because of the security configurations, the address=
 space
> > > >> of the bus has to be changed to that of the configuration register=
s.
> > > > The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map=
 only
> > > > config address part in your drivers.
> > > >
> > > > Frank
> > >
> > >
> > > Any concerns/anything wrong with current approach?
> > >
> > >
> > > I find it a bit awkward to have the whole bus address space
> > > in the DT given that we're only interested in using the access
> > > controller register space.
> > >
> > >
> > > I'm fine with the approach you suggested but I don't see a
> > > reason for using it?
> >
> > Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
> > Applications Processor Reference Manual, Rev. 3, 08/2024), the
> > AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
> > different than the bus configuration. Why not model it as part of the
> > bus?
> >
> > > >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8mp.dtsi
> > > >> index e0d3b8cba221..a1d9b834d2da 100644
> > > >> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > >> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > >> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
> > > >>  			};
> > > >>  		};
> > > >>
> > > >> -		aips5: bus@30c00000 {
> > > >> -			compatible =3D "fsl,aips-bus", "simple-bus";
> > > >> -			reg =3D <0x30c00000 0x400000>;
> > > >> +		aips5: bus@30df0000 {
> >                        ^^^^^^^^^^^^
> > > >> +			compatible =3D "fsl,imx8mp-aipstz", "simple-bus";
> > > >> +			reg =3D <0x30df0000 0x10000>;
> > > >> +			power-domains =3D <&pgc_audio>;
> > > >>  			#address-cells =3D <1>;
> > > >>  			#size-cells =3D <1>;
> > > >> +			#access-controller-cells =3D <0>;
> > > >>  			ranges;
> > > >>
> > > >>  			spba-bus@30c00000 {
> >                         ^^^^^^^^^^^^^^^^^
> >
> > This looks very strange: The aips5 bus starts at 0x30df0000 and has a
> > child bus starting at 0x30c00000?
>=20
> @30df0000 should match controller reg's address.
>=20
> subnode address 0x30c00000,  should be descript in "ranges", which 1:1 ma=
p.

Ok. What about aips1...4? Should the be changed as well in this patch?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--t6hsk4jscu4czxbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfBb6oACgkQDHRl3/mQ
kZys/Af+JyX79oEo+P42qia0ifhUHhQ8uxl4ubBgAq31jz/UbCwphkgDjXDi58Yr
GEnxGy2rsLcwwyivdNwDMLAmlUx6Kc2ufwOC5cVbtUV4hvkb8FvaMCKg0SnHWSVE
AYbPnnjeYF9AWiDzK6hS48Ml8LUuFGordlFBMtXpreyGQsxJ9brOqEJw4U/q0qbO
O6RDfZPqmFXyiTaw74+Nt1plN8pW2cOod4vT/5kBqPQgDJYvoePucEaZDPQZp+o5
b1dSH6J75wo0PKIiCbbKJ6oaflX7YUJNg61FxHxLGmm+rEoCwOc6ieHgM+6uAMtu
SArJMXcrD5c2+tHQu2ndLQl+tQ+Scg==
=/SWf
-----END PGP SIGNATURE-----

--t6hsk4jscu4czxbb--

