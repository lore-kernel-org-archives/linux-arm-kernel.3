Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AF5E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lntT44yDA/CQPJtT+Ol4QD6NQsks727x1mdyw4aP2xo=; b=n51CVjCzkfooswdN9AbGpP2L5A
	fPfRqLCRxAcQXcLva9U/0Ubgmoz05DSn0ybP1gXyPCs8RTQ0Mlzc4Y8OIAEcczOMB+YOAcPzC5+72
	npHF9akPAmnegXOo0snfiXFDBDKyb9DtHPvpdOf2EYXIizGEgCy+5ctihVkeBlPWDombzf3TUyujP
	3z7g16CTYHBDJaaP3pqRcp6oHYdmtKu1qwcnGJ0/UgVorMfX70LJX6YSYDjOEQCjDYbUTKKBXcfDr
	POfFZPLfZmrAyPhZn66IUYDXc7Ghk2QVtGMGeBIwnSTY9T9Jdjy3pUOXdZFs10DBc9YvS/uGxvDbv
	3/i6u0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWei-0000000AF2u-0HGc;
	Tue, 03 Dec 2024 17:25:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWdh-0000000AEvD-12B9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 17:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 056FCA417FE;
	Tue,  3 Dec 2024 17:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5597DC4CECF;
	Tue,  3 Dec 2024 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733246683;
	bh=LNXxnd+wAtX8yjnWtSQBVcGs5jeF1cYxXYnclU8AnDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4fWRbkNm3jIkzfpx0pDOYw+KFGofLZR7Wkua0flCruEk9CYgjatRvlLgPHHy1ilD
	 +WRMYBCdOJKYuHwHcfz4P+AY/FiH5A4c7paI3nsojLe8d1UYXjPFZL+Jieq4TPzKR+
	 YPT3BdwA8JIKaPoJohyzwnFAjVS28hYvsatDGWDDhC4Q/1A8D+ZDHVquBLJlUBDzBf
	 5KmDbKd0dGmv32Q3W+TRwteyk0Xw/ATWLjtku9mZw4eUTOYrofbJjNzMySg3fB0o0R
	 Ic+q6vFVxzRcugP5nf1717ZCRcdX59WvuMK0vU0no9HyLqBGhGi8l5kbrtLsAE7Pw0
	 fS+HssiZ74Uhg==
Date: Tue, 3 Dec 2024 17:24:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
Message-ID: <44d67835-1e43-47cc-9a18-c279c885dcec@sirena.org.uk>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
 <Z08khk6Mg6+T6VV9@e133380.arm.com>
 <9365be76-8da6-47ce-b88e-dfa244b9e5b7@sirena.org.uk>
 <Z085GKS8jzEhcZdW@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tHDCWXL5Z30wlzvr"
Content-Disposition: inline
In-Reply-To: <Z085GKS8jzEhcZdW@e133380.arm.com>
X-Cookie: Alimony is the high cost of leaving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_092445_410915_4B3A15DA 
X-CRM114-Status: GOOD (  33.27  )
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


--tHDCWXL5Z30wlzvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 05:00:08PM +0000, Dave Martin wrote:
> On Tue, Dec 03, 2024 at 04:00:45PM +0000, Mark Brown wrote:

> > It's to ensure that the last recorded CPU for the current task is
> > invalid so that if the state was loaded on another CPU and we switch
> > back to that CPU we reload the state from memory, we need to at least
> > trigger configuration of the SME VL.

> OK, so the logic here is something like:

> Disregarding SME, the FPSIMD/SVE regs are up to date, which is fine
> because SME is trapped.

> When we take the SME trap, we suddenly have some work to do in order to
> make sure that the SME-specific parts of the register state are up to
> date, so we need to mark the state as stale before setting TIF_SME and
> returning.

We know that the only bit of register state which is not up to date at
this point is the SME vector length, we don't configure that for tasks
that do not have SME.  SVCR is always configured since we have to exit
streaming mode for FPSIMD and SVE to work properly so we know it's
already 0, all the other SME specific state is gated by controls in
SVCR.

> fpsimd_flush_task_state() means that we do the necessary work when re-
> entering userspace, but is there a problem with simply marking all the
> FPSIMD/vector state as stale?  If FPSR or FPCR is dirty for example, it
> now looks like they won't get written back to thread struct if there is
> a context switch before current re-enters userspace?

> Maybe the other flags distinguish these cases -- I haven't fully got my
> head around it.

We are doing fpsimd_flush_task_state() in the TIF_FOREIGN_FPSTATE case
so we know there is no dirty state in the registers.

> (Actually, the ARM ARM says (IMHTLZ) that toggling PSTATE.SM by any
> means causes FPSR to become 0x800009f.  I'm not sure where that fits in
> -- do we handle that anywhere?  I guess the "soft" SM toggling via

Urgh, not seen that one - that needs handling in the signal entry path
and ptrace.  That will have been defined while the feature was being
implemented.  It's not relevant here though since we are in the SME
access trap, we might be trapping due to a SMSTART or equivalent
operation but that SMSTART has not yet run at the point where we return
to userspace.

> ptrace, signal delivery or maybe exec, ought to set this?  Not sure how
> that interacts with the expected behaviour of the fenv(3) API...  Hmm.
> I see no corresponding statement about FPCR.)

Fun.  I'm not sure how the ABI is defined there by libc.

--tHDCWXL5Z30wlzvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPPtYACgkQJNaLcl1U
h9APOAf/UFW40tTbHb8uLiLKWdPsreOHsimNJmtyKr1ffXaDSWdfVPDpmIkD2Pq0
IfxTti7phJ0HbaSbSPQE5Q4wAuoWBKPBF1MA//sROlRYOrgRyGnoh4wYPHsKyHsC
te9Y7m8YRG5BjAWU9AZxXDqrAzAD0Z2FUzPWHoeCfZfMzF39LVeT9fWrXifq//JL
pukr0jwLO8Cl6h5beYMmvhhV+tUFooMIyswL0ao+U8oR34CtbTO43JsGwvIQ4jtN
jkLXq4qeAFpbCdfepZcfO0GM3MIFMBu646I3pUVppZj0FAtQzShBrTdEz8IxAr4/
Ae/GFy0QGUkCC6ZHRyE/6ZC3sp7Vmw==
=MArm
-----END PGP SIGNATURE-----

--tHDCWXL5Z30wlzvr--

