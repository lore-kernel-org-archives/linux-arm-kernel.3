Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D69EC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dnMyD3HJYCzzmNgau2BKIJ720HcnPVMtJkCqV6+TJI=; b=RqHtL5lK0C6FKdPqtTBmlyRE1J
	ApQu1Qfm10La3dwB2z+YMBZ7bfpzsvRCfkLdfmymUKgqJI5qV4A5wgdP3pL+RTr5JElew8xzpfiz6
	Hpzwuhx64kKBW1FL6l9enyocUKXpHZ8FkQxAlxwRF5rlsGrdePx4N75orQSTKmPr/p+QC/OLs0PuO
	h6jpZ5aMFknUppRxhwWFOrdjnqJZCfx6muA6hgtZ+nYT3rzVun3klV1hGdhH+P5GIsrIyABHLrtpW
	W3Tb2P3AETEpq0GdsMwJBRWv55qJ12XuxUadODfNqWuZR+zOJwVaivhdSWAEPNUq8iDunXQL1Y42F
	mKqPENDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITrd-00000004Ara-0mpM;
	Fri, 23 May 2025 14:59:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITBn-000000043Qw-1nLL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 14:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C41735C652B;
	Fri, 23 May 2025 14:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71AEC4CEE9;
	Fri, 23 May 2025 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748009757;
	bh=E2T15UQb7YmouLcQa9XmZQe3OTz89LQ9xuaFzoFi6tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAtFyDcMb8cPtd+I6NmN6gXlU5jz2lHRPwrwl1dVWWQMjkzDoHPs+DYfrSfIBUZnU
	 mVqgLR0xt/lgbEdY/+OWagqccWqRoiBTNUzvnW4SVDtWTpL5HQUmndRupgOVstrK29
	 /dp5pNnucd909xPdYF+jqK86o3kckB1sVr0AJQbvcUejN8lC49ic1gz3nr/rVoG7IJ
	 Q4Gp/3hCgeQca84/zDWVCWSrEwR4sRyy6sqxAeHU5lj9/YtKWYXF4xesQ7ak+v7205
	 sZZwWYNEEvuxydVXJvkCauk9Jou5faH7sDRXdCKK4+KK+yDfAg8jmCqMRKQY2Quijy
	 w6BvCQcBsQjiw==
Date: Fri, 23 May 2025 15:15:53 +0100
From: Mark Brown <broonie@kernel.org>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring  (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <aDCDGZ-G-nCP3hJI@finisterre.sirena.org.uk>
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JOptcxW8/D3dLVn7"
Content-Disposition: inline
In-Reply-To: <20250513184514.2678288-1-scott@os.amperecomputing.com>
X-Cookie: Always wear your seat belt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_071559_558570_21321C59 
X-CRM114-Status: GOOD (  14.05  )
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


--JOptcxW8/D3dLVn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 11:45:14AM -0700, D Scott Phillips wrote:
> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> translations for data addresses initiated by load/store instructions.
> Only instruction initiated translations are vulnerable, not translations
> from prefetches for example. A DSB before the store to HCR_EL2 is
> sufficient to prevent older instructions from hitting the window for
> corruption, and an ISB after is sufficient to prevent younger
> instructions from hitting the window for corruption.

This patch, which is in -next as fed55f49fad181be9dfb93c0, breaks the
build of at least the vDSO selftests:

$ make -C tools/testing/selftests ARCH=arm64 LLVM=1 TARGETS=vDSO

  CC       vdso_test_chacha
In file included from vgetrandom-chacha.S:9:
In file included from ./../../../../arch/arm64/kernel/vdso/vgetrandom-chacha.S:5:
In file included from /home/broonie/git/bisect/tools/testing/selftests/../../../arch/arm64/include/asm/assembler.h:21:
In file included from /home/broonie/git/bisect/tools/testing/selftests/../../../arch/arm64/include/asm/cpufeature.h:13:
/home/broonie/git/bisect/tools/testing/selftests/../../../arch/arm64/include/asm/sysreg.h:1097:5: error: function-like macro 'IS_ENABLED' is not defined
 1097 | #if IS_ENABLED(CONFIG_AMPERE_ERRATUM_AC04_CPU_23)
      |     ^
1 error generated.

--JOptcxW8/D3dLVn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgwgxkACgkQJNaLcl1U
h9A3Pgf9GsTk5F/0fGNY7kWqakfU1yTU+RDK9n6FFb+6TJtfgeAXmmC8cEWLDAC7
tZX+QqEMT6QCMrQwW30wWrG0DMlSXea4lOlEbe+Bxyj7nXyb7buttUfdXWhSnWBv
yIJBf376RmMy97ILyMoS6rtIhLtKoU75JXoWjB5QgYiGkypejZR1F8nH9y/hGO+9
tXRx1oLyc/5agIHMewTCuqeCBZRz3yv+I5cF5C133O0bMdLt5JaPJ5tYL+SH1vi2
Cqe9Au9ZZsVntJwxf/c+iq7qtvjxxy+NMfgJrx+ebEgZVOzZN2HjDUoWgb9Z83pv
MVZQBGqQ1cq/g8bSFqTDiGjj4VbZTQ==
=buIY
-----END PGP SIGNATURE-----

--JOptcxW8/D3dLVn7--

