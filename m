Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE84E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbXWaV9B/wZwixbCzDy8Tr2NlxyDefP9tYG/0CIrKt8=; b=GMCGFJIgoqvKTFgV9ltHRrIelS
	SZ/k+Bu2hMcnL2WeJVsYP5UKtBWM/p65Ul/rvUaYpD/qN0z6llmMNk6i804DKY61KI+egMptoT75d
	DneV2/uL75FG1f31P9y/RJH2pi5wIdz+GSOjoSyBZzy6pjjQVWOzmegzsA7LFNQxQdIwcrmR1Xgts
	tex5LuzstTUrAMFZtwBe8Y36K0zP3kug1szaLqKbc9sRNJ6bzHBVil09vhHv/uD9pbjJYBxbjOmth
	2IPXmTZzQ4iMtuhbj8S6a7wNYgwHxJlH/DSHz2aGQ7OhFtaGkZKsidw/JiIWpFDyBbqjB66hQo9J2
	kDazCw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYQN-0000000Diss-2MUo;
	Tue, 17 Dec 2024 14:19:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYNk-0000000DiTV-1LAa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B617DA40FDD;
	Tue, 17 Dec 2024 14:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB08C4CED4;
	Tue, 17 Dec 2024 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445023;
	bh=7EaWDQiz3ku1864YMwkASvsrUlcSGQ3K/iV69ef1jLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nh0EmHxWnox1JJH8zFpSsJJNRKHE/nB45aTVMkteifPzmTqIaPTVIlIcbQSX/oTHc
	 scuBBRx45bg/Ieugb8hSHrpUKeRAWphROtCMz9/Tz+z3Jv1fLV7NPTptlpLbWqToEr
	 qdJKnL9lASYjAOLqvM+n7Ho/5HRokjuhYsteglNYLoMBsCoCTeqqBUgKN+tuJLC1E9
	 zuhH2163YUO2tIJiZnMzxM23FTxxpyztVuTOZvxpo+aywzANYnYaFlQHUQhSa6Kp6h
	 gDN7m4C9RhWT0PQ2X8M+Zgy8Ji8qtM5TmJ93VMFprDfSBRPu3EjoInfSr7i+oNP3MU
	 icjUP72IXmK4Q==
Date: Tue, 17 Dec 2024 14:16:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Peter Collingbourne <pcc@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/sme: Move storage of reg_smidr to
 __cpuinfo_store_cpu()
Message-ID: <7bd307fb-9add-41a8-975a-a0ecfec1a933@sirena.org.uk>
References: <20241216-arm64-fix-boot-cpu-smidr-v2-1-a99ffba2c37f@kernel.org>
 <877c7ysois.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d2cJnMtFpxG7edgI"
Content-Disposition: inline
In-Reply-To: <877c7ysois.wl-maz@kernel.org>
X-Cookie: The sum of the Universe is zero.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_061704_426188_7ED06094 
X-CRM114-Status: GOOD (  13.36  )
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


--d2cJnMtFpxG7edgI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2024 at 08:27:07AM +0000, Marc Zyngier wrote:

> My reading of the thread was that we don't need to kill the
> arm64.nosme option as SMIDR_EL1 wouldn't UNDEF, which is guaranteed if
> SME is implemented at all.

My read had been the other way around, I'll drop the change to the
override.

> What was needed in 6.0 is not there anymore, for all the reasons that
> Mark outlined and that you have pasted in the above commit message.

That's a rewrite of roughly the same stuff!  I pasted the commit IDs but
the rest was a rewrite.

--d2cJnMtFpxG7edgI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdhh9kACgkQJNaLcl1U
h9CYyQf/Wvw3RKu1eUbog9QV/00EOo70CEQSxMcNrdCNvvJqVzAzzIFapUar8CR2
GQqcyJ1YyUWAS45ktwGfH0rNS6+ukfAx9t3muRFjtO+JjLoY0WUU0WrZHqGK2MX4
iYULrzXLqR/FpbWNgeDf85aRXURG+pyxNM6wbna+wl3C/DXLENZB/HQn+0IRWsfc
F7AJvXLnkSJnCoZXb0KgJGNq8vJBfIIv6/pTmdaHjfF89xVqgbdROhIWqnAQFN9v
0GRsBI2CYs132fhseGAK7kOff+b/uhhc816mWHS01pFQ+F231vsP81CoIbzlurmX
XeGMjA0u5HyGXJE/uW2a0eutjHKz/g==
=Fvq5
-----END PGP SIGNATURE-----

--d2cJnMtFpxG7edgI--

