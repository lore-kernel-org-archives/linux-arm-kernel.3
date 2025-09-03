Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E826CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4cIf/LKyf2NFfPm609tLk0xDglhWspNezwjyINHGN0=; b=aEwwh5HNqXNOgz7MmeLMtKsJlQ
	pkQz9bAiyj8awm23Y3hqZx98Y8rzl99HieoFS/90ul6rZk5SOxoeXkHtFPqJ4VsPGOa4Hh6vzPGdD
	hu6xlWM5fSAV52xpOEJ3pIDrikKOAamVGTND9/rdgzInRhfWvMOF1rfeAZFw7LrYexsL7V/SIzTYD
	v2thxy0dWmmrl75KrCc256UAnq18IUg2xkLN4TE7mo5Xur9L7xCRVB8xqINVU8J/hWwpncIjbx/5I
	6kVKd52ZfMDA3TUgL6OvyTk4huc5k4AtRmrOPAo5MG0f0+KJM0Sq5YlYWn9LwSKYlIbA42R3D/EKP
	AjGaS4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvQn-00000007j9m-1b2L;
	Wed, 03 Sep 2025 21:54:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpEQ-00000006s4H-2WV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:17:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1utpEB-0006Li-Pb; Wed, 03 Sep 2025 17:16:51 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1utpE9-003a6L-2s;
	Wed, 03 Sep 2025 17:16:49 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 79C52465B63;
	Wed, 03 Sep 2025 15:16:49 +0000 (UTC)
Date: Wed, 3 Sep 2025 17:16:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux-can@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: stm32: add resets property to m_can
 nodes in the stm32mp153
Message-ID: <20250903-uncovered-magnetic-marmot-dd7c37-mkl@pengutronix.de>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
 <20250807-stm32mp15-m_can-add-reset-v2-2-f69ebbfced1f@pengutronix.de>
 <59f25804-d310-4492-b95f-19c42cf3cd42@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="drmik7hqv5i24xa5"
Content-Disposition: inline
In-Reply-To: <59f25804-d310-4492-b95f-19c42cf3cd42@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_081706_641004_7B3306D3 
X-CRM114-Status: GOOD (  21.88  )
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


--drmik7hqv5i24xa5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] ARM: dts: stm32: add resets property to m_can
 nodes in the stm32mp153
MIME-Version: 1.0

On 03.09.2025 15:10:42, Alexandre TORGUE wrote:
> Hi Marc
>=20
> On 8/7/25 08:09, Marc Kleine-Budde wrote:
> > On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
> > shared reset in the RCC. Add the reset to both m_can nodes.
> >=20
> > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > ---
> >   arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/s=
t/stm32mp153.dtsi
> > index 4640dafb1598..92794b942ab2 100644
> > --- a/arch/arm/boot/dts/st/stm32mp153.dtsi
> > +++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
> > @@ -40,6 +40,7 @@ m_can1: can@4400e000 {
> >   		interrupt-names =3D "int0", "int1";
> >   		clocks =3D <&rcc CK_HSE>, <&rcc FDCAN_K>;
> >   		clock-names =3D "hclk", "cclk";
> > +		resets =3D <&rcc FDCAN_R>;
> >   		bosch,mram-cfg =3D <0x0 0 0 32 0 0 2 2>;
> >   		access-controllers =3D <&etzpc 62>;
> >   		status =3D "disabled";
> > @@ -54,6 +55,7 @@ m_can2: can@4400f000 {
> >   		interrupt-names =3D "int0", "int1";
> >   		clocks =3D <&rcc CK_HSE>, <&rcc FDCAN_K>;
> >   		clock-names =3D "hclk", "cclk";
> > +		resets =3D <&rcc FDCAN_R>;
> >   		bosch,mram-cfg =3D <0x1400 0 0 32 0 0 2 2>;
> >   		access-controllers =3D <&etzpc 62>;
> >   		status =3D "disabled";
> >=20
>=20
> How those reset are handled at driver side ?

I've created a patch that adds a shared reset to the m_can driver:

| https://lore.kernel.org/all/20250812-m_can-fix-state-handling-v1-7-b739e0=
6c0a3b@pengutronix.de/

The reset is de-asserted during probe and when the interface does up,
otherwise it asserted. This way the IP gets reset only when both
interfaces are down.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--drmik7hqv5i24xa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmi4W90ACgkQDHRl3/mQ
kZw7OQf+IAk77vePmsl5sa2RCJ64dVjof83jSrEidTOll5/fyIaPux6Y/xW/WlOl
r7Jiw9c8rTb66LdAl7QxlV9SthVj3iaD8qIRt3jFOTHtLOVOjuOh6UPP3rdoSSQS
rE/eve4ZibgRYje/9Uzey2lJ2Mybq/qDtexmqzygOngruvvWLe+4BdKHykjQPBXu
TnGA+vSAVZ7Gd0vmbSeL7OWBMLD4i6i5L0SW1O2L5vLVGr7eHSqHp+TAP4Qwd2ls
oJwojmqYInUMNjCsZyDpX+/O60KsA0wlWnp5JCoIM4JwuzDSruI6mBTeChvRdQc4
S2srAIKWU7ZOpyhRiJ0Sq0Jw2hY9Xg==
=u+QD
-----END PGP SIGNATURE-----

--drmik7hqv5i24xa5--

