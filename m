Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99E8E87823
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoQEXTMZ9Ikue95Hghv2U4KfjvZP3qi4h7j/Au2GuAc=; b=kPev5guqRWGG3uvdhP4HLZROFW
	wkhZAuwR0HimFmapYeHz4rdxlFVdffhAqoDSKweC70bndtbMycCrdblPbPc5eBKgeXygilog+91Nu
	/+VjHOYe/gi2VhfbgNXRk/thjA3AyLCyFEVmIWDJxoNiEHwKAEi+PI2Gli/jSZJVToVsIsd3El8AU
	rmhDs+5S9jnPbqB9nnJK/2lZFl7Lq0YmommoQGvyFTpOUus7Kt1PHFsocEahNUCH2hQje6zLHX5ms
	AVyQBGk6t+hQcbQyBmhYTgNYk7ZtmA4NvbIdZpL/8dx8rIxeZ2I7Xc5KunjfCQ91KL4G5rnqZYBHT
	DIJpdiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFpt-00000006cVV-1Lcf;
	Tue, 03 Feb 2026 12:48:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnFpq-00000006cVC-42C7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 12:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A9FA4432C;
	Tue,  3 Feb 2026 12:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7BCC19421;
	Tue,  3 Feb 2026 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770122929;
	bh=GoQEXTMZ9Ikue95Hghv2U4KfjvZP3qi4h7j/Au2GuAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALpjSkomsKM3SQ34jEsx3t1EKwY1yvq9CrzOJwoVGQVtHWHml3CP7puEaQH0Er3zH
	 brdEcWlTNROiVmuvM9FxuLtgloWaNNekO2pQp1I5tMMx2GgY3CDtDRZN1xqztkAT46
	 h14cqQcqDUtSqAteqhgYWfA/eEI+oMWpIZCv1kj5KRVC1JWQ6c1p1yHwgalPDpwade
	 XqLFET29PEZ4zDK/6H7gej50jpnogTUmU5A+TN7dBZ3LqUbbNcawWMKWWg95iuFsgf
	 LC4VM6/iKvS5NWJn5Sv2T0FG+dGvvNQ4gHWv8rtuocabvyTD3iL4OibYPKf8rNm42g
	 022BEijLBGadA==
Date: Tue, 3 Feb 2026 12:48:45 +0000
From: Mark Brown <broonie@kernel.org>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] spi: xilinx: use device property accessors.
Message-ID: <849bf95a-133e-4faa-973c-19342afca327@sirena.org.uk>
References: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t84k7qtBs9ObTbmj"
Content-Disposition: inline
In-Reply-To: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
X-Cookie: Do you know Montana?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_044851_101488_197ACAF9 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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


--t84k7qtBs9ObTbmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 01:55:12AM +0000, Abdurrahman Hussain via B4 Relay wrote:
> ---
> Changes in v4:
> - Removed patches making the irq optional.
> - Link to v3: https://lore.kernel.org/r/20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai
> ---

That was the changelog for v3 as well (and you dropped the changelog for
v3...).

--t84k7qtBs9ObTbmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmB7qwACgkQJNaLcl1U
h9DYngf/a0dtVE9bwl62OCn814HhMa027S2vocFd+4LOvRmwR9AeCktln2ffod7m
YWPa3ktlAM/7mZizlo30Ge5BtbvE9yTXL/NfDUXHTaQqrF/UtT3IUqjs4Uaq3Ibk
kRSpWxx0Z8SxEUTwwYuRQO3zVT/bfRrYIrMDOz/HFAQSBTZqU8EdIfn1RFmvhryG
WGNPeU1L9Ixw6SZH7j0QCOnUA5RWSXtqj4cz7Gw7PXoJxoWEATddFo/nnpwp5Abq
UmS+VaBYFNMRGlVkv9o94IYWVGwd/CuiYieO7JOf7qY3MZQTnnaiPkOny3xR1kTb
ktzCfDcYpvLk+VmDAOVMLp91WedA9A==
=1d7o
-----END PGP SIGNATURE-----

--t84k7qtBs9ObTbmj--

