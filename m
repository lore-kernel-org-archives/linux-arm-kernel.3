Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1050C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5qv7SU0WDIL3754Sz2KIRetoEuCaKQJTb8/kp1+BN4=; b=njCrDzsaEuYXe0fkcsi6nDENm2
	GgU4+KPqoW4JclGFTwzdnLglDv7vMgUR/j88bx8yY2GqYAgpORN11lFN9S/pVBrOAYhpjw25rQHGl
	U2WO2kjck7BzMw09XS2SvB5LZc52PPPQZKsn6w+ZBuB+LyjaWVYn21cFY92654FwAGUtaqUf4juD+
	5KzAkN0pKNAmNK1zDTWPrsAvd/I17+V63zGbxpEHJpcWAnj2N3FKdVCpTUhvGWvVRG7hUxBE40vMf
	nT1SwaN5DNEwILkwiJz6i/z90J3hC+OwKdOCBmvXmny2myrs13D0uxPr+VN3Vk2dP5mnEM1scI6KA
	D0aaNOvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i4L-0000000F0gj-21Nz;
	Thu, 10 Sep 2026 16:56:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i4K-0000000F0gZ-17TG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:56:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2AAF6020A;
	Thu, 10 Sep 2026 16:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1840B1F000FF;
	Thu, 10 Sep 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059371;
	bh=H5qv7SU0WDIL3754Sz2KIRetoEuCaKQJTb8/kp1+BN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RYT1XR/OfF0mS9K7RNsSt0/bIB4tPLioqS6oICC8IIBQHYVfhoUtGXezZnR7dAl+c
	 rFWzFgqOUX4ca86r7skR+88tgY+1ogkZggJmqPnETO8L7QgfniDy2g/o7Y18pUXxsb
	 bFM6/G27KvDldgE/IwzDlrYaZ1ti/gQoZmyuuGAU9OyXJJfhZeM7dLTPnJgKsYWFmi
	 wKWAGiMui/lzpZDf76fBJTyUFLu/Rq18kYGGmUr0p2SOBUpNmY9gHnQMAuwr0ROqn/
	 6RRmm9D08XnbYF8D3KE8lgsE0DMnNnhHE1v3HoHRYQ2+1033JG9Ecp7oP7YCvG8lGz
	 q0jT9Y7FpqKlw==
Date: Thu, 10 Sep 2026 17:56:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Itai Handler <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, michal.simek@amd.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] spi: spi-zynqmp-gqspi: stop the controller on shutdown
Message-ID: <8fcad389-8340-4ccb-8ef4-008d826115fa@sirena.org.uk>
References: <20260910113325.717882-1-itai.handler@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3mhjrI60cxQYt2un"
Content-Disposition: inline
In-Reply-To: <20260910113325.717882-1-itai.handler@gmail.com>
X-Cookie: Gravity brings me down.
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


--3mhjrI60cxQYt2un
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2026 at 02:33:25PM +0300, Itai Handler wrote:

> +static void zynqmp_qspi_shutdown(struct platform_device *pdev)
> +{
> +	struct zynqmp_qspi *xqspi = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	/*
> +	 * Only a runtime suspended controller can be left alone: its clocks
> +	 * are gated, so it cannot be mastering the bus, and its registers
> +	 * must not be accessed either.  Any other answer means it may be
> +	 * running and has to be stopped.  In particular, on a kernel built
> +	 * without runtime PM this returns -EINVAL, and there the clocks
> +	 * enabled in probe() are never gated at all.
> +	 */
> +	ret = pm_runtime_get_if_in_use(&pdev->dev);
> +	if (!ret)
> +		return;
> +
> +	zynqmp_gqspi_write(xqspi, GQSPI_EN_OFST, 0x0);

What ensures that nothing can start new transactions after this has run,
and if there's any operations in flight will the controller be OK with
just being stopped like this?

--3mhjrI60cxQYt2un
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqi4SYACgkQJNaLcl1U
h9DtGwf9Hvtmmb3vMcKh7JgRiQb0kCFv9qEx+cbBU1WvojtOeTyWRno1HPM+1Dm4
1a+alpDAO3fkRljzrLYyxHcx61SNwypP85xG7nYIRoLjj85Q0H7rl74tmH4W2KNW
XCdswt1F115sVLVg5Z7a5rv5gyunIjmgqze32jlZQKFkU15oEUsbk3NB1/CbQOQT
Z2QYer07Z/TCA0enUEK6NKJYRDJQJnSgGJBoAvoF5vbn72TLcrHx8vf7i9GZktzl
j8ZPbKqiygHJwpUT0+Qser2009MxBTS79sbGbN5/ESD4eKi59lGRghuhmza22ZFP
nKQ1163hkIr+j+n+ECibjh0si5+eDA==
=ImZb
-----END PGP SIGNATURE-----

--3mhjrI60cxQYt2un--

