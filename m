Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C41AF483E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5WODaG9Gq7F9JZNXjpS+WX7LEMWIQj7OgYxY6O8wm0=; b=XmDmxLAn9ZTE5M2N5xWCzwW+GA
	6hkDy5XW8SImYEflmGXrc+f6RLJnzbsHuo7l5aRZAAI0PpUT8tXZA+yp2hBqLkzogYX36Gm8DHvl5
	qpYBdJoZc2K+V5odxoGq4iWuv3OZjVaMZe4hvIPggTFqWjhx48Xrzx60XEWYIaaBGbzBZogOaIQwv
	VryD8G9d8PkUPsMFoUS5nWE/HI4zdrXxxmUawV6lAf2duuL4kmxVQgGrSg2g7CRJbumZlwADOnd+S
	512JMC9P2prL/QtfyPjh8NXraxmt4+BitBfumMhSaFSSYMvo4g7l/Zu0vBlmgzhjDyeFSoI2mwAMa
	ti3qFAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lBc-0000000HUCJ-1PlL;
	Mon, 23 Mar 2026 19:43:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lBa-0000000HUB5-1NLV;
	Mon, 23 Mar 2026 19:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3D45437BB;
	Mon, 23 Mar 2026 19:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CC5C4CEF7;
	Mon, 23 Mar 2026 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774295017;
	bh=v5WODaG9Gq7F9JZNXjpS+WX7LEMWIQj7OgYxY6O8wm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwxvSdbYYgbtTaGBexrLs+CBdI6CQ35Ad/j92i3+aRR27slb6tT7mjmS18WnawZKS
	 qjPE5+FMQ7SmONBT3pbXlxEnWBTjIfNKVpfb/l301sTXf8mwulN4p+us/dq6jpk5i9
	 zmFUX6viu3udkvBFk/DaAGrGZMfx4FdD1FTlGFI4EV5VGNXViAD9gJKwkJagHO/n7n
	 bH5xw/iUaQ212ONZ8kV3zMeok1EQaGArnSybU57FB0e9IjaWExq9bg37mVyFciJqad
	 lAe3YrFq/pvXpgB4v/Zo3VE8zAVgc4zbd/kAbUmX5YFWXCvU1Ml/2o0MMhVnax+MnN
	 nUU9y+OpLYjbw==
Date: Mon, 23 Mar 2026 19:43:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 08/17] spi: rockchip-sfc: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <a4972031-e0e0-4c0d-90cf-c283010980b4@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <863ab1ddc4f3b9a25c0bf79e1581b65359cef6c3.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T+H6iatU6AC0B8Qc"
Content-Disposition: inline
In-Reply-To: <863ab1ddc4f3b9a25c0bf79e1581b65359cef6c3.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124338_385999_E4B0418F 
X-CRM114-Status: GOOD (  10.25  )
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


--T+H6iatU6AC0B8Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:04AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both the interface clock "clk_sfc" and the
> AHB clock "hclk_sfc". This reduces boilerplate code and error handling,
> as the managed API automatically disables the clocks when the device is
> removed or if probe fails.

More runtime PM clocks.

--T+H6iatU6AC0B8Qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl+QACgkQJNaLcl1U
h9D4ZQf/acnRu0a4w6FJL3v12O42Uq6Atol8X/9TvvfEv8vy8qQx4u7LQH0wAamf
h5RLhWnd6nnJ0UEgty8mI544lxzYw4RRV37oEWa1YlNgWMLJk+5DOgR6Ez20DfdU
vVcwkiwN1T30Yx8oaZOvLVLtuKv3X31uzjSJLs4xVCFbvAJSqjhhnXrhBd+NqGgD
oLCC0q7KFUnaYaKyIBrZNm01jtXo6NntwK8dLHecJOuXmSAXpCnAM17uiYSQCuL9
d8SJVRLy9Dbwoz+RSHJJh97TvT0aW9by4xQABRV37vXmaj48N2TXJXgJj5xx+teB
Qqk5+3b+2LydR9XyiqHGRXrhmHGHQA==
=dt67
-----END PGP SIGNATURE-----

--T+H6iatU6AC0B8Qc--

