Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D11CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcwxqT4TVtb+epJim5j/G1nchvLYtIfA5lCbo16Xoag=; b=QO7ZyJi/CXgfrUS9o1iIe0GVm9
	uqtY/8gMC4LOt0eYlTWUmugdzunGvU2jCu476DaQIlB4m+xpAGXonvded9++i5rCT+ISh266UNUw1
	NHsWd/EYDLWUmv4wMDkQuzzoykec5qfZYIdOnHceppDqVQSgV19qXy8Dkl02sKZSowMOayx07j0sg
	j8eEUQUvSqFIeQ6PoutRaH/NmIHZVYCy0iBA9W39gwk74skks5VqVh5RrKZ0A079ihEzUa1cnR5y4
	l/6fHP+pF15PuIRAHAL+Ri5m966D2ULrg4KPS8i61n7LX3YPuNueFU4GrriNZsbOS61REs9bTZe+W
	k6pmqvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1sA-0000000Foke-23l4;
	Thu, 06 Nov 2025 15:26:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1s5-0000000Foiz-00wH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B500143FB0;
	Thu,  6 Nov 2025 15:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E04AC4AF09;
	Thu,  6 Nov 2025 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762442756;
	bh=FcwxqT4TVtb+epJim5j/G1nchvLYtIfA5lCbo16Xoag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOsWLfPQi1cmw0/HB5N+eY/PMCPnGwKT38MFa133tw5Iyu+Q4y11IHLyJXxf+HSmC
	 pwEwnQDb6M3NKjhti7Y62k2/46VuWNaneXsduaCvVbx+dT1OYwaaojqFp1xG417ZUC
	 6KHbt7x9oyFuyd479cUiY0xWANYYGECg3N2RudSzW7ouwFiHKWpfJWQzfNetFu7YAj
	 KEYYlhBiQ6Um2DzNzcvF3JRQ/NYqVmptcbWSlNqekpK8VZfM+tNxojZydRUKW8YQfo
	 RxnuuO8iHy3goa2hB8dWFOSWMROnRO1OurmHf/jR/Io5vkmTgVe21d22llFlXpdsky
	 w6f7xy3GCX92A==
Date: Thu, 6 Nov 2025 15:25:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Yicong Yang <yangyccccc@gmail.com>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com,
	james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com
Subject: Re: [PATCH v3 1/1] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT
 cores
Message-ID: <aQy-Ac8h7Y5tuECQ@finisterre.sirena.org.uk>
References: <20250922033010.4596-1-yangyicong@huawei.com>
 <aQyxy3vCbk-Ux9Zp@finisterre.sirena.org.uk>
 <53c1490b-79f6-4661-bbd0-9d087bddd5bf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ospFUDxpRYxoJ2UX"
Content-Disposition: inline
In-Reply-To: <53c1490b-79f6-4661-bbd0-9d087bddd5bf@gmail.com>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_072557_076816_5C9098B2 
X-CRM114-Status: GOOD (  11.61  )
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


--ospFUDxpRYxoJ2UX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 06, 2025 at 11:16:52PM +0800, Yicong Yang wrote:
> On 2025/11/6 22:33, Mark Brown wrote:

> > The above function is inside a CONFIG_GENERIC_ARCH_TOPOLOGY guard, we
> > need a stub definition for architectures which don't have topology
> > support or for the users to have guards.

> already sent a fix out [1]. sorry for didn't notice this :(

> [1] https://lore.kernel.org/all/20251105103849.4093-1-yangyccccc@gmail.com/

Ah, great - thanks!

--ospFUDxpRYxoJ2UX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkMvgEACgkQJNaLcl1U
h9DFXwf/f8ksqf7uKJnYidRgX0QHnlpiLLzkr53lQ8ivP1B3ygzjmbFyn23iq1tu
7DuZLYCpVVsdvrlJCV4piwhhBa8ohqxkAbTNaXCvRZFVRGabgfn41AgyGiLp3NpE
A86eQAFayuJLRonmvf5/OADji9/am2xytHL6OpoSjcLrdgtSFTWc55l5vYQFO4CX
Rg0LG6ro1vOyBoZxhg6hLA1nz/prPvNEJ/DWSVAcncErqCMwm7Iru9BqALcjKAyH
E1aY49S1kRo0NunKSu/ZSHZNGMJVyYRyY2zJitej4NCrue13o8zasqNkmyJ/61Yy
SCaexfSTDDieHBlch4Su1WDdGVEe/A==
=7MJm
-----END PGP SIGNATURE-----

--ospFUDxpRYxoJ2UX--

