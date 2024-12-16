Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE377E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcLGQ7556zNYV0AH4bhLvcU39BmQmcq3mQ/qHBEnQMA=; b=SvKe8UKeIwk6zd7R5e+Jot1i9a
	HWeiscLYOYnKevhyiC2xQrdMiHPfrmcNRp7xXBngzLPum5Oc4q/DqRCdQ3m3BqtQd02YQd6hriQ82
	GhS5GJOcQrR57tV3iG5HShkeCHz/Pe4gCkVrWs9WVOF/s0r+SwPH5AUNyv4G4elRF7f7Rwul0ciPY
	FpPslZXN6b+QUBsWf8YeXEgQ6ucolfI8PZdyyYm7qS65Pgxl+n2oKcit+V3qIZ71+mG5838egklhL
	zknzCiFV/ex57m/HTUYxzZlKooMWVb+WJld70wtq4feImCP7HEJ1By2E3sVhNNUD9Z/Q33DFGpYXN
	2Y6dlKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFlG-0000000AxQu-3fw0;
	Mon, 16 Dec 2024 18:24:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFL6-0000000AqcD-324Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35C1BA41979;
	Mon, 16 Dec 2024 17:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8132BC4CED0;
	Mon, 16 Dec 2024 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734371823;
	bh=Z4tZ8fVofiGwAb7FaAn7u4Dk8NVUizwERM8FmNMH8MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbQb5YtoHWIG2i81bmyykeMAQvNegaoDJWzvE7DlBZex3RyAfwAroe5bQGbRHlJby
	 jjqQVAAkr8hl8Dvjtpke2QQz2r0Ad/7uEi+edK6j2lLcJoyLs70xjia11RD9bTH8Dq
	 E3Jvt/ICN4SJjUxPtoq8GeF2toKeWTLVW2uDsDNfsZvAuGESM82qsyDGNtplv5ieGs
	 s4kcPeGaKiDCeId0agBsQE/PlCv4C1v1aoXNADhWZn8A7+Oc8MBtKJJONGyClzTaba
	 uY4aJE9xAyCgjoz77qfQYB/Cm4kHef8xCurK7C8gXvfvdrpKaWczWGX7XtHfT1xIwg
	 YtZJ4kj/0G/Uw==
Date: Mon, 16 Dec 2024 17:56:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] ASoC: SOF: imx: add driver for imx95
Message-ID: <03b0bcda-c351-4d76-accc-3d3e0ed9c335@sirena.org.uk>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-5-laurentiumihalcea111@gmail.com>
 <Z2BZ+WUY6ecIwhEt@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1dCq6JFN4ecgzC7O"
Content-Disposition: inline
In-Reply-To: <Z2BZ+WUY6ecIwhEt@lizhi-Precision-Tower-5810>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095704_829708_95456C2F 
X-CRM114-Status: GOOD (  13.09  )
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


--1dCq6JFN4ecgzC7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2024 at 11:48:57AM -0500, Frank Li wrote:
> On Mon, Dec 16, 2024 at 09:50:38AM -0500, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Add SOF driver for imx95.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
> >  sound/soc/sof/imx/Kconfig  |   8 +
> >  sound/soc/sof/imx/Makefile |   2 +
> >  sound/soc/sof/imx/imx95.c  | 401 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 411 insertions(+)

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--1dCq6JFN4ecgzC7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgaekACgkQJNaLcl1U
h9Cl4Qf/Wqcio/gpAHtCYuQyA3wXb/0S4M/vlqazIEavGzTlUOYqnxsbU2AaeMEk
zwpZ2+eQ/bxaq1ShK4qLnNmzrurodvT1vfHAZPzfx58S0dtVN5Y37lau53+IRyQA
GIyaTH3CFhR1JJcXKXPfF6cl8VwHgniUTT+hlT40q8I/j7Jp5AJWqOcKfx9Zx8sd
Rnpg5dGVAg8blZMM8ste4YKqkx2DRgtc/yIe19c2V3+hyTjmBnw8+PztkfW3hqKS
g5i6JYX1BwjPexEl9apLPs8lhKaEn7p/sHIVz7uxUBwkKz7McqVAaXTTKGebi/KN
RXz4I6ljBH8xC5MQ9DH0/EEnOkZgcA==
=wqS7
-----END PGP SIGNATURE-----

--1dCq6JFN4ecgzC7O--

