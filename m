Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429C9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aV1J6MifAqAJ1Jq0WWRrntWcl/8qrLrWiHHgvEodlsw=; b=3SRQqbhmG6j4nP8eCo5yukBJth
	jMWz6xVDW6uOTgmjKVAvj5jiCpMVJFwe4iJFirZbivwgwtpiahPeMchHDu119+G/L25AEmhHQZuur
	3xtgWXhaKdt3NxYebx8xGhJf0Xuy88TJVcvidJ5kVEB7xErMEUa+MvsDTMrqoPzZQp488gWDO7uaa
	bNYqCBgZm23efzwbzFWmo4d2gn9nC/YjVH8rXDDvSL8qbdHX9RgcTiYsJBuTS4C3VB98RrAXshBgE
	u7HeaAbsWXXsZ0eZ6UacHYAKfXZ2ZgIBBaesNFzHPftzW+YMVXOfmqBXF+tQg26y/mN7qlQK5TTAs
	uoTBi6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJKb-0000000BWyl-0l9l;
	Mon, 16 Dec 2024 22:12:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJJI-0000000BWoN-3G3e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 22:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48EC6A41B39;
	Mon, 16 Dec 2024 22:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7589FC4CED0;
	Mon, 16 Dec 2024 22:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734387087;
	bh=aV1J6MifAqAJ1Jq0WWRrntWcl/8qrLrWiHHgvEodlsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAuDIdXRxiy7LoqcKDg1yIU7cZNBbFDNz3F2w/LHl5+U5qirzcXDa34q4UXCS/xhE
	 KqcQwIuU+oalAdVZX0SyacRyvHw02C3cbodn21yVcr6O5TtLTL9Tcf440XUSbcS2Y5
	 HUQ/tLEbkGaisiKIRb/0DyKLYnzP9rEA8Pz/mulFHoYVUjgvbXEHlioKjASJW/0zcL
	 eq0oW41Z1rPxbFIGjSaEvvi0h1myyyhwo/km4hf7YW21rODc39/gDtVagtMcahl+UR
	 nTgAf1TlRKGh6UX/lt6QwsQM+wXKxGylh+SEa5xTM/C1NS29u6rlAB7eFPuslPn4CL
	 fxAlPpAdRjJ+Q==
Date: Mon, 16 Dec 2024 22:11:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 12/46] arm64/sysreg: Add register fields for
 TRBMPAM_EL1
Message-ID: <01ca449e-b34d-4833-941a-4aaeb197b28c@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-13-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z7aSgB+b+DyrUt5q"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-13-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_141128_878989_28E73543 
X-CRM114-Status: UNSURE (   7.70  )
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


--Z7aSgB+b+DyrUt5q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:37AM +0530, Anshuman Khandual wrote:
> This adds register fields for TRBMPAM_EL1 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Z7aSgB+b+DyrUt5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgpYoACgkQJNaLcl1U
h9DhWAf8DObkHaJw3p45M7h0LKyURhsSBHONCy1NsNNHrMKVgjxmWILSQusHgA5Y
JlqE4pb1xspixa/eB+wbdC8QOb0tdJ0e/9aWxlJe2C96HTawajMmsC6Ne/++IC7S
d/0ShOIWFn/QPcSChyIdf/5Su8SG2qSYdmRMpvKfYCwrEXz0WQzlojwNk2nebOzM
CtOWpyJ+EgihefQbW4l/rjUo5MwXFchsxylpkKQ4xX6gdIpJm+iSDe2OG4T2N+ut
NKiXPTZAt5bu6JR6dpl8Ua3W7JjAzQzl/PvdBUt/m0/1Lohkm5JuCv59n5UEfefF
VSEc/dpRvMZMus5QDA8q5PQUkj60gw==
=32OO
-----END PGP SIGNATURE-----

--Z7aSgB+b+DyrUt5q--

