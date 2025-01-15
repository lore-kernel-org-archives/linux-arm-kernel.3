Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3DBC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2zzn99K6+XMMLbFjuejKY/JKAK5VXBWhhd5tBoEzmE=; b=IqmWDP9US7UZZDCF5/2XThoR+q
	Q0jzhHhU3/ufFk6vczaLeVmrW3k4nIuaHrMYCVNkv/Du5FkcHjtwMvsLUeF+XGhKwEu4l01OWiU/f
	XLYppKPze5rGNlRCUaLtzcRSJmqQwfxJNQPDklIh+/dJiuLM8MOAOvwcyEPCOxXYv465wOU5LoAVs
	AJTkKi6kjTstWMiYdp8UpUqrbDOxQVc13bMW5VvgSWgVFkF6F/nnbCxa+x3LPR3x57+5lYJpih7cv
	X1HANzw7bsPULCX984Q8E5QThRHxWqTSDq0Ki54qHOEGp7NnSSxQwLuCjQwuDALrCLTtXjI0OuycH
	qQpRPDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Y6-0000000CwwP-1ecj;
	Wed, 15 Jan 2025 19:59:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Wo-0000000Cwsa-0DNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 19:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4201AA42115;
	Wed, 15 Jan 2025 19:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E10C4CED1;
	Wed, 15 Jan 2025 19:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736971093;
	bh=b1zwF1BGXQlXm1R3cl13d2s0ww/jUj2cHk8qqDqXlLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAtY86ilFjTPdTtwFEuuiGc9ORgUMgPSr8wCse3pCwHXuhVH3MEeTFsoAnwm7zwVu
	 hfU79zCuwxK5vB17Ctl9HMlFW9xpqAOdpDbLx3Fr7PmQaNFkfPUfOilXuo1GUi7pi9
	 nhsCf0UyG+vRZ8SroIaVB15FFl1LPD+xxWah6S44d+NIFtub3nK/7ce7ZWeG3aQ4vM
	 wEm9ixrUWBmM5tXrxa5Ng0C6uxiBkus2V4gJ5YKzjcyLz+ShBzq6tOCwCfOtXVrUW0
	 B2ho5pClOVqxZ72z5y2sjJrUXcZyyuwZVIY8G1+jX8Jdw+A39aCuaWwB51QbP/usNd
	 Q4/8Eb8rpBdiw==
Date: Wed, 15 Jan 2025 19:58:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH 3/4] spi: atmel-quadspi: Use `devm_dma_request_chan()`
Message-ID: <c0bf43cf-895c-4a0e-b771-39481b6bc024@sirena.org.uk>
References: <20250115160244.1102881-1-csokas.bence@prolan.hu>
 <20250115160244.1102881-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/C570SxBCbhJhqK"
Content-Disposition: inline
In-Reply-To: <20250115160244.1102881-3-csokas.bence@prolan.hu>
X-Cookie: Phasers locked on target, Captain.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_115814_151458_22EDEA46 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--5/C570SxBCbhJhqK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 05:02:40PM +0100, Bence Cs=F3k=E1s wrote:
> Leave releasing of DMA channels up to the devm
> facilities. This way we can eliminate the rest
> of the "goto ladder".

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--5/C570SxBCbhJhqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeIE1AACgkQJNaLcl1U
h9AnNgf8DMYZf6zzg9U9DWtNPVoUCGrIyhEwHEBrEAdgZyNU40ajjEYnLbiovUF5
XVNT5K838kI/G8zJqNJbJQSbYz5Jf/Q/telyqxtCBFvi1txRaqcIqg2nf5Lixb4n
U5ITEToURnue9vGDlMR5awGYXJHfp3Ys7tA3mdxJJh2Gl3l7LdClTtB4QPp+A2MS
QdwR/YW/uC9ck+sDXecUryZgQCqkzG0U4DnAnjl9TLniqx9F2DeLC+im0/heDRx6
mMXct18YUQQuj96j9FA+OJmywhPMYH5m9EBilJkQHQHy8fPU+ySqq51oqF/92XHx
uz5zl9EdYpFrw9/vQtegyT2doIMQwA==
=VR/j
-----END PGP SIGNATURE-----

--5/C570SxBCbhJhqK--

