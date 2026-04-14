Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686CAF9D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyaAgcXilztMiuVpBoeFRBdFxH2s83KO9193bsYP6Vo=; b=jbVg7jAk4jA//NOw7z14TsRvzM
	hWN9Ax2r0Wu8/BxS7k/7gMg7mtB0BkPqvR7UikYv/CGJ9xbUe4WLElng3O9z4zPm+gCEKHoCrN1IY
	wbAv8WXwZdSKWmRiY00cvhhijTyWo86gyRe+ojTp/PADrcrFApm0uAD0hk3ok6gRhzMOPPEnpwUBC
	9XmPHLkweyJj5M4CrlIbU3bc0BxoAeBoT10wlgvQfxf+9zWRPAh4qeHsnnvQuJovEmjHFuTKt+/Q3
	Oq2UH2xDCFp+Ga3KArBhdeG21Ikavl0jcCtaO7Fa3jJjztL0jcZ3LXPb8LOiKcJJ75+AsdxH4BvHw
	YsAfctfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgW1-000000000N8-3t8j;
	Tue, 14 Apr 2026 16:21:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCgVy-000000000Mf-1WxM;
	Tue, 14 Apr 2026 16:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA0A5443E5;
	Tue, 14 Apr 2026 16:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E69C19425;
	Tue, 14 Apr 2026 16:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776183685;
	bh=L+p7vVyi0ZuGNy1NR2PmnEYPIp03GJxMFlPl1DRyxPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOIjKyZaZ/IfJvIgjdqfDbtHAYwbCjaflZ/Os1aiwlhfe89Ej4+7Tu6eWhM1wI43l
	 0TQ7OGUaCZr95ce5+6GTl81meF4dLxTNbtHq4YEhCBRkQERKmXPff3To2k+POh4ibH
	 FNdifqmgWlCzvvUn7ZOTS2bbkt1VBltVvyYj2PFuKFF68y3lNn6/4vNgdm/e+oN4NS
	 QYMakyesCHdx63hfc7VnzONb7hYGWr6QD3n61h+L/udWivNP7dUtCxxOVh5+Zqou3B
	 nWCp8AjTiAJbgcF2waATiJzrf9KIrR/3cAp+QsvRZ2+ApXgjTfY3PpISg5tvEH6zAG
	 oLJujwe8BX08g==
Date: Tue, 14 Apr 2026 17:21:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 01/11] ASoC: meson: gx: add gx-formatter and
 gx-interface
Message-ID: <34a800e1-2ea1-449b-913d-f14f994a46b8@sirena.org.uk>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-1-4c8a6ec5fcab@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ThtFczj72toqES9e"
Content-Disposition: inline
In-Reply-To: <20260411-audin-rfc-v2-1-4c8a6ec5fcab@baylibre.com>
X-Cookie: Academicians care, that's who.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_092126_446056_20C9B334 
X-CRM114-Status: GOOD (  12.30  )
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


--ThtFczj72toqES9e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 11, 2026 at 04:57:26PM +0200, Valerio Setti wrote:
> These files are the basic block which allow to shape I2S in GX devices
> the same as the AXG ones: the DAI backend only controls the interface
> (i.e. clocks and pins) whereas a formatter takes care of properly
> formatting the data.

> +int gx_formatter_probe(struct platform_device *pdev)
> +{
> +
> +	return snd_soc_register_component(dev, drv->component_drv, NULL, 0);
> +}
> +EXPORT_SYMBOL_GPL(gx_formatter_probe);

The other allocations in this are devm_ but the component is registered
without using devm.  Not using devm also means that all the users need
remove() functions to unregister the component, there isn't one for
AUDIN.

--ThtFczj72toqES9e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneaX8ACgkQJNaLcl1U
h9B6uAf6A2m0yG3Y4j/XfhUBnzGIW4nBPB3PnZi5+Te4FO26/IniwmRzcM3z++SE
c323dI1EWkZFAa67hiWafnMH3mKcbDCQPqyWwmtif1y/FODAaeoYfZUiqZgkVkDR
v6oaX1uBg9ATaRQPQFPmJHL1fcQLtqbzWZg1kRpE5QXlboubISOT3IbByULGHFqZ
JVw5IZDGvrGCzKS039L9ozPMVFABUwYsqhX5DN7ElRBA8AX2gojlo9tuEf1vJGXZ
SThkCgS+i9NElRJq8M1bb0AXC5q7by6rdRDB1s8BQWkyp9DCZ5982teNFKt8PBd3
csX6oiRRn5VViHxk+hdzeXtTD8zTEg==
=ixQ9
-----END PGP SIGNATURE-----

--ThtFczj72toqES9e--

