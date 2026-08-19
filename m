Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7EBC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTifcNr4LKctsAM4SMxsssPmhWjX8dsPgZMHxI2Vljc=; b=OFzOwJpOxHewvUbkFy4tniRcJc
	lTwMyELGwYQ4/WqCYr5NCpGrA90FJPnGzGOZpJzzSfNnjxTUNsAwqfLEmfHQ+qQu37Qed/8TFBfhc
	jJG6gxfHdog0Ql/98mwYuBjqB4dnXMgM7OdbGme43IkXyJnt13osiHx7UCdS2+ESrB/95giZZVHSM
	S1trLLQRJEfCXEo9/if2pcQLcAaynbREDNdhZFJQX7feCJR7xg1/lUf83uBaHYgbNiclGv5ZhH5Vm
	vyesytFIPswlczpwiaaMbpa3Pp0ZZeJqL2OnqtTufjO2K4PePKztuk8xZYHxuMUpCjw77h8+a/MaP
	AsvVuacw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjQX-0000000ADNK-2Vqg;
	Wed, 19 Aug 2026 16:46:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjQU-0000000ADMJ-2vmg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:46:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10D5F41B26;
	Wed, 19 Aug 2026 16:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E283D1F000E9;
	Wed, 19 Aug 2026 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787157965;
	bh=CTifcNr4LKctsAM4SMxsssPmhWjX8dsPgZMHxI2Vljc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K6XU6SjJEqZOn++A5CEJP1XEh70wIlhZncBG9/McLETQ44Tp/E87sg1NJeN8LIcKh
	 9LeizfBbjQ8zIKz7RKZV11UFQCHHoO4HacbQizZKCuSMEKVGpbd8v0A00V3kN6lK0f
	 abv2c69ZnzZJEKfi12TnYolNjiIST3Ufh01WpBqZMJMgyecK7g7ptBtjsfBwrtEv7x
	 AI6dWb9WT5+1oAHiGSPHhzjRTCma4bd9chUUw7JHaixQ+9cBc/RlFHUnMfMepcz+4O
	 r6OfY27+KR2uHulOubDC1tSeSl4C64mOaFrMd3OElL7t3llZjsnd53Lj8fTG8men/j
	 i6eLfj0PLchMA==
Date: Wed, 19 Aug 2026 17:46:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <48be9e5d-357a-4863-8682-8b3f34c69723@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
 <20260812-arm64-gcs-v19-3-9105afd828ac@kernel.org>
 <aoXamcdKoMynTkpX@LeoBrasDK>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bWH43D23LJDpXW5I"
Content-Disposition: inline
In-Reply-To: <aoXamcdKoMynTkpX@LeoBrasDK>
X-Cookie: Allow 6 to 8 weeks for delivery.
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


--bWH43D23LJDpXW5I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:32:25PM +0100, Leonardo Bras wrote:
> On Wed, Aug 12, 2026 at 08:12:02PM +0100, Mark Brown wrote:

> > In order to allow guests to use GCS we also need to configure
> > HCRX_EL2.GCSEn, if this is not set GCS instructions will be noops and
> > CHKFEAT will report GCS as disabled.

> It is zero on reset, and keeping it in zero disables GCS in EL0&EL1, so=
=20
> unless we are in EL2&0 (HCR_EL2.{E2H, TGE} is {1, 1}), we need to enable =
it=20
> so EL1&0 (guests) can have access to it.

Right.

> > @@ -77,6 +80,8 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu =
*vcpu)
> >  	__vcpu_assign_sys_reg(vcpu, SP_EL2,	 read_sysreg(sp_el1));
> >  	__vcpu_assign_sys_reg(vcpu, ELR_EL2,	 read_sysreg_el1(SYS_ELR));
> >  	__vcpu_assign_sys_reg(vcpu, SPSR_EL2,	 read_sysreg_el1(SYS_SPSR));
> > +	if (ctxt_has_gcs(&vcpu->arch.ctxt))
> > +		__vcpu_assign_sys_reg(vcpu, GCSPR_EL2, read_sysreg_el1(SYS_GCSPR));

> Out of curiosity here,
> Why does the saving of GCSCR_EL2 depends on ctxt_has_tcrx() (and E2H set)=
,=20
> and saving SYS_GCSPR does not? ...

This is just because there isn't a preexisting ctxt_has_tcrx() check
already there, FEAT_GCS architecturally depends on FEAT_TCRX and there
was a request to make this explicit in the code to try to optimise
things a bit.  The compiler should skip over both blocks at once if TCRX
isn't there rather than having two separate tests or static branches.  I
didn't add new checks where there were none since I expect that to be
unhelpful for code generation, you'd get the reverse situation and emit
two checks.

--bWH43D23LJDpXW5I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqF3ccACgkQJNaLcl1U
h9CcQQf+IxvaF1y9eqa1wPv0kD6ec4r4UKmxZU1Sj6EfStbT+DJpeDDZmbR5wLHi
UIbnCP1BlGVPGIw8QfCpH7x1W3Vk397dUmfHNuEv/HACcnIe7J+3TMA3I0bSD49i
eY7wVTezjJGRBNMtLzFVT9Ed1mK7iZ3xeD2oU7ii0abLeBMmEwuQyvroT6nLqa6I
hmtlWxH5Ps5ol3qaxoD+w12M6YlkXLucm5OgMZ+gpQM0JuQaxOb2UUxBb64PhcH2
0cdjq7xLFg2kz8kdcitYNVmbE34x/2ZJfg4RSV0AT4B5D6Mst3zXJLI8gVcWjO7e
hZdv8j5JdWYVkbXUdOYTVL0HppvTgw==
=FnPL
-----END PGP SIGNATURE-----

--bWH43D23LJDpXW5I--

