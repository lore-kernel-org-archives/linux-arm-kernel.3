Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E944ED3B7C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wpyZYVXSrFmOqwbJZhkGIoJEIM80hOcHt1jNF3/WeY=; b=xbPMa3gmh8FFTG1upQg+FySfo3
	b02dwlKYQabnKhotJabkvDDSyiQoSt6luPzTx6gXuziiCawHmzxKI8+Urf7CwkmkAVqH9Qo/xP24+
	4ep6kDfFkb9FBmTlD5fTpRQPG9Z/9cZ3Ms1dzFjwRI7bj4Y8kC3b2n8UBTzTpFSB0FLq9AuSbLOl+
	vt9UqXMNovXIgM9YHE3DIeBq2VVNOiuXxw7iY1jLJFbdURIPIAYPnhGmmuKgzEB4hWBl/Lm1ouDcJ
	OZMWfzyO1NkjBoHxeyiBqSyEokRje92L6f7VVvY4F1SMzru4LNXof418SBbuUcrGr7+TeLYyAWLZe
	TFt3j0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrNI-0000000A0xQ-3jA6;
	Tue, 26 Nov 2024 08:56:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFrML-0000000A0sl-06x7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 08:55:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFrME-0002WF-HB; Tue, 26 Nov 2024 09:55:42 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFrMD-000Der-0E;
	Tue, 26 Nov 2024 09:55:41 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6F55437D766;
	Tue, 26 Nov 2024 08:55:41 +0000 (UTC)
Date: Tue, 26 Nov 2024 09:55:41 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Message-ID: <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idutayp4iw5aar47"
Content-Disposition: inline
In-Reply-To: <20241126082535.1878554-1-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_005549_065371_0DAB706B 
X-CRM114-Status: GOOD (  29.84  )
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


--idutayp4iw5aar47
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 26.11.2024 16:25:35, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>=20
> Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
> have not ready yet.
>=20
> Move i2c_imx_dma_request() before registering I2C adapter to avoid
> infinite loop of .probe() calls to the same driver, see "e8c220fac415
> Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> and "Documentation/driver-api/driver-model/driver.rst".
>=20
> Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> are unavailable.
>=20
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
> Change for V2:
> - According to Frank's comments, wrap at 75 char and Simplify fix code
>   at i2c_imx_dma_request().
> - Use strict patch check, fix alignment warning at i2c_imx_dma_request()
> ---
>  drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..4e5633166a1e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struc=
t *i2c_imx)
>  }
> =20
>  /* Functions for DMA support */
> -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> -						dma_addr_t phy_addr)
> +static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_=
t phy_addr)
>  {
>  	struct imx_i2c_dma *dma;
>  	struct dma_slave_config dma_sconfig;
> -	struct device *dev =3D &i2c_imx->adapter.dev;
> +	struct device *dev =3D i2c_imx->adapter.dev.parent;
>  	int ret;
> =20
>  	dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
>  	if (!dma)
> -		return;
> +		return -ENOMEM;
> =20
>  	dma->chan_tx =3D dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
> @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct=
 *i2c_imx,
>  	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
>  		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
> =20
> -	return;
> +	return 0;
> =20
>  fail_rx:
>  	dma_release_channel(dma->chan_rx);
> @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct=
 *i2c_imx,
>  	dma_release_channel(dma->chan_tx);
>  fail_al:
>  	devm_kfree(dev, dma);
> +
> +	return ret;
>  }
> =20
>  static void i2c_imx_dma_callback(void *arg)
> @@ -1803,6 +1804,13 @@ static int i2c_imx_probe(struct platform_device *p=
dev)
>  	if (ret =3D=3D -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
> =20
> +	/* Init DMA config if supported */
> +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret =3D=3D -EPROBE_DEFER) {
> +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> +		goto clk_notifier_unregister;
> +	}

Don't spam the logs if the driver defers probing, it's not a error. And
it looks strange to ignore all other errors here. Either add a comment
here, something like "continue without DMA", or let the function return
0 in case the driver should continue and propagate the error if the
caller should take care of it.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--idutayp4iw5aar47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFjQoACgkQKDiiPnot
vG9yIgf+KeMn1/k836gXtD2Zg1FuuWGbO2RIaxvsdEJjgPTk0/uKBRn6hl6dcD6E
WLeR88F/j/GCTj5kOuFWCDaUlTyIsnWvSHpy/Rj9BebzsAL6dbiUWQ7a8CGvvA6L
PLtCoNC5JcooBTmqGXIRjRdBbpFnNo+BHPmwoeseFIbsTitjuESVjvsG6m8gDoAn
w1zieedbBsvAhpiukgxVFav5PDe2wdrXtTBdwNYvynBhnbVNjxxrxhz3k5eaaBWq
BSutaHC/ObVAMb8UqORr8TqQqlwZBuiPSxghHXdRl/7IMFhs6F3QdKIjlMZQPsoI
YJcLA6tWs00i/VanuDHWa8WA2RMyWg==
=Wvyt
-----END PGP SIGNATURE-----

--idutayp4iw5aar47--

