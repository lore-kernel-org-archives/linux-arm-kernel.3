Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E68CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBPzx+uGVOr4Q6fKVMed3XqaUTMvbACo0SmUrYnsNCw=; b=B+/OCJKSiLEoofGUrVKSYDccdt
	IilZSnjgKRdnPiHS6LZUHk8p88gvbBZhdcKaLGofC4+CA4EpL8Jqbup0HsZSHoFtYsbI46IesvmpQ
	hwSQaKNxmssCP7DWztkGzDugE1OU5MkDvL0KkQ3hvNn6JCJZ3Wh2DNa/ZDHC0/I48kRHQC6l/gh4p
	+tT76ev1JoEtS/HwC+JOvaGcMHZSFj6gFjWqD25nQ0OtFQcON+KN9ScR1UV2Z4bx2t6Vad7qeWGJK
	4gcAlA+TY2OM91wY+qes4lbx4bJSErVnPcMgcR+zqsSH+e4yn9gUA7efSv5isi7TumQb7ingmdFBP
	J2re7tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL6Z-00000000Cyf-0DbQ;
	Thu, 15 Oct 2026 13:02:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL6X-00000000CyA-1W83
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:02:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7119C60120;
	Thu, 15 Oct 2026 13:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC891F000C4;
	Thu, 15 Oct 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069360;
	bh=yBPzx+uGVOr4Q6fKVMed3XqaUTMvbACo0SmUrYnsNCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTMOKU1toKNsK0qFQNdH803k0H0HblVaIt86xYfDuFOLqgAYkPlxMxhTfjiuUGo8E
	 OtWHN+aYURAmiBOB8CzFkADc85ffzOMWuL+toafLHPnu1GEKw1OHQQRtlvP/l9yqrL
	 DVOsD5CN1WZC3b/jmF6uoyGXwc/9m+QK3Sk2NCtmSzMFKrwJgFBH+61DsXoB5Z3oGD
	 2B7gKhOlsnjbmsGumN/yK/fujj0r2qe5RSZDFMpjffBAewJ2+HFM45yJYpIvJfX0gW
	 QXACNtmhi1zp2z1o8cuYNIfIRRhIPeW86aIUEdB1/BDAva5O64cdewQN45GYYsVdW/
	 mJWmE7whjQLqg==
Date: Thu, 15 Oct 2026 14:02:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: gcs: Store GCSCRE0_EL1 values instead of
 userspace mode
Message-ID: <bea663db-52fa-487d-9134-606094004f7e@sirena.org.uk>
References: <20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org>
 <20260917-arm64-gcs-store-gcscre0-v1-2-3c9fa9213bac@kernel.org>
 <as-8IqsbMbOBo5Oq@arm.com>
 <c39b2cc4-832f-49cb-8a59-e5b7a8bd9317@sirena.org.uk>
 <atDBVHvDQ3Pwr2Uq@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZxYMydLMYgrvLhA5"
Content-Disposition: inline
In-Reply-To: <atDBVHvDQ3Pwr2Uq@arm.com>
X-Cookie: Tax and title extra.
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


--ZxYMydLMYgrvLhA5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 15, 2026 at 01:04:36PM +0100, Catalin Marinas wrote:
> On Wed, Oct 14, 2026 at 07:28:08PM +0100, Mark Brown wrote:

> > We also set the mode from ptrace at which point it's being set for a
> > different thread.

> Could we do like in arch_set_shadow_stack_status() for gcspr_el0 and
> only set it if task == current?

Yeah, that does work too.

> > The case where a signal handler tries to handle a GCS fault by disabling
> > GCS could be handled using prctl() if someone wants it.  I'm not aware
> > of anyone doing that yet, there was some talk about implementing it in
> > glibc at LPC but it's not been implemented.

> Just thinking, if we fault on a modified field, a handler using prctl()
> would also have to update features_enabled in the sigcontext, otherwise
> sigreturn fails. I think that is already the case today for disabling
> (the frame still has ENABLE, so sigreturn returns -EINVAL). prctl()
> changes to WRITE/PUSH are silently reverted.

Yes.

> Another option is to ignore the field on sigreturn and keep it for
> information only. I favour the latter, but it needs to be a separate
> patch for discussion and a change to the sigreturn text in
> Documentation/arch/arm64/gcs.rst.

OK, I can do that.  I'd already prepared something with this as a
separate commit before the other two, I'll revise it to ignore.

--ZxYMydLMYgrvLhA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQzusACgkQJNaLcl1U
h9Cwnwf9Gx4ar59q2MShlfkqmo9vs8osi96N1I+JJmBry5qav8fHpEOlhyMduFpi
dZ/HF0zKMadR3kpTnp6qF+slePI/s0J8tsCLM8cksD3uKA/vTBvElOFyFsZe9iZz
ekTAoUASVzKwK3ckTgF7WBzjGdOlhHnDGTAG7+H4rY7EHIkJWBFlKDuc443F3VLQ
TFV/42CmPyfhutPgy/t5mfzqaFj47Tm1EqfvULuoyka5m2Y9VMHMSVs8k0GqYjPE
aiIAENRd+FKI5+cu22XJwCsTlBrLN79UCf6jttfwkm0HyQF10UX/m0NQly/4jCcl
CrewZT+dhw4wp63+75gAgrT/Z26K3g==
=CbSG
-----END PGP SIGNATURE-----

--ZxYMydLMYgrvLhA5--

