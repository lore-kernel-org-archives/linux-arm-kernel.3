Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7C2CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diOtI+rTq3VpTxoZsD83Wtz3uaGxVEmVM1dPziuORnk=; b=LepJ4Y0BuhmPaownfjPp3yhy2A
	0xO1ce7x0Z3mVz92UgwtJHg7GroixjAbCIskRdo/Fag9GV9gVrZhCGvxP8Wm9ZyX4b/HCPZ5bJ3sA
	5tmnOtw2uOjZqDiHa/tydWlv0qkrse7pXtVzTVIpNNiiQ5TyljfCQCMH8xPHk7oOQEgN6Sdvptsp/
	Ug/G0SHUQtMs7Tc2CJN1dUw4yWfoqql5qe24e9ldBiyVi6CgDKI1WHm2PLJNB4UqBwM0cem2f5TWB
	uoB0ciJ77Dx1/IVsvruHbbHPprn20mOn0/B4+/YTnLxwexTx9jZYxWis0160O0AP5hRgxhgHR70Eu
	TwLQtPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqTQ-0000000B9ac-3ReX;
	Wed, 17 Sep 2025 11:37:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqTO-0000000B9a5-34go
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 11:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6474844A0E;
	Wed, 17 Sep 2025 11:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76607C4CEF5;
	Wed, 17 Sep 2025 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758109038;
	bh=WbmYU3ruE94iDmsbFLGgval4W/XhsRukuT15oThIL8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ihH3G4T867OCfsUh7/y/Z69LQcExnUK3vFRwC1A3Er+wUhi9J6Bil1b6h7IXbNUIr
	 HEL8wR0WnSXgj3skw14IllDaOKCd34GLbouL25Ls4FQI/c2jGvN0Lhw1hbRpwrkrX7
	 a5E5IxR/TdPpP6ZpkIFqg8u7JQ3dxOgktE2TZxBhARPBDPYJEdoIeNmiBLWJ3jJfd3
	 EyXWojoPhVOhxzFLwKd3BUm4C4+tZinXLVLRqNf/7AMSBM2X4irl4lWmYXAphWmW3H
	 HgldcppoPAHZZOehAPYHWsoXCiM/K+pAdCxqGTNgQbfzovbW3pMURtUFcBal83uA8u
	 wqv6ZKaxLU7NA==
Date: Wed, 17 Sep 2025 12:37:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Igor Svilenkov Bozic <svilenkov@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
	Aleksandr Mikhalitsyn <alexander@mihalicyn.com>,
	Andrei Vagin <avagin@gmail.com>,
	linux-arm-kernel@lists.infradead.org, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, rppt@kernel.org
Subject: Re: ARM64: GCS: RET history and GCSSS1 stack switching
Message-ID: <77f2b585-8bed-425f-8c24-3ad3c2ee55e0@sirena.org.uk>
References: <CANRhiBqUsYo3Ryr9Ex2=U+=nbZu_XJoBuEQta=NKFCQMgDnd=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0160Feg+VLvDowZv"
Content-Disposition: inline
In-Reply-To: <CANRhiBqUsYo3Ryr9Ex2=U+=nbZu_XJoBuEQta=NKFCQMgDnd=w@mail.gmail.com>
X-Cookie: Lake Erie died for your sins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_043718_814540_69A2BB45 
X-CRM114-Status: GOOD (  26.33  )
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


--0160Feg+VLvDowZv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 12:08:48PM +0200, Igor Svilenkov Bozic wrote:

> 1. Retired entries lingering after RETs:
> When using a GCS-aware program that pushes return addresses and then
> RETs, I noticed that the slots below the GCSPR_EL0 pointer still
> contain "retired entries" from the previous call frame(s). Is this
> leftover prior state expected as a feature, perhaps to assist
> profiling/debug tools by preserving a history of RETs?

That is the expected behaviour.  It does reduce memory traffic a bit and
I'm not sure that the history of the call stack is seen as a big
concern.  The focus is on preventing writes.

> If so, is there a stricter mode to force a wipe of the shadow stack
> after a RET, in scenarios where maximum security is preferred?

No such mode exists, you could implement it by giving yourself write
permission to the GCS but that that substantially reduces the security
benefits of GCS.

> 2. GCSSS1 usage with new stacks
> When switching to a freshly mapped GCS shadow stack, it appears that
> GCSSS1 requires jumping to an address that already contains a valid
> (completed) token, which is then consumed and replaced with an
> in-progress token.

> As a result, it's not possible to do a RET to a return address higher
> in the call stack prior to the GCSSS1 call site. For example, if the
> shadow stack switch occurs in a call chain like main() =E2=86=92
> subfunction(), you cannot directly RET back up to main() while the new
> stack is active. Instead, either the new stack must be manipulated
> (given that it's a writable GCS) by copying (via GCSSTR) to the newly
> switched shadow stack or by fabricating a sigframe with a new
> GCSPR_EL0 (with a proper SIGNAL_CAP) as we do in CRIU in the restore
> flow.

That sounds correct, yes.

> I've written a minimal selftest to help me get a better understanding
> of what's happening under the hood when using GCSSS1 and GCSSTR as
> well as remapping the shadow stack VMA. The test is available here:
> https://github.com/svilenkov/gcs-play

Please consider sending that upstream, especially if it's capturing
behaviour that's important for CRIU - if we've got a selftest then we'll
notice any problems that come up

> I plan to present this work done with CRIU at the Linux Plumbers
> Conference this year (Containers and Checkpoint/Restore MC). If
> there's also an Arm64 MC or any Arm-related session, I'd love to
> attend it.

Nothing Arm specific that I'm aware of, though there will be Arm people
about and we'll be taking part in some of the miniconfs.

--0160Feg+VLvDowZv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKnWgACgkQJNaLcl1U
h9C4ygf+MkMqRzzCxyj8A8dQlY7eM3U7Di29BhWLgjW4XgaZ7S94l/Rfd0lgtQEU
I1wweEYQEd+/tTdI0lxvvk21h7AtSQbVVeNLJi7HvTEc07BsC/pMKovD/VoRR/tD
TI9l/3rOB/1gZCPgxlzSRhWBbhXKsfrXnfRJgcJ6BliStoKuZU6J8Cnlz008d49w
nJj1Anydau+RgrgiIg0d+g1Uh/Nx9e0txmSTK3e1GLpMK1jo9qvQ5ncVB0ZOi8K0
FuQjQPM10lo67EIvJ7DoD2B8u7N0RKt7eqhPh3tJnMb77pFbOrpheoj/ZdniJDcD
+So16y7HJ/y3yvjd+G6kGdGIq64haw==
=6lm8
-----END PGP SIGNATURE-----

--0160Feg+VLvDowZv--

