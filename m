Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8294DCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRmvbMFwYGvqxVKcL37EQYDRgsceGbCJn0Lg0mc4++M=; b=CQkM5PPIrVA9n/qz4Sqt9vOeuq
	JcZ9nkPNhNn2XxMXJonOy4h9syrDNuV259j8yxnAzao/B1Qsa4lvMY0d9EmuQ9/JKsJOp330bvotF
	3CfQXQ8l1S88QMFp+neA3fUQKI3ZxdVn2bKZwg9Pafwbq0pDzwos6HuBH9MxjRfWIFjOhOPhXj8PX
	CT9XfmRa7WotMPlx9LJJ/VpUcS7BbrdkxWW+KJm3CiRu3pHFsaAO5RW2t+L9DTQwUeQoPQc65kKFv
	hnonD2emjXmEIGsNpHbvcfDvSDV1Qf0GZBj7ITDiobkNgLYyxuHK33OyVe7q2HsILFqNQe8aUdpyZ
	4hnblMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jNv-0000000CoSl-1hqI;
	Fri, 03 Oct 2025 17:15:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jNs-0000000CoRg-3RDV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1102048C6D;
	Fri,  3 Oct 2025 17:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D561C4CEF5;
	Fri,  3 Oct 2025 17:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759511755;
	bh=ZZv8CPqkYLJ1eai5r0tTlcZnMnRuW9lxPjZKqNh9Fgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9olP3+RA/xgi4InNmjFOCdomNzym7DG+KpJu3Kucl4AGJHeT4dsCv/wAA3l/TCB1
	 Xwr+r5L0M6wKQPBNV0OcT1tdIlyTtr71Sua5Bj3bMagm8p8kEAwfY7mBMj904NoSxj
	 eK8ybtHVMf/BE7RCINqcfhX0UJyg8w6TBwjekJJy21COifMWcukd8fgSRhFjdM4iK6
	 eC1/iI04On0pnEbI2RiqR50UqsDpV1aib5oIOpAxRFYh2Z6IE0S/1ryVRU70y13Ai8
	 Z8rtDkggRmbqlpB6ePmY7n39FOZlomu4UEtbmcNTx+wIcVVMS/JgDaDesohO/mQuBz
	 VLJcdzIJ9RahQ==
Date: Fri, 3 Oct 2025 18:15:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC PATCH] arm64/fpsimd: Implement strict mode for kernel mode
 SIMD
Message-ID: <8790c3d3-596e-4642-b96c-774b0a9c473b@sirena.org.uk>
References: <20251003162120.2672780-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QkKeN2PzcTCBNXKQ"
Content-Disposition: inline
In-Reply-To: <20251003162120.2672780-2-ardb+git@google.com>
X-Cookie: hangover, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_101556_881044_0E7C58E5 
X-CRM114-Status: GOOD (  16.17  )
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


--QkKeN2PzcTCBNXKQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 03, 2025 at 06:21:21PM +0200, Ard Biesheuvel wrote:

> So implement a strict FP/SIMD mode that does disable access to the
> FP/SIMD registers, so that inadvertent accesses trap and cause an
> exception.

I like this idea.  However, my first thought when I stated looking
through the code was that it lines up with the idea I had to move the
way we access to the FP state (kernel_neon_*(), disabling preemption to
access userspace state in registers and flushing to memory) to use a
get/put model.  The idea was to make the patterns we use for taking
ownership of the FP state and the lifetime of that ownership more
consistent, and support validation like this.  It's a bigger change than
what you've done here but with the updates to manage the traps it'll be
touching a lot of the same places and I think it'd be really useful from
a maintainability point of view even if we don't actually end up doing
anything with the traps.

I'll have a proper look at the change next week.

--QkKeN2PzcTCBNXKQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjgBMYACgkQJNaLcl1U
h9DIRgf/Tft1Btsk4hrF4biUcoJSfwb7MZlDHK5X2cbLrX8QxaeD/AZ0nrdeHyqB
LfJ+bVi9t4Kr6Y36xwoq3PEzqkSK1EJTTZ5fgCy+0mtduEdahizLuG5CoNxUVMER
FWfoYvMIVqwuKom4i7n1Qn0dfT3vL8cSwtrHM+AX24ZrH/W42f+c38XwBYStgkw0
PAEuIxOW5+F9Balp2eZ3PZpRlmv+vIVPXHC7RZ9ncCxWWZv5VBgNE6RVTxBumE3t
cInPm/TMSr8I5AMS3G5u2VjDGkR7nkUNV6NWzC+M6i/YI1TIZAsz6PKvSixyYh7G
mN+jtjDZZKG3Zba6blgje8DHVmLs+Q==
=9D7K
-----END PGP SIGNATURE-----

--QkKeN2PzcTCBNXKQ--

