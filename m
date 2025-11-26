Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129F1D10F2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFOnkZ2rSfekfIl1J5NTBCqfLRCoz/HZnyQlFkQKSSc=; b=3yuNR//RYp+BsOGqwo00aXX08I
	UY3jbJu7r7f17IraH4Cig2tRusEU6pA6GTm7wAHHn1JJHVJtIIFq1H1FnK7dp8d6gOdyGR/mnM9yW
	CQ3dhDxDYfMhximLvcWd6UfGwtphNnNEFdF5YaME+xGbJySjtSG/Cz4rwZxpPvP+O1z6BiX1GPMAc
	lfM/QAKdk61Nnhm/MQnNV19Xk9XCS1OlQ860D21WDAavSbYSsKppx3JT5NgyVLhJLE58YIfnvKJgE
	uLh5M19A3lfkUTTFCCZV1NJVxUFGMnefhXLepsdjw/Xvcten1UKydVdohDiq+0HD4bJiOcp0ySzxv
	mQpXuxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEY2-0000000Ey9q-3pfw;
	Wed, 26 Nov 2025 12:23:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEY0-0000000Ey9V-0FJX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:23:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOEXw-0008R1-7h; Wed, 26 Nov 2025 13:22:56 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOEXv-002ba0-2u;
	Wed, 26 Nov 2025 13:22:55 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 8EEBF4A8BE0;
	Wed, 26 Nov 2025 12:22:55 +0000 (UTC)
Date: Wed, 26 Nov 2025 13:22:55 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: broonie@kernel.org, frank.li@nxp.com, hawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
Message-ID: <20251126-loyal-lobster-of-virtuosity-0aa824-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-6-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="myitqgaobs22g25h"
Content-Disposition: inline
In-Reply-To: <20251125100618.2159770-6-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_042300_145119_6C312E6F 
X-CRM114-Status: GOOD (  16.33  )
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


--myitqgaobs22g25h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/6] spi: imx: support dynamic burst length for ECSPI DMA
 mode
MIME-Version: 1.0

On 25.11.2025 18:06:17, Carlos Song wrote:
>  static int spi_imx_pio_transfer(struct spi_device *spi,
>  				struct spi_transfer *transfer)
>  {
> @@ -1780,9 +2112,14 @@ static int spi_imx_transfer_one(struct spi_control=
ler *controller,
>  	 * transfer, the SPI transfer has already been mapped, so we
>  	 * have to do the DMA transfer here.
>  	 */
> -	if (spi_imx->usedma)
> -		return spi_imx_dma_transfer(spi_imx, transfer);
> -
> +	if (spi_imx->usedma) {
> +		ret =3D spi_imx_dma_transfer(spi_imx, transfer);
> +		if (transfer->error & SPI_TRANS_FAIL_NO_START) {
> +			spi_imx->usedma =3D false;
> +			return spi_imx_pio_transfer(spi, transfer);
> +		}
> +		return ret;
> +	}

Why do you do this? AFAICS the framework already does this for you see:
spi_transfer_one_message().

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--myitqgaobs22g25h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm8RwACgkQDHRl3/mQ
kZxM9gf+PBn8M993Y6DCSCAzs3Or4xmLeazQrHUS5Ra5UOOnjL0TCCZed0OwCmMp
hlcBXsu8PyapENJ5eimk1pG33l6ZjqSSYjgk2tcZ1r9e9Eswle00Ra9F6Hw3Rpbx
DxBHoiJDH/rJhPYBCaIR4HzTu3eoVIBnFL+sQGLPjdR7LTuYEjKBwNY6l9TPQVjf
VFgEGsioB0dpuKjR3MO9pb5BQpLJI1iblrdoBr1lwjvvg1NYe+ZBwAklpRinQhPv
rlgeV9yaP0x89MQM19/DflbnikD2a+ryFOymsGBiLxnsB1f8JosPtPIvjM6i6E5P
fKpE1CVTHbe3WBe6AtVOT+htRwWRmA==
=ymDj
-----END PGP SIGNATURE-----

--myitqgaobs22g25h--

