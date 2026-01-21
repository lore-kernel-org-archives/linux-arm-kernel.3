Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE24C4451A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOm30u6gK/r66A1Wr0DpF3h2DA1WKQoKv9vRSkX6H68=; b=1gxTiulh3MzgyV1sXpSFntJWrx
	tdVrGEqbh+jpIagc1f+Hx3lv3e6vl6ZooutU6TBibK8FAvI6SyBfdUz//x4+1ND0BNwa7FVkO1tU2
	gn2EANeU9motgdgBiKXPNHnY3kyCe1qukleyU/MwROJhus0bgSwbhKSm/L4eLDn3nTuKcj3obaVcP
	3/HbR6jVFpih3EUfYWeNLln/ZGifCksPYvmWF5GOAE/fgh+SU2WmZsQT2EmTiAqUSFEs3fwShPTz8
	pGYj1u9zJZ44Qr4KE41n3OjIhhiyAZIJ6N5wUek+S0SpG4vDYUGrbG1FLen5kXsx5zzgCRdgEOb29
	juuW5a+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWYi-00000005Mg9-1wMR;
	Wed, 21 Jan 2026 11:39:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWYf-00000005Mfo-1wCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 11:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B75B9418FD;
	Wed, 21 Jan 2026 11:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7B8C116D0;
	Wed, 21 Jan 2026 11:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768995571;
	bh=OZXYeC+9a+kafCG1p94BKTtO3DuMta1qT3VMpvj+N7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtevf5tC7W2AYC2sCJEIUgUmDW2cMb/DMQtYixYR5BL3bQN3CpYpm7lmnmYlaY8JG
	 BSY3FvBAT6IBBrk1D3qLSu4jf9zd29KCIu3R7Qt5w2P/e+QXZyjSvns0lLBu2OHy+x
	 jn4jYTQitVAUwSnagvCsU1tOM6zYVQYFgyufo1n9YGi1FQJZUlQIjuiS36SoxS9HpE
	 ugvZOuAEB2ZLFByCwCas++FjNOEMQbHr7ueO/TYW65mEI/Qa/II0i+Sq6uwXfIXLr4
	 N5+JBi9BC1NaWri91qbsTAcWK15L/WIfGBk2awyAyoVISQQNJdzKBdEI0q8RLSYpl4
	 XgS+aO9v3u5DQ==
Date: Wed, 21 Jan 2026 11:39:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] spi: xilinx: switch to device properties
 and make IRQs optional
Message-ID: <83b93899-8f48-47cb-a74a-b4e838cc463b@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <176893698361.778248.6867023245726406177.b4-ty@kernel.org>
 <c0288962-6a11-4274-9e93-91bd5a6997c5@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6oTNzElpk8SzuhnU"
Content-Disposition: inline
In-Reply-To: <c0288962-6a11-4274-9e93-91bd5a6997c5@amd.com>
X-Cookie: Eschew obfuscation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_033933_542685_AC5BFC11 
X-CRM114-Status: GOOD (  14.46  )
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


--6oTNzElpk8SzuhnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 09:15:02AM +0100, Michal Simek wrote:
> On 1/20/26 20:23, Mark Brown wrote:

> > [1/3] spi: dt-bindings: xilinx: make interrupts optional
> >        commit: b603500de20fbe15ee54580481c1df4212a4ec44

> Are you sure about this one based on my discussion with Rob in past?
> https://lore.kernel.org/all/20250605130331.GA2370690-robh@kernel.org/

> I don't really mind but would be good to do it in a consistent way.

My understanding was that the hardware doesn't require physically wiring
up the interrupt signal and can work in a polling only mode.  That's not
unknown for SPI controllers.  If the interrupt is actually a strong
requirement for the hardware (and especially if it is actually wired up
on this system) then we should drop these patches.

--6oTNzElpk8SzuhnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlwuu4ACgkQJNaLcl1U
h9DM0wf9Ef7sqmY9FVcVZkrTC4gEsAf/UWIpQT7xuqTVm6rMyNBxcr7hgG1I2jpp
civnH47B1gKiGjfVFVdSKaP9r7dh0XsyiuHVCECK/zaB1og4XDvIJd4v2louzCQ8
+xeqWZf6vuTu4LFjbhdMetTqWgBFBKu/dEm/oKrpTN8wBHbRGsCE+kd5W5hHATF9
h0eivfXgVIDIS7ktrVvgirKQ+6AkY/qBsvn0NAqEdMrPkGPsud8znU3eLkNrQmC3
hgEOqBqKI1/gw22IrJM++MPADnzYbUVJmZlwSd+LQdDlOjmSSgTJjRRKxZaIhBpl
qEgDqXc0EVQhN7JUODVuBlxWmepKiQ==
=jyYD
-----END PGP SIGNATURE-----

--6oTNzElpk8SzuhnU--

