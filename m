Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECC6CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 16:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dSso2N5KSmgLAtF6av/17DEDuEYDtbG1/oPAIfoiKc=; b=WPyxywquapBgEPn28yadXXxLYJ
	Y1PX7uzvrqNzyDPY/ozUgr3+XDpvGh8tiMAN9eJMrwSCBo6N5nTyVWw4R+ww0hcsgQQMLVYHbKSqx
	Zqlcf18w78rB4Tg70sMYq+EZbcD2zajXWpIMwElIx3kUcCCdFHMF7Jn9eLOMoGVodVaYEp7h0eehd
	V2kpkPeyZu9DbAPHX3nZ28qOMFT62AZyHyrW55jkPu0xGO3N22VzFRVVSVxGBXc9ZE6FzPrwQS8OL
	+Lhz095dg+9WKUcdPSS58Lt/hvMb7SbclNs74uJjmvZYhsrTPvDK1CG6GX2HmqAXBTe4AIovak7Mp
	ZW/z842g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqa6c-00000008fbs-1Jw8;
	Mon, 25 Aug 2025 16:31:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZGo-00000008XnL-2MLb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 15:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA257431FE;
	Mon, 25 Aug 2025 15:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D9DC4CEED;
	Mon, 25 Aug 2025 15:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756136285;
	bh=8dSso2N5KSmgLAtF6av/17DEDuEYDtbG1/oPAIfoiKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7dnuw1w/7MAem+AcLipOzAy0iCDUH7w4/SZXtFKRKsqZZJO2yeqW0wyYd0G1i42h
	 DfRZNdI5NHreSJjkOmj3LSlewz5Y7TcKmqhxV6P+SWJkRBKM2wQ0l48LrHvSJ7wTun
	 5SrD9iAZNhItWJ3tPrkNqRDuRQ3ble0YbzwYeEmulYrKY1R5x7KZvnWtktzDGJDXTj
	 XERIdtUaRD2on5rAuMD04elNh7XXjibF8yZLf7qANzMqeC5+OtTS0Nq+UIGa4r6GnR
	 w4PHpS5KN/fk81JazgwrWcCy13+pfrVy00v43ibaGCNpEsnX9JcfGupQFGPB4efdr4
	 ifYM7iNhRRDzQ==
Date: Mon, 25 Aug 2025 16:38:01 +0100
From: Mark Brown <broonie@kernel.org>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	ebiggers@google.com, martin.petersen@oracle.com, ardb@kernel.org,
	thiago.bauermann@linaro.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] selftests/arm64: Fix typos in malloc return value check
Message-ID: <aKyDWRkgv-BAtuDc@finisterre.sirena.org.uk>
References: <20250824131647.490439-1-zlatistiv@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="miGEQnQWrbritfVa"
Content-Disposition: inline
In-Reply-To: <20250824131647.490439-1-zlatistiv@gmail.com>
X-Cookie: Filmed before a live audience.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_083806_621188_29D37633 
X-CRM114-Status: UNSURE (   8.94  )
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


--miGEQnQWrbritfVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 24, 2025 at 04:16:47PM +0300, Nikola Z. Ivanov wrote:
> Fix double "-ed" in malloc return value check

Reviewed-by: Mark Brown <broonie@kernel.org>


--miGEQnQWrbritfVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmisg1UACgkQJNaLcl1U
h9ASfgf/YGmdSiL8/P92y//a3VVs5MwJXjfBPqxoEYDuK+QDU7k3D/eZ5UdyAuP6
lpxJgjVLT23t/D2DLtfcjpfBEtfbs2iEz7gRMALdMqEM8OeVZfiVqGygYiCT4ggM
zPGq8BSie2C3C0SNP5z219ldAPWl2bLLF6RqqV6RtaZWXpuf54VBGblB2+cTp+X5
OqOWOjf/ese9TE+bNTO+cOTm60SdJanRrBGG69YPvQfWGdKsBBE3yTxE5JHK2E4L
Qbvw4tFGrzQfqYb+FWu96LFETn9Mpg0cLybpJgXPBt8hcmjXcn3n7KDI7D9GQiOq
8OvI3cKjYTPX9tWlyh3T49v6HJ/EMg==
=aEbu
-----END PGP SIGNATURE-----

--miGEQnQWrbritfVa--

