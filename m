Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0673C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+Nv/i3AGjRTsrY90yJrW/7RqYiOCVlJKwcvrzl0CdU=; b=F1njYI9cURQtbi2AUcuUTkYAAw
	00QTbV+KIlW5h3viFGzlp4CFcICrVRN6tNCKNOKm+IY4nf4kwIgxfS6a11HMRjVXXb3/sXpqyvr00
	54nYpmRzBymQMNrF/JITLKEsEdz51gbfcpte+kQpIuVor685ClBB2Z8d4nSh9FP9vtvAKAcj0yxCl
	kZSVFDynOtOIUnwh0+7a5TN7aIsqONgM/qh0HlX7Tqe0G4WhBEOmG2Xx55XjmknauUuQIPrcOZDoi
	39FfnBFUMnkmPepVtoZIUl3epx07yvgSyk8oun/H9p7QJWPkyjgWo8buaARrlcGg7hljmZeZ1gPW5
	5Eu4cU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbfm-0000000756T-0lTX;
	Thu, 27 Feb 2025 11:03:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbag-000000074Au-1Hub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:58:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnbaV-0008AV-Km; Thu, 27 Feb 2025 11:57:55 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnbaV-0036wT-18;
	Thu, 27 Feb 2025 11:57:55 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DA0BA3CD463;
	Thu, 27 Feb 2025 10:57:54 +0000 (UTC)
Date: Thu, 27 Feb 2025 11:57:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <20250227-monumental-whale-of-security-b1c84e-mkl@pengutronix.de>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
 <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
 <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khvk74ne4kfr3emu"
Content-Disposition: inline
In-Reply-To: <cd6a84cd-ff17-45df-becc-9bfc74522f73@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_025806_344829_4A19F632 
X-CRM114-Status: GOOD (  28.80  )
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


--khvk74ne4kfr3emu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
MIME-Version: 1.0

On 25.02.2025 16:14:34, Mihalcea Laurentiu wrote:
>=20
> On 21.02.2025 21:56, Frank Li wrote:
> > On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> AIPS5 is actually AIPSTZ5 as it offers some security-related
> >> configurations. Since these configurations need to be applied before
> >> accessing any of the peripherals on the bus, it's better to make AIPST=
Z5
> >> be their parent instead of keeping AIPS5 and adding a child node for
> >> AIPSTZ5. Also, because of the security configurations, the address spa=
ce
> >> of the bus has to be changed to that of the configuration registers.
> > The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
> > config address part in your drivers.
> >
> > Frank
>=20
>=20
> Any concerns/anything wrong with current approach?
>=20
>=20
> I find it a bit awkward to have the whole bus address space
> in the DT given that we're only interested in using the access
> controller register space.
>=20
>=20
> I'm fine with the approach you suggested but I don't see a
> reason for using it?

Looking at the "AIPS5 Memory Map" (page 34/35 in i.MX 8M Plus
Applications Processor Reference Manual, Rev. 3, 08/2024), the
AIPS5_Configuration is part of the AIPS5 bus. IMHO the bus is something
different than the bus configuration. Why not model it as part of the
bus?

> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/bo=
ot/dts/freescale/imx8mp.dtsi
> >> index e0d3b8cba221..a1d9b834d2da 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
> >>  			};
> >>  		};
> >>
> >> -		aips5: bus@30c00000 {
> >> -			compatible =3D "fsl,aips-bus", "simple-bus";
> >> -			reg =3D <0x30c00000 0x400000>;
> >> +		aips5: bus@30df0000 {
                       ^^^^^^^^^^^^
> >> +			compatible =3D "fsl,imx8mp-aipstz", "simple-bus";
> >> +			reg =3D <0x30df0000 0x10000>;
> >> +			power-domains =3D <&pgc_audio>;
> >>  			#address-cells =3D <1>;
> >>  			#size-cells =3D <1>;
> >> +			#access-controller-cells =3D <0>;
> >>  			ranges;
> >>
> >>  			spba-bus@30c00000 {
                        ^^^^^^^^^^^^^^^^^

This looks very strange: The aips5 bus starts at 0x30df0000 and has a
child bus starting at 0x30c00000?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--khvk74ne4kfr3emu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfARS8ACgkQDHRl3/mQ
kZy1eAf+NIqSit01hbOk1TNt3Hmnml2DOG0v3yFMt3q0JGMriHkU9Rfgf+J6HLQF
+7ZiOn+KkncBW72Or3hAO4/BjlQoHwaf7ds4d+INbRY9JZxlqc1HovkScesRV+Gi
ce/CK0cz7sG02xqvFf4D08p3GaC5Do6oGtXmlOt8Mi45HC3ulKLnri/In9ZnfGXb
HZQr89ukWg67YwLxVd+wwIQzoGPH/qWZAhe+f6lfB8SGd1Jcp+vLoFLBJ2LctquC
wShPsn0p+dzhjANxj8yNc3uIncdU5yToRwWTTjodk6xQez9Duc+JZplVPMx6ptoJ
W1mmqIcEGNHve3tu7qHKeKwmrpiH+w==
=8kNX
-----END PGP SIGNATURE-----

--khvk74ne4kfr3emu--

