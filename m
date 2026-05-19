Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058A8CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO7gu5b2VG3xhzvGBI4iTMcvUPrRg5etVktBHbZs3mk=; b=vRmvCP8bpO3Nmftr4UocddtYqS
	u56LXp0007mHaCLj3xjlCZdUciPpzD79OA1c1F3IldVloC0JicZB4dzkcLXyDhocuyc08uGtV8oO/
	fyMfsZdDFzvin4YMZgTBOybRixhJPCo+wVgTBZvkJI/wD13R12OtKvHvDPUSG/8DwJmYaMIknfzzd
	lYH9InMpBFzAm1/sHEfh6gnSywXfTtmL8e+gDUQaQbhjqQkEkdF8XFxc55/5GnvT0qhym8AisF8nJ
	YrUZqStLlblmwXPsiq3CYNenaytbNSGFT6iqqoyissBcUg1Vfzobrz9LDUpXRsn3ld//gc0XvKqXF
	MobTwIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMvS-00000002ALf-3opG;
	Tue, 19 May 2026 16:04:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMvS-00000002ALG-1E9x
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 16:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DO7gu5b2VG3xhzvGBI4iTMcvUPrRg5etVktBHbZs3mk=; b=qKyBq0eCslGJ2B0NVbb76TXYMd
	Ofj/YxV3rKlDVHZIJs9SlUj38FJsp7DL/SeKpgX9itF+IXAL4kYVkjEGij5ZUFUtmK857iDUCqYgL
	/22gDsvmnQNUWqv2GMxQz9yTGKVPEhbrng/gSx4NO8cJ10CjbR9J7tcstYQO5Nturf5SM48PUg9d4
	llW9mzGjs65Yni2Ld/0JWl5eUW3SytHbtjT4qx/qLmaDCQ8a+I7REXOGez0LgSTPbtaucx7ALYlKu
	lFp9VfHpU+eQ1puC0eBI8wJkoCUdvYPneqIypVmTIYt9y6Os085wpvx0oqpOJMeEjL5UeYpfoSsH/
	E22uKueA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMvP-0000000EkZ5-12q2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 16:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 579054023B;
	Tue, 19 May 2026 16:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D00C2BCB3;
	Tue, 19 May 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779206643;
	bh=Lnx/pXqjltGA5ONxEFwxZf8Y5U4N814gZuOhZVLw1og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJNf/CeGIvGrP9EaIQi4pfT79mOF0qY5KAreyTQLYPRMDGTSDpylVsdIrWl1mgf/N
	 bz84lZ0pmvcZZBQxouPO2C26PK1I8ZasCMTaaauyU3AGxfrwCUpL5kK2jKhKWEdFqp
	 gqGQHW8pg5/flkPE1rcDX+caQW0+ly0PTFRXsXI0JQatAYvZ5mJikFkYlCC6jdJ2FG
	 e8c7PgBrlZzTIiAFvWTUqhcp6+dcdoBgwrUjh9snuG9Qph59B56kRUIrKRBnf4YVJK
	 pr8/FgYUxlRT52kN7RJxsWWtvvcuQUR7ozAbgxqhK2/c3mr8DzvtpT5PmPVcL/FYDx
	 osGbT5LF/b2Ug==
Date: Tue, 19 May 2026 17:03:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Message-ID: <4f6f15db-7881-4bf1-af84-f2066e740129@sirena.org.uk>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
 <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>
 <agyAs0UXGulhFXga@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h/QgtpyNZPBR8+wA"
Content-Disposition: inline
In-Reply-To: <agyAs0UXGulhFXga@willie-the-truck>
X-Cookie: Huh?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_170407_751349_6C284181 
X-CRM114-Status: GOOD (  16.07  )
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


--h/QgtpyNZPBR8+wA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 04:24:35PM +0100, Will Deacon wrote:
> On Mon, May 18, 2026 at 04:07:29PM +0100, Mark Brown wrote:

> > +HWCAP3_F16F32MM
> > +    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011

> > +HWCAP3_SVE_LUT6
> > +    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
> > +    ID_AA64PFR0_EL1.SVE == 0b0001.

> I've queued this, but I'm curious why you've called out the
> 'ID_AA64PFR0_EL1.SVE == 0b0001' part here and not for any of the other
> SVE caps you're adding?

It was mostly due to the possibility of ID_AA64ISAR2_EL1.LUT getting a
new non-SVE value, now you mention it I should go back and add the same
restriction for the others due to the use of ID_AA64ZFR0_EL1 for SME
only systems.  It's the implemented behaviour.

>                         It's also formatted inconsistently from
> pre-existing entries (such as HWCAP2_SVE_B16B16) which put the
> ID_AA64PFR0_EL1.SVE part of the antecedent first.

No real reason for that, there just weren't other examples on screen at
the time I was editing this.

--h/QgtpyNZPBR8+wA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMie0ACgkQJNaLcl1U
h9D44Qf9Hm/HoYVWOogGsZwsAW3fUJ+l+CbQYeMQ4uxFJrjRfTyWJF150CL8cR/p
fSjXG7b893A88VmLURRews0SIbQl+ySoLBMmkquPYOEa81h9IFjfRWIUwMSg9RaI
n/u9d/tr0nTsBcdxgBd/pI5j/XvW184DfpWW2nyHHlR66ocYiPsHxi5P9bOkimYR
Rk6dMU2/t1h6OpPTY4lYUsGrPeX2tmcVOCB464/QHWzjGc4KE+FY8FzlOCi3RL7t
pKN/3a7k8ysVJahVqHEvMB8Ko4pTGygRuWAqR6d1bDI9Rn/nuevyX0O1vHkZHUoV
fyT2A/dA+fo/WnKgX3z8BnV3epB0mg==
=XelS
-----END PGP SIGNATURE-----

--h/QgtpyNZPBR8+wA--

