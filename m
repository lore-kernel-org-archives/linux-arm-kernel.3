Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD799E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hARwVT/145HG+VwoR9lImznDX5tym37Rde68MKkZLgQ=; b=pEZYIKp7TpbC5dtgyOAvcK260G
	2RCV5Fnd1JmGfNLLC+prL5eFo7ghBverQCqIdccsqEI0/FqWnPPlIA2IlY6zeNGNkc0IJZ/MWFfMH
	5K+913aUwD4kHQro2lTSIt6rybGSNILPH41Fq5doziRzHqKbDzHtbG2ZDU1No/uZRPh+wbvc1Ps2S
	Stde87Y5OuqEPD6KFJkDmPyewoqAaR8qYf/zAeuZhaF26562y8KA4hKN4vht6JQ6LC0XGyvMgza+R
	jKKa1SPuQgA/vkNLQNZiGery8jGA3triRfWy5gRFRwV7ik/gwCyosSav2Svm05UEMeoMYxe88Z2d3
	oYtwnHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdM7-00000007pjo-44XQ;
	Mon, 09 Dec 2024 12:59:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd0T-00000007jPY-3OZz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C8D65C59C7;
	Mon,  9 Dec 2024 12:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8883C4CED1;
	Mon,  9 Dec 2024 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733747816;
	bh=fU7JocH+KX+BzHCdE650z9D0sioBzhAoJR1baPJ9Ngw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFQDkCw6uBL0azgpIY8eUxNjE6YkBk2azrXe9L+McetcdErtE6/yzZQW1KGkzae8L
	 EIZBNnBm1PTpU8QSOnGTKBEZT0aNQu3tssVIncJExa/mw+gvQS9DnSARFC9D9OaxVS
	 NtMDcw5wdgC6wOgUANPjmm/caAZHx7TL/11Ko3Va4Fp4lHZUVATq1iR3QYtrobj6Q2
	 3NdPqCF+i3f/W3gcallgUb4xTK3JozQOL/SeO0R/dFPRxDmJt+m8YgR1VtwVctYEYl
	 AawGR5NwXDhN+K9nj88MOyISvhxsvxbyKlj8I6fl9aS9S10ttHHz3WMGLpWaoyhNi6
	 P02TeRc1FHPgQ==
Date: Mon, 9 Dec 2024 12:36:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: abi: fix SVCR detection
Message-ID: <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
References: <20241209105237.10498-1-o451686892@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="niIOaNVqrCdk9TWd"
Content-Disposition: inline
In-Reply-To: <20241209105237.10498-1-o451686892@gmail.com>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043657_887557_5B5DF941 
X-CRM114-Status: GOOD (  12.58  )
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


--niIOaNVqrCdk9TWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2024 at 06:52:37PM +0800, Weizhao Ouyang wrote:

> When using svcr_in to check ZA and Streaming Mode, we should make sure
> that the value in x2 is correct, otherwise it may trigger an Illegal
> instruction if FEAT_SVE and !FEAT_SME.

>  	// Set SVCR if we're doing SME
> -	cbz	x1, 1f
>  	adrp	x2, svcr_in
>  	ldr	x2, [x2, :lo12:svcr_in]
> +	cbz	x1, 1f
>  	msr	S3_3_C4_C2_2, x2

This is against an older verison of the code so wouldn't apply now.
It's not also checking the value of SVCR, this is checking the SME flag
passed in via x1.  You can see that the SVCR value is loaded into x2 but
the check is against x1.

--niIOaNVqrCdk9TWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW5GMACgkQJNaLcl1U
h9CFGAf+NOmJS7zfKX8ub3vY7iK8rhpg37EQQlYcPuE5fAkhIyUx6eKqtobU2FzL
fqnPOWvkobsArRBSeUAIAUnahlqn2XNQKGX3XuJHUTnt24IARB76rpGRhXKl5uT4
6JZcTLddrNKi+/B8j+ivLp8iGh6O3u6Hxi/U6f/QsYULh3BABeWsreagh41iDhqx
wLas3NT8PgfnYd3BttsCgrjv5/xjNmmnnj+K17+9/PqIGi3gjeXWFbxRrq01e6dN
pVXbZHt3UzdpanqVZrR8zdhbqyFBjuiZuOI19FlCB1bMyBlk4uYJpT/GmGfnrbag
XMsQsRcBRxkBArPtfXnhufY1zxRm1g==
=gU9c
-----END PGP SIGNATURE-----

--niIOaNVqrCdk9TWd--

