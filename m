Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DBAD3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21558PEY/Y2hSBgtrvlu2KzH4L2KWQeyo+FBK8zn8Tg=; b=CGMxamL8mQq1fQh0CwBtexqAAk
	vAEQYv+LcGkF6NSp0Qnef+GQOHxK4yUulouIqSL6wN5uwcKB48Z7a1Oc8HtRUUri5i89M9STXIGFE
	+UBToK+d0BvMIF4sCr4HSkMXE2U6PTjhCli6dNGgpNsASZ9DWU498/HCanKx2uhNQCMVffcLItK8P
	7sF2ZqVo1FvKozeoZ4E+8cX0c4Myi7kbbrKyeVxvk/Jlr37YjdsU/cgJq98Xc/ARyUcj/A+YKeM25
	uOUobZcsSRTqutxRsw7EjMdgZW1yauiC1HU2Jxb4wXPtsxwoniTP2KXvIpXdPMtqWrKX+AVMoa83O
	fSwZ/A1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFs8o-0000000ACrf-2eMf;
	Tue, 26 Nov 2024 09:45:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrwJ-0000000AAHy-3a9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 09:33:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFrwF-0007eA-Bj; Tue, 26 Nov 2024 10:32:55 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFrwD-000E1G-2n;
	Tue, 26 Nov 2024 10:32:54 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4E53737D824;
	Tue, 26 Nov 2024 09:32:54 +0000 (UTC)
Date: Tue, 26 Nov 2024 10:32:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Chen-Yu Tsai <wens@csie.org>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 10/12] can: sun4i_can: fix {rx,tx}_errors statistics
Message-ID: <20241126-illegal-prehistoric-mongoose-1a61ad-mkl@pengutronix.de>
References: <20241122221650.633981-1-dario.binacchi@amarulasolutions.com>
 <20241122221650.633981-11-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ua6dubftl2fle6kp"
Content-Disposition: inline
In-Reply-To: <20241122221650.633981-11-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_013259_891218_E55F0D62 
X-CRM114-Status: GOOD (  18.88  )
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


--ua6dubftl2fle6kp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 10/12] can: sun4i_can: fix {rx,tx}_errors statistics
MIME-Version: 1.0

On 22.11.2024 23:15:51, Dario Binacchi wrote:
> The sun4i_can_err() function only incremented the receive error counter
> and never the transmit error counter, even if the STA_ERR_DIR flag
> reported that an error had occurred during transmission. Increment the
> receive/transmit error counter based on the value of the STA_ERR_DIR
> flag.
>=20
> Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Ker=
nel module")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Fails to build from source:

| drivers/net/can/sun4i_can.c:583:7: error: variable 'ecc' is used uninitia=
lized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
|   583 |                 if (likely(skb)) {
|       |                     ^~~~~~~~~~~
| include/linux/compiler.h:76:20: note: expanded from macro 'likely'
|    76 | # define likely(x)      __builtin_expect(!!(x), 1)
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| drivers/net/can/sun4i_can.c:606:8: note: uninitialized use occurs here
|   606 |                 if ((ecc & SUN4I_STA_ERR_DIR) =3D=3D 0) {
|       |                      ^~~
| drivers/net/can/sun4i_can.c:583:3: note: remove the 'if' if its condition=
 is always true
|   583 |                 if (likely(skb)) {
|       |                 ^~~~~~~~~~~~~~~~
| drivers/net/can/sun4i_can.c:534:9: note: initialize the variable 'ecc' to=
 silence this warning
|   534 |         u32 ecc, alc;
|       |                ^
|       |                 =3D 0
| 1 error generated.

Fixes by moving the "ecc =3D readl();":

--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -579,11 +579,9 @@ static int sun4i_can_err(struct net_device *dev, u8 is=
rc, u8 status)
                 /* bus error interrupt */
                 netdev_dbg(dev, "bus error interrupt\n");
                 priv->can.can_stats.bus_error++;
-                stats->rx_errors++;
+                ecc =3D readl(priv->base + SUN4I_REG_STA_ADDR);
=20
                 if (likely(skb)) {
-                        ecc =3D readl(priv->base + SUN4I_REG_STA_ADDR);
-
                         cf->can_id |=3D CAN_ERR_PROT | CAN_ERR_BUSERROR;
=20
                         switch (ecc & SUN4I_STA_MASK_ERR) {
@@ -601,9 +599,15 @@ static int sun4i_can_err(struct net_device *dev, u8 is=
rc, u8 status)
                                                >> 16;
                                 break;
                         }
-                        /* error occurred during transmission? */
-                        if ((ecc & SUN4I_STA_ERR_DIR) =3D=3D 0)
+                }
+
+                /* error occurred during transmission? */
+                if ((ecc & SUN4I_STA_ERR_DIR) =3D=3D 0) {
+                        if (likely(skb))
                                 cf->data[2] |=3D CAN_ERR_PROT_TX;
+                        stats->tx_errors++;
+                } else {
+                        stats->rx_errors++;
                 }
         }
         if (isrc & SUN4I_INT_ERR_PASSIVE) {


Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ua6dubftl2fle6kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFlcMACgkQKDiiPnot
vG86uggAk5nDid8uwxMZDtzRp+kfJaz/cngmez1n0624cpt7FCh1bKx4sitruzsm
BChsdETbPalV4234FJa9f7EzXe1OLeKUBCM99TweVhlBicNH4ZIISjaDmsQlPktu
me63etuNtH+JQFAJlPPaPx3vbodfsQ51MSftLL/ag70lroEpuusPaIBW+L/yODl1
fbL+G7Qc3oaKL6s0wl+ldjDnEFuA+i+jGZDaCWqSKsNsnBFiZa9Z32IiyC16AA+C
V4hqyhDju4ButdrRDmrrwBlBlw0nddXD8DqZwLvHCf3EYdZ03J096EgEu7WyoA0V
BfMSxcAOzP1Vma5mZ7noy0TEXV/OTw==
=m367
-----END PGP SIGNATURE-----

--ua6dubftl2fle6kp--

