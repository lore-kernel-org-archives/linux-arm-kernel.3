Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F04CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 22:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsoSuIhXeCFtpii2sOPCdKeocOyhPAH8/h4Y7CKNez4=; b=qushW7aCIg5SPgbNpSqjJSlpcr
	eRyqqMHtiYIUG0JSlBvS2DNj7Xn3szgCZKralLEz9agK2TarpRXsazXUKN9HDzZGeHlzUxKlyvuvR
	HVxVafa1sVwhJAMTsQKCTMrrUQfolPhM0CUovXvc/F/4ZSxHL/cYPZ2ZYYAByqRGHZkBlVPf0MC3c
	ukjNoyww67w0zenNe86TILsGMN5Kx3tjY9KC3ANI7vqt25m2pBFdGPlwGhgMN0kQpvSNCAdZGEvmm
	vvpRbSJy5aadf7NkeX+hebeHejZ8Jyta7HZt+es5+K9ow6pdZ/qwJJzKtAAmNJ8EZbA5qgz1IVMpV
	vOm3XyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgAf-00000000ezh-2VCd;
	Thu, 14 Aug 2025 22:11:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umg88-00000000epc-0Enq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:09:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB87D60208;
	Thu, 14 Aug 2025 22:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37FEC4CEF1;
	Thu, 14 Aug 2025 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755209342;
	bh=jsoSuIhXeCFtpii2sOPCdKeocOyhPAH8/h4Y7CKNez4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpNbrbiCeF2fpdDqz161W+bfJNH3zCKX9S7gPf7EB9xikNdnGXRl/CUw/B6Ac+Cv+
	 Kse/F+WumyjJWysvC4ORlsOpKf2DiJUufXGoviPMS5gtZmEAV370Mxqg4iaoAPTdRc
	 INBavLz+97xKcw54XUePJhBkmkTGIMq3xPIyJr52mKlR5svF1q3DgY2KW6QvB6fw22
	 XN3FSIwXyBq7jeSKX9E66APOLSxsA4/bUT0pj3Qt8sKaAcYqvI0PlhLpPufXRk73Zl
	 Gf87K8i1KwRAyNZv1fcog/xtsJZkAjwTa9bKaUt1SNKvJQ2kt0bep83v5Td0qlKNne
	 y95XCRMcXVJnw==
Date: Thu, 14 Aug 2025 23:08:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: David Lechner <dlechner@baylibre.com>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
Message-ID: <abe73ebd-56ff-49bc-9442-b7a1f75159ff@sirena.org.uk>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
 <1a87f436-317b-40e0-a655-cd82f969f22e@baylibre.com>
 <5b02293b-9c86-441b-9344-2d0263eb1659@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a/cfWV91tOSeYEDb"
Content-Disposition: inline
In-Reply-To: <5b02293b-9c86-441b-9344-2d0263eb1659@linux.dev>
X-Cookie: This sentence no verb.
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


--a/cfWV91tOSeYEDb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 14, 2025 at 05:15:14PM -0400, Sean Anderson wrote:
> On 8/14/25 16:55, David Lechner wrote:

> > FYI, Mark's filters won't pick up `dt-bindings: spi:`, we need to change
> > the subject line to `spi: dt-bindings:` on the next revision.

> Sounds like he should fix his filter then.

This is me triaging my inbox by eye, given the amount of irrelevant junk
people send to me.

--a/cfWV91tOSeYEDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmieXngACgkQJNaLcl1U
h9Ce6wf/Qu2YathFr1tHReSCROT8x/3eQhjB1wlLlAwnwTTnitm79RarH1yJFVEc
O/Kzlp3QLG6Vtga9heYyMZVZh1UUdXiumEJjSyl7d/fr84lsZ0rJRkpMvcg0v1Ox
giMjHXX2UHGgji5lRfE76zFJIXkeRClunHmIwDFE6tAEV//8fFIDIgTnvUqLvO+2
fn1+lCmyekl0sTT76u0JGPWWc4uFAR3xwMJElb17aeidPOJ36AhuWSr2IEYpsZZ+
9iQS2iQIvpiyyftEqoQdgZTTXtUWbeO4VNDnt2KbRxHu9wcjoQzFAPTPLISUdCZZ
Cz2IUzzHBGyPPFk7zTwN6NG2E3tbng==
=+AkR
-----END PGP SIGNATURE-----

--a/cfWV91tOSeYEDb--

