Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4CBCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFp+7Z8AuiOfuKOj7/7PH/FrdCSrXuJWAdxzeXlw8HI=; b=mLUm03zKp6FBA6Ogn2W++pJI9S
	Hmo3QIPOy76tuNMD3coNkbT3NkPCVQ4KONrvlzo6EJd8TLsGQghojFxPSTWxRPg8mJp6StIowZYPP
	NXZdTiopvxhtRoo7F4d74wd0nSH5GtGdqKvSDokoeEI/njjr36wVNzHkWckwMgEFtfrXr62SGoAbV
	PmzlEK8m0/FpQekzHzpDszZvcmBbPMMJAOIEu98pPgG0KamuaU9PM8GR+G3376+Tkt4093gBwegme
	/vpweROAAsg+E2XIGy4mZqG1ri9WxDjKV+TtA9nUgma5PhEdWTdOBUPmWuBBAA76VGjVlAWYaf9RX
	gSjcMWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0WV-0000000GHHJ-1doa;
	Mon, 17 Nov 2025 14:48:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0WS-0000000GHGi-3Ujn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:48:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vL0WL-0007T9-DB; Mon, 17 Nov 2025 15:47:57 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vL0WL-000vdw-0M;
	Mon, 17 Nov 2025 15:47:57 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CF7314A1637;
	Mon, 17 Nov 2025 14:47:56 +0000 (UTC)
Date: Mon, 17 Nov 2025 15:47:56 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add support for NXP XSPI
Message-ID: <20251117-logical-benevolent-penguin-29b355-mkl@pengutronix.de>
References: <20251117-xspi-v2-0-e651323993fe@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pmc26wvviv3xdq35"
Content-Disposition: inline
In-Reply-To: <20251117-xspi-v2-0-e651323993fe@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_064804_871501_3BE14303 
X-CRM114-Status: GOOD (  13.20  )
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


--pmc26wvviv3xdq35
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] Add support for NXP XSPI
MIME-Version: 1.0

On 17.11.2025 19:04:23, Haibo Chen wrote:
> XSPI is a flexsible SPI host controller which supports up to
                ^
typo: flexible

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pmc26wvviv3xdq35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkbNZkACgkQDHRl3/mQ
kZxTEwf8Dh+HeIttfhkyysWoTAFq92mdf9BiCYI1kuIrjU0h2Yxpz/hAOVwRwRlu
Ujp+UzgTNHQgGpWrygiWLOJ+5NZmxiF9RN241sOy5hYGWp7kZlk+p50Ncu5NSBi4
VD02SwnihSie7MXXJgNrCYoLVLzYZ4AdrGPklom4PK23ZfCC1PuS8CY5YT+G0Fgr
si/FJQBbT+Sh16H/jgJ8fx2DfcJtxZAkRkrGUkjyy0jix7PAIyUTcczZj9d/7PSF
wDMmTOHlBPAGI9tOxci/nQqnDE037lgsCdy/4TeC8mFloLgN4gaPkOfUpvVEc4eE
PchF3+FZJB16HlBLNVqQ8QViBK69JA==
=NcxV
-----END PGP SIGNATURE-----

--pmc26wvviv3xdq35--

