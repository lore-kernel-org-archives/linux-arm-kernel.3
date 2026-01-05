Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BF1C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxCpOBj5Ugt2Ls4JeNvRbvyW3tOKH0s2HHjYQxctAkQ=; b=G7w8gdgLHcrWQNMrXi8k76TuQG
	LpBDHg5od70zucA0qIkFypwz+oEI2UnSs0rwNzL9gkftubq4FewhPCHLHzGlQkDc5xPpmJH9tOy0l
	6AblOiPQnir/+xY08Bj38E0lVMWSdLyJgDSPiCHCag591R6nDgxesFuW0VvVhDKB+fqiDpne0o0Fk
	fc/Cj4fTj6/peqIK4Zc20tMIBJXWn7mc7mNo3ayAuMtH1a8KGYVm3oaPUryDXKdTecmXLMaTIEy/V
	opOseQKj7d4/6Z7X5I8WMwrUnHP5NSRB+LQiHcLb7srg2okYEO7HzujQonPjvniumiJGEVv5kl919
	3S6kG/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcniR-0000000Bkou-1ogO;
	Mon, 05 Jan 2026 16:46:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcniP-0000000BkoV-0AiM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21DE86013A;
	Mon,  5 Jan 2026 16:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B224C116D0;
	Mon,  5 Jan 2026 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767631555;
	bh=hRalsOfosJADEMwrxolfPeTiI+tRS96R5nKkLXSFV/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPfguw5wUf0G5rvgYSSC+g28McqYU8gqXVj8JYZ+U8ufWLR7fto+11FmxnlkVAxpl
	 N7iSNf2UWBzRnGn+E1W12qH2/H+zIhgltq1o+HRYJA6RrIeL5Jyqv/WVux6VeBIM2j
	 uTYiGXzfhMmrH2o7mFMzPfqVGZQgD/acDW0xD67Fy5HXACXJKk0PCRSJkfEAZ7vkdL
	 BCDDhWuwbUSAnGqGGrgJpAIFoGeZ6aPJtbJeZwPKvP7KL2exfNnBx8jZ52jx1XNasD
	 Ut3JWJH/qncBbGk9Tdbkd2sW1v+zKNwNRvPUnuM/jhFQAxKfXQv+6T59eyayyKb1py
	 7Z/KNGAwnelPg==
Date: Mon, 5 Jan 2026 16:45:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] KVM: selftests: arm64: Skip all 32 bit IDs when
 set_id_regs is aarch64 only
Message-ID: <90fb25bd-fa79-4980-902b-497346a3e6d5@sirena.org.uk>
References: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
 <20251219-kvm-arm64-set-id-regs-aarch64-v3-4-bfa474ec3218@kernel.org>
 <363e440d-4e29-4286-ade4-b4be2f856859@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jUgQ9HrVrHCgvOyK"
Content-Disposition: inline
In-Reply-To: <363e440d-4e29-4286-ade4-b4be2f856859@arm.com>
X-Cookie: So many women
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


--jUgQ9HrVrHCgvOyK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 02, 2026 at 02:50:07PM +0000, Ben Horgan wrote:
> On 12/19/25 19:28, Mark Brown wrote:

> > +			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
> > +				ksft_test_result_skip("%s value seen in guest\n",
> > +						      get_reg_name(reg_id));
> > +				break;
> > +			}
> > +

> Unnecessary? The decision for which regs are testing is made in
> guest_code().

The guest code has a fixed list of registers it reads blindly and we
skip the write for these so our expected value won't be something we
explicitly set.  The actual test is done here in the host code and it
seems both more maintainable to keep the skip adjacent to the live test
and clearer to be more explicit about nothing actually being tested.

> > +	if (aarch64_only && sys_reg_CRm(encoding) < 4) {

> Doesn't this exclude more registers than needed? E.g. MIDR?

Yes, I took this test from somewhere without thinking about it properly
- it's been so long I can't remember but it was clearly wrong in this
context.  I'll update.

--jUgQ9HrVrHCgvOyK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlb6r0ACgkQJNaLcl1U
h9B3Wwf9Ei81DVRAliYp+f2cGXjW5ohJtH7FHEVkRHuPfeDT/8tWAFsmGjASwsQv
4Xm4CiVybCEghpj+Ld9vTaF0LYm1yaNVkTPl0EuIWBxMXBxI2OaXhqZ2+N8tzhQ7
vdBXg9vaumylp81y7RDEeaHySwWg7ZtydV4zNMoq6bRkq02iwcuuDuC6hYwUSOFR
hpr3yKDBfZ/kDHzZ3IUFrKiGQQCKuHtZ0FZgBPP0syz9rMVmxBaAAyKPGNmEtuvv
iH5iQy58lagYJfMrRFTxYnAg4w0jN9VIFjiSxabF213G+fIyx0qtpw6X2SiZBof9
e6MtF7Jgpg4sNydpvFXSxryixWYU3A==
=HcmY
-----END PGP SIGNATURE-----

--jUgQ9HrVrHCgvOyK--

