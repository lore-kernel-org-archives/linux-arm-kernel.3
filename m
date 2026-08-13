Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96730C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBLS0FUJYhQkT1zB8ZANDPYH4FFbqlmbBM7/T/YIqRo=; b=OAfyNzRdp4vcjiLyP9glLwm6B1
	A7twVtrKwlaU23V8GDsFDMCWkwwBLSZknivF9stahHNclgNlXkiNSO5V2/5UhSiB82BDUX2Pq20Nd
	oWQeyneW0ebXWPsftGN4JoHAmq2fAPVIKDDREhUHNAAdIVgAmqhNHbQz4xVyZLUBEGI4/QCXiSD0J
	DLJe+ggYUFVKjXAYgZTBWoIwDHJRTy/4U8dopJC9q2ldEDE+iI+08H52JT6Aw3Jgq2lwzBq1WD/eN
	Q/3kW9e616grV32nyYJsnxV4uN6kqvjYgSUw/tUkqBGZY3lMNQuiMBQ3diskymla1ibBEi2eqbirQ
	fi5Brlig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXqQ-000000015zM-3ewI;
	Thu, 13 Aug 2026 15:59:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXqQ-000000015z4-1BgH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 15:59:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 101A9423CC;
	Thu, 13 Aug 2026 15:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7211F000E9;
	Thu, 13 Aug 2026 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636789;
	bh=cBLS0FUJYhQkT1zB8ZANDPYH4FFbqlmbBM7/T/YIqRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B8W4ndihMue/+2EAWms1e0Bq8lI0vlF75HckH/GSe9oxI23AKQqPlBstT2kWvBw9y
	 hBqAAufqxC7EgH5vuASZmVMONVy706R1bXu1A8QxKhInkjp1iFpXZ7KGSr9V+1Orz6
	 6MmRehRlhUD2i+kBh3A9hF0YdnkJIf2PiJdIkQT/+BCB+AUYtBlv1mO20ZwZrr7pOp
	 00GbaYZlvDUQ6GwvlTVfSowHMntAHYRYOhvk/YGFs9PZUy5aGPaH3J+gcTYD5K8nio
	 wU3WujaHdwOV2tt+U0uk+ZAI285x0a2QQEvwY3e46Rcje7iZ5+g53pE7ZvwlyQZ2FS
	 tCrQNUQjv4gLA==
Date: Thu, 13 Aug 2026 16:59:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] KVM: arm64: Block ID register changes after we
 rely on the values
Message-ID: <81c8d950-2413-4d9e-961d-ae96ab10beb8@sirena.org.uk>
References: <20260803-kvm-arm64-idreg-final-v2-0-d7d7e4efc640@kernel.org>
 <20260803-kvm-arm64-idreg-final-v2-2-d7d7e4efc640@kernel.org>
 <8633wi1372.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s0CQpxfWlxjP5lls"
Content-Disposition: inline
In-Reply-To: <8633wi1372.wl-maz@kernel.org>
X-Cookie: Immanuel doesn't pun, he Kant.
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


--s0CQpxfWlxjP5lls
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 03:54:09PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Avoid these issues by adding a new flag that we set when we finalize the
> > system registers, blocking ID register changes after that has been set
> > even if something fails later on. Do this in kvm_vm_finalize_sys_regs(),

> We already have KVM_ARCH_FLAG_ID_REGS_INITIALIZED. Why do we need
> another flag for something that appears to be similar? Why can't we
> broaden the scope of the existing flag to cover the above?

That looked like it was for the other end of the process, where we set
up initial values, and that userspace should still be able to configure
values afterwards.  A combination of the naming of the flag and the fact
that it was introduced as part of the writable ID registers series[1]
but didn't block ID register writes made it seem like it was intentional
that userspace should be continue to be able to write to the registers
after the flag has been set.  I have to confess to being unclear what
the intent with that would be, but as this is ABI I was trying to err on
the side of minimal changes. =20

I would be unsurprised to learn that it's just an oversight, in which
case we should just use the same flag instead as you suggest.

[1] https://lore.kernel.org/r/20230609190054.1542113-7-oliver.upton@linux.d=
ev

--s0CQpxfWlxjP5lls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp96e8ACgkQJNaLcl1U
h9A80wgAha8llle9+QqQT+mJR2RuxsY6SQP/3Kj2ODe3Ammr9HvKe7VFlUnYcZf0
5oQVJfqxCR9Khm8XwlPTFbUnhRxNI2WHnwrIBoDULd1MK3EKjfpNNJrr9jOBS35a
XHX00r6VuPASZW5onDlxMgzEGQI0a0ngcUSUBH0YZcATe8BzpLBjTEhLAhhDBBrF
HNahJz6MNNtvPSoSyBe32zavOVQlSMaaY1YFoBxh0TGuym1Z9OH9n3p70mQBeN+T
9sIV0iJBdEjdPCcx75P+5P04cGp+XyjG3HE41FYAsqTZrKGsEAqUrk9NHqKBlomH
rzBBLk8MTWWmlEVKRz1p/gF2972u3g==
=uPvA
-----END PGP SIGNATURE-----

--s0CQpxfWlxjP5lls--

