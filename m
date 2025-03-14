Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F67EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auGt9XWP0Qbzw3OPjJr1G6NzqivSoczirlHeVfF6E10=; b=2M9PppF39lWE+CbXU8kA2KGPpc
	pxKLTnSpYR22kJuVyvLwvkGCz1x+Fxr36dDOPMIDrYdkN16ga/tGV3sGIJOZocwE0nXuoJrttE3zQ
	fp5+rNDKBjMVsIpnF8JnmotSIPMwxHpVykttMD6RJqG/k2QZWotlUh5c5I+g75kE1n1Zcy3H1BajO
	VSvgBpgc2sgAl18t+flFxcU3umP4yfujiFuwDJn6FZ3CEaBtG6UH2s6oLQDJqnv9+sYM8HkgBf+TT
	8sC3i908GTn6ORmSDDvT8W4AbvfRHrHsNNen4UqMJe1zqYOdIY+x+OjlUO7tZCbFDuCDVZ4oaHH/k
	0OaQQc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6j5-0000000EWCJ-13eg;
	Fri, 14 Mar 2025 15:13:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6da-0000000EVMu-18X2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:07:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B06D2A47554;
	Fri, 14 Mar 2025 15:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE39C4CEE3;
	Fri, 14 Mar 2025 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964869;
	bh=auGt9XWP0Qbzw3OPjJr1G6NzqivSoczirlHeVfF6E10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNy5Dld9pXvBnJf7wFR2PSc2XDHnXiK4b460XZRPxQk4OI9ncVfutK1DC+v3Ca7iq
	 8hatfFD9HqzC6G0xlxxkVw7+Xhu5afEzXQZZXm+weAOhZXM/LKsA0kQ7XqIGt04ZmN
	 PRHTmKa2cyrMcd/TFdZch5GLtrXLTy3pBtBt/sKM9bQLFsLAyi9VDYbroS0g1c7tWR
	 9nDRO7GOWk3GbTScXZ4mOKDkmgUJq/MENFAZJJ5Be3tPavyh1qZXNjOB2PCGLLFlsp
	 bIvokHWi1xBp5PzSdliL2ixusTBWMibIQB0p+RPp9PYmfkZ8c2cKGDPzGnueoufAqi
	 X08d4J+ZWL6fQ==
Date: Fri, 14 Mar 2025 15:07:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6.12 3/8] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Message-ID: <fb6255b7-0ba2-45a3-93fd-2ebebfac61be@sirena.org.uk>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
 <20250314-stable-sve-6-12-v1-3-ddc16609d9ba@kernel.org>
 <2025031427-yiddish-unrented-2bc2@gregkh>
 <Z9Q_zW_mM-v2iPHC@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S8XTGybJTDvyceBH"
Content-Disposition: inline
In-Reply-To: <Z9Q_zW_mM-v2iPHC@arm.com>
X-Cookie: Reality does not exist -- yet.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_080750_375799_E305BF73 
X-CRM114-Status: GOOD (  11.18  )
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


--S8XTGybJTDvyceBH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 14, 2025 at 02:40:13PM +0000, Catalin Marinas wrote:
> On Fri, Mar 14, 2025 at 06:32:45AM +0100, Greg Kroah-Hartman wrote:

> > What is the upstream git id for this on?

> It seems to be 8eca7f6d5100 ("KVM: arm64: Remove host FPSIMD saving for
> non-protected KVM").

Yes, sorry.

--S8XTGybJTDvyceBH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfURj4ACgkQJNaLcl1U
h9Am2Qf/b4EHZqu6pDkBYyouOVfn8Z/DkFLUSyW1rFgzV1MJ+UBtBsdKnClTUz2/
HbeF25PC/M9OJgPZDBVbyvMcSidxldZib36id+wvTgvvZvAPr/fiAW/T8AXmPT+T
OujSaupg0i2yN3LtCcDbI9cytqJjYzD+eXHp2RZehpJvA2pWTJ/zLAq0d0WE55BD
FAZx74C24WZ7InXKCP+U5hE2jpHp2iIuK5H+lTY6AJCpgOn9R6aIGkeo9SK5UCSC
0k0oWK77zGxIe3B3Vxj/NvRkfk8D5rrh+pGJkuTihWjDzoCNyi8moceHdTO1YoVO
aA73+5Bj6jDghbg3JPgw/01G2fO2yQ==
=YUsB
-----END PGP SIGNATURE-----

--S8XTGybJTDvyceBH--

