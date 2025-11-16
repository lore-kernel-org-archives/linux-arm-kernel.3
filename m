Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9290FCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utji8Aq0mvq0N87Jf82ivnv0+hotmgIQKp4IeytxJts=; b=BnEL4uEWa3xoXsYCDFVAIPCW6h
	cfHRlt0QPPTfB/NOSxXQOt5Uwf+SP+S1W39TMnEPrRao9946shAYhxq8OERcifcO0mNLPJPTOjiCo
	gZD1DLTB3xXe8j9LIuqlpeOkqfULqoou2DTYC7/KLGrrz6/0zj/4Pmba5vjkPqKIzGSmTrWgqsSc9
	vwFFo7lasQflzloevEGl2JjFpI/ehZ4/r5cUOfBq83wKO1WutZxkERyTgEil5avE9Hz6LeMDjK6lr
	yzUJVcP0+aeTdAeezfiWJ+ooNR9zfStRq8mmZs8v1mn1kpRtcpT4R3IrjJNDnRSuhwPf/10ge8KOo
	IyNKunVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKfZy-0000000Eq7X-1rrH;
	Sun, 16 Nov 2025 16:26:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKfZv-0000000Eq7C-1m5h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 16:26:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKfZp-0000le-9L; Sun, 16 Nov 2025 17:26:09 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vKfZo-000lyM-0x;
	Sun, 16 Nov 2025 17:26:08 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E81E14A0D9F;
	Sun, 16 Nov 2025 16:26:07 +0000 (UTC)
Date: Sun, 16 Nov 2025 17:26:07 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, 
	Maxime Ripard <mripard@kernel.org>, kernel@pengutronix.de, linux-can@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Thomas =?utf-8?Q?M=C3=BChlbacher?= <tmuehlbacher@posteo.net>
Subject: Re: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq
 loop handling
Message-ID: <20251116-mysterious-delightful-spaniel-18d220-mkl@pengutronix.de>
References: <20251116-sun4i-fix-loop-v1-1-3d76d3f81950@pengutronix.de>
 <2804881.mvXUDI8C0e@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="em24b66ivg3z2dow"
Content-Disposition: inline
In-Reply-To: <2804881.mvXUDI8C0e@jernej-laptop>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_082615_487043_538A5199 
X-CRM114-Status: GOOD (  17.74  )
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


--em24b66ivg3z2dow
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can] can: sun4i_can: sun4i_can_interrupt(): fix max irq
 loop handling
MIME-Version: 1.0

On 16.11.2025 17:20:37, Jernej =C5=A0krabec wrote:
> Dne nedelja, 16. november 2025 ob 16:55:26 Srednjeevropski standardni =C4=
=8Das je Marc Kleine-Budde napisal(a):
> > Reading the interrupt register `SUN4I_REG_INT_ADDR` causes all of its b=
its
> > to be reset. If we ever reach the condition of handling more than
> > `SUN4I_CAN_MAX_IRQ` IRQs, we will have read the register and reset all =
its
> > bits but without actually handling the interrupt inside of the loop bod=
y.
> >
> > This may, among other issues, cause us to never `netif_wake_queue()` ag=
ain
> > after a transmission interrupt.
> >
> > Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - K=
ernel module")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> > Signed-off-by: Thomas M=C3=BChlbacher <tmuehlbacher@posteo.net>
> > Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > ---
> > I've ported the fix from the sja1000 driver to the sun4i_can, which bas=
ed
> > on the sja1000 driver.
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thank you very much! I have seen a lot of feedback from you about the
sun4i driver. Would you like to become the maintainer of the driver?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--em24b66ivg3z2dow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkZ+xoACgkQDHRl3/mQ
kZzTlwf+KKSw3ld6WMWkRDCymQOeVahqaRqN6JLXg1lCVaiFL5OC0OApQ1hYnCLR
rEnb47cb4jxA/HVt1O2aCS6sOT+OKVSU5kOhFbFFnwcZxrGe54PzPDM//9iHNzd6
k0HxI1kejcL9ehlMgY5kxUyQG0YUyl2IZjMoPIldc0STty7sK6sBwC4Cq2R6lGtb
/7RSNZk95tKD7mOabKemeCJDkVrQ0XW2OK9HZaWTxcPEOcmSkp61pZ6rkzJPx06M
fPPFvVvG3stojpsJXrslsB/hl+NIjh02w+Tvk6fO+UvyXHsIbKVIpe/aLDUWaRwv
65u3bPD6FMVnzSXzfHs0jijKWABtBw==
=CLj+
-----END PGP SIGNATURE-----

--em24b66ivg3z2dow--

