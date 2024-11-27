Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583A2D6D229
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stwjnGnk0DMxkcjdPTNVNJUobHrJYgbm5W0wA6Sug34=; b=A0yZWLP3F094kcFl9OS1iEsM/S
	dm4z1FQFnxzqd+ifsvLAcELGB0rP8AXjwDamKXgu2cw+vWeJJ/NhIRk4nz5eZ9ZA0Zj5PlCot9oQH
	X2Pgl/pXSFUuAmoeGlWvOVZcN6oL00YDYrYfXRSWNLKgARUOINnjyQDoJV/SGp9XUh7zxRxXpuTBF
	/mb6D/FtH9JTJBfz1IRVRe9amAPNX4lfaPpRAGbu3RSw/Hkxv9K4ghjeW7aDI+g+vgvj+yejbSAnN
	7RtU9ULL9qSOiEWEvfrVv1zNFluQOrKd5H3NPes66GkKi5nGsqFrLDjzHCQDEPC6CyzJW5rTfqdfx
	wcwWzvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNIN-0000000Dsmi-1Dju;
	Wed, 27 Nov 2024 19:01:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNHP-0000000Dses-0JPC;
	Wed, 27 Nov 2024 19:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CCDF1A439DC;
	Wed, 27 Nov 2024 18:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E462C4CECC;
	Wed, 27 Nov 2024 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732734049;
	bh=stwjnGnk0DMxkcjdPTNVNJUobHrJYgbm5W0wA6Sug34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2H085Y8eZ+EJL0Vp6lK1S0Cka4gBCSm1WqJDcii41/tx3Q1QrQsIiqmPSEEkmxjD
	 FpXAGRQAhd5AU1Iv4kx2Yb8v3kq0UhZ1rbv4yNNcffAItqvsvP72ObPdm8Z+RXqrBI
	 6A0MrVhd4D2qUW0mpMFlboAFDLuTbpTIUvWLPNr6YMuqhULpq9tN7VSpo7O6EcsthJ
	 fpEOTg/rLu25cQNFnEThAIwfjjYkP59eE9pUmcT593gIpfc/pcZR1SWs7+LD8lEAZv
	 MJ+u4x9eJhpDExiZMq4EGFePOda/jjkJaiWw7SYYfAX+BqdT324irH1ChsfoHIHtUL
	 ByKL6LX76Z/pw==
Date: Wed, 27 Nov 2024 19:00:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Message-ID: <e714ad9f-6a31-44ab-af2c-29f052cec07b@sirena.org.uk>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fBmr5vGOD0aDrNaq"
Content-Disposition: inline
In-Reply-To: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
X-Cookie: Every path has its puddle.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_110051_178626_2951AD13 
X-CRM114-Status: GOOD (  13.54  )
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


--fBmr5vGOD0aDrNaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2024 at 07:47:46PM +0100, Jerome Brunet wrote:
> Depending on RESET_MESON_AUX result in axg-audio support being turned
> off by default for the users of arm64 defconfig, which is kind of a
> regression for them.

> Cc: Mark Brown <broonie@kernel.org>
> Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Mark Brown <broonie@kernel.org>
Reported-by: Mark Brown <broonie@kernel.org>

(I reported this to Jerome on IRC)

> ---
> Hello Stephen,
> This fixes a problem introduced in this merge window.
> Could you please take it directly ?

It'd be great to get this into -rc1, I've got some of the affected
systems in CI.

--fBmr5vGOD0aDrNaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdHbFsACgkQJNaLcl1U
h9CFhwf9FXbeRLv68awMr86hSLLgSKMAQX6/IB6cA/KrLw0zKPUpVtq4T4rgrF62
dgaTI48w9uz6aP7wXU55jYwZiNQrnCZ5YFlAF3sa0Hp18oMYAeyKC3zwGV6bCaQu
h+o8wXq59ThA/Tn9IKq6Op6WDhk6Cgg8KufIu3yx1y2gO8D0+ltttuHpFnfmPmuU
cmGWvdAEUtk/j/JfA/TzlpF4e0rPx2XpkTWLYGBs5mbqpkr7VkkYlnFTcUbMWdKb
bPFAubHBjKEawqmZn60wqlAbHB8tOJ0OrG+oUEok7MYaPt+hwzG6pE3d1ukSbLFt
CAcEJ9DcfS/toyp9owKXsI4HGdKVZQ==
=8CNX
-----END PGP SIGNATURE-----

--fBmr5vGOD0aDrNaq--

