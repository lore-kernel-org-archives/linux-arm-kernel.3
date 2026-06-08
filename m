Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DBCCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTGSQgErg/Arp5VRvofr5JzJET68SF76bEcAEEeqMyA=; b=Y5Psp3D91sKCnnN3F9dm68hp8D
	sCy+a7I42dPu9wMVCi7lrR7zDg0fH9JarbrdV4tDi9Iay719Kei6qKwhQpwWnzL3pd1lV5pMPaubI
	keCOzGmaJv2jEAH4iZF1zf+ZqUCKAy25JBAqZFh1kveDlgOjrifqRr3iEe57KvJxQ5jUmXQffJQ4t
	UYgnhn/7gWybyCdRBw2iwEotlqblEgcmGUnKk2JZ0/9KZ0o1tE20t1HbvmNLMhGQ1R4WRPQMnnqeT
	KAnhull6uLQuA0Al7riDzNlLVvflXGAKw86OQ9uRxq+r1tXhkqQjccXldJTurohLK59AvAOlkl1mL
	TlNWVVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXbW-00000003NLy-2egk;
	Mon, 08 Jun 2026 10:53:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXbV-00000003NLs-1YSJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:53:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AB626001D;
	Mon,  8 Jun 2026 10:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497731F00893;
	Mon,  8 Jun 2026 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780915992;
	bh=pTGSQgErg/Arp5VRvofr5JzJET68SF76bEcAEEeqMyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rrn4QeB6IQCz0lWezlbna7qQFATILo8R3qo3AohPUrZXEgwUCTbOZIoi8TB4J1B0K
	 QXuLQVoyzSL69TccroGsPlnwmQePaGvnomxhqyA71LUmVDI3hVA89MxZEmSw3mzTbm
	 yVu8yeCjwtsMd8pfNnE2hRb+PwzewiFKf1vU4bIdHlbr2kNqqVyKquhVRIkjehGqCL
	 gq6XSYxAlFPOXkR0XGatAzTC0R+WB1YpYlxxX1Yj3/acun2mCEC8DmRHE67q6OR2Zx
	 HeXZoo0JMG5V0UDg3mXh5kzSB6/2xYxjMuaNPZc0HgT831nXZFBtho437ACJFWWQ5m
	 veEnPLRrlF1lA==
Date: Mon, 8 Jun 2026 11:53:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com
Subject: Re: [PATCH v2 2/2] spi: ma35d1-qspi: Add Nuvoton MA35D1 QSPI
 controller support
Message-ID: <8e751df3-6237-4c8e-9c87-34bb67e435f7@sirena.org.uk>
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
 <20260608025009.1504971-3-cwweng@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xd1MFY+nK8dwfKSr"
Content-Disposition: inline
In-Reply-To: <20260608025009.1504971-3-cwweng@nuvoton.com>
X-Cookie: We've upped our standards, so up yours!
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


--Xd1MFY+nK8dwfKSr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2026 at 10:50:09AM +0800, Chi-Wen Weng wrote:
> Add SPI controller driver support for the Nuvoton MA35D1 Quad SPI
> controller.

> +static void nuvoton_qspi_mem_set_cs(struct spi_device *spi, bool enable)
> +{
> +	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
> +	bool assert = enable;
> +
> +	if (spi->mode & SPI_CS_HIGH)
> +		assert = !assert;

Hrm, we should have the core deal with this.  Separate issue though.

> +	ctlr->num_chipselect = NUVOTON_QSPI_DEFAULT_NUM_CS;
> +	ctlr->mem_ops = &nuvoton_qspi_mem_ops;

We don't specify mem_caps, I'm vaugely surprised nothing trips over that
when testing.

--Xd1MFY+nK8dwfKSr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomnxAACgkQJNaLcl1U
h9CmEAf+MpO2k2NNGcoMDAdpYpmFVLXNz+7NM8gxd84SFap2YCj7QWwpERJVAemF
kY6pBKnK0Sjzx+b5sk1GNhbhG7SXYfqRv5NV/GZ6XC0g7f/TmBNn999DTJIkqpV2
Ke8NtxlpN47GU1n3B4OxYhsZ43FA2Q5cRtySFtoyRmK8quCSxS5EQpe2Q2hTfkdp
drPirHEvVXl1zynEwPmxaNUkqSy30Ic3Ibih2sXGDqtfrCH1liNDxzR1mZTnNjJ7
x/zhElVxcJhLxsqvRiEkAM92j3I4IkO7oKiEHWSpE5U5+oO0AyBtfVU/EAkbqX05
eRnQzWH1wTSKTa6lFWL+6e3piFV60Q==
=CCql
-----END PGP SIGNATURE-----

--Xd1MFY+nK8dwfKSr--

