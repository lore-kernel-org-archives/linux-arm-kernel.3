Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FBCC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mS8xOrDiWisPJFT5MvNta6x5S/8S777SjEClilc+s6A=; b=XEdLoKLlfqp9j+WRMux5y77pjC
	2Kdy2BRg7ifwuk2fxEUFEh5MA9YNYzfjPKKZIGZostV4KOWzs+y55dJOnJauSOPjM+Q1pwA6M/0vy
	RjKC6trf6tHpURCsotklX5NmZJWgr2EvYJO2l3/IRHc6MRoGQ8nx+DCSOTxwrrfHnRx22xtUQx63p
	xNxXkznXyjyPQe1Xch7I1QkXuM3EZIHX/MUzw/WyaPnCCp6S/hvmHpi3s8WM5XzjgzeJxFFbDhkXB
	WTcyOcQCcLqQXQdi4P+BVQ14BI0dD9pTWNQ48QV+DmGJbW1NUIP7XsNDNlOamTK3a9R73jzH0/zy8
	7vph3zeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AN7-00000004To1-1ekQ;
	Tue, 08 Apr 2025 14:56:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AKU-00000004TBE-33P4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F52C4A130;
	Tue,  8 Apr 2025 14:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEB8C4CEE5;
	Tue,  8 Apr 2025 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124013;
	bh=h30ID7kxAkmaXcFv2JMEhNrmrJvCiO3BqwN0uwK9abY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTyQICnxjgIsAKn2JgZ0kPR14XWipwaBY/rRQ78fgkaMpYDaye2le7nVWMaTAN7kG
	 0SKpDf8WbXUQ1jAkM1T1ff01w5TPdTvq1JT74TfgQ+xEIQMDijDkTRQQFWltyNawlQ
	 wNjfaJFbgxPg6/mfzy8Go9xHJoleqSsLSuzHXeHm9gbcrjDsJkkHpZ2Kl4ST/azKl6
	 TO73uOiPNTLpj/MYaRhO9Z0MX3BFG6BxUVkQbqIND6WlLgdeidSI7uSAlB64IQzLuJ
	 +Scd87R3s9DW1+eEsIN9PPmTJ0ct19pMHlYd9xvqFzHbi9LGaWHZSM0JG0/fADvM+H
	 bbEO8bQwlxNgw==
Date: Tue, 8 Apr 2025 15:53:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 03/14] arm64/fpsimd: Remove redundant clearing of TIF_SVE
Message-ID: <d74ed5c6-4298-4613-a4a4-894aca2663b2@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-4-mark.rutland@arm.com>
 <4b256092-ccee-45c8-aeb0-8af85cd43171@sirena.org.uk>
 <Z_Ueq4ezJyCPEJ6m@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YjRsCf4c48N041z5"
Content-Disposition: inline
In-Reply-To: <Z_Ueq4ezJyCPEJ6m@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_075334_792004_B9488379 
X-CRM114-Status: GOOD (  16.09  )
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


--YjRsCf4c48N041z5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 02:03:39PM +0100, Mark Rutland wrote:

> Yes; we really must handle this consistently at the point the allocation
> fails. It's rather annoying that unchecked allocations got introduced
> since commit:

>   7559b7d7d651d397d ("arm64/sve: Better handle failure to allocate SVE re=
gister storage")

> ... since after that point we really should have known better.

Yes, indeed.  That whole API being written the way it is really helps
nothing here, we should have a return value we check directly on the
function.
=20
> TBH, I don't think we should *ever* change the stored representation as
> a result of failing to allocate memory. We should be able to allocate
> the new buffer before freeing the old one, and if we cannot allocate the
> new buffer we can return -ENOMEM without discarding the old state.

That's probably the one thing we can do consistently.  There are the
cases where we're only doing the allocation as an optimisation but I've
never been able to convince myself it's worth the complexity.

--YjRsCf4c48N041z5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1OGgACgkQJNaLcl1U
h9B96Qf/aSWM1JEw87nbJVPtzV9GvjXsXhCdrjpwRrcVCE1W5sOcvEoBiv0A9m/L
OwNJsE+6XPaWNWWkXGPXrmjnQLTlYJl6gTRpZrD4zFubVKNDms36JiuKHZnX1021
M1mG6cBw0jfEBZaJmoAIJ6Svkms+srrN+HMWalrPZSbldnv+8LW3r9fWkFDGq3Iy
10b1pDYZh5GYWbDsyBdWMKnfFRBQk2hcD0xxLf8rIQET/5A6v9r72uJrt/Od1VMw
dYFA5zxillxCiRWsThZ0hzOVrQdjpkn7xrDSqiH3Kr/I0D8+EOE9edyxqZEDqK6H
M2onyudStuqkxFPBgZRM9yVf1KATDA==
=2ccc
-----END PGP SIGNATURE-----

--YjRsCf4c48N041z5--

