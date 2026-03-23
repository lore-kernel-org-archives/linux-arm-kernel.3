Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2116F483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EoWahn+aCaO4RgFt5H3ba598sk0yyiLlddVHssRrP6I=; b=ztJiv39i2fRwc7EMa13Ms+nCz4
	1nIUCrUOtzcYPp4/W3EcKLHXsKXDpfmBCns9RLmBTUjz5v3ngmpzaHHZAFryBW6WkxVy3nV6OzK/2
	wYi7CXAjIKCUUSIyR9KrScAmGzhxkPbmM+EEl2i8Iai84fHKGgDxLR+ulDmcYSdW8HvB4DRjuPd66
	zteUPVK4oQqT9ZuYIzFc8AdZUpBXbkVd55EvxhkwHoQoDOiD7cx3aD/SaX2HJd7jDBVhpdDH+lbIZ
	u1r8BeZDwzApIdaV3xIZxOJqxOQ14bEps/YtQ5UiRHDhNSm0ApjLGYDS5QBwkygRR14QILdVwDuxD
	ZPtRePMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCf-0000000HUYf-301J;
	Mon, 23 Mar 2026 19:44:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCb-0000000HUWV-0YVy;
	Mon, 23 Mar 2026 19:44:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6529960103;
	Mon, 23 Mar 2026 19:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8ECBC4CEF7;
	Mon, 23 Mar 2026 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295080;
	bh=EoWahn+aCaO4RgFt5H3ba598sk0yyiLlddVHssRrP6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ462hZ/iAigMKTQaYu+CB8zaJMOH/HxYZY6tSMKEOAD0CCRZV7NuPFohwAiDzZV4
	 s+vmj+k1xRLbPyum0J2ICSL8Hd2vR7PMUwgkDJM8AbFo0eHypKBNtUlkCRRyvlWMVu
	 p1UDx+HPa17fcaQDH8vwLNRGZEybH9dTod7CGrUHOWl3UVlEuGzE5H+NvQUYcQu2cn
	 YRfx4iQm+qIJNXMX2EKBEuJqASEbWeadUAdI6GgNSH9t9gJaEl9ePpUCpmRvVKTwhN
	 /3lHI0T6oz2KT0VuPzkGojHnQymA4qvCIJIwePvzBgOjw5TUvFASATfXaaDZAw2f++
	 cMEWIodaZK5CQ==
Date: Mon, 23 Mar 2026 19:44:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 12/17] spi: stm32-qspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <834e2939-93a4-4088-b6d2-6b15ab00ab04@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <333b09950ee5c2fc0e560536281afb33f92288d1.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4FaSwlMKbUzxP7VW"
Content-Disposition: inline
In-Reply-To: <333b09950ee5c2fc0e560536281afb33f92288d1.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
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


--4FaSwlMKbUzxP7VW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:08AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.

More runtime PM.

--4FaSwlMKbUzxP7VW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBmCIACgkQJNaLcl1U
h9BlVAf/SqX2lKFh0WlwoopEAQeKZhC6ZHRqtyKh2/RgbK5AFMr9p/zvDbHhnb4m
QUJdF7K+dWgmYwaqer9oU4T2iOQ7nwvkHcaqYCX4qbMnUAtUWcSkiRuntlcB3npQ
Lc9CtCDNgixwYNjeY3tb2+kRpOSJMW6UGRCk7vdoobQgqT2nBYLx48DyjBgLUpCf
DzWTPa0ECdN9GU+lHoSR86OTRgSVe+DwuA0gOg104a0cJxs0gz8WiLnIXpmVvxj5
56XU5Dsc4MkWeuovuBtlEj/UXalFuNl0QK96f2BOn1EjIdBN8dFAt4Z6vxr6vdJk
sEKFbLoc9OFb65c2iz6ILeZ87zPRtw==
=SHbm
-----END PGP SIGNATURE-----

--4FaSwlMKbUzxP7VW--

