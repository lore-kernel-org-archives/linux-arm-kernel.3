Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B5EFDEE3F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 18:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vB5IPxTRHP39nn5nizcVUL7wYBYeAXeH+nIwf49x40=; b=jiRQQRUGGlP+UlACeBo8pNz4a9
	wlX4MjfYAwb6ILQPwGUwEwVmFUmQ/4SpXFK3nTH1XT0DGFvSqZ1zvWGPvJpw7SJa7JUh0/wQQ5mMj
	AppwuDmyFJBi8JOFuQSWK54c3TdQPB2VOiKE93EWTNt5J6gknenvRRs91Fy5hwgUwTFqsnbpUNN15
	13CbxDKUuaFRlHYs9WC2BZH1SdbmEmyGvhiqQHlkPQC8mdT2wmafVzOGf/81o96ZUHtannunOJKlF
	+TvUzqdgw9U5h5Rd20SsiAC5CgPl9z+qOfymAUqxUjyi9BlGVOY4t2TKBrh+lEbdwyZ6/fxLQwitu
	2mOt1o6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz7s-0000000C8wX-2V7e;
	Thu, 23 Apr 2026 18:50:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFz7q-0000000C8w6-24xB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 18:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D44D6406A6;
	Thu, 23 Apr 2026 18:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E29C2BCAF;
	Thu, 23 Apr 2026 18:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776970209;
	bh=7vB5IPxTRHP39nn5nizcVUL7wYBYeAXeH+nIwf49x40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFqSgZlnTfVBRjGJbfom7Q+r2jaidYL9x0RD7JgrV4TpzLgnqQmWRYz0gFbP8/YNa
	 mU9Aut1CrtTPrlpcaOz6mlrYh3V2VtQ9Cup0LxatNyPZEUYGhgoCIgEHGXVjMHq6vl
	 ssBKDvVQe2RbIR1+NPnfrjfXA/DIxxiFKAc27AgqovsoPUU5sO7He82/LvNfq1W3V7
	 Dbmn7lnTxIHdWvGLFADrP+iD90ZWsBavHQsic6IMwBKR2QERkv58kVZL1KtXzkgNPr
	 Y9hp/fmxJd/XxtcBAZBRtfh3A3U8zKlx5+fGOfkyme135zXHHUf4yulDBTG3e6xEPm
	 /PGLxoH+RWRdg==
Date: Thu, 23 Apr 2026 19:50:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Mehall <km@kevinmehall.net>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mirko Vogt <mirko-dev|linux@nanl.de>,
	Ralf Schlatterbeck <rsc@runtux.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] spi: sun6i: Honor CS setup delay on the first
 transfer with native CS
Message-ID: <5ccd1ed2-b4b3-4f94-8c32-89bb27d4066f@sirena.org.uk>
References: <20260423174001.2797797-1-km@kevinmehall.net>
 <20260423174001.2797797-2-km@kevinmehall.net>
 <53c2d366-2d76-4a6d-a72b-99544026ee27@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IoiCEiiWH5qA67xB"
Content-Disposition: inline
In-Reply-To: <53c2d366-2d76-4a6d-a72b-99544026ee27@app.fastmail.com>
X-Cookie: I'm hungry, time to eat lunch.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_115010_576911_F6FF8F10 
X-CRM114-Status: GOOD (  17.06  )
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


--IoiCEiiWH5qA67xB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2026 at 12:40:34PM -0600, Kevin Mehall wrote:
> I realized this is incorrect. With a GPIO chip select, sun6i_spi_set_cs() is not called,
> thus CS_MANUAL would not be set, and the hardware would then automatically
> assert native CS 0 during the transfer. My testing was with native CS 1 and a second GPIO chip select,
> so I didn't see this because native CS 0 is not used on the Orange Pi Zero 3.

> Therefore, I think the best place to set CS_MANUAL is in sun6i_spi_prepare_message
> as I had in my original patch [1], unless you think it should be duplicated in both places
> or have a better suggestion of where to set it. sun6i_spi_prepare_message() is still called
> before set_cs(), so it still fixes the skipped delay.

That sounds about right, the other option would be
SPI_CONTROLLER_GPIO_SS but I don't think this controller needs it.

--IoiCEiiWH5qA67xB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqadwACgkQJNaLcl1U
h9C5sggAgETyhpLUFJdWeth+udrgH/0YKeI5n87h7uw96RcN0MdcVQrXGRwlQkVC
bThbi9LY3VJ+YrGlL6zWSFmuybyaX7AlukJjJo5GDYYSuFHy2VInX0OT+4HVpTUK
oJxbCCxXZ1Va6mtIThVE8t3vFrOIL155dYBmsPZgfS6/nIDxd39HOuBB3tw1j7Iw
I2QGXa2fVP+ok8j+1s8Es+QFnqbJ/QBzMJnlNbOLmaKU0/LM7U94amjkoxH0bQq3
KhAgTQMMultNs+8dnShM/So2hBRJj+pCNZA42XsKCnZEFFLVZv5ISXq8pfO4Jibo
huXj5pI4nhgNwZDXgrYYvnRlUhZ+rw==
=WYR6
-----END PGP SIGNATURE-----

--IoiCEiiWH5qA67xB--

