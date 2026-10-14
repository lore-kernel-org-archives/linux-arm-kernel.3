Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EA1CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 18:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FG/dI3SNgpPU4Bu7DcRd1rffp3ub89wihELCwlProk=; b=JTb/e1lZdQVBHLSNByHoi6Ia2Z
	BmuZYl+OcQtjHxnWBnOQGovSRPfmxiTRdENGC2eOl6NpbPNSm3rUNriNqoCVPaOHUNUfm+u5qLICa
	TSsR7nH+fZCQ91bc+Oy+IuBXa9ofIZYVvFlKK06hjtiVPqWVMpmuiU2TzcfdjC1lHiXMBx3rxlhet
	AabRX/ZEnNdMRGhDHHbz0BT6cC0wDsZGUVW868uoRtOzgyh4MGhww2X0R09Pa99/NagdY/7NvoTEK
	xF6O0FZxQw6IP8dw5hdqHAGaTtcbSl3axKBpAmMyElSSbFKiWsp9CR9jx5V0Yk+IUxJTKk3bqdIB9
	C1erokAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH3i2-0000000G9Iy-3AZW;
	Wed, 14 Oct 2026 18:28:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH3i0-0000000G9Ij-2UQ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 18:28:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E610E41A73;
	Wed, 14 Oct 2026 18:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47741F000C4;
	Wed, 14 Oct 2026 18:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002491;
	bh=1FG/dI3SNgpPU4Bu7DcRd1rffp3ub89wihELCwlProk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gN06LqC2tjJ6VYjpIGDT1q+UakkgtM3aj6RkW8WoRsBC08dmHPleVLmpKzf4pWP8K
	 ERnwJt+Z6KBK1RLxT/Z4ZjRDbg0CFe5f0iM47ZXMWFu9wAZtgb3UdxQkqsWqQ2gUT/
	 jvuJi8LQs6XO0yHMnQc3+BVT/Kh/Bm++oyhgv/xa5t55P4jXHlVJJw/tKXDv8Axmh5
	 kNZqxw2k/h29fblvDhBFBv61Io2sAU/OaVsQE4padaFw4WEJ+oxUKQtZaI/x84W530
	 JPikfsOfanabG8XAN+s59QzN08AfBplVqgn8jQQyP1nIdtwxnaqeX4uP4HcMUvrn1U
	 oW21Jgix2xZ0w==
Date: Wed, 14 Oct 2026 19:28:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
 <as-8IqsbMbOBo5Oq@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4+DNe/36eU2EIEe"
Content-Disposition: inline
In-Reply-To: <as-8IqsbMbOBo5Oq@arm.com>
X-Cookie: Live free or die.
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


--z4+DNe/36eU2EIEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 06:30:10PM +0100, Catalin Marinas wrote:
> On Thu, Sep 17, 2026 at 11:14:17PM +0100, Mark Brown wrote:

> >  	u64			por_el0;
> >  #ifdef CONFIG_ARM64_GCS
> > -	unsigned int		gcs_el0_mode;
> > +	unsigned int		gcscre0_el1;

> u64?

Sure, I always find the decision about which to use in a given situation
confusing.

> > -	current->thread.gcs_el0_mode =3D enabled;
> > +	gcs_set_el0_mode(current, enabled);
>=20
> I think we have an existing bug here and it's more serious without this
> patch. restore_gcs_context() does not update the actual register and,
> with current mainline, we may even skip the hardware write in
> gcs_thread_switch(). Basically one task can disable GCS for another

Right, that's an existing bug.

> task. Can we get gcs_set_el0_mode() to actually update the register as
> well?

We also set the mode from ptrace at which point it's being set for a
different thread.

> On the sigreturn bug, do you recall why we thought we needed to update
> the gcs_el0_mode in the signal handler (or even expose it)? Wouldn't it
> be better if the signal handler did a prctl() directly if it needed to
> change the mode for the current thread?

In theory you could have tasks with a mix of GCS and non-GCS threads
doing green thread stuff, especially if the clone3() stuff had gone in
so that the GCS wasn't so tied to the thread.  You could also have mixed
push or write permissions in that case.  I am not sure that any of this
is a realistic use case though, I'm certainly not aware of any current
users.=20

The case where a signal handler tries to handle a GCS fault by disabling
GCS could be handled using prctl() if someone wants it.  I'm not aware
of anyone doing that yet, there was some talk about implementing it in
glibc at LPC but it's not been implemented.

> I don't think we have any precedent for allowing sigreturn to update an
> EL1 sysreg. In hindsight, we shouldn't have exposed it at all but that's
> ABI now. The next best thing we can do now is check the field hasn't
> been modified and fault otherwise (assuming no-one does anything with
> this field).

I don't think userspace is doing anything with it at present.

--z4+DNe/36eU2EIEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrPybcACgkQJNaLcl1U
h9A+twf/SvrdXCf5iFoUVIJnYy0vstIxnbvlnm8Ng/nkRT0U38Wg0Sawsj4f8kQ+
e38vZSWOU4zXOjqyGBjtjT3QUd6JkdfxBBRFZsT8mMv+Dcn92i41yKCTk+a096E+
LSnUj/qVOP3iGE/4qbRqJbLkhTrbM/UeMmFFel0Tp29nLMakKnV3Df9/L+iwG1d+
iTF0yZCDMEyJ+wqAdnVfj/hhj0XFop4O81BxcSnKEpznhET2RF9yZWtYN6BWs8kK
AthpKsF2dogqkK8Et1ijxF525s31M51GeiDWL+S4doH75/61GRPed54+dUzS0JVG
MUtKCK/VA2vmvM4K4WhSJAgi44vPQQ==
=pqzz
-----END PGP SIGNATURE-----

--z4+DNe/36eU2EIEe--

