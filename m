Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJg1nXP5WH1KbQY/FrFCHWpaeAl6AJoKHRnKylOHvYw=; b=0jOBozwShr8M/YCPkX5aZztTZ5
	1iYpH8SzW01MKoqnVEsh3dZnpm470Pgz/PE32C9G564Zeuupm3Bu81CvuJEKwxclWHlZo11q7QplT
	f7isX3YsiBZq5ehptZ5UIGdryvrbndPFZTX2DRNBEBrPr8EWn4MXm0KDQle+1PZKRERQiU2XyW+7v
	WdYNpThG07ZxptAe28Fe6+5qDOvaZz3xhTeZQ6+m7eYs0aWbk+S4GeMPgsN4S3ND3m2fGBOL50FYM
	74p7JXBbYu1DlYRZqicJH5qJ8Hdj2aTAGUPXJOWyK8e4bU6x9gmdUcwB36cX0MtvexxFFZ0P6mrZo
	V3ElSJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Mdq-00000009FgR-3fDN;
	Thu, 03 Apr 2025 15:38:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0MXX-00000009Eqa-2ZOs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 15:31:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA7CAA43E67;
	Thu,  3 Apr 2025 15:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6767C4CEE3;
	Thu,  3 Apr 2025 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694294;
	bh=ywX+w2ejjtUoTP/P9MQhvoCasOtZWG+Jw8XsR6yk9go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqfZ6V6UNUu3lFHFKlnWCFVf8rHkyRYnqyntQk3cBIEeN9D4/LoxCTSZJgW7yfBFw
	 miqP/U+jpNlGpizBr3zB6cTiljXWfDLbAYLk+uRYUpf+vZ5Vq6EL0PPf7LHOEBuP6/
	 vZ6IlzmuWuJ3ExrrU8Z2/cwIhh631e1RU4YiY1+VZUxfvvoAsWFmajL2dyn0AjxSma
	 oCAMfxcoCySUelgF0jbMD7mQWKiXkECfibQzjHMBpa0Hi4lN8mDa2jZUaweIfFi3MA
	 PSx5rzUZimG/QHVy+IrlfNtDP+2+y5nTp/2sSL4wqQKtCSLOxrCavn6nlDNngJfQAi
	 5ofujHMot9g8A==
Date: Thu, 3 Apr 2025 16:31:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, yury.khrustalev@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com, james.morse@arm.com,
	mark.rutland@arm.com, huangxiaojia2@huawei.com,
	akpm@linux-foundation.org, surenb@google.com, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation/arm64: reflects FEAT_MTE_TAGGED_FAR
 description
Message-ID: <93497fc3-3da9-43f1-8b22-cf0d3f3e7de2@sirena.org.uk>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
 <20250403141535.23496-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxRN7uTMagz9u5lh"
Content-Disposition: inline
In-Reply-To: <20250403141535.23496-4-yeoreum.yun@arm.com>
X-Cookie: Logic is the chastity belt of the mind!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_083135_731033_6A7FFCE3 
X-CRM114-Status: GOOD (  14.01  )
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


--oxRN7uTMagz9u5lh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 03:15:35PM +0100, Yeoreum Yun wrote:
> When FEAT_MTE_TAGGED_FAR feature is supported, the value of address bits
> [63:60] is preserved on synchronous tag check fault.
>=20
> This patch reflects the above feature in the documentation.
>=20
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  Documentation/arch/arm64/tagged-pointers.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

I saw the subject line and was looking for the elf_hwcaps.rst update in
this patch, though really it should be in patch 1.

--oxRN7uTMagz9u5lh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfuqc8ACgkQJNaLcl1U
h9DNfwf+LDTdUjy+phURiCQ64ZN0TgTHnloTqsXKJJLs2WB63AGO04uu9pLprQ8q
H5VcxoVmgSoFdTh0eRWorj5490VGcxWXOEBKfL3oe6/EC+KH+5uWu1RzUuV0W5Ff
Rr6NRfix45cj4OaYCiTOxdC7+5Tbb5R76t5R+UFJn3Ap7fIOlT5l8PAnLMmsNzNu
atAAI9WFGAS7I7Vu9CKjnFEwOhL200RgJNFpzyS+gg6WXlfMc3zaRCEoJQ0K/fgF
wLhgmuFE2xk+ZoOBykztgNhGy0JtnrW/5csyLC1cGyEYsxz6L3S2bFqjuxiruCcO
rM8gtkBASbMayS6KsVHTWp8RlbIZIg==
=BWMY
-----END PGP SIGNATURE-----

--oxRN7uTMagz9u5lh--

