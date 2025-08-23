Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3923CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JE5Mk/bggTULBU7u872/3Olvtu6u3CyKyckt13kzLM=; b=zgxz8HGbosSifvR37bT4G7BNjS
	K0qcHj3wRhv0/GYl8W2eGoSm25A2e+E+HOXjE7ySLtjifp7ai8BihrNSotrDdYyC8fIfyjViosrUi
	9je6GiTLbNbbGGT5O938dGeRHcpnjG3eEyV9adk2H8HrShCLjSm8tGS7sHkXrF55MC8IZ5UJTKkwe
	pECYfshYbaSaCmOdvAVLaf0pgGfHDMyt7oe336ZMfopTOdSMLNCom4Gme6kqhMlM/Bu3to3pEN4o7
	H/02Sp1f8/MyjgSiCNy9XZrqPbYngiVc8wPGNXx2Rnj7gpeCjOM0wpQrCC7ZHi8hMV8+T4ViMZlka
	mZe1qmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLS-00000004crS-36cq;
	Sat, 23 Aug 2025 10:19:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjiF-00000004OfM-20se
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 08:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A1FD601BB;
	Sat, 23 Aug 2025 08:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9ABC4CEE7;
	Sat, 23 Aug 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755938098;
	bh=GQDqD9/6QX6CCxhf2faZ/EDoG8gzOseFMn+0Er8QwG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUvHNe/HOHVLa9UdM11MiVD9T2IBoat9Mz0bRNdBioPjL7mktS9SbFqyEt1+H15Mk
	 N4R/uGI9q0yROeSvPKvsAlHmi7l/PPSxgyIjhForN3EwgwRMLwseCzXRjkIT0V9kRS
	 L38ZRMf5Lv0aLvDPseS0SXz5BlGGFogPmP1srr1v3zLVDVioVPV+jq13Sfb//9dCUA
	 POtXbz0ZDEsY+3wFSVg+fdBQh2XlfDooto+SzsUdR47Jzv5Nj3XHGswzgNrP6BiB+B
	 d5BvNMGY20f8HV37uZXss+UsBLatGw0kwXMj4Z1dvFicq0dv4gr0tIeffNq8mlZTtg
	 6FOSnWQM3V4ow==
Date: Sat, 23 Aug 2025 10:34:54 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/13] spi: airoha: switch back to non-dma mode in the
 case of error
Message-ID: <aKl9LqrRDtrYhSkh@lore-rh-laptop>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823001626.3641935-7-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BKP8bCyXEOhRq/Lw"
Content-Disposition: inline
In-Reply-To: <20250823001626.3641935-7-mikhail.kshevetskiy@iopsys.eu>
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


--BKP8bCyXEOhRq/Lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Current dirmap code does not switch back to non-dma mode in the case of
> error. This is wrong.

Can you please add proper Fixes tag here? Probably to make backport easier,
this patch should be moved before patch 5/13. Anyway:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Regards,
Lorenzo

>=20
> This patch fixes dirmap read/write error path.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/spi/spi-airoha-snfi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
> index ce4026611e26..3431a9c84679 100644
> --- a/drivers/spi/spi-airoha-snfi.c
> +++ b/drivers/spi/spi-airoha-snfi.c
> @@ -692,13 +692,13 @@ static ssize_t airoha_snand_dirmap_read(struct spi_=
mem_dirmap_desc *desc,
> =20
>  	err =3D airoha_snand_nfi_config(as_ctrl);
>  	if (err)
> -		return err;
> +		goto error_dma_mode_off;
> =20
>  	dma_addr =3D dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
>  				  DMA_FROM_DEVICE);
>  	err =3D dma_mapping_error(as_ctrl->dev, dma_addr);
>  	if (err)
> -		return err;
> +		goto error_dma_mode_off;
> =20
>  	/* set dma addr */
>  	err =3D regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
> @@ -798,6 +798,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_me=
m_dirmap_desc *desc,
>  error_dma_unmap:
>  	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
>  			 DMA_FROM_DEVICE);
> +error_dma_mode_off:
> +	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
>  	return err;
>  }
> =20
> @@ -836,13 +838,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi=
_mem_dirmap_desc *desc,
> =20
>  	err =3D airoha_snand_nfi_config(as_ctrl);
>  	if (err)
> -		return err;
> +		goto error_dma_mode_off;
> =20
>  	dma_addr =3D dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
>  				  DMA_TO_DEVICE);
>  	err =3D dma_mapping_error(as_ctrl->dev, dma_addr);
>  	if (err)
> -		return err;
> +		goto error_dma_mode_off;
> =20
>  	/* set dma addr */
>  	err =3D regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
> @@ -939,6 +941,8 @@ static ssize_t airoha_snand_dirmap_write(struct spi_m=
em_dirmap_desc *desc,
>  error_dma_unmap:
>  	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
>  			 DMA_TO_DEVICE);
> +error_dma_mode_off:
> +	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
>  	return err;
>  }
> =20
> --=20
> 2.50.1
>=20

--BKP8bCyXEOhRq/Lw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKl9KwAKCRA6cBh0uS2t
rIVqAQC9rVH2ZVbpmFmpZvCcg2btW82f2rR1q6+G2F7Uh5TSqAD/aShKTkeVPTKj
Rj0n4uxJ32FwRyYt2JKVrvIk+Aj4xwA=
=E5fX
-----END PGP SIGNATURE-----

--BKP8bCyXEOhRq/Lw--

