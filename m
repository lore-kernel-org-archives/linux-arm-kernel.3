Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7088CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8CaueeKwV4GgTFKRKoM2j/sxWa70IVtbvDEfVmq57A=; b=l86V8f41HDHRGKYccExYLPxY/G
	Gwio0+LSfzxVgU4oSaL8AcVpIeaViyxg7zg0bSrzOZUmzyS1rpCiV7UD5oMmu8EEF3/TOIvWAYjym
	oW5GLroh1FBdTdRaiuHDvjmUYWfPm6vyuC67hGOQ/QBAyK/bDwl43jqpcT09YnOBfODsxB1xQAHis
	ATkKh55Ca4ULGLr9uaO7MCqTyZDSf9VYmju8IpS2bS8BqigbIZ8xGPPLVarkj7RTwGdoK7s4VCHHt
	cfL+VG2Q2I+0Bki7TJcv5xb3Fxzrhz8tO2oyViLEbL/IkkDIdyi6VhkfVBDs2y+pIzyYERmwPk9oC
	/j8zMo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLT-00000004cry-1DFa;
	Sat, 23 Aug 2025 10:19:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjje-00000004Oju-1Vhs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 08:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 202805C463F;
	Sat, 23 Aug 2025 08:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5661BC4CEE7;
	Sat, 23 Aug 2025 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755938184;
	bh=9HXgfwsXlpHGuE4MNNyqKCJCXrlDF0GP047HKDxcEJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPgTCDfFlfFyx/PiB1QzQKBlavWtGGDch+zyjkzeztX3onwKjHYSxZTiS5AoI1svs
	 R1nARjQtYYAzrnTAIZGXlli987Qzi2Yd3EBW6B/Jro0gWM11ZpO0yR++Z4/0EFtFb8
	 LMrybYiucqExh5Ff5VlSmHlLSE5H3M29bkY3gCtKGrFV8/m4IT3YdKpXtx55RQzgIU
	 /Z08CMRa1HVDcufEVrkpNKOOn62koeSgbRdKRFeOoBH2MQLiyiSLENoOymL0BmZ3cG
	 z/B9puxop6U6Xvv/Y6aAmzZ6ubfSkqKcEpPX8tb32OvL7yb6cwt1UnME8Hg7GWVJGp
	 YSC3nQOxx4W3g==
Date: Sat, 23 Aug 2025 10:36:20 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/13] spi: airoha: fix reading/writing of flashes
 with more than one plane per lun
Message-ID: <aKl9hOx2hcZUfg-k@lore-rh-laptop>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823001626.3641935-8-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LN76RXLjGbIEDXVw"
Content-Disposition: inline
In-Reply-To: <20250823001626.3641935-8-mikhail.kshevetskiy@iopsys.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_013626_481621_96533E05 
X-CRM114-Status: GOOD (  19.99  )
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


--LN76RXLjGbIEDXVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Reading UBI on the flash with more than one plane per lun will lead to
> the following error:
>=20
> ubi0: default fastmap WL pool size: 50
> ubi0: attaching mtd2
> ubi0 error: ubi_add_to_av: two LEBs with same sequence number 403
> eraseblock attaching information dump:
>         ec       1
>         pnum     538
>         lnum     0
>         scrub    0
>         sqnum    403
> Volume identifier header dump:
>         magic     55424921
>         version   1
>         vol_type  1
>         copy_flag 0
>         compat    0
>         vol_id    1
>         lnum      0
>         data_size 0
>         used_ebs  0
>         data_pad  0
>         sqnum     403
>         hdr_crc   c8418a31
> Volume identifier header hexdump:
> 00000000: 55 42 49 21 01 01 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00  UBI!............................
> 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 93 00 00 00 00 00 =
00 00 00 00 00 00 00 c8 41 8a 31  .............................A.1
> ubi0 error: ubi_attach_mtd_dev: failed to attach mtd2, error -22
> UBI error: cannot attach mtd2
> UBI error: cannot initialize UBI, error -22
> UBI init error 22
>=20
> looking to spi_mem_no_dirmap_read() code we'll see:
>=20
> 	static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
> 					      u64 offs, size_t len, void *buf)
> 	{
> 		struct spi_mem_op op =3D desc->info.op_tmpl;
> 		int ret;
>=20
> // --- see here ---
> 		op.addr.val =3D desc->info.offset + offs;
> //-----------------
> 		op.data.buf.in =3D buf;
> 		op.data.nbytes =3D len;
> 		ret =3D spi_mem_adjust_op_size(desc->mem, &op);
> 		if (ret)
> 		return ret;
>=20
> 		ret =3D spi_mem_exec_op(desc->mem, &op);
> 		if (ret)
> 			return ret;
>=20
> 		return op.data.nbytes;
> 	}
>=20
> The similar happens for spi_mem_no_dirmap_write(). Thus spi read address =
should
> take in the account the desc->info.offset.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Missing Fixes tag.

Regards,
Lorenzo

> ---
>  drivers/spi/spi-airoha-snfi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
> index 3431a9c84679..df2d3d717c00 100644
> --- a/drivers/spi/spi-airoha-snfi.c
> +++ b/drivers/spi/spi-airoha-snfi.c
> @@ -727,8 +727,9 @@ static ssize_t airoha_snand_dirmap_read(struct spi_me=
m_dirmap_desc *desc,
>  	if (err)
>  		goto error_dma_unmap;
> =20
> -	/* set read addr */
> -	err =3D regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3, 0x0);
> +	/* set read addr: zero page offset + descriptor read offset */
> +	err =3D regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3,
> +			   desc->info.offset);
>  	if (err)
>  		goto error_dma_unmap;
> =20
> @@ -872,7 +873,9 @@ static ssize_t airoha_snand_dirmap_write(struct spi_m=
em_dirmap_desc *desc,
>  	if (err)
>  		goto error_dma_unmap;
> =20
> -	err =3D regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2, 0x0);
> +	/* set write addr: zero page offset + descriptor write offset */
> +	err =3D regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2,
> +			   desc->info.offset);
>  	if (err)
>  		goto error_dma_unmap;
> =20
> --=20
> 2.50.1
>=20

--LN76RXLjGbIEDXVw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKl9ggAKCRA6cBh0uS2t
rNEzAP9Qd8XxGGaG44w/Yv1yxymd6mE+vW15GyHs8Zjiv/dEsAD6AvgUJ/iXlYAj
4sbGzifvI0iy8Pslf9mIRvj9KGVXcws=
=Ju9w
-----END PGP SIGNATURE-----

--LN76RXLjGbIEDXVw--

