Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87886C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxGogtOAm0iALwbFbJRw5wOFGI1RipAb1Xj7B5IQYaA=; b=wZrfzJGKSMqNuUDX8oflWgaGt1
	FmNQx00xoYzBShjLITyYxIMemf9o69Hb0CjMLD326+fYLZDb+IKlg39au8edq+NBuFiXA7M844nnN
	A/sNuV9aDGyMIDpGhZIpmidYXlhFfgOGdsC2gLX6MoJSSNxn/7yJvrrVjIa665nAEfcYHoi3+Zu+L
	DpxzOYgzuEWXq1Q1edbqkwzmsdF9UvAD8HP2TUmIqx8gt63NneEcM0srzffMDYQkI2TPNR/X3fnjg
	M5G9/Up7cRUoHlyR2SOLxmgvk+oeM4XH8BFdDi9el+eySFHEJq42Uq6rdwFYty7i31y2HEdZyJGUX
	KtQ8TOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcP6-000000043m2-023i;
	Wed, 05 Aug 2026 14:15:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcP4-000000043lm-0k80
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:15:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33B02600AE;
	Wed,  5 Aug 2026 14:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3071F000E9;
	Wed,  5 Aug 2026 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939328;
	bh=fxGogtOAm0iALwbFbJRw5wOFGI1RipAb1Xj7B5IQYaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=foBjS06KUc/OFPi+sdmPTIVp3l9Ir5q/92/ETsHgqCpnMciG/3eZ9BGBrs4iSu53l
	 raKRbwjVJWoxZNOHPhjiM0PJXQM4SCSuaE8XHlPYV76ABS2d/1+k24X/6SgTzuAflU
	 wO+bQF89sPcje2uOCCzzEn6DA1Gw/1lpWdhaY0o3H+a8SEiXlIDVtjRpc02M/UDEF7
	 7ytCBne5L3dl32Si3AkTIwf8stlznV1dPP20rMFVaOMNMXYVTMbTO7YpRXt5soZS2z
	 Sh7hP8TcdXx5I4u6ubSkhJJGPgqtaoXOPlyH1i3TdlwMpyYRO2ZZRq7jSoQiT/7J3p
	 u8fVQEpCqwnNA==
Date: Wed, 5 Aug 2026 15:15:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: selftests: Check ID regs are immutable
 after a failed run
Message-ID: <d2a0c43e-6ed4-432f-ba08-e4e076d17253@sirena.org.uk>
References: <20260805064740.3013538-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7NKDTjH7y4mykaMJ"
Content-Disposition: inline
In-Reply-To: <20260805064740.3013538-1-fuad.tabba@linux.dev>
X-Cookie: Stop ahead.
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


--7NKDTjH7y4mykaMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2026 at 07:47:40AM +0100, Fuad Tabba wrote:
> Add a set_id_regs case covering ID register immutability when a vCPU's
> first KVM_RUN fails after finalization but before
> KVM_ARCH_FLAG_HAS_RAN_ONCE is set. The test provokes such a failure with
> a PMUv3-enabled vCPU whose PMU is left uninitialized, then checks that
> KVM_SET_ONE_REG on the feature and implementation ID registers, and
> KVM_CREATE_DEVICE for a vGIC, are all rejected with -EBUSY.

> +	/*
> +	 * A PMUv3 vCPU left without PMU init is rejected by
> +	 * kvm_arm_pmu_v3_enable(), which runs after sysreg finalization.
> +	 */
> +	r = _vcpu_run(vcpu);
> +	TEST_ASSERT(r < 0 && errno == EINVAL,
> +		    "first KVM_RUN should fail post-finalization: r=%d errno=%d",
> +		    r, errno);

As mentioned on the prior version TEST_ASSERT() is not good practice for
something reporting individual kselftest results, and while there's a
bunch of bad practice in this file we do also have some attempts at
doing better (although not currently entirely successful).

Otherwise this looks fine so I guess

Acked-by: Mark Brown <broonie@kernel.org>

--7NKDTjH7y4mykaMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzRXoACgkQJNaLcl1U
h9DgpQf+NiXNgNz+S2xmmQYAF5oWFhIlgcL04ppAf5m1QioqC9i8YyT6gjbjlEq0
62HwWZO7dqJBj7nvrvvSULN8r9CjoBqyAVqpn/C3s8pULSUph+XA6Psy/+8gL8xg
1Kc/ShsanP4oQylJZBhkA0m/nD86hWIKpCWeRj6ATbIigEISAS+I2h1ccExPK8EG
1HqTFfHnGj2vNxO2P0adUueVr4AOPSPL2uLVqIXEUPbL1h18SljzWBufqq6cAJ6q
lEIHE+hs6N863tRjyY+q0DfISxRKxXk16kw0c8VqXq3sxGZV/Wr7NTGLB5IDzNcZ
udHpg9y7ZM358WfE4TCLov0QiN+kRg==
=KIf+
-----END PGP SIGNATURE-----

--7NKDTjH7y4mykaMJ--

