Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21EECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmYyJOnUFog0AL2FCuG4NNJEsZpxpTJfKkWtHasPM2c=; b=psv0CSInByDq6FIDuIU3HUnEXg
	qyxrnR1zskzrVMcvPc5Zn1CslbNQY1jUiwmht/I2jfcDyCyjFkdrjLmOnli75up3VsPp+PfSz363k
	P34p4N14eJ32HwKWEkqjM0MWst/Ku3RRyPl03d+ml+stHXarHIiEKWukLavrDzF9u9Yg7rOAfd0xl
	WhTxAxoglycCbudRAP0YIL8/ia3ygujwXdwLZEiAAvbPMMeedWEz0ENfjH5l8Jfd6gT6MS+mtoOrD
	ECJnqE6PsQnDQybDdnuW4bsi9BTy7P1z7iyoi1UhkcQJ8UAVJk4WSLYMQaV4oBgfXUIhn1JAftKw3
	WI5Xp1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M5f-0000000Aos1-3UfG;
	Thu, 02 Oct 2025 16:23:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M5e-0000000Aorm-3QRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E93F361D18;
	Thu,  2 Oct 2025 16:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E49C4CEF4;
	Thu,  2 Oct 2025 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759422213;
	bh=PmYyJOnUFog0AL2FCuG4NNJEsZpxpTJfKkWtHasPM2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hAiwO6pQ72bAJ1RaRtddkhRyk/vpHK6scNS/SS9/YBZKmjoFI0L2R+wn8n3xQTj1w
	 6Fe6YiaqtqVAzmBgLfzcCoTSZnZ0j/SAeOqnpVUwn1ycavDACFyh3J1kOdmCYOnJi2
	 8kcw+S5ntsUVxVNypxwQ2xAEet8UWAdPE5xqcQo/JREnAQvY++nap8heu6pXJNI7fI
	 1jlQdpx4X1sqr19cHFqtSYRf67g3MGwjm3DlMaH2mR2VdbqsXhp9LDNw7jjtF0AAu9
	 IOMu/L2l7xR7fImaz6EfwTc/KeMHoPX8Z7wSbqV3AxXtTyloKwUciUrG47qqBZOeJP
	 20o9yMnAitcTg==
Date: Thu, 2 Oct 2025 17:23:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Eric Biggers <ebiggers@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 01/20] arm64: Revert support for generic kernel mode
 FPU
Message-ID: <94214ee4-3eec-4151-a5a7-9d5e030fbca3@sirena.org.uk>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-23-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nWWZ4oGleevaWtf9"
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-23-ardb+git@google.com>
X-Cookie: idleness, n.:
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


--nWWZ4oGleevaWtf9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2025 at 11:02:03PM +0200, Ard Biesheuvel wrote:

> However, dropping that flag allows the compiler to use FPU and SIMD
> registers in other ways too, and for this reason, arm64 only permits
> doing so in strictly controlled contexts, i.e., isolated compilation
> units that get called from inside a kernel_neon_begin() and
> kernel_neon_end() pair.

> The users of the generic kernel mode FPU API lack such strict checks,
> and this may result in userland FP/SIMD state to get corrupted, given
> that touching FP/SIMD registers outside of a kernel_neon_begin/end pair
> does not fault, but silently operates on the userland state without
> preserving it.

Oh dear, that's nasty - I didn't see the patch when it was going in:

Reviewed-by: Mark Brown <broonie@kernel.org>

--nWWZ4oGleevaWtf9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjepv8ACgkQJNaLcl1U
h9AjmAf/SiFHTDNbN3rXmWdsvNAunPrL+9aRBs9j/mZfqVYq9uzKNhwIxj8s45I4
yWhSDWUvwP8YaauMEyjic7CObKYZqqDWU/EiN2nIXazkkxLJbHepxoOdtl570UeE
O9tTJ4GxAuFO0tAzCJZccVjlmBPw8mjZQFNnoisDLZtoPkeAHeX+luSpKrtRW485
i8koP3kVvjSSKEzKFAl5EzXO8rytkbgGoHCJEC5VCowgQjYMPfF2q/9pqkrtO6FZ
MzlGkKZpEAfFDanLklqtkCzVZVX1kWB9FLK9l7ivkr8Fm/zJcXtqJAJGcaW6ysAW
FeV20Z2gHM1Mv6ApBwu+USi75HVx+w==
=Z2EE
-----END PGP SIGNATURE-----

--nWWZ4oGleevaWtf9--

