Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8470D1038B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDSL4bS2GPzDDS9LlCeFEC6yf1d7WKWTth2wMoJmVmU=; b=tShmUpaP/n/f10T8GLm/Nd/KiU
	CTS+BkSEkmvm1ua7jjVEKgpZN1nw1fMRCo3OeNlXrAZGLs/0NFNDaqAAI3jh6z5G7a10QgUYIIpdW
	NK+FdSyB4HASIRw2cRRTExiaNXca0yWx4CyL8zHqZJNgnezc9hQjTszGDIJTi+KJZBH2WPI7cXjiu
	KWrocbu3dbXCWy7I0tX7LFpAct349qGf0QJzhrpTeMKZ/QaUdjfnTyC+/9MqxX+8rkfk7OFuucwg8
	z3fjAPn5bca3iZGkPq1fI5mVL2EyjtW8iYPkKIv9QuorqyLufTYbAxfBwu7Pjy9aVXrMHrkfistcb
	y1wW783w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAdA-0000000EaIY-3IuT;
	Wed, 26 Nov 2025 08:12:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAd8-0000000EaGl-1IQq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:12:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOAd3-0002rl-DL; Wed, 26 Nov 2025 09:11:57 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOAd2-002Z6r-34;
	Wed, 26 Nov 2025 09:11:56 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 934EF4A8744;
	Wed, 26 Nov 2025 08:11:56 +0000 (UTC)
Date: Wed, 26 Nov 2025 09:11:56 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: broonie@kernel.org, frank.li@nxp.com, hawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
Message-ID: <20251126-defiant-swift-of-domination-afa2c9-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-6-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2xakqceqe3dflkps"
Content-Disposition: inline
In-Reply-To: <20251125100618.2159770-6-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_001202_350608_8F468A9B 
X-CRM114-Status: GOOD (  19.06  )
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


--2xakqceqe3dflkps
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
MIME-Version: 1.0

On 25.11.2025 18:06:17, Carlos Song wrote:
> +static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
> +				struct spi_transfer *transfer)
> +{
> +	bool word_delay =3D transfer->word_delay.value !=3D 0;
> +	int ret;
> +	int i;
> +
> +	ret =3D spi_imx_dma_data_prepare(spi_imx, transfer, word_delay);
> +	if (ret < 0) {
> +		transfer->error |=3D SPI_TRANS_FAIL_NO_START;
> +		dev_err(spi_imx->dev, "DMA data prepare fail\n");
> +		goto fallback_pio;
> +	}
> +
> +	spi_imx->rx_offset =3D 0;
> +
> +	/* Each dma_package performs a separate DMA transfer once */
> +	for (i =3D 0; i < spi_imx->dma_package_num; i++) {
> +		ret =3D spi_imx_dma_map(spi_imx, &spi_imx->dma_data[i]);
> +		if (ret < 0) {
> +			transfer->error |=3D SPI_TRANS_FAIL_NO_START;
> +			dev_err(spi_imx->dev, "DMA map fail\n");
> +			break;
> +		}
> +
> +		/* Update the CTRL register BL field */
> +		writel(spi_imx->dma_data[i].cmd_word, spi_imx->base + MX51_ECSPI_CTRL);
> +
> +		ret =3D spi_imx_dma_package_transfer(spi_imx, &spi_imx->dma_data[i],
> +						   transfer, word_delay);
> +
> +		/* Whether the dma transmission is successful or not, dma unmap is nec=
essary */
> +		spi_imx_dma_unmap(spi_imx, &spi_imx->dma_data[i]);
> +
> +		if (ret < 0) {
> +			dev_dbg(spi_imx->dev, "DMA %d transfer not really finish\n", i);
> +			break;
> +		}
> +	}
> +
> +	for (int j =3D 0; j < spi_imx->dma_package_num; j++) {
> +		kfree(spi_imx->dma_data[j].dma_tx_buf);
> +		kfree(spi_imx->dma_data[j].dma_rx_buf);
> +	}
> +	kfree(spi_imx->dma_data);
> +
> +fallback_pio:
> +	/* If no any dma package data is transferred, fallback to PIO mode tran=
sfer */
> +	if ((transfer->error & SPI_TRANS_FAIL_NO_START) && i !=3D 0)
> +		transfer->error &=3D !SPI_TRANS_FAIL_NO_START;
                                   ^
this doesn't look correct, you probably want to use a "~", right?

Marc


--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2xakqceqe3dflkps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkmtkkACgkQDHRl3/mQ
kZwc4Af/TNDPHIaoFGGl6ukBcKwe8NM2ZOe/tGDo2HCK+tEBzyKnR/UMtPbCOOts
ZbjuXQ0I3FXFZ80z0XyTiZJIlyLnVI74JGUIIPLdsryOBBmeELwu6BN99f5FZ5qa
x0uG2iyheamGFhetK3zt8F2DObqtEGQJ7JUEVBowUnNNk5wJoLHWYAzLu2qwtOWg
ffAd70VNxPoudzUoTvB87+Aa9mB6MIw2I58WgPP3sUuxDiA8rK+Lj/W2qfYwqynH
vifXpU/gvihUDPS01sKBLg6otQlel2d/ZHHErwemrz11TFgQKuHGz8I4tmZdtn5B
OH4pou7EUL69TVMsJaL2e/xFecR3dQ==
=X/RP
-----END PGP SIGNATURE-----

--2xakqceqe3dflkps--

