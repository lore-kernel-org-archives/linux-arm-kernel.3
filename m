Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C585CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjnOtSoAKluHBUYkKgFPRZc3qkvy8iRwCj2TNbf/AVo=; b=rmVKpjJbD55nFwp+fJErQfqzld
	Ujy9uAjU9NVqrHjZ2+ytrlEadtOfKilXZel8CLG3pRDDu1e6vrDzoLIOolOmkBeBo1WI/RdKclFEf
	Ah0SCXSSjuYYJZgNrueu3MYDKy17AfkFu2hXe9dCYWgtQh+neMquJ5pA41TXGnT2h9E1JhxWlcraN
	TYhW9jB6Gq56xO8a9U/timcwhQedb+bFScSqO8p+fXTYxTWtRVYWTZKkdXBmpjqhB+kFd7rZC4esO
	Hwvq4R2QZxc2OUxMRx0MvwLXL+GvkdA1FqlzKsnzAITUB5ApJCmoPXZ1mgKYzfOb8cvto37ddyQ05
	Wfhl7/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxvj-000000035FF-1zZI;
	Fri, 15 Aug 2025 17:09:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwVV-00000002rCR-34FG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3D114324A;
	Fri, 15 Aug 2025 15:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C8CC4CEEB;
	Fri, 15 Aug 2025 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755272296;
	bh=ynfE8kuAaAEGGLj8ZZSR4SpHdIFRt2PRvN/8CmoDgW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2srh0kKEmG0TLMCVwfNkB4zdNI46zW3ogTio1l643B48daYwxA3kYJG97V7RN9sh
	 RzUG399113TOBnA8YGFcqaXLRVFLJ0Ipas+AbG7UFmV1HqXwzTMUkBvorrIMlAfgzy
	 ctTGiwkiyrYoZaK9a98d9nZvPRFuNbcby4Z15sBbQfKkiIL11iI8l5lUri2UnE9bQZ
	 y/cEKqjUDX7wQXLoxAHaW7ikX4i63M2WeHGG7gatNwhPql5jAuhbd+0nqEZFc8Q5kx
	 wu0hl9nB7lCr78wQrumtfnwIe6hznlkFqEUd7t8FNfJlZ1QowQ/wr3Z4j6dFJ7xV+l
	 l+iDdCyG3Rblw==
Date: Fri, 15 Aug 2025 16:38:11 +0100
From: Mark Brown <broonie@kernel.org>
To: 15074444048@163.com
Cc: catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev,
	maz@kernel.org, joey.gouly@arm.com, james.morse@arm.com,
	miko.lenczewski@arm.com, yangyicong@hisilicon.com,
	robin.murphy@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	lihaojie <lihaojie@kylinos.cn>
Subject: Re: [PATCH] arm64: cpufeature: Replace inline with __always_inline
 for GCS checks
Message-ID: <4ac4f0d0-fa5e-4c47-bcdb-fc2a65450848@sirena.org.uk>
References: <20250815011905.1368058-1-15074444048@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="caUVqYPC02RodTZa"
Content-Disposition: inline
In-Reply-To: <20250815011905.1368058-1-15074444048@163.com>
X-Cookie: Tell me what to think!!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_083817_786525_9E66C921 
X-CRM114-Status: GOOD (  13.65  )
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


--caUVqYPC02RodTZa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 15, 2025 at 09:19:05AM +0800, 15074444048@163.com wrote:

> When use __always_inline The compiler will almost certainly inline
> system_supports_gcs, which allows the compiler to optimize and check
> earlier during the compilation phase. If system_supports_gcs() returns
> false, then the line of code restore_gcs_context (&user) will not
> actually be generated, so the compiler will not report an error.

> -static inline bool system_supports_gcs(void)
> +static __always_inline bool system_supports_gcs(void)
>  {
>  	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
>  }

If we're doing this for one of the system_supports_foo() functions we
should do it for all of them consistently, not just for one random one.

--caUVqYPC02RodTZa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmifVGIACgkQJNaLcl1U
h9Bzlwf9HozQmAyb+RkhSQzwYx5HY1E4TULvMLAY3bE0I7jieEIJDouBY6HmeJpz
mNXjH+hVpx2fQtPbiO9Aum9WPW6Je+/XQJXInf4ct5v9lQOeYUNSAsGXvK2LCSNw
48UB+t/XvJHti3XJ52avROTpauD3+VDuGRwRkXBs6FvcxstasyhvhvXmnbgfxqJP
4lllWILmdxnCpmkseAquih/U5Uo2V39L/C7STJuidnrljqtSISzE8LD3CvtnO47W
00Hsvf+lPDKVfOKHZZBHIuXQZVFIdG2JyfLkCIeZeX/zJjLMtvpC6Q/rHRhZuCYq
NPag4h7iOpndV6uPMczgHrOG5XedwQ==
=TaSe
-----END PGP SIGNATURE-----

--caUVqYPC02RodTZa--

