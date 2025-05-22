Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ABFC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52VVEAi2aAXvyDwALK7gRzcGDPxNWjxTVSIoaEVtwR8=; b=Q6PZjKVdXlytdhkJz5NYRMAuJ7
	N7jzn7Y0LmdeTM9oCDmryht2kw93UKQG4pkNGisXu4at+CgukBCU5Yjudfjq7EPP0KNqgEQH7GZnq
	YIjwiLLzj3uAYQBBdQgjyNuvpKBlycquTlXIkCxwJqpMYF1b0EmaDz8WBBZID+cn/JOoHkYEHEq/w
	IxarT/JdmaAMOllgD0r7vWftG3oEFqPWp8K/VW4megGcyCqCNuRbWH49b9esi2axDRxFwKRy9I4OE
	N0/x9cANrN6GDcmQmCY2uwLPFVNGP38vSnK37c+grwYWZxsH4pBHzUer0/hBIzym4Rg/o8KN2cdpq
	CQmKmBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1DJ-00000000Gl0-2vhH;
	Thu, 22 May 2025 08:23:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0qR-00000000DJ3-0YVX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 08:00:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI0qN-0004uV-1S; Thu, 22 May 2025 09:59:59 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI0qL-000hFi-0P;
	Thu, 22 May 2025 09:59:57 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1A403417179;
	Thu, 22 May 2025 07:59:56 +0000 (UTC)
Date: Thu, 22 May 2025 09:59:55 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	cl@rock-chips.com, kever.yang@rock-chips.com, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20250522-delightful-lean-chachalaca-4950e0-mkl@pengutronix.de>
References: <20250522063232.2197432-1-zhangqing@rock-chips.com>
 <20250522063232.2197432-3-zhangqing@rock-chips.com>
 <CAMZ6RqJzR6ucRnCHFq8ZFRnznRsFYq6BMQY24aaROJMLWigU4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpmlapbweec4lyva"
Content-Disposition: inline
In-Reply-To: <CAMZ6RqJzR6ucRnCHFq8ZFRnznRsFYq6BMQY24aaROJMLWigU4A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_010003_172046_0375A0DA 
X-CRM114-Status: GOOD (  19.43  )
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


--lpmlapbweec4lyva
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

On 22.05.2025 16:51:40, Vincent Mailhol wrote:
> On Thu. 22 May 2025 at 15:38, Elaine Zhang <zhangqing@rock-chips.com> wro=
te:
> >
> > Is new controller:
> > Support CAN and CANFD protocol.
> > Support Dma.
>=20
> Please write a more verbose description with proper sentences.
>=20
> > Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>=20
> You need to break this into several patches and several files.
>=20
> You can not put everything in rockchip_canfd-core.c. Create a
> rockchip_rk3568.c in which you will move all the already existing
> rk3568 specific functions. Then, in another patch, create a
> rockchip_rk3576.c that will contain all the new code. Also adjust the
> headers accordingly.

I think the first patch modifying driver code should be to add the
callbacks to rockchip_canfd-core.c and move the rk3568 code to it. The
second patch to add the rk3576 without DMA and then add DMA mode. Maybe
even split more. Have a look at the series where I added the original
driver for an idea how to add the support incremental.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--lpmlapbweec4lyva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgu2XgACgkQDHRl3/mQ
kZzQJAgApXCC8s2c2+CiMrRCtKvYLVoAutalwYhghaYH2BXfFWc/d+28zc2+kk2x
A0KBEBHsHyNacv50PzO6Cd4sbbvsPUUHEYBHoqFP4rU/v2ume72v4R6vlnGe5wq4
ARFfylPB108a4IQ/rFrJK00fBPA0QEL+xLFhs5qhIC4ULpkFZA2gQ3pvOSaBAC/1
1Lpp8qjNt1Clk2JlI255nJylV04Xe8qcTNq490v1Tj4Cj++vZh414SFvmHBWrbb2
ui2ptgp7K6tqo+GnUu2aFQf1o3GAGoXCEE0AcQCIBuq1d8Rf2lrVM1Koo0cAgNQ1
B2NARj0eLbE2aIKJayqbaBmLHYDzrw==
=uXC8
-----END PGP SIGNATURE-----

--lpmlapbweec4lyva--

