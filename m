Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F730CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC1CvCMf0QYxJhP8tXRBBu45jhcU07pLSmc9GHkVHFE=; b=S0tbd0FqTvkTd4vHtWstDAjobt
	xDQo8zoM25Iv0KlSEgdD9FlQQz1tLI8y6bQBqZdEvjBgdkWYtkKvw4hgw978fAeHDhH4Xxz6gLCnI
	QsybEkVDqJA7hZqrj9DCMT/19CeHyQCBN1XqhyAdnqVvTtcqEXbURyUfuOW5BnzWRMRDlKgaBFnrQ
	8/h6qL69pWKjfubFUngIhNPVdEJpq2YFHgu8n5vo+kDY59NrsYIk+Jp5MzbHc3p8dlvnTM5zWeKgu
	4Ic/FyjtYkKFmxF+FmGgx3oPRqUMBFCg3FOc6Rdg4vFam6w/2Bkue0eLAduNxA4ED7zMvWq3Mwx0G
	uyaDUT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplLR-00000004cpY-0mx3;
	Sat, 23 Aug 2025 10:19:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjcy-00000004ONx-0Dku
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 08:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E759240A8D;
	Sat, 23 Aug 2025 08:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B16C4CEE7;
	Sat, 23 Aug 2025 08:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755937770;
	bh=3V+aClYI3aaQ5gU13ezDYqzZA3Gf8IZDs3ACDxjVH54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6DfwwQEuXHptokfcHZgzpy1FPB8Lw5RAhifx7kjkok4nGqqWegfLoZfun7QAebkA
	 GAaRqU42NU7euJbXTV4l9IMSukcUTIGtxFng0dMnQep22C4rqbUwrDbBL2JnyBX7XH
	 bLjkVLqrtfWVjC2+00I0t9Crgs05tRTWr8/ZGo0NaeqEHLwxKqU0owqkHt5PcnzvA5
	 1agzOoiefZdz6m1ZTEqpBNXJCtC90Zz+47il2570TKzlrkn6XR5LKnl6yHuZQROuA/
	 fi/9X0XXUnGJC4JzRVvWRQPtrtMUYQP7fZ3dBdgharG7Z8ITCInR3yiVk3I2Z41+dg
	 FLPQM/0JXtKuQ==
Date: Sat, 23 Aug 2025 10:29:26 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/13] spi: airoha: remove unnecessary switch to
 non-dma mode
Message-ID: <aKl75s_6ueJ3Wulc@lore-rh-laptop>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823001626.3641935-5-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AhtF45ahqs6p77op"
Content-Disposition: inline
In-Reply-To: <20250823001626.3641935-5-mikhail.kshevetskiy@iopsys.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_012932_113980_F619D9C1 
X-CRM114-Status: GOOD (  15.64  )
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


--AhtF45ahqs6p77op
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The code switches to dma at the start of dirmap operation and returns
> to non-dma at the end of dirmap operation, so an additional switch to
> non-dma at the start of dirmap write is not required.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  drivers/spi/spi-airoha-snfi.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
> index d64a687c07de..1ebf7def7ba7 100644
> --- a/drivers/spi/spi-airoha-snfi.c
> +++ b/drivers/spi/spi-airoha-snfi.c
> @@ -812,9 +812,6 @@ static ssize_t airoha_snand_dirmap_write(struct spi_m=
em_dirmap_desc *desc,
>  	int err;
> =20
>  	as_ctrl =3D spi_controller_get_devdata(spi->controller);
> -	err =3D airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
> -	if (err < 0)
> -		return err;
> =20
>  	memcpy(txrx_buf + offs, buf, len);
>  	dma_addr =3D dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
> --=20
> 2.50.1
>=20

--AhtF45ahqs6p77op
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKl75AAKCRA6cBh0uS2t
rAr3AP9T2QJKhkVGX6NfCc6oaN5Oe1P5X3lrZiNltQ+HB+JXXAEA5nwNp4mEd3JS
TXd4xaqIwU7iCVKk9KDIHkZzPeKrJwc=
=Q08H
-----END PGP SIGNATURE-----

--AhtF45ahqs6p77op--

