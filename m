Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE94E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNICOKCDqQx8wLcl9YtGpAxA37hpdnJ/XSY727ONqJE=; b=3Q8HlQrlVdhk+sP3vXhQna/hO3
	e3kpXnMG4tutapDCSRxhD0lQeesqO1w9uPUrdKlKmKAhUBiz5J7QrbrZQ2xL4QtRP5utilpHJehur
	+d28/RhqQgCj2CGmdPUH/QmKxQAX5GX/krTGCXQXsPn2RJYC7Cz8XWUNDrQPXOI4kDdz4dSjTAZNV
	3YK2451yeg/6aIioHHXDLJKb0sGvlbk7w1fGPWQg0uh69PeN/5n01Z5zNMJrgH7uaaXrMOgnDPX2E
	5S1Xnctq3vGR26Z6Ti5MmPQMe7gaYztqOkHm0Ypxh1ETleyLheT4S9bkEb6WBJaBUwASq8rn0VirW
	tp3uk4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKf9E-00000008HMa-2T2o;
	Mon, 09 Dec 2024 14:54:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKf5P-00000008GmF-2On9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 862455C06D1;
	Mon,  9 Dec 2024 14:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C55C4CEDE;
	Mon,  9 Dec 2024 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733755810;
	bh=QNICOKCDqQx8wLcl9YtGpAxA37hpdnJ/XSY727ONqJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4MoffX6wSrVo6cfkuKH+CMYY8YOjbfmeAhyNrfHawm0f8B3TeFhbvBgNvbSG7Tgk
	 ayxVG/rEKf9EqQ8TPvm2z7n5poFbiBj1abqJYaJsvI8V2YXy27FvSJgGOeDVcYNuEK
	 LCeETF7M7T6rqUJN7JwKff5pBEaUQbKBt0g7InetSDfMc+76x0FbdOkr3S3UWliAZ0
	 /o6k1jYXtbqXo2N6r3kDRYs+T6zrQHGhecsb7RCO3TM1jkCNfCsZ8AEjrC3pwUeA2r
	 5Wr7uAoPNX7sLDslaQxTqbF81NXVpOLSg1UArZSpWwaQRQx8FKJ94gGgD3HGszgkUc
	 EQEU7x4NRLslQ==
Date: Mon, 9 Dec 2024 14:50:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH 4/4] arm64/sysreg: Get rid of CPACR_ELx SysregFields
Message-ID: <aa8a6c68-13d6-4311-8903-577cec91f8fa@sirena.org.uk>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="skbI6LnrmfTymsLf"
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-5-maz@kernel.org>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_065011_652875_F222D667 
X-CRM114-Status: GOOD (  11.20  )
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


--skbI6LnrmfTymsLf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 07, 2024 at 07:07:40PM +0000, Marc Zyngier wrote:
> There is no such thing as CPACR_ELx in the architecture.
> What we have is CPACR_EL1, for which CPTR_EL12 is an accessor.
>=20
> Rename CPACR_ELx_* to CPACR_EL1_*, and fix the bit of code using
> these names.

Reviewed-by: Mark Brown <broonie@kernel.org>

--skbI6LnrmfTymsLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdXA50ACgkQJNaLcl1U
h9BRJAf/S0ycslVskgXpXkjdvI/5+VVEFQFc/0Bq4LuCxfAySEoj5lYXZBfkCbyU
fUepdbv4utG+qLWjLDeezQFKDMSLU1jCaOjly/wS5lDoyo3/Q2eUZ47d1YbaFxad
A8d8UEQCnmqDrUGhBf+PGERd4nhI25x9PIZNDDlQBHkQ7T5DN9cUZYvi54cLADxM
XWFgKnnYYSg6iQR69KkjYx5cult0bxD6Icx7PhqyZbNo/lD+S79mlTeajEtNk9CP
G1qYyebgGVHIRXOVajFW3w3/wWAigddiBAnhIWatFTwWhv2yHC8Ti3Y9QZ5EX6wm
N8mhwTBF+RWlkQrCZZTXZWvs+rFNRg==
=/h92
-----END PGP SIGNATURE-----

--skbI6LnrmfTymsLf--

