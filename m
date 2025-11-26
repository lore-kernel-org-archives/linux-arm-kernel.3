Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2975D10F2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwaZd4pNGwuR15lTzbzimqunCQm/gk47ifF7EVigcT4=; b=1rNGUUWcGJKy4eU5UJ9JqkazbG
	Gqk43AtfskPJcsy1h3NAeBpZCMuMZpg2M3WG5jQ9s5hCQ5rSHlZDAuNFyBBcr6FZyZBw40uT4C2os
	W3MuZ0oxrP/RPsxGIdm/zkt+UHeuQXwSWfmXG7e8KbhAbKIefJxB5F0L1XeuTlRSw7LjzgF0zZg/f
	ilDbhGbEws412PrLYQARR4+ripB223CkfCO4RK9nOlSyGhbM/lxAaY23+NRGHGEOSJhQ/v1s3RgD5
	AtcAkcpE2NG/EA+Bu+33PjC5Mzj5yIm14PjaTFldKbsG7b/xmxXiclMmOHZSpZmRkJMb5GK7riQwV
	hBtGqiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOETT-0000000Expd-3jxW;
	Wed, 26 Nov 2025 12:18:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOETQ-0000000Exp7-3VdK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:18:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOETL-0007u2-Dh; Wed, 26 Nov 2025 13:18:11 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vOETL-002bZg-01;
	Wed, 26 Nov 2025 13:18:11 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id AB5144A8BC2;
	Wed, 26 Nov 2025 12:18:10 +0000 (UTC)
Date: Wed, 26 Nov 2025 13:18:08 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: broonie@kernel.org, frank.li@nxp.com, hawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] spi: imx: enable DMA mode for target operation
Message-ID: <20251126-bulky-mega-beaver-de575c-mkl@pengutronix.de>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
 <20251125100618.2159770-7-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5df52gksb7am3vhl"
Content-Disposition: inline
In-Reply-To: <20251125100618.2159770-7-carlos.song@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_041816_939991_D482DDC7 
X-CRM114-Status: GOOD (  14.98  )
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


--5df52gksb7am3vhl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 6/6] spi: imx: enable DMA mode for target operation
MIME-Version: 1.0

On 25.11.2025 18:06:18, Carlos Song wrote:
> @@ -1895,10 +1920,16 @@ static int spi_imx_dma_package_transfer(struct sp=
i_imx_data *spi_imx,
>  static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
>  				struct spi_transfer *transfer)
>  {
> -	bool word_delay =3D transfer->word_delay.value !=3D 0;
> +	bool word_delay =3D transfer->word_delay.value !=3D 0 && !spi_imx->targ=
et_mode;
>  	int ret;
>  	int i;
>
> +	if (transfer->len > MX53_MAX_TRANSFER_BYTES && spi_imx->target_mode) {
> +		dev_err(spi_imx->dev, "Transaction too big, max size is %d bytes\n",
> +			MX53_MAX_TRANSFER_BYTES);
> +		return -EMSGSIZE;
> +	}

If there is this limitation, this check should go into
spi_imx_can_dma().

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5df52gksb7am3vhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkm7/0ACgkQDHRl3/mQ
kZwSxwgAo3CvZ95SVpWaSCshyMvZJ6w2bXoMQtzSgXTCg+abeLF0ICK/dY3phk8H
4GVrJ1LQwsHERHkMui7ufs+gvKFp25Ba7sGif7k9ag0c3Bc4z6T0fPAjWuGH2joM
6WvuuqTnoY1lGKl9s1aclIEx6fG96ll0NsbJ00iqQKk8VvwmjwUt47v+FAnLLmIf
sqFuBsH1Te/qcaMmYqvzbukJjFRJR2Wy+HsiJpOFTt7IASa6M6T/cr4FiF/qhIBa
z+iEj7+841qhFryMV96P8to4Bnh+p/v63mHPoByhCS5622oJKMANjKbhJXWm778C
rGS15gbb2HxMR6lwFULY4zQqi4FS1g==
=VliQ
-----END PGP SIGNATURE-----

--5df52gksb7am3vhl--

