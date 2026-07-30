Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E03C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 15:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHxdDcbjOGlOJGutMP1HQ34hkj4cQTaM3qxD/Kj1olE=; b=hiOBgxkLKAdQ/AxfksmL3wcmtX
	VGtusvmlh4DWUhzZ5rUFkNme4nFshqP+jCozciHfuNO09iv24iZbYpBP1eeGXabtmEPmrGHkdWBiy
	AP//0/KnBXUg3YBj7KBa2YXB7BJatV4/23fOvPlwMnmtnvRVRPmxzWG674mUBHrk50kfl0COQXtqs
	yYgLK1frZHCh7j/LidjGNS5DUtihpGt3e/JQCsULutumxiHjtTQsR+zhlOjyTndmofs53niw6mXAT
	oFNJfvnlE4+oiEk1blxHrBz7GVW5KTFh8o6sYOyqU/L2FJqi4Ba7qyeNx4bo+tYSEVx/ZveXn88Xa
	tyX2EezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSQ5-0000000Aouy-429b;
	Thu, 30 Jul 2026 15:11:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSQ4-0000000Aou6-2pnA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 15:11:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B83CF60A5A;
	Thu, 30 Jul 2026 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944F91F00A3A;
	Thu, 30 Jul 2026 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785424295;
	bh=CHxdDcbjOGlOJGutMP1HQ34hkj4cQTaM3qxD/Kj1olE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TpLs/qWP2a+i8/Inzm92fLUyaAuPx6kegJnbSh+d4sxNsAZYorZuW7X0QYbEwtHHe
	 CO5wJcrvAYCs9bW0BXAldV9X+7kEl9er12f6vdeDZbR+2Gvk6sxm446d4IVWiqm/Bk
	 /7s4kvO9X/3TXfZawASXJKF0+Bpy3zlHZQz5sfhf6HndwgjCBaRNNgcviRMMjG7kGc
	 ckk8azMfr0hrTLyA0t/1m5Orw5zpyWaC6FtRq5+lUB9Zc49nGpZGiGzIZgiLUDOF7R
	 PmZV4zvN9JWDZxD74Eynexcp0RGqXG0xmsvXUTGDbLNvX+AMNQsX9+zwJ6oQJpG/Iu
	 eAUxKDHoO/Qyg==
Date: Thu, 30 Jul 2026 16:11:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH v4 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
Message-ID: <f698ec65-1677-45fa-bb05-34aa8e092100@sirena.org.uk>
References: <20260727091833.750051-1-cwweng.linux@gmail.com>
 <20260727091833.750051-3-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vI34kSNS08hda07L"
Content-Disposition: inline
In-Reply-To: <20260727091833.750051-3-cwweng.linux@gmail.com>
X-Cookie: In specially marked packages only.
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


--vI34kSNS08hda07L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2026 at 05:18:33PM +0800, Chi-Wen Weng wrote:

> Add SPI controller driver support for the Quad SPI controller found in
> Nuvoton MA35D1 SoCs.

> +static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
> +				    const struct spi_mem_op *op)
> +{

> +	if (op->dummy.nbytes) {
> +		nuvoton_qspi_set_bus_width(qspi, op->dummy.buswidth,
> +					   SPI_MEM_DATA_IN);
> +		ret = nuvoton_qspi_txrx(qspi, NULL, NULL, op->dummy.nbytes);
> +		if (ret)
> +			goto out_deassert_cs;
> +	}

I would expect dummy data to be an output rather than an input, we don't
want the lines left floating?  There's a similar thing below when
setting up the dummy xfer.

--vI34kSNS08hda07L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpraaIACgkQJNaLcl1U
h9BY2gf/YLphrDV4vjup9IzsDwXOsd0044IbIv7XUtgTxbr+xyZCitNdL6irO/GA
4H6dME9dkwBCIB0HY1hI4uCH4esj2Kwg7pCfB3HRcgOxRv710hhTWM4oYJHtsZqD
OJx/ajLbhFtToRXoHbFR2UbtOHs37jdmtIVMnM8pSYbxhUEjc2j5f1sdwpSktZBA
7pdwMdHMDVhFxeO172mNdMCDZBQWgSXvoeK0wChkYPGKZycVccNFpSk0h3AJckXs
lqsPXhQw5QVm329UDNe3mxGoyy3jLfN8qJukqGrjtmzE8+JbOPhmW5C2a5EtOUlZ
nvPqU2/12B4CMFv2/xXHDH3SIjWZ/Q==
=2MuL
-----END PGP SIGNATURE-----

--vI34kSNS08hda07L--

