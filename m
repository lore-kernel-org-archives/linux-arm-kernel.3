Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D5DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0w9bwNHa2UecZxB2XFhlAwGJoeNBsQInIIZ5ceAdY8w=; b=MkJkjyJ82tFGpLZp2Jau5Ss8sD
	rgmE+EKl7pje32l+YPSuy8FGO2ltpNT26euYAggJ3kxJTZpF09LYzAKT40aHKzxiHrG+q8tVoipQ5
	PM9Jl9OkigoXh48J4ni5YxvdKybFAUv1QejpC7iw2jvbo42URrxxCkf3hZhBw0YkaiSMD3OZXno9z
	ZIGkUYO+SiiIAXmdfD+Cj/LDqft3qcSwEfCsI2x1XKdRKyfvUmaFhIOtSS9Q3Z+enI+V52bHfJ4SC
	IvTOEtcEHxPcuAe9+znA0m3uaibPLYcNNpprEAI+8OPi1onbE6FUhjNV+fjHrvkvUbRg8bwttXqBo
	0QBQwF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUR50-0000000DL0j-3dsI;
	Tue, 02 Jun 2026 15:30:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUR4x-0000000DKzw-3nzr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:30:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA11043EE2;
	Tue,  2 Jun 2026 15:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CB51F00893;
	Tue,  2 Jun 2026 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780414254;
	bh=0w9bwNHa2UecZxB2XFhlAwGJoeNBsQInIIZ5ceAdY8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yl7N9Yn8hC36PKtqcw73mNk27lUf+Rc42GyAKT207hsRa3Imn007N/QobCMsp1FwO
	 rsvg9MH3xqSgXePkFNw+CGKUnVk0viythKJl4vwU32IqRMScKkODMtv/IFwqykvEVK
	 gObX6UOo98QNuG0jOqJUm4W8UYU4pDYvwtq8IzRcSpeGlFLaCROijnl3hinyRllBuv
	 03RYubSF4LZEdmk+OPv1HobcFL4WuGOlp0wUxEprcxZNLR3KaCg18GOjU7u7zPVvhg
	 qd/6iF06QpEZ+R3P+UUNlB5AhIlIbRQV0PnSqy8gEYl7Pmcw13PBfuPlfxgtMdNeU2
	 dthyommoVrcCA==
Date: Tue, 2 Jun 2026 16:30:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, vladimir.murzin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v3 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <8dbd6e01-d6bf-441f-9ea2-15bb947f6d94@sirena.org.uk>
References: <20260602151150.925126-1-mark.rutland@arm.com>
 <20260602151150.925126-18-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LATmKv9d2Fyh2kDV"
Content-Disposition: inline
In-Reply-To: <20260602151150.925126-18-mark.rutland@arm.com>
X-Cookie: The wages of sin are unreported.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_083055_968129_937F1A1D 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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


--LATmKv9d2Fyh2kDV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 04:11:49PM +0100, Mark Rutland wrote:
> Currently the SVE register save/restore sequences are written in
> out-of-line assembly routines. While this works, it's somewhat painful:

Reviewed-by: Mark Brown <broonie@kernel.org>

--LATmKv9d2Fyh2kDV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe9ykACgkQJNaLcl1U
h9BOGAgAhXrneuUEueUUahSkK2Hk1hnf2xL4+ZlC7J7dS3wWunVywLYRWuegAV4C
BVYSH7LDgQpzslyJWIMvCwRA3CEP9unid3cwH3wsZhV4DrbsplYxOkIuV0wzfyK5
Ic4hC0J2KQJM2G9Ruv+V6Z9dP1hcSEa+fCuAv1PdovPHAksV2dLfLyykm06QKBkp
/u2S1ZKiQB7TrPDOVfSO9yss2r0PxjECPT+837FEpWsmDQ9zx63yKK7kf+lvr0Fm
qrcsXTQZsFXXSoTMHGJ0JSMT5iHHSiS1cfhpGShWBLKfAy8BzehhOtO2eOGydQmy
9xQn3HY755u4HQtSF5CylCGnbEbgXA==
=nDAt
-----END PGP SIGNATURE-----

--LATmKv9d2Fyh2kDV--

