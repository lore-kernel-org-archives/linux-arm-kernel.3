Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694EBCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7qPecjHtuGkgkb8r250/8mgrRC3j2WbmZVVlrZePxk=; b=ZiI4fz3b6XjFs9zf8l44MlEpQh
	2rBW699q//svIEEhaQqLJrbPG/dXg0I4LD+UujboEgdBD7JR/DHwY6yfU98K0T+HIbXKEEltLk1T1
	d4FzPifiQZd3KysNZFljIn9U71jcNgQ2gUJFu4lBrplovwyGUumm/qT0RTeG8Bw/zek9nAkRLw+6w
	3oscO9WPFDHB0lIdIKMF0EOt9mLJF62bdMG89E+iGp/zQ45EcX85ak0QmEoEHzahQAJMP3HCEPAgP
	GiAhuCWVWqdQa9e22g4OUdJ2DyqgvqehCRdBQqHrzE5Kxh6/QUlqy8YgijUAqFoYNxo0GOLlttcwz
	zGN4y7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjac-00000004OFt-3ti6;
	Sat, 23 Aug 2025 08:27:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjEf-00000004JtO-0FCa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 08:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 184A6A58ADB;
	Sat, 23 Aug 2025 08:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAF4C4CEE7;
	Sat, 23 Aug 2025 08:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755936263;
	bh=G+/OUbMjRjtJ1O+gXrVBKFF97ndR0d3t/eZa2Y6qmhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t90gH+3hoMY/CvsA6myg9IfjKSLYRDiavSi2Oad1Np+0HfzFG+PBoABOSZne/+OR7
	 0Li6poNEV/s00yeRKXrL1o4edJmZShyhOCh3+my/hGh/uuJM2NvDmrdGNClRHaE5xt
	 ZmOFKH0zdGmu5ZUJZQiUhHM0Hdqz8I1bywoXvmfGdR636JieasLNmyELUHwroqrOcn
	 z9ZJh53rqEmBZbVcn8TdKAdQNqLiF+9N37ZlbU5vCxz15zgxpHFQvMXXAUjkPhBtuQ
	 sfiFKEi8c5E57AfYmibJWTaria+qazsQFzwwKsH3b8Uc2BErZoX7e3IlWWLecW0s5i
	 CQqqC3K2YcqKw==
Date: Sat, 23 Aug 2025 10:04:19 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v4 01/13] spi: airoha: return an error for continuous
 mode dirmap creation cases
Message-ID: <aKl2Awfe4CIV2O44@lore-rh-laptop>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823001626.3641935-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IsRgQG7emvDuB06q"
Content-Disposition: inline
In-Reply-To: <20250823001626.3641935-2-mikhail.kshevetskiy@iopsys.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_010425_164051_EEF19B71 
X-CRM114-Status: GOOD (  18.22  )
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


--IsRgQG7emvDuB06q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This driver can accelerate single page operations only, thus
> continuous reading mode should not be used.
>=20
> Continuous reading will use sizes up to the size of one erase block.
> This size is much larger than the size of single flash page. Use this
> difference to identify continuous reading and return an error.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

I guess here we need to add the proper Fixes tag:

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")

> ---
>  drivers/spi/spi-airoha-snfi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
> index dbe640986825..043a03cd90a1 100644
> --- a/drivers/spi/spi-airoha-snfi.c
> +++ b/drivers/spi/spi-airoha-snfi.c
> @@ -618,6 +618,10 @@ static int airoha_snand_dirmap_create(struct spi_mem=
_dirmap_desc *desc)
>  	if (desc->info.offset + desc->info.length > U32_MAX)
>  		return -EINVAL;
> =20
> +	/* continuous reading is not supported */
> +	if (desc->info.length > SPI_NAND_CACHE_SIZE)
> +		return -E2BIG;
> +
>  	if (!airoha_snand_supports_op(desc->mem, &desc->info.op_tmpl))
>  		return -EOPNOTSUPP;
> =20
> --=20
> 2.50.1
>=20

--IsRgQG7emvDuB06q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKl2AAAKCRA6cBh0uS2t
rFmPAP4wEbp3RP2BlAiOqtIlSxliBwk5YgWRY2Lrl4Q+hJS/+QD/QK/uStPNob1E
lJW0noeR0NSGRRFK7R5EqNwGP22jbgU=
=FuF8
-----END PGP SIGNATURE-----

--IsRgQG7emvDuB06q--

