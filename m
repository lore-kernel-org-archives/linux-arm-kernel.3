Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C0DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BcoHlr5mqONKZTSzBUb5jY6jJZN9tS++KsS1iH+yJY=; b=vODSVc401zuAxpWaXR2NdVX8Ko
	hdpziDlwuPyTHftweLvs0oBbUw+8Yy/6eyFzbkJslbziugSMlqtL2aVGqcgmaKarrTYN5PblhI3dy
	7Z6p+b7rAjA1jWiyH5m0PGVXCdnWc7J2iw35yuAguzUG47NGIhUcxjRza61F//jnRXGGA91mFP+xC
	p6pBQsJR9moRCo2aC6SzcHu5ggFWynYElR0Wje1I55gFCPF3XZyIfvrQpMIs4dbTbVnDBRKcO9ik2
	sdWGhr8AMS81WEC5f9Lbn5Zh4uA+AICrB28Ue9XFX04RLIe3/L+ueN5RsxJzw04DKoZO3xdlrfffU
	heGNaUhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsgU-00000002Qv9-1GyB;
	Mon, 06 Jan 2025 19:22:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsb8-00000002Pi1-1RGB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 19:17:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC586A41CE2;
	Mon,  6 Jan 2025 19:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0335FC4CED2;
	Mon,  6 Jan 2025 19:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191029;
	bh=6qqkycaChU04ByYjXtkPjgTjS4Ua9uw484eT8onPDKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzqfclh7A68HZXspO39YAG3pSFL2wOfsLq8oX0mIJ7rrwOgqEpyKqeTtB4QcQnkNI
	 YVs2MzkIM1TipZLgcUlWucIA7yAf/+Zdiw3wpFS0S4ZW+y56XXb64MtAxRzvawO7Ko
	 FruGwNDAnfSRFl5qbupeBDpBk81ijRm/1B22JAo5cdaBkCJtGFoYIFdGRiZelzePmB
	 OMv+lYcR7QhaQlhy3i5iZcK/xheJEh75hrU829nvAYA6jwbe7rL6btFFpft6K80GfA
	 P1c+JQi71nPm6DyOdwz4kn0Np/xLX7eAJg82yvGXEUHLWGVJeRv6LUKr3AXuIS5K19
	 iGiRQxkyFvL4A==
Date: Mon, 6 Jan 2025 19:17:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Filter out SVE hwcaps when FEAT_SVE isn't
 implemented
Message-ID: <f36c5201-940e-43c2-acf3-b117d5cc3573@sirena.org.uk>
References: <20250106174020.1793678-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vZFIhnK71t2UBznl"
Content-Disposition: inline
In-Reply-To: <20250106174020.1793678-1-maz@kernel.org>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_111710_448204_A78DF4D8 
X-CRM114-Status: GOOD (  16.40  )
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


--vZFIhnK71t2UBznl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2025 at 05:40:20PM +0000, Marc Zyngier wrote:

> Things become a bit more interesting if the HW implements SME.
> In this case, a few ID_AA64ZFR0_EL1 fields indicate *SME*
> features. And these fields overlap with their SVE interpretations.
> But the architecture says that the SME and SVE feature sets must
> match, so we're still hunky-dory.

> This goes wrong if the HW implements SME, but not SVE. In this
> case, we end-up advertising some SVE features to userspace, even
> if the HW has none. That's because we never consider whether SVE
> is actually implemented. Oh well.

> Fix it by restricting all SVE capabilities to ID_AA64PFR0_EL1.SVE
> being non-zero. The HWCAPS documentation is amended to reflect the
> actually checks performed by the kernel.

Reviewed-by: Mark Brown <broonie@kernel.org>

This is probably our best option here, it's what we really meant anyway
- SME did retroactively complicate the meaning of the fields so it's not
unreasaonable for userspace to get confused.  For SME specific usage we
should implement separate SME capabilities that have a similar has_sme()
check, I'll look into that.

I agree with the discussion on v2 that anything reading the ID registers
=66rom userspace needs to have a similar understanding that SME only
systems exist so we shouldn't do anything there.

--vZFIhnK71t2UBznl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd8LDAACgkQJNaLcl1U
h9AjWQf7B82mmLxvEvpghzPsMNERTf/lPPS7nYAi8h/sDfAuP4OfpP7GsSbQGmJ1
QAk0U60pmoOKIKqSeBA5DOYXE1Nf6iJDPraJDgtOSY8iVulXlKbT0mE4WYbtcLXH
LRwwfwrnb9PXONqmKQD/nD6qNElAs+yet7BhE9ROxvrto1Ndht1viZRQgt9y/gM7
fi7Eyzr/iNP7RZqc4BmOAwi8YkLrsKt/y8hV2LI8tbxfATUCizl1K+oh4pNSwxg3
sNnRwqYR7N8Cm3YqhSQEKMw4JAUGnCp0J5iB+0unmvOQjp8XD8O83qs9HhWARyXw
798pCr5lCZJb7/ZmisMMbEKim5YSyg==
=SojD
-----END PGP SIGNATURE-----

--vZFIhnK71t2UBznl--

