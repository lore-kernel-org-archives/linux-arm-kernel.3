Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BCC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt1p7cYUcwFEhnFIxwVKkIVqx6h14n8GPYfKX7AMCk4=; b=avBFSWfCGCobRN2FHPja1f6Jb4
	s/eUdcmRIh1Nz43A4DK5P8nIhGdF11tdzrvDRD+o/2ck5qI48qSuT38Bc23mrdifBFliiL4WZt2Kr
	yBcGfh0MUw6aXdFvHZp+4wRvlKhD+b36mY31yfZkjlhsPYoXbheocQP03zN3V6N0soTJc6rCHZuDt
	DoTfBUtFeWbTEMjcC0GM+kDm4jim4Zl2mg+EemI00m7sejypvFB5gCsiGpzvKK3XoxXP02ns0jFKh
	jqRpULsuoZPf+YT5SwoH2VvPqMaZZy/QgTNGTM6urjtT8TX0M6rWMxWBtn0lJx+Nja7LR/Rm0nvPt
	nFfPPX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHnA-00000002Hx1-12MD;
	Tue, 04 Aug 2026 16:15:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHn8-00000002Hwv-3UTZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:14:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B5A843BC3;
	Tue,  4 Aug 2026 16:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399BA1F000E9;
	Tue,  4 Aug 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860098;
	bh=Mt1p7cYUcwFEhnFIxwVKkIVqx6h14n8GPYfKX7AMCk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n4WnSWwXTxjDbdY+W5tlD3UsY0AXM9s/hRQivDOmNsdYxTnEzRuhW5q4ZU4eIQLxw
	 DLWIQM3bXIY01GnCguAeUJwcrNJhtLFxMRLF3NlXYG/cZ9GxV73f+9NrBBhx5fWpaT
	 +z95qn+ic/x1dsrxDHmUnoHn6yzucBGZ2CSwa2ZVVh8NwX2RTrZ76qKGGI6HMUM53d
	 7QI5ZaabGzYDAf7s/BAPl/oQeTgQ40JJ+ZDhbEC4ucL3Ybnew+sM7S7QWE/g8Yf00L
	 g8iSz4otsfnrkUG1OiPeMezDrIipXA460me6Sy5Oh4V/AX7lqvmwNaf3ZFpEOpaIML
	 vtKwJgnMrgT0g==
Date: Tue, 4 Aug 2026 17:14:52 +0100
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
Subject: Re: [PATCH] KVM: arm64: selftests: Check ID regs are immutable after
 a failed run
Message-ID: <599f665d-7474-4f17-a044-cc92b03d02aa@sirena.org.uk>
References: <20260804092421.1728880-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3phxlZuUwtCbrTU"
Content-Disposition: inline
In-Reply-To: <20260804092421.1728880-1-fuad.tabba@linux.dev>
X-Cookie: Biz is better.
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


--z3phxlZuUwtCbrTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 10:24:21AM +0100, Fuad Tabba wrote:
> Add a set_id_regs case covering ID register immutability when a vCPU's
> first KVM_RUN fails after finalization but before
> KVM_ARCH_FLAG_HAS_RAN_ONCE is set. The test provokes such a failure with
> a PMUv3-enabled vCPU whose PMU is left uninitialized, then checks that
> KVM_SET_ONE_REG on an ID register and KVM_CREATE_DEVICE for a vGIC are
> both rejected with -EBUSY.

> +	for (int i = 0; i < ARRAY_SIZE(test_regs) && !found; i++) {
> +		const struct reg_ftr_bits *ftr_bits = test_regs[i].ftr_bits;
> +
> +		reg = KVM_ARM64_SYS_REG(test_regs[i].reg);
> +		val = vcpu_get_reg(vcpu, reg);

If we're doing a focused test for the specific issue there's the VM ID
registers as well as the general ID registers and adding an irqchip.

--z3phxlZuUwtCbrTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyD/sACgkQJNaLcl1U
h9C8YAf9EMhSIgloBjFk+gFUs12O/TATm4DfMhGeRfvlcALpkawfiIyC1MQxlefq
sd3bgUKbBuOBqRBXBOY/KJoMZzRiK5QWJWTyGMaaDwRKB4uvfg6P1V/VKBY0qhGv
BXnks4iZ70/1K8Fv//PxG8WwePOAcBgDKKXbopoyKEQa7ZQ2JzbF6+m6lxm6nBTV
OuNxcLLG7ZpmcSoO3F2Iu3TfUD2ltq6LP1IrfjW0V+7zmy/X79L7d9P+lCZVL+WR
zj6xNQDWt7KrZMxlgRplUkgEVSh2CmZAjWu70kGyqyaBjqmaalu2Ge6zNlyH7WpI
D6VZ1lYs3eQsU7wZ2jSpX0fv2924RA==
=45sn
-----END PGP SIGNATURE-----

--z3phxlZuUwtCbrTU--

