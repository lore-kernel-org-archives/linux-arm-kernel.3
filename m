Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFE4C71143
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c96O//SDqamm/fQkqIHjSpr4fJPGGhqavYmjSXabBNY=; b=r4iVEygpWJZJAnjpwxJY6JncaF
	r6myhaBuDDXORWmGmov3EKcmxohij3g5+1GVpZ5UcOBARpizRDwkvkKf3YXe94DO9K2JjJSa6tY6o
	Z61fFSJGeLp5p5eTHefBDurWsJiQFYlUlUdtXEza1SHTZDOyYlmfZVgs6URcT6xCwqiLvPmREsbrj
	Ah8I0iP/blqEHpXks1Z49cSbv9nVB2EIByBFtAsAHQC0NWwXmujUve2TUjymJ67pUMqs3YGy0L4lM
	8XpT2363NfTn0I/Pzs4qEdF+QRjy9Fb3BoMXpw/iDwE51OSAvkj4wcuAurvt3rxoOn6k4WK6Y+tWU
	A2UwwRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjZ-0000000AlgI-1686;
	Wed, 11 Jun 2025 17:59:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJrY-00000009lqK-3VFZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A46F944B84;
	Wed, 11 Jun 2025 11:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3479C4CEEE;
	Wed, 11 Jun 2025 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749642203;
	bh=VtORa9gULIIxSrmzYE2nKZ6lSqCXmbEADc6P99tw9QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBlo25BvgjCTtX2YzIkubtVomP3UFvIlPOni6KAT2iaqyw0+rNOOgM/ZPl/fuHBvJ
	 6RUhLoAuNInQr/FBMX+RWik7oyFJ4KwkDbIMdqFWDfaPGcfFNs6vqlMdc5geOp1Ujl
	 FCrHNQtUTTvUg8occ3jpxoAIVnGwsjmbIPHHEIjSsMh6tsNYLL33XyJWgH9mPukgYK
	 hCYm0bezRR5bM1XDKENk3gDVdcM6xmivdsOEg/XJ+wiMB/PkzCPytMmHvseo0dSsne
	 uuGrlx1zIJ69ZAdr98knudftyVAnbpHr+F3oPh7UTtxBz4kbE8usaFABwhqFj1mliq
	 fumB5us0LDq2g==
Date: Wed, 11 Jun 2025 12:43:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <c0b4dc8a-b37c-4e8e-be2e-bc8906615702@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gb6T1JetxHXIds4r"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_044324_892279_5A0AC823 
X-CRM114-Status: GOOD (  14.78  )
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


--Gb6T1JetxHXIds4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:41:00AM +0100, Yeoreum Yun wrote:

> +HWCAP3_MTE_FAR
> +    Functionality implied by ID_AA64PFR2_EL1.MTEFAR == 0b0001.

> +Applications should interpret the values of these bits based on
> +the support for the 'mte_far' hwcap. If the support is not present,
> +the values of these bits should be considered as undefined otherwise valid.

The constant is HWCAP3_MTE_FAR and the cpuinfo is mtefar:

> +	[KERNEL_HWCAP_MTE_FAR]		= "mtefar",

The reference to the hwcap should probably be one of these, I'd go for
HWCAP3_MTE_FAR since it says hwcap.

>  	/*
>  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
>  	 * for tag check faults. Set them to corresponding bits in the untagged
> -	 * address.
> +	 * address if ARM64_MTE_FAR isn't supported.
> +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.

Should this say UNKNOWN?

--Gb6T1JetxHXIds4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJa9UACgkQJNaLcl1U
h9CZqQf8C9c9a1CQGL/nyb8MDCIEwm3jBTstFRtDJlSPcoMRL/KcLTbk01sP2PWr
A/qdmt5qMlQKPwtnIUrzSIqmn96TTzCbJZWsn4C7fzrLh7jT+eD8GjXKCjF/Mkq0
uXfzVKY5Mcyn0H73gtKrRdOC9ng/Xn0xFolNvXYDZplN0VUHBn+Fj51XYzR1lMKL
9zNZry8Dc9mpHUgORCFt5gxud4Wph4lPnWPsCDI9zyXHw91xzzZAxqByLZ8d8vsH
Z5Rpe5jD6kMkoS2umJr5ZyENjqaPagxWY1IZa+C5/7xx7l8czKLWXy+jj7OG9lAr
G+4u3UauAv/tfBdOWi2iq6ptu58suQ==
=dyyt
-----END PGP SIGNATURE-----

--Gb6T1JetxHXIds4r--

