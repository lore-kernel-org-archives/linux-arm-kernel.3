Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E1BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuJI1JRg8NeSQ2KgmIU707AKWB7lrYa01oU5oSVFV/c=; b=JyM7AUmPpSUY+31Xw7WKfqLAZ3
	v5oY3F3t3hsreHKy30qwSbD7zY2KVI2XkjRzC5nqON2Dh+1YrLiyJBBP3y/kxUCCXjmMIGk82j0C9
	l61mMy+9/DLOb5AImTF4A8V/5ojoJyHgCOA2sdnEg1yH90BEsWKsE0BKJ6DG2eVHYQiG2RCFdeYjn
	IePXPuaXtaFFKzLUMZMlyBFd5dfMWFwFA5ob25pAdOB10b5u786orZ/nWah/+pDY/SL6AiNOYZcMU
	N+BFtPKFtse4wgvRT/o0tAud0Qcvdi+beSQuIAZVhjZihlLalJ9bCAGyJTE7uf7a6KaOrzTkvC456
	/Q7dQaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTmk-00000001yxl-4AlU;
	Wed, 22 Oct 2025 08:01:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTmg-00000001yvR-1md1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:01:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vBTmU-0003pK-Pu; Wed, 22 Oct 2025 10:01:14 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vBTmU-004r70-1R;
	Wed, 22 Oct 2025 10:01:14 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2C9EB48CD55;
	Wed, 22 Oct 2025 07:57:49 +0000 (UTC)
Date: Wed, 22 Oct 2025 09:57:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	Maud Spierings <maudspierings@gocontroll.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: Add the GOcontroll
 Moduline IV
Message-ID: <20251022-innocent-micro-reindeer-5baf06-mkl@pengutronix.de>
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-4-20af8f9aac14@gocontroll.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxa4q2agib3drh4u"
Content-Disposition: inline
In-Reply-To: <20251022-mini_iv-v2-4-20af8f9aac14@gocontroll.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_010126_472025_28602366 
X-CRM114-Status: GOOD (  11.28  )
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


--pxa4q2agib3drh4u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: Add the GOcontroll
 Moduline IV
MIME-Version: 1.0

On 22.10.2025 09:22:40, Maud Spierings via B4 Relay wrote:
> +	can@2 { // reg vdd?

What about this comment?

> +		compatible =3D "microchip,mcp25625";
> +		reg =3D <2>;
> +		clocks =3D <&mcp_clock>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 =3D <&pinctrl_can1>;
> +		pinctrl-names =3D "default";
> +		spi-max-frequency =3D <10000000>;
> +		xceiver-supply =3D <&reg_can1_stby>;
> +	};

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pxa4q2agib3drh4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmj4jnkACgkQDHRl3/mQ
kZxZwwf+KpjbQgWmUFLp56sny+5XAwlaxkBqCad+kiFnLVez+S26CcuzHSvGHkJk
0Ghc442UXJQhtvqR5HD1mJnVkNr0mTuFW50C+0pt1f1p2M9Efs96f1BVV8UHTS0b
zfsq0rqllhG/oXImasKHusL6OGuthVtZhAIzZAGexKQV6wurz/ZNIPuXpMubrJdP
ZgEMWQkqLXq7aY4H7mM+ly0/S7kVHfQiDTMLZioxAbmjx0iM+OcB47mtFcODM4a7
zbqWwNmXeTq4oVs5ZZgK5+pMPGr8fJpTjotJN+CDF6sv7FXruiOVaA4wXqdFZE7C
3dKbQGybI+GSDvh/u+LsI2bWiawG4w==
=MV+c
-----END PGP SIGNATURE-----

--pxa4q2agib3drh4u--

