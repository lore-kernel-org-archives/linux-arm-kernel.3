Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E840DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWBAlXIiGSk72+6SessRFhuHLNEcm290ACC2CqugoH8=; b=OcwU3kVRKEnKLr39xHtQQEknkm
	UJyRzVTy11t65szkzm0GVmw4VFc4YFXkYtvrQkcVJUvidbP2MvFvniTmTjlr989S2CaESU8NA8CMo
	EzNxLN66KMJslvgqhjd5aeHoF+9jsd3F3hOoBY9pO7iwno16XmSDOoRYpbMX28aqoMm0oVMH4PTHr
	IT1eqds7DP3GBpfEPKG0+D6CeifHBmZMDknp3YNVN0HWuACZc6xp7mnYQuBbHH3HVf8G/8Nt0Tdao
	xnNKzwrN6EeddwKuxNLKUYZHji81XhcNIes1iIsLt627+aG0ynaJiGR/ZHX+3SIBg37k+SmsbQttj
	6PNmD/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx75q-00000006TmC-1Q0j;
	Tue, 25 Mar 2025 16:25:34 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6xE-00000006SCE-3yOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 16:16:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EF54102F66E4;
	Tue, 25 Mar 2025 17:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742919398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=RWBAlXIiGSk72+6SessRFhuHLNEcm290ACC2CqugoH8=;
	b=etuhEHLcGMuGJ2sHkEQHMUW7CYyd3kSRO3VgG7YzetdL6iKlTmQA65K9QexSY4M43MDD/r
	KCcEd+MmekrLuoa37EcJI/0jVOs3zXxpLl1cNyqzsJwavPkatyebPXJQXI+e0SWcf9o4eS
	AWqtCd6tTylJ06cBTHBZfrXyioOnFHYokl3L/EkiJMyvXIzE9MnzQe5s011oXV+4lGofXM
	pfrMFFlbky0wXbK5uLpu8eZlkIxe/PjP4+fC8ikwsQ9kfo1YuS51Ftr2OF/xs0Dlhmm6VT
	0TURP8y1DhSClSnNk+U1Lc1odU0a219CNa/vm6D3qm0KjQMMA9r/8Loc5VVXmg==
Date: Tue, 25 Mar 2025 17:16:34 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>, Jakub
 Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 davem@davemloft.net, Andrew Lunn <andrew+netdev@lunn.ch>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Richard
 Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, Maxime
 Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 4/5] arm: dts: imx287: Provide description for MTIP L2
 switch
Message-ID: <20250325171634.1c982583@wsk>
In-Reply-To: <40c6c272-d4a3-4bf2-87a1-17086d96afea@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
	<20250325115736.1732721-5-lukma@denx.de>
	<40c6c272-d4a3-4bf2-87a1-17086d96afea@lunn.ch>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/greT4myIzbgADdfT0SPqvTm";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_091641_135675_1D97FD65 
X-CRM114-Status: GOOD (  25.49  )
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

--Sig_/greT4myIzbgADdfT0SPqvTm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> On Tue, Mar 25, 2025 at 12:57:35PM +0100, Lukasz Majewski wrote:
> > This description is similar to one supprted with the cpsw_new.c
> > driver.
> >=20
> > It has separated ports and PHYs (connected to mdio bus).
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >  arch/arm/boot/dts/nxp/mxs/imx28-xea.dts | 56
> > +++++++++++++++++++++++++ 1 file changed, 56 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
> > b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts index
> > 6c5e6856648a..e645b086574d 100644 ---
> > a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts +++
> > b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts @@ -5,6 +5,7 @@
> >   */
> > =20
> >  /dts-v1/;
> > +#include<dt-bindings/interrupt-controller/irq.h>
> >  #include "imx28-lwe.dtsi"
> > =20
> >  / {
> > @@ -18,6 +19,61 @@ &can0 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&eth_switch {
> > +	compatible =3D "fsl,imx287-mtip-switch"; =20
>=20
> The switch is part of the SoC. So i would expect the compatible to be
> in the .dtsi file for the SoC.

Ok.

I'm also wondering if I shall use "fsl," or "nxp," prefix. The former
one is the same as in fec_main.c, but as I do add new driver, the
prefix could be updated.

>=20
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mac0_pins_a>, <&mac1_pins_a>;
> > +	phy-supply =3D <&reg_fec_3v3>;
> > +	phy-reset-duration =3D <25>;
> > +	phy-reset-post-delay =3D <10>;
> > +	interrupts =3D <100>, <101>, <102>;
> > +	clocks =3D <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> > +	clock-names =3D "ipg", "ahb", "enet_out", "ptp"; =20
>=20
> Which of these properties are SoC properties? I _guess_ interrupts,
> clocks and clock-names. So they should be in the SoC .dtsi file. You
> should only add board properties here.

Ok. I will add them.

>=20
>        Andrew

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/greT4myIzbgADdfT0SPqvTm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfi1uIACgkQAR8vZIA0
zr1rmggAx1FgdV+Uvb819ObkX0K7D/zPrmuFUWMVgi8RNIV2Wr55ejmrX3s/QQRV
emSwGiQ4g3CJL9w4bbtQ1lvEmxPMmzlzG69NXvgWyLykHKFLnlCQ8YBclJHRHNWy
gwzqLyqpSkM4RgM/qVh8Tqg1HEk9hyhwiLVwZo25qyPOq/0mPzbFhgqyKHi3CIxT
U75LviRxABG9/5/7/7cNgYsobJfrKjFA4rRDjXiSfxwv6gX0oO8hyKLGMviv+5B8
KBoETzr7Ukhty1Iqp2g8HyUAeU11GV+HxPwENZ6EwAy1FytBgKj28mP/kl+pAXLQ
zpHVgwgILNnvfDlFKcZPaAcUBdmeMw==
=gPXo
-----END PGP SIGNATURE-----

--Sig_/greT4myIzbgADdfT0SPqvTm--

