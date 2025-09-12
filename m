Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A731CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz+aR51NPeVfv6985NVBYqIT6ZN4NEVIrnC289DmxYA=; b=NaqyYRWFeZQ5H3k5QSbqAtnDtA
	zHqrNq7IpjvacuCWH8lY2YemSQsa0b0R2paVF8BO3zLFdK7NthGPyimn9X/i5jGGSc8sN44BKknMV
	b3LlPrBWW0t8k/e4N/QEbXNuRfnlRnYtZd+ukyNICKXx60bxxRAC5yh2S/0BnA9XPXMHB35bjFiXS
	H4TX7O0PIR+l5D8Pf1eBqOElH6F7IkDWtoqIR2ea3eOLkvZQ36RHLo0rLlTYq4YL+dxoN1MZBPeIc
	Bk3MZGk7SouaHqFcR01/R9ig5SvaYOE9hHNf5kZiorzPYV8sA3tmuKF0FrVgGL4IGTtFJIiktDlIT
	XbRp2H+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6iT-0000000AYHf-10AI;
	Fri, 12 Sep 2025 16:33:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6iR-0000000AYHJ-39vB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:33:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70C1443D4C;
	Fri, 12 Sep 2025 16:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B2CC4CEF1;
	Fri, 12 Sep 2025 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757694819;
	bh=40D3azo32aA432DW1jWO97dUK4u+gf4msaD08ReAdlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKDuNMrgspTKbgKs/S3dV0K/yVqGkd+Mc06d0z1Hs9jytEautBcOG9mVnAMSOfi7T
	 HvBDXePdazel5390VyNYnn/xv3+rn/vW2s6bgyLc/IBSG2NMWAFLMUDaes15fp2p0N
	 DkZoRUnpad0gCJrmECdXdY+uE0FKo/3nLDL4jUbpZAgPBYKFVoYz9+TYtZl+8BESRn
	 TeTVTxn0gytq7iBJd+TKhBxB9lhbqH31KQ7rRiqjzPOZope7CwxDgO2So/ErWAEal1
	 gbJlZYEJ3DZPftPQBBosopqREX0gQnLwu1Wt5kw6lkociLd/HvQWradNN7SZ2zxMbp
	 0tyAHTMyymsNQ==
Date: Fri, 12 Sep 2025 17:33:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 2/6] KVM: arm64: Manage GCS access and registers for
 guests
Message-ID: <aMRLYBWfDFiIB7wx@finisterre.sirena.org.uk>
References: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
 <20250912-arm64-gcs-v16-2-6435e5ec37db@kernel.org>
 <865xdndgpw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzAqF05U+jmCCGjc"
Content-Disposition: inline
In-Reply-To: <865xdndgpw.wl-maz@kernel.org>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_093339_813070_8C87418A 
X-CRM114-Status: GOOD (  13.01  )
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


--bzAqF05U+jmCCGjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2025 at 12:59:23PM +0100, Marc Zyngier wrote:
> On Fri, 12 Sep 2025 10:25:28 +0100,
> Mark Brown <broonie@kernel.org> wrote:

> >  		MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
> >  		MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
> >  		MAPPED_EL2_SYSREG(POR_EL2,     POR_EL1,     NULL	     );
> > +		MAPPED_EL2_SYSREG(GCSCR_EL2,   GCSCR_EL1,   NULL             );
> > +		MAPPED_EL2_SYSREG(GCSPR_EL2,   GCSPR_EL1,   NULL             );
> >  		MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
> >  		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
> >  		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );

> Just like the previous version, you're missing the accessors that
> would be this table useful. Meaning that the vcpu_read_sys_reg() and
> vcpu_write_sys_reg() accessors will fail for all 4 GSC registers.

Just to confirm, this is __vcpu_{read,write}_sysreg()?

Sorry, I missed your comment about this on the prior version due to UI
confusion with my mail cllent.  My mistake.

--bzAqF05U+jmCCGjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjES10ACgkQJNaLcl1U
h9AzDgf/duT63XwRmgWz0snIItmYAaIOhyi9DSxNDPK1rp7/ouyg/0hMk2fa5glv
1ILW6aKRp8AdJeKuqbRnCdJ+G5dxtmtOV6BmkxcK7bPorQYP51Xlat7OqsLF56R2
vRT2MwbM6VDt9cyp08gbJ6TVLrbHfwYz9XEr19HsrDqRYyCojz41cGf7QzPbKIBz
6HeUZQHSZnsf6Ov7DIsZons63MmVdvYgKAv29I5tLca+TlnwVoumfVCGNeM1BB/4
/9yhS+DQB47AvKDMX2jI3MzaQ3n3NLL7pYUF7c5K3e7uiToZZZRjxm2hTvPYGzrS
I0ulFq9qRSGr6EH8H02+ru7NA5yWOA==
=rXPS
-----END PGP SIGNATURE-----

--bzAqF05U+jmCCGjc--

