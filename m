Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563B0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFIZAVuxn5LNa4zpyntsKVLMFZa8gU8T5EHqVMiE4xw=; b=o+XnFy2UvC26FMGnHbUCXFiD0B
	rm/bg5tA6G75HkWyoe8j1ieZd1zrEJZ04Lv8YXO5vTxvcMVewLPTGLrWJSPFlbLBDWexG1SNZOZro
	+jpDC/bwhIwh8vLAmB+R9qpbNl5OLbk0DO/0ReCzo/tqO70rn4Yb7g+KSJoUHN1YDoR822j/aOpGB
	jdl10vzHNPjZ2Ze+IfpA77sVxMj9Ga3Ve7a6jg7JBAM5tjxOwsMawAfHlmETHaF16YDzQbv/k/tdq
	RLbZM1+cHpZBF72FU/g5gDMuoGMkkQraHmtYseR0Ag0mXLyS6AjEPmUI6hBLnBrXpO4VJ9M5uQjAb
	1yRWyr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOHj-00000009dBD-3D9J;
	Fri, 07 Feb 2025 13:20:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOFt-00000009cx5-3xTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5BAE5C0460;
	Fri,  7 Feb 2025 13:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D19C4CED1;
	Fri,  7 Feb 2025 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934329;
	bh=eFIZAVuxn5LNa4zpyntsKVLMFZa8gU8T5EHqVMiE4xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekP5Lsbih4Qrni6R8KYuVNRJ8WRlBAeWg+Hu0ONFhF6aBh51clA7BNtyaooC8i1e0
	 IAmVPKamC8BBigHoQMzjldd/m/rlgckmQaV/RVU6z+QVnnJzcGmj7vjTX65HuDyNfJ
	 YgAfkv1OvdxhFW7kqg/U5JTZ8gUSB2NCVKdKdqcVQSH2AKxOYDSrp1M54LwJiAskUn
	 9kCEd6/QBw5cHMhu6/8FfvO+11p74OOWW5bdWQbT2bi88J5mbBg2JDNDtJr+CL0GVy
	 aA0e2KK0z8LJurpjLJQ8FTZ9WOH6efVoCPlAYlX5B4E2Ih/aQxD8jQao5S8TpcFIOH
	 ptCuv/sgMmehg==
Date: Fri, 7 Feb 2025 13:18:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Subject: Re: [PATCH for-6.14 v3 3/4] spi: atmel-quadspi: Use
 `devm_dma_request_chan()`
Message-ID: <175b903c-59c9-40d6-baff-d5b8dc996318@sirena.org.uk>
References: <20250207124802.165408-1-csokas.bence@prolan.hu>
 <20250207124802.165408-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yBiLvRP78GmtPzGu"
Content-Disposition: inline
In-Reply-To: <20250207124802.165408-4-csokas.bence@prolan.hu>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_051850_024817_CF702794 
X-CRM114-Status: GOOD (  10.51  )
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


--yBiLvRP78GmtPzGu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 01:47:58PM +0100, Bence Cs=F3k=E1s wrote:
> Leave releasing of DMA channels up to the devm
> facilities. This way we can eliminate the rest
> of the "goto ladder".

This is just a code cleanup, it's not suitable for a bug fix.

--yBiLvRP78GmtPzGu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemCDQACgkQJNaLcl1U
h9BPmgf+PzP0hQysLpvxFfaX3oeQdksaEVIPruNAjK9B1f8EI048STKEjrQuZdrA
bvp2WDGRMPu20hr9XeavQTfF0nfNt6fmjdD6ZOolH+pGJg6roepiZfRl9ALIdjQp
3Wve+bFF3/nYUJqj0jlG/H+Pyx//sJTaBFKTHGe+dTkCGw6sJ/Nd7poI5DE9dMbX
zPyuUVFqLEXAueYDdDb1pzaAwcNip3eAfcAtj+EtO42lWRIPL03cr5Ap+i/f0DX2
X0+OUpNFy77gmoMauGmQAZ0HuFOwKizFq+mTkbSRUQBtSF/z6RqKZ9W3bwlUAYqS
aG9u9rdrdC3/wcxaJNW+c1A0suIVUw==
=82/r
-----END PGP SIGNATURE-----

--yBiLvRP78GmtPzGu--

