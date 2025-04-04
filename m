Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB6CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAXWd3bv6oLIIlOirKCyX0HVaKCP/3E5JM/Ns/NNc1k=; b=I7HIkpTW6xcijH8jOV52YKnJ9F
	1jy8CF9ZDdbbGotlsa+BudnS2jHir3ezhcNm9NcJJc9xVhGoMwsnwmcLKQLbALlRqK671V1rkTApc
	bVNvuYvyIwQ+8uVav5zk9vwYS9Z0joBtatZ1SURRgE/Ir+9OP/pbrXkMRZ2w1NO0dAAbinltUXIJJ
	8sOD7wehi/p7w1r9InO3HhJG9t3+Aviw8B9tS7cUFK4eSpLjvneRdda7qxeufD5ZXbocEUpSWVeKH
	f0JL20GF4OCodoSm/HID75YeZjRyZZONVLN55+IgIAcCvqMEs9GMPl4KFHxF8ljDQAdRBBZz3ysWG
	C16okiMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lad-0000000CVvY-2tLB;
	Fri, 04 Apr 2025 18:16:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0lRR-0000000CUaI-0IAz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:06:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB91661165;
	Fri,  4 Apr 2025 18:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0552C4CEDD;
	Fri,  4 Apr 2025 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743790014;
	bh=e60wxkUdp5e132nRF81S5l2O8crfDvqMBbg8O4M4MVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBm62vN4eYXFLk4KC3g3w6Vo/4taJd/N5AAxjz26GCpYDlrz9F8JLkpnPaxvJ5zul
	 qkqsoAecL/jhql4ze1l3pPWwdc3c3yIk9nwd3hgmTe7Ds0oXykl9kYGaZm8MzvZS3w
	 DyXnp/2EW1zlQ/8uifDVxBs9FeNLMukfz6zzyFy5lqWF7p077I2UzuPYIFl4AR3V0y
	 D0ct7u9T8+c7MWZ7ScMDZkrMBPry6tOh00G5uzFNWZdM1tQrxpAvbCxJNN0RcKfmHU
	 kyRs2NetIAVD1I48t6kMd4OCCuYaNepEYmok7SzBgM7BV34agMoABu1WFWjhxjDF7U
	 ECQebxlC6mgaQ==
Date: Fri, 4 Apr 2025 19:06:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 00/14] arm64: Preparatory FPSIMD/SVE/SME fixes
Message-ID: <45cb5ce9-39af-4c42-b68d-fa506b67bc55@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Swcg6mfueNd7i5Zb"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-1-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
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


--Swcg6mfueNd7i5Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:21PM +0100, Mark Rutland wrote:

> * The ptrace ABI for SME is written around the assumption that
>   SVE_PT_REGS_FPSIMD and SVE_PT_REGS_SVE are separate bit flags, whereas
>   in reality these are different values (0 and 1 respectively) for
>   bit 0 of the user_sve_header flags.

The documentation definitely doesn't reflect what actually got
implemented, IIRC the errors are more around returning the header only
rather than the assumption that they're separate flags but at this point
it doesn't really matter given that the documentation is clearly wrong.

>   I haven't yet worked through all of the implications of this, but
>   AFAICT we can't reliably indicate the value of PSTATE.SM, and
>   userspace cannot reliably save/restore a task's state in all cases.

Userspace should be able to read by looking the SSVE registers, if you
get SVE format register state back you're in streaming mode.  Streaming
mode state will always be saved in SVE format so a read of streaming SVE
vector state will come out with the SVE bit set, if we're not in
streaming mode it won't be set.

For writes writing to the SVE register set will disable streaming mode,
writes to the streaming SVE register set will enable it.

--Swcg6mfueNd7i5Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwH7oACgkQJNaLcl1U
h9Dhvwf7BXofroKSlp/nciQH0O2qHpNmcr+4aFcP1g+XW7NuPJ5bbSvAEO0EpqPF
199kSJEYVAKyPgYQ1o4tPoeYX/OvJ4181tpLyKmh8zWCFmhyNsBlgxVs6Ls5yFPm
7XDWU8WG1J66yqG9mu3a9h9ci2gVSCCpAc3HBDbZ4x5egNVkngmoQr0z2jBa0SrW
0Y5bAiw2o2hgCAREA4NyQwslZ1gHJEsQZujuNf5bOnPc4IoSSgRV8kFyVQ/+J6fU
Z+edhcdck4HaeN18UKx/k6Y1stPfqzETUfwFbELlTKOZu/9r+VOAm/nGvc59VAuP
wMPQGUjLeKcEOfc4d0mUAtgcDLN5mQ==
=L94X
-----END PGP SIGNATURE-----

--Swcg6mfueNd7i5Zb--

