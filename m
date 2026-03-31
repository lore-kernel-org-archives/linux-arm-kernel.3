Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B07FF60E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KK0eQCW33KmERzI09ortJszhsGGsvAQrl7rSJZo83j8=; b=mFXt2bNXGlQUr/Hf4tSgEASj5e
	swPZVXdDjzm7iY1LPFcmpR6xklDcBjJ045vXttMURGiJJb12r0ALj4ZeDGxffUYm1korqpCob3HqB
	3heGES36+EUdTOHBHaZ8dHU9buZwLCUg1NaWU/t5YHELb5rXRRwPA3wESBSqRpfuTJP9aRH2ioCkA
	K4nJ1/bTNNrxLOQbsFWhh/t+mxXMgmELeHpdDvoHZaCD2rBswXNybHCe4MR7Yx/43saD0cRoVaXEb
	0gFPxNUK1fGnaBp9DHbfg9Pqx3qmZVSGZjn3VLechORVWxcZ2MOv7nNn1bSOTBmdmQmzyxwgGRZUb
	v6FDsafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UDt-0000000CYcP-3QST;
	Tue, 31 Mar 2026 08:13:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UDr-0000000CYc4-3W0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3585A40523;
	Tue, 31 Mar 2026 08:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877CDC19423;
	Tue, 31 Mar 2026 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774944795;
	bh=pJGLGPlP+pgDoOnMJ+vDANz34nLVCZQqTJjj+JlmLOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKJ1TjY1KR5V2fPPOJ8XQi6etBUEiUGhvNaSWz4sQ4vb4o3f7qz6MkCmmuleaP4p3
	 YwUeNMwpx0sd9qjM5cAnmH1wd1zJGdvHG2DTbGscmWNHk0c5hYJgKd9mi7EU9l86m9
	 4dmS4MF6ZeoOiYzBriJJ6lU6kZErxPqRThfAin3Vz/hlq7sWyqnZqgqN4jXNYguAen
	 036nr0blsQWpXDIQTLqbWwM4h7zkS0QyQS7Bl9waqZIQSAZb64NWH7Sw3LQghV3jxp
	 ncbGmmivlJ8q+AR3RvfSpimH9YvOXzDg7pXAUA1YgTq/R/Lc35pfbL5pIkEcI2KMIA
	 LzhHooHZ/9e/A==
Date: Tue, 31 Mar 2026 10:13:12 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Message-ID: <acuBQcq0jEX7fv9J@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
 <63b6c9da-4c0e-497c-a2a6-8aa5e74e2adb@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ucvm2dz66opruy4z"
Content-Disposition: inline
In-Reply-To: <63b6c9da-4c0e-497c-a2a6-8aa5e74e2adb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_011315_939377_6DCB8E73 
X-CRM114-Status: GOOD (  16.26  )
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


--ucvm2dz66opruy4z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Tue, Mar 31, 2026 at 09:59:07AM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2026 17:10, Thierry Reding wrote:
> > From: Thierry Reding <thierry.reding@gmail.com>
> >=20
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
>=20
> I guess related to my question why patches were applied one day after
> the list:
>=20
> Days in linux-next:
> ----------------------------------------
>  0 | ++++++++ (8)
>=20
> Commits with 0 days in linux-next (8 of 8: 100.0%):
> ...
>=20
> So you exposed soc tree to all sort of integration issues. No, please
> keep them for some days in the next before you send them to soc, to
> allow people to test and eventually complain/report issues.

Most issues would've been caught by daily bots already. A lot of these
probably were in linux-next but changed SHAs because I rebased them on
top of the PCI bindings patch to keep the shared branch as small as
possible.

I also do fairly extensive build testing on my side before sending those
pull requests, so I don't think I've exposed the SoC tree to an unfair
amount of integration issues.

Thierry

--ucvm2dz66opruy4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLghQACgkQ3SOs138+
s6FfYw/+LNdbCG4yiEIT7ANseqTzRj7TYxgDAAw6I+FYeoOC4PhIliXs7xdMQMC3
b7+LFqbsBcdIjG7TOLKcTeBjYtqOnGgHdWsAq3ZzA/RfZ8CmpjBhdQRC17xj0obs
+WVpMTGcx51B7Am92oJeC8bG20c8q/Pw7E+xdwgO8tGiHY644TH6eWtijj14x94O
JO4TVE8vwtvps8oQnTT49lfL9avljxGGd2M+LXbp1axt923uGfD6gI6NUovrxDXM
Ihp1wln0YW3eF/wvmoxG+487P0GduvA9jrZf4ZGEcQ4bcQv7VebUk9JgVXVHVZII
uxx2BeOdQUaZTcrCBV5/5iUNWORV+hCSblHZCuK+o0+HZ9MXxQi26+C4D7ZJ2RIV
82TWX9EyZXbTl/oRQmOUGPPpuziIL+M0nx8ToRGo5s9wzXmbj5xsC87gtQP+RYZ8
YL7dr1NkUtX+oqTzuhEVpiuR0NDFE0ggE68SL0ItlRiFxi3xATE3ttzvdTWXXawg
7zco6kR+kgnwUURK2i0JD8ZyLx9zqMkux7nQ/NnX07bQdRmJ+rZ75mHzR3C/SPrw
YM0a9EZXicfqrTlidqAYo77d/XVqiVc0zU3rUwXbopN+SS+nYIedyGsdsZNl558G
gHY8TBhuDSYVdB/dYdu7lpzms/Fcl1W23sOjlUPpaXkaFuPlPjU=
=nwD7
-----END PGP SIGNATURE-----

--ucvm2dz66opruy4z--

