Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA282C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ltj/FmqAZ7QuNyBZnXsvt0qatnm/T9l1m84EX22EFg=; b=qvSqmVdiagVD29e/mMSF+b2SwG
	PMGQXb773vVlOxBKQdwe2qwQX2z9gSP30Be8eVy5h2cTs7Xdr7mrqIhCb8TFTCfwnp8r4jYnCwKEL
	DK3DxQpUYbR8oxGE9h7fLB+gFil4RysWYuNFxMxCFvuzkwwbs+pzty/Q2dEhQyCvhhRuVHbb0tyF7
	mhTHLEmBPa3t8NLPl+ZsYczIbSznMUbZU9yooUdB1RFR/USbmZHpkBd+U9aSWOabIkIVL6857KV8c
	pCS+gVmn2ryrkmdGTD23zBlkz1mzz4YVcVS1T7eI0bcOT24azK7jXQ+XeSATrlRZh0w2pseVZF9A4
	Gpu66yOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW6-0000000B0ky-24qK;
	Wed, 11 Jun 2025 19:53:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMDe-0000000A4JS-2aJ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5250543A60;
	Wed, 11 Jun 2025 14:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16783C4CEE3;
	Wed, 11 Jun 2025 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651262;
	bh=3ltj/FmqAZ7QuNyBZnXsvt0qatnm/T9l1m84EX22EFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BsDUsth10QpiJL7THtTgD+ziLCgb8HxBK1eqLm6Ove4ilnd/7Z27eninlqd/814rv
	 5NHPjyF7+vpMTnHbgI6TMBf4r8nsAig8dlSl/BZRLBua+KUUGjuoVGbil49dpYZZ1r
	 6fSDhype/+BRl0pKAkbaoYCSdOgYmGM7ah439NDO5A62XYQyzodpfr3V7PufY5RGaA
	 bxWATM45OCT1/FfUE4amKvXEKzT6xvmGsCLek+pY7f0a+vfP0DCKaLr3gyxbAV4Zgq
	 Lf1vCXRibWWFeTM9geYd8dOaCY1uOgo4Hp4UeGq6on4WXXbHa5p7/MCuZv2MeeQ8hu
	 Ihni+XdsEhhvQ==
Date: Wed, 11 Jun 2025 15:14:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/7] arm64/cpufeature: add MTE_STORE_ONLY feature
Message-ID: <ea76d2f7-897a-42cf-b327-7391478cc486@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHmyzTM6zYC1FDH5"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-2-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071422_672072_33E7A3E7 
X-CRM114-Status: UNSURE (   9.34  )
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


--hHmyzTM6zYC1FDH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:47:56AM +0100, Yeoreum Yun wrote:
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.
>=20
> add MTE_STORE_ONLY feature.

Reviewed-by: Mark Brown <broonie@kernel.org>

--hHmyzTM6zYC1FDH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJjzYACgkQJNaLcl1U
h9DLewf7Br2u+NGtNFaA7jt2w7hoA9uhEO1bpq25k9ho86z7V7zRqjFHJQ+dDyHL
V7VIXqnh92lmnJRWh8ZvGDKM25FxUBAQzql+DCeHdi3xC3RX9Vu37WXMJr5b0LZz
oDCUHpszIOsmX/DMYlhQ9Af4ioEYoi+xdCn2jUb6JdO1jAbPcTKRPIZVqv64JVQ7
jaEhM+49KtZ+KXoDxKe/bJoiV9YD4SP6/wVNLM/xY3ZBf/8zwcfUgFNOwXdED96b
KOhHvX6NVj+MOR0Sa39p8PF8kRVccDqux7eouE77egS1r+IDlOdrDgBnI6KelVeM
ilLlU8bkZfN6pWCNlIRsO0cWwDCeSA==
=zCgO
-----END PGP SIGNATURE-----

--hHmyzTM6zYC1FDH5--

