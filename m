Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C29D609AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 07:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaKRNL5TmPJFTGh7QkA8yPjUMmCdrCL2bECCtwaJs1M=; b=GwKTm8bV7m3VQBPlORf/wNqhDi
	hcgFbncyWM7IygcjgcHmERwc4Hassgh6IrKyw61QNrbI0jL3ZYlMKggE/TPiOmDHDgReCV7WHygmJ
	UKfw/pmIJYBOP9ipZknwPAg3t56Jd/QSOXXl4RXvZQg+NQcaD7vhbVpgjGdBrZ4L00vvBEXdyEJZA
	Ln/UBJA1p+z8OInVEKZNpl0lMdZb53qhk7webfmOk5Acawm4Qm+wbEIbO8d7ppHPCh7JMstETwGQS
	EBy6uldA/ZHOYn9sIVv8g6ywXD0VtPxV42lhGoY2Hw7hQaw6bQRN1rYqGtirSPLIBWAXcG3yEJBo6
	NmnIMXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCi6-0000000CT7x-1zSn;
	Wed, 27 Nov 2024 07:43:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGCgt-0000000CSx4-1VCk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 07:42:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGCgn-0002io-EU; Wed, 27 Nov 2024 08:42:21 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGCgm-000OCN-15;
	Wed, 27 Nov 2024 08:42:21 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C46AA37E17B;
	Wed, 27 Nov 2024 07:42:20 +0000 (UTC)
Date: Wed, 27 Nov 2024 08:42:20 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: imx: support DMA defer probing
Message-ID: <20241127-ninja-dormouse-of-bloom-8ee494-mkl@pengutronix.de>
References: <20241127074458.2102112-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uslwfux5gvanalae"
Content-Disposition: inline
In-Reply-To: <20241127074458.2102112-1-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_234227_395855_4A383997 
X-CRM114-Status: GOOD (  34.62  )
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


--uslwfux5gvanalae
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 27.11.2024 15:44:58, carlos.song@nxp.com wrote:
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
> Change for V3:
> - According to Marc's comment, remove error print when defer probe.
>   Add info log when DMA has not been enabled and add error log when
>   DMA error, both won't stuck the i2c adapter register, just for remindin=
g,
>   i2c adapter is working only in PIO mode.=20
> Change for V2:
> - According to Frank's comments, wrap at 75 char and Simplify fix code
>   at i2c_imx_dma_request().
> - Use strict patch check, fix alignment warning at i2c_imx_dma_request()
> ---
>  drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 5ed4cb61e262..47112a38d034 100644
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
> @@ -1803,6 +1804,23 @@ static int i2c_imx_probe(struct platform_device *p=
dev)
>  	if (ret =3D=3D -EPROBE_DEFER)
>  		goto clk_notifier_unregister;
> =20
> +	/*
> +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> +	 * this platform, that is not a real error, so just remind "only
> +	 * PIO mode is used". If DMA is enabled, but meet error when request
> +	 * DMA channel, error should be showed in probe error log. PIO mode
> +	 * should be available regardless of DMA.
> +	 */
> +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret) {
> +		if (ret =3D=3D -EPROBE_DEFER)
> +			goto clk_notifier_unregister;
> +		else if (ret =3D=3D -ENODEV)
> +			dev_info(&pdev->dev, "Only use PIO mode\n");

On a system without DMA configured, with this patch we now get this info
message that wasn't there before. I think this might annoy some people,
so you should remove it.

regards,
Marc

> +		else
> +			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mod=
e\n");
> +	}
> +
>  	/* Add I2C adapter */
>  	ret =3D i2c_add_numbered_adapter(&i2c_imx->adapter);
>  	if (ret < 0)
> @@ -1817,9 +1835,6 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
>  		i2c_imx->adapter.name);
>  	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
> =20
> -	/* Init DMA config if supported */
> -	i2c_imx_dma_request(i2c_imx, phy_addr);
> -
>  	return 0;   /* Return OK */
> =20
>  clk_notifier_unregister:
> --=20
> 2.34.1
>=20
>=20

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--uslwfux5gvanalae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdGzVkACgkQKDiiPnot
vG/p/gf/dNbUgrCuDN9PCQSS3wFnlsgOdh8NYGwvCYGdpCKsCEV5ka+ZsoeG3Gs3
sL9ZpngFs6mYthktAyMv7JYNeC8swoxZCNAlxbOoqcp3DO6Xea4Iw6mA/RCmbzQU
5AdJ0SdFYCIZSyklxCdnftN5IC0Ss9bKBbWNh/u4DwfIgImX3NdmH3I9ICRy+Q3r
iIqAmqDA89AlPQbvzpNb2C3hhlLIRMpLzQX2CMwxLacuEBlG6ipHWZp1dLJ44U5N
PYg1rrZxYvq/ALYAYLiCz7HbpNtPnRADB0TU336iG8/KhjfvmZhRY7wG8hju2hEU
3RrT9AlFcC69Gp8TDMvlFrs8YqEEcA==
=wCoA
-----END PGP SIGNATURE-----

--uslwfux5gvanalae--

