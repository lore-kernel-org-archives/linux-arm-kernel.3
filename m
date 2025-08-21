Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30082CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5SlkqaSNYvkI2vn6LWVlDQt2oeUKoK3se/zF6xp0yU=; b=Mu/YcmEGIm5L4ckOvLIdzstmoG
	Fn7d69zqG5VC1RTicTNd5di2oJ+8qdOBtaqH2sLE8jvfstvEK9322nY+z317EcLmD0wFf8c1MXfTn
	b7+W5As/Qjs4xBPAO4wUtFd4u83aPMczcS7IKXncqccxkYWhZu6KSD9541cy+f41nhMqYilk+WtRO
	J7d0oW932t3uRE/6QzFqcDwyCfDrNbNzrJZ2bPtbDuhcAhLLwBOo8o5jh6DGqe5/LIlCL0F4/FaCm
	CNf/BJNLpyaZZ0K8C7DTfGkeNiJktPovnLc8DU1RD2Dg0/o+CNU/+TCpftn5GHaDfEvnG5j3YX9ff
	9CUTLDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozgE-0000000G6Cr-3JkJ;
	Thu, 21 Aug 2025 07:25:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozFh-0000000G1fW-3Sp9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BB27601D7;
	Thu, 21 Aug 2025 06:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490E1C4CEED;
	Thu, 21 Aug 2025 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755759504;
	bh=mZ4FUqwpeliFM+BfIUJKWhmDxAE2ZXgT86u5GAWrTAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsRpfLjOy3xC581SFRPJeAyZkyycZvl6aPn2IFA5QoPv9IeStQDToqlAa5mlJqPQL
	 89USDd4HGTiTtFM46F85AMnbO0B9pwrv1rES7j9hr4QJaQ32GjXhTKk/qum4+WCaOL
	 9YQ9Nej5JXVLvyMMJ5af2Q79KlBdLYxYt/+URZC2BVZaTeWN8RDe9L/ETsdIfNFizm
	 IjsXai0Q5igBl+5vgvQKLv76aykaU4ZImTGOxDJ2gi/xXbV5VTfJr+fn6HiceIp67x
	 yIEb5mXLA+7xUGuW1wI/g5uoBYo/sV8sE0QS1RbHr1f6vyMUSFvAgC9U1NvqUN4XLJ
	 cO8TVfCtXw5BQ==
Date: Thu, 21 Aug 2025 08:58:20 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 00/14] spi: airoha: driver fixes & improvements
Message-ID: <aKbDjIZhJuWo3yFu@lore-rh-laptop>
References: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1AUHNkd+gHsq61gf"
Content-Disposition: inline
In-Reply-To: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
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


--1AUHNkd+gHsq61gf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This patch series greatly improve airoha snfi driver and fix a
> number of serious bug.
>=20
> Fixed bugs:
>  * Fix reading/writing of flashes with more than one plane per lun
>  * Fix inability to read/write oob area
>  * Fill the buffer with 0xff before writing
>  * Fix reading of flashes supporting continuous reading mode
>  * Fix error paths
>=20
> Improvements:
>  * Add support of dual/quad wires spi modes in exec_op().
>  * Support of dualio/quadio flash reading commands
>  * Remove dirty hack that reads flash page settings from SNFI registers
>    during driver startup
>=20
> Unfortunately I am unable to test the driver with linux at the moment,
> so only the following testing was done:

It seems to me this is quite an important rework of the driver. I would pre=
fer
to have some test results for this series. Are you able to run mtd_test ker=
nel
module for testing?

Regards,
Lorenzo

>  * Driver compiles without error.
>  * All changes were tested with corresponding u-boot driver. U-Boot
>    SpiNAND driver was modified as well to match linux-6.17-rc2 with
>    additional fixes for continuous mode.
>=20
> Changes v2:
>  * minor fix
>  * add comments to code
>=20
> Changes v3:
>  * add patch to prevent continuous reading
>=20
> Mikhail Kshevetskiy (14):
>   spi: airoha: return an error for continuous mode dirmap creation cases
>   spi: airoha: remove unnecessary restriction length
>   spi: airoha: add support of dual/quad wires spi modes
>   spi: airoha: remove unnecessary switch to non-dma mode
>   spi: airoha: unify dirmap read/write code
>   spi: airoha: switch back to non-dma mode in the case of error
>   spi: airoha: fix reading/writing of flashes with more than one plane
>     per lun
>   spi: airoha: support of dualio/quadio flash reading commands
>   spi: airoha: allow reading/writing of oob area
>   spi: airoha: buffer must be 0xff-ed before writing
>   spi: airoha: avoid setting of page/oob sizes in REG_SPI_NFI_PAGEFMT
>   spi: airoha: reduce the number of modification of REG_SPI_NFI_CNFG and
>     REG_SPI_NFI_SECCUS_SIZE registers
>   spi: airoha: set custom sector size equal to flash page size
>   spi: airoha: avoid reading flash page settings from SNFI registers
>     during driver startup
>=20
>  drivers/spi/spi-airoha-snfi.c | 508 +++++++++++++++++-----------------
>  1 file changed, 260 insertions(+), 248 deletions(-)
>=20
> --=20
> 2.50.1
>=20

--1AUHNkd+gHsq61gf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKbDiQAKCRA6cBh0uS2t
rJDmAP9GGuvSZEogcCj+X2sKTBaavTRJxM26qOSQDYgAAIL4nQD9HS0AIcUP+7jg
0doMcxD0fGbfIx1hqOoVPVYE1CgCWAc=
=YwyO
-----END PGP SIGNATURE-----

--1AUHNkd+gHsq61gf--

