Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C335D41D54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKEgGHQSu3SXCxGE/6L/k7TU16u15vr97h0i3Rk8N4Q=; b=oyer2evpkVPDr+6hoqFJdUaHPg
	AgZu9zFjHjgLWqlpn1vJs7bmQJUDYwn+ZgFhlMcLlC9aW3RMXZgyQjpAwxr+a7Ja8nXrjeJNcWor7
	Zxt0BXaq/clxwWzJypk4M38RKANnoSjV0JqVGl409YQZaeMfJYYjBkFl9dZ+1+n/gE8vFqHAu7c+x
	fs/2XrxeP466l4Zf5ZJOr9BiT86iPHk5quwbF01MiJ3BR4x+cWSOQeV5kbvvI82EMgtiqPT/w6I+P
	vUMnqpbAnvNPx5QSYNXuKw/aB8pbskTsmP1Y+qq0tvZLdkVEOyM81UxIK50C0dKiCtGiMsYaPx+LK
	UqSbG2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr0C-00000003Zuk-40DY;
	Tue, 12 Nov 2024 13:32:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqta-00000003YHv-3jTv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0CF05C5780;
	Tue, 12 Nov 2024 13:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEEEC4CECD;
	Tue, 12 Nov 2024 13:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731417925;
	bh=fhzf1jcZSTAtYRSI99xDL2bTyDAMziFUtoPEDRFBo7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WledquTpOzLCn8K1NSvc85m+6IeY7VJhhVTy/4QavsGdoUpzWXffMrNOyd7G6SUfv
	 9/SXctGeD+w+dGadzhJjYM3Dx4g2DeAiR22gAAKrDHKuMKh/OuXXm8xgxILV32PeSS
	 v/2h0/icCFAULxX0nwa9PhD+WgIed4gjgyfoKuHYiTuYC22ZIH3jMldHVNNtz2PCTb
	 qffJQpbIwEoVu3HstbEdOrKqVAiVs1v3PCB8wfT/CKU76RQMJ15xOVe4E/dxBpQ+J5
	 +nh+XS4A+fD2HdiByuYeQK7efVov589w+Y4CMl8H3YmHw+ezsgyhLPptYQEshJOUpI
	 osulbbKHU6LcQ==
Date: Tue, 12 Nov 2024 13:25:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Check that SVCR is 0 in signal handlers
Message-ID: <ZzNXQtbk1NWN6F7f@finisterre.sirena.org.uk>
References: <20241106-arm64-fpmr-signal-test-v1-1-31fa34ce58fe@kernel.org>
 <ZzM8RrD248eSW5bG@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l9TdSVVGcv9oOszk"
Content-Disposition: inline
In-Reply-To: <ZzM8RrD248eSW5bG@arm.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052527_075427_29290CAC 
X-CRM114-Status: GOOD (  12.17  )
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


--l9TdSVVGcv9oOszk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 12, 2024 at 11:30:14AM +0000, Catalin Marinas wrote:
> On Wed, Nov 06, 2024 at 05:07:51PM +0000, Mark Brown wrote:

> > +		fprintf(stderr, "Unexpected SVCR %llx\n", get_svcr());
> > +		return 1;
> > +	}

> I think I'll change both printf specifiers to %lx here since in the libc
> I have installed, uin64_t is an unsigned long (the kernel defines it as
> unsigned long long). Both gcc and clang complain but the compiler
> shouldn't matter since the headers come with glibc.

Makes sense.  I do wish the compilers were more consistent with
including these warnings :(

--l9TdSVVGcv9oOszk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmczVzYACgkQJNaLcl1U
h9ARyAf/ccxPjV6NvV0HX+NR8V0IrCkIUFYkF+JnPeCHw79ymsk9scQ+8HkDFvXA
OUzbd+d42XjQN4bMm6FK8NF0Be4syfkOUmP5EUx2x4aWMjghJZIpH53hORjDYH8m
ej9HimaSZlhkVUFEFsYeTgLH/NC0WbGKyW1KlnLpZ3oAZNzXNsRTM+vfKvkijvYn
nH4NcBHjA/p9duc9XDitUZISNE6sKMAZT0h8dOp6an2S4gSHLx2wLH5//Mbvinja
NpOzppfqHNEXN2DpGjvgLzEs6fQjRaRXnfno6QOBg6DTO+Qg40ExFexA2YwW43nY
d0PnQEXkJ4bwC6IVbirTiegjMLaLzA==
=q9Xo
-----END PGP SIGNATURE-----

--l9TdSVVGcv9oOszk--

