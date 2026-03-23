Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188A3F483EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dmtorY8LlAopvLU37QPmGzNGM+3mvzFRJJMdAu2qDw=; b=k/rxAXPum29QD1kpJO3B0ODvNK
	M8w4IUPi6VM0ItEDtYQ2ZfE71ImayUKHqOY3CeJABBTp9cXgQ8YabzmBAiGimryxtZOS5C2CuSCQp
	GnsVj7gMXS2bN7g1+U2bUeFMDIcK0EkY4RmHeS5Aj1lHdhG5YS8acTjE2sI7ldl4ev7tQP2PkJZtf
	ePzfNk35DHp56QhWQcg0j/8E4w1/kVb2PvmjMiUYJ5g5mcK4lrwDV6zikJgr1s58A5NKrI56HFPMy
	c+7OCkUb0UvVhmM/eyTPFlfIXLr8bIVVLOloySK3Vcj49RaBw9LNhBRU12EA7SmD/5WqKfYpWTRsz
	iuf00KnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lEV-0000000HV7E-3gu4;
	Mon, 23 Mar 2026 19:46:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lET-0000000HV6l-3uYC;
	Mon, 23 Mar 2026 19:46:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F35A406E5;
	Mon, 23 Mar 2026 19:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D6CC4CEF7;
	Mon, 23 Mar 2026 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295197;
	bh=/dmtorY8LlAopvLU37QPmGzNGM+3mvzFRJJMdAu2qDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rShQHzbr+/e0vr8yznZXZLi0IadcEXyXmTC90VkLLCkDaKMyZV6XVtlDucYuLRq74
	 cw8in6D0nwJYmsWUzDM5DUNt7b7dv5ZP9BgpIbj55v3YyI9+xYELCUmp3kPYHs7x0C
	 00JUcr6l+IiGJ2xPxQM/T0R+R/AxSBcBKqUj20bwgr7zgL1F4QraMYx7OEzbxPleal
	 UhrfMUKHBGqXIXHQZtqkMmt/ioegcjIoDyE/8AluJ3QflhBk8vVAiE0QoMZKdFT6Y0
	 mUyw1ezBl/MjVbtx5ejQ3Exaog+afTr36miFzTZGTx45Rg10COYbaTuthczwezddX0
	 8h16B0dBoRPdQ==
Date: Mon, 23 Mar 2026 19:46:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 17/17] spi: zynqmp-gqspi: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <cc7f3fec-e314-4f46-8c62-75feb919b778@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <611b4c4b67aaa8d86a7aeba9707ada47e6fd5dc3.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yXZTZfMj8/cYjg5u"
Content-Disposition: inline
In-Reply-To: <611b4c4b67aaa8d86a7aeba9707ada47e6fd5dc3.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124637_994016_808A5F8B 
X-CRM114-Status: UNSURE (   8.78  )
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


--yXZTZfMj8/cYjg5u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:13AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "pclk" and "ref_clk". This removes
> the need for explicit clock enable and disable calls, as the managed
> API automatically disables the clocks on device removal or probe
> failure.

Another runtime PM.

--yXZTZfMj8/cYjg5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBmJcACgkQJNaLcl1U
h9Azogf/QlfWQKZIDTkEDnV1hRWkQlKZGgabUOpCAe5hOywhIwsKTsN0RsdWj4pu
gZ5CUwol9/peWzpl3LUtT438fl+Tj1jWbjNJWSBHy4o6uSnLSIedjHJuFrA5nBb7
Nw2JPIwe1Sxk3ooG6qCf1RLFclZHxcvjbAeTDIUbRmnA2ZeOMuDQ030AbISPi50p
TwkulHE1Mfd6zQ/Dtfv6azyFxBMfirgdLPblRWmXkYp9zgnDKfOxgy29A30V/0zb
NBeZSB5HZVYUCjuCMpe3hbq8MYLGL+d/khvAy8r/tnghN49BcXv9/LG798apXkXC
FKZxce5d98Cm2HnL8Suce3/z9c3sKA==
=quxv
-----END PGP SIGNATURE-----

--yXZTZfMj8/cYjg5u--

