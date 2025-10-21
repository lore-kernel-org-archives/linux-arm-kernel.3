Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B301CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99thKPLlHxxIN3ahqRfDfet0pr6M08fpjKP8oT47RGA=; b=ZJ27d7lBMGTx3ULWsNeU4KnbxK
	TOmfuugj+vZQKR8HtDRDW8lCWqYnVwNbMplrvbR0Zxr9nwQMfWNG4HOtNJKBALIJt8/7JzB/9vpvx
	RBmdbIE4u3gmCkdJ/iGqfWvBcO69o6EqU1EC4u/L02Ermi1XnA+qaS/wivvivP/y7Rwsu96YiWAW9
	fCFAg7OVTBgInm0ehEqib0F+KsOSTZYiRT4233/R3kmvOE3LCtihxf3HpRcZ2ZcrJugGnHZ04UO6d
	Gmx9Bl0rNRrLOBRcWV9mT7zID0IH7Ac+VLhgvMYXdQKhFul3jSucZNAjVIRrdnj0KXyjLBBmRukdJ
	YeCVyX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9NS-0000000GaEv-437D;
	Tue, 21 Oct 2025 10:14:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9NR-0000000GaEQ-1HyD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:14:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vB9NJ-0002U2-Ke; Tue, 21 Oct 2025 12:13:53 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vB9NJ-004hl8-0p;
	Tue, 21 Oct 2025 12:13:53 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B872848C042;
	Tue, 21 Oct 2025 10:13:52 +0000 (UTC)
Date: Tue, 21 Oct 2025 12:13:52 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	upstream@lists.phytec.de, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Add phyBOARD-Segin-i.MX91
 support
Message-ID: <20251021-elite-crab-of-spirit-744926-mkl@pengutronix.de>
References: <20251021093704.690410-1-primoz.fiser@norik.com>
 <20251021093704.690410-2-primoz.fiser@norik.com>
 <20251021-bright-brave-dolphin-906891-mkl@pengutronix.de>
 <4979a32f-f938-4956-8293-eca5667bf1c4@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="633ncal4gpk4csrw"
Content-Disposition: inline
In-Reply-To: <4979a32f-f938-4956-8293-eca5667bf1c4@norik.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_031401_348568_648D132B 
X-CRM114-Status: GOOD (  17.30  )
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


--633ncal4gpk4csrw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Add phyBOARD-Segin-i.MX91
 support
MIME-Version: 1.0

On 21.10.2025 12:07:13, Primoz Fiser wrote:
> >> +	flexcan1_tc: can-phy0 {
> >> +		compatible =3D "ti,tcan1043";
> >> +		#phy-cells =3D <0>;
> >> +		max-bitrate =3D <1000000>;
> >> +		pinctrl-names =3D "default";
> >> +		pinctrl-0 =3D <&pinctrl_flexcan1_tc>;
> >> +		enable-gpios =3D <&gpio4 16 GPIO_ACTIVE_HIGH>;
> >> +	};
> >=20
> > I think the tcan1043 is a CAN-FD transceiver. According to the datasheet
> > it support 2 MBit/s and 5 MBit/s in the "G" variant. However due to the
> > board layout, etc, the actual bit rate might still be limited to 1
> > MBit/s. Ask the HW engineers if in doubt.
>=20
> phyBOARD-Segin actually uses a TI SN65HVD234D CAN transceiver chip which
> supports up to 1MBps. See [1].
>=20
> However since there is no direct support for SN65HVD234D we model the
> enable signal with the generic PHY driver and use "ti,tcan1043" jsut as
> compatible. Suggested by Frank and you in [2].

hmmm, okay - I suggest to add a comment that mentions the actual
transceiver and that it's a 1 MBit/s CAN-CC transceiver.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--633ncal4gpk4csrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmj3XNwACgkQDHRl3/mQ
kZy5jAgAs7oItdqTyJWADrxD5vFJF9S4BVEJ17u41fKIp+iMmT0qPT7dOZ20oVH6
UjhrIJmT1goI0Skggzr0Fs4vnhLPA7bsLqMqZM6ZnbawW2+g4iKd13dvR3hHqRSV
c2dE/r6/U+DjaPs+Ijz7zR7FVHd5jyKI83LsDSYBdqNC7QM3RfFYYPTVbURfdhUX
1Es2zmH18iWgSBG3A+Url9o1sWuWQVFNDi6ogNFb8+94kk8YJLnSNyn18Us5p08j
pRgH/U8mlYfziMPSjzvT4hFZNnK/g+Rvdp/VbTjtvY6T94CoQUtvAKod+CHkbcjd
ldrScN+ZDNKPIH6DM0xe4PFTFD5l2Q==
=CrZZ
-----END PGP SIGNATURE-----

--633ncal4gpk4csrw--

