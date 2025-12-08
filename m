Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E54D3B7DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+GHZBp1xTsG+NvCUoENtB7SPDio0ubNpnMZVjFPIcM=; b=JQYKhq7oOPo0mxm4/v0uRV9zUx
	6VqaE0hcGpM/c4Nx7DRc+kSIpm2vlhl8OSsisISR8EimKWCnXyx1gxS+gTixsRGK64fUg0p6/V8YI
	mNq7tQGkRFwlwThEvOb1rYWYGdsiZr1nitnmyq0eTpjEjw6iZoirqS51MCO4gSMifTl1talyJm6Vd
	y86hQLpCIQv9Lqf0AVjiicv6rXqZmhT7nwCfWREw1r428IlTJXd5RwjBXbYzwzGgUe9jNjZ6pP5Uk
	c3XQcFw3MHpgpGAULCHw5fSmqkCuHvOzaT4bieHIIckDxf6t6QNQsRsiHo4KJKisrxSFSsgtTCYcW
	mVzlT/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXJI-0000000Cqx0-0VBG;
	Mon, 08 Dec 2025 09:13:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXJF-0000000Cqwa-2ytp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 09:13:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vSXIy-0002mw-PJ; Mon, 08 Dec 2025 10:13:16 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vSXIy-004aRk-0G;
	Mon, 08 Dec 2025 10:13:16 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B75B04B0E81;
	Mon, 08 Dec 2025 09:13:15 +0000 (UTC)
Date: Mon, 8 Dec 2025 10:13:15 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Yanan.Yang" <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, Lei Xu <lei.xu@nxp.com>, linux-kernel@vger.kernel.org, 
	qijian.guo@nxp.com, Xiaofeng Wei <xiaofeng.wei@nxp.com>, justin.jiang@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <20251208-free-barracuda-of-strength-4f8c3f-mkl@pengutronix.de>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzcwykrisnlaz54e"
Content-Disposition: inline
In-Reply-To: <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_011333_751691_BABF45E9 
X-CRM114-Status: GOOD (  12.18  )
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


--lzcwykrisnlaz54e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
MIME-Version: 1.0

On 05.12.2025 17:03:59, Yanan.Yang wrote:
> This DT enables:
[...]
> - FlexCAN

[...]

> +&flexcan1 {
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	pinctrl-1 =3D <&pinctrl_flexcan1_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +	xceiver-supply =3D <&reg_can_stby>;

please use the "can-transceiver" instead of the "xceiver-supply"

> +	status =3D "okay";
> +};

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--lzcwykrisnlaz54e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmk2lqgACgkQDHRl3/mQ
kZwS1wf+K7LLtmt3oV4Qx3/qOJRv46Ok7N5R83QHG7iCNAsQ0guyYHnWYexNGxyu
eUWf+IHZRDU2x/RQI3IGK/OoMQ0XGsT6upxGe4WoAsTSvz41v+vx9HL/lON2BkDG
xjFLdgTvI9Z+S1DT0zvK7gE+DsWEgJUdQVsoPMyiINJki77bExjZSpkN4BZH7BGN
/b7qGyMuuyvH9hoDCY2iRkAKmacFYV4yjzSffg2jFeX8J7IuXy9oIxhoIz54Ueuz
jqufabNyMDrf3mNlYF/55ZoNr8Hz6Xxpl2mUrZXPHA/sJso1Ih5VOk8hKe/mcbmf
W2FmLc29ysE2RxYphUS3ftvcCw0pvw==
=XX8R
-----END PGP SIGNATURE-----

--lzcwykrisnlaz54e--

