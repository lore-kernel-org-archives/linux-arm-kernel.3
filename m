Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A357E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUCxJPlmCw0HzJw1QZxkFgQihWHbkb85x5mZbr7b64c=; b=es1cguv/YNOv3X2g9pYfjTfjFn
	0KHRgIWiFYtlk5dYoaMGWlWrS7/NNVnhicWjy3NOdWdpZ0ehDGX/oYbI3jTgaEtM1pTG9KHnFTILR
	NVsDWC+SDGLo3AcpR3n5zWDNimKWh3a/3nHpmMsKzDEWFuE5OqYdZWukP0AU+4JivO+Gtk6zp9jFN
	nCOFVgsc+1A8dKdKHDEWr/gmtCkM4SbpVImT5C5UucquX+57hL4p54hoq7WpTHtV6bg3AmsVWI76T
	pGPAlKXQxSOoQAsQ6zSurx3v/BYpAA+TX+hChWmpzOXPyRRxUvR2YGJmOOjDE4l+WabB/tnoVaFw1
	NkQ8J/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNA45-00000009wqq-0nEh;
	Mon, 16 Dec 2024 12:19:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNA30-00000009wlb-25zL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 12:18:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 094CF5C6234;
	Mon, 16 Dec 2024 12:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4C2C4CED0;
	Mon, 16 Dec 2024 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734351478;
	bh=9wUkqB8f8eK0RMLaMON1J/gQnYa58rUUdB2ULEUHmzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMnXtfZQp5EbWP1vD5F4aLPSj+F44yU5bQfri0VF6ER9/1j1y1ZVNbZn1oBo2rcQT
	 CmskZUR2XVc5kajkituXx4xSvlLgz2QE7XdhheQfioWU488mqgvrCKhzAeDKzYgITC
	 OtyJimBKhvXRGQf9O47IOIPgurSt0vttH5atAgMmEXWEyxBCoVae7DMe8w+PAVAwRk
	 mzU616Q22h3xl8eGwYfxsLeImgBJeKKc0rUIeuU7dEUi7jQCDQuhR8oCj8eLkKIIe/
	 dQ++IKBJJsKi1z8kp2q8DU9QlfFd3amokbHgc++IbTguzxUyuq8JIqqMShpJYc5IDJ
	 ca/EZ76UnrrcQ==
Date: Mon, 16 Dec 2024 12:17:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <709a0e75-0d0c-4bff-b9fd-3bbb55c97bd5@sirena.org.uk>
References: <20241214-arm64-fix-boot-cpu-smidr-v1-1-0745c40772dd@kernel.org>
 <87a5cysfci.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E9e43Uydk5bsqLo+"
Content-Disposition: inline
In-Reply-To: <87a5cysfci.wl-maz@kernel.org>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_041802_579905_EE71757F 
X-CRM114-Status: GOOD (  14.38  )
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


--E9e43Uydk5bsqLo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 14, 2024 at 10:56:13AM +0000, Marc Zyngier wrote:

> I don't understand the need to single out SMIDR_EL1. It seems to only
> make things even more fragile than they already are by adding more
> synchronisation phases.

> Why isn't the following a good enough fix? It makes it plain that
> boot_cpu_data is only a copy of CPU0's initial boot state.

That would work but it's not clear to me that that is what the intent is
here.  The current ordering seemed like a strange enough decision to be
deliberate, though I couldn't identify the reasoning.

--E9e43Uydk5bsqLo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgGnEACgkQJNaLcl1U
h9AYKAf+MF8iAaNQZfOzVcq7lqkYOmJEIvxdmbZaGy4HG4Qyq6EiHhR9proanw9r
zFm1HwS/071AORKmuW4ou3GTTKLbJmbFwX/y4JLpunQxncc0IEUqqPRN5d3ilWgV
avtBILCtQ4ioBR/4BfHUdR3l+pLei3Mm3HiZwzAGt0fcabqieAFGQlrkuu18uum8
7JMff+9Ki1Ndupfh4W8iVVhsf1cAl4DUw3SA3675SmAgjQdNIltbL1CPTiHpELn9
ycs9q/OOYvHexiTmEbud95/2d6tfau1vF1NZxP1lxBshdMf4fTx1KfGhSm/TVv1U
r9VtFi7sySnj59Bjl/JZNJM1Gb22RQ==
=32wj
-----END PGP SIGNATURE-----

--E9e43Uydk5bsqLo+--

