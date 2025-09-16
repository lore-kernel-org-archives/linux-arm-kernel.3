Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E95ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+qI4h96/5omUNjpEqnB88ROvEQ7MRPtM8YHNenk4tY=; b=fxh5wgqvWT79h0fk4Jsn2jqeAZ
	RekVvyhFwJk+yFS6LXWdD1uKYbAZiFBTYslW/gHWUFlx0RsvKbRTdG3mKR8duTHF7H5vNGdgyOUaw
	Lm6faD35pW0KbIksb6+J4zLL7DUtl5uJI3UTj+4vTW8x8ZOMu6Vyi6F3QGNISe+d13aOmvr/vxfVI
	A+e6mbl3XRjJuDV76VK36QN275KdhIj5xj0dlg/++P1nMQzrh8MN6LQV0he87OP9dUaLkKQq10zAv
	rCUpVzWJZCRwdp3UejJxrbCz0cjOKrpORxh2TknUvWvQUTsqTZSZLFDILN3KmXgj1mxLPKvTadGTJ
	0HVJg8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyddE-00000009IUs-0Y7K;
	Tue, 16 Sep 2025 21:54:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyddD-00000009IUO-16J7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 21:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE0A9601E5;
	Tue, 16 Sep 2025 21:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EAAC4CEEB;
	Tue, 16 Sep 2025 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758059674;
	bh=4alxzrUdOK5CtjJJqQwPxV2gCyf0hBSdvjtFuyZab4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqkHM2AElvFo1Vqq/Rh2bjQMcAEERYu7c5C2fACPhHmXNYCbIxyUddnL9b6n4fueV
	 Fr4KCV1HLUM3XhpMAzkRRpctAFMhkU9kCzlcBtp1NS96Zzmi8ayiQxC/VU6qTP+LNO
	 h/VdnaoSPV3ahJyHxZ8V1py3XzMkDN44689Sr1O3TkJMiCoYe0wQQCRiKBeOrViv4/
	 ybymEkJ8FymTHWJ4F3csd2DYCNF4+DrBtr/KhnUL/Z30Oz3PZmLyBVyyT8WKeAcjp2
	 xYrsD78cUbdHeMTYPIaw8SVweg7GaJO4dL/m7txn47ah4yk3/lsAAnbkE/tX7OPkZE
	 ywa4zhpI+zP7w==
Date: Tue, 16 Sep 2025 22:54:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 3/3] kselftest/arm64: Add lsfe to the hwcaps test
Message-ID: <73cba923-facd-4c9a-a5dc-2413ef8b055c@sirena.org.uk>
References: <20250818-arm64-lsfe-v3-0-af6f4d66eb39@kernel.org>
 <20250818-arm64-lsfe-v3-3-af6f4d66eb39@kernel.org>
 <aMnTm59nrA5lBxN5@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p8SWN4j5J2YR9ElS"
Content-Disposition: inline
In-Reply-To: <aMnTm59nrA5lBxN5@willie-the-truck>
X-Cookie: The people rule.
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


--p8SWN4j5J2YR9ElS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2025 at 10:16:11PM +0100, Will Deacon wrote:
> On Mon, Aug 18, 2025 at 08:21:20PM +0100, Mark Brown wrote:

> > +	/* LDFADD H0, H0, [X0] */
> > +	asm volatile(".inst 0x7c200000"
> > +		     : "+r" (memp)

> Doesn't this corrupt H0 without the compiler knowing? It's probably
> easier to use STFADD.

Yeah, that's more correct and easier than specifying constraints.  In
practice it should be safe as the compiler is unlikely to use FP in the
instructions it generates and it's a caller saved register.  The program
is in general not careful with constraints.

> > +		     :
> > +		     : "cc", "memory");

> Why do you need the "cc" clobber?

It's overkill.

--p8SWN4j5J2YR9ElS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJ3JQACgkQJNaLcl1U
h9AdSwf+KQSnGogEd+URgYtj9MeVv6Hiw0FX45ZsYI85Bi0KOmP+Nu9Tw1jbTfsM
JgVvX+UfLVkSnmDHbdvTT8KSJ92bCk7p8vm/liTHygyQmmYVXaQMoVNGLdkCngtH
DcLWwf6FKzeJfp5wO1nM7PR36ITmX9H8DaTszOFPzbzpcy3VKkJ5xlhB27Lpehav
NBfz3XpkdnZpyxwdE1fsHwiQE6tZC5uesLXRt7gDHrFk5jI4OhmMYSyg9PfR39f3
Z7qrEp8pZM6JNQcHpkJu+W7KLwGe/AXXj2SYjAy0uHfciTEUYIQBwj9+vmY6NdYW
8hTyvGXk1ls7EfGSbDIGjGSZOzKkAA==
=0H3m
-----END PGP SIGNATURE-----

--p8SWN4j5J2YR9ElS--

