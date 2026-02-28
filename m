Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85116FEE4EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT4OxFoltA76Dy7s67BSFQFUDU+OlZvjlXl9y1ridU8=; b=y9BV8PGq0VeGjxXtY+8+Mvc/of
	o983wAwP+BmJWKw0K/7uCkTJrZ8upZw/wYeRvXilSWYrh9IsIlKRx3969z0PEDJQ2CbBs70KX/kGu
	M6kwsIYObQz9+Q7D7nMw4N5NJfFMB2ITRereSiZ1iksOo/z/oBmOE3ozHaVH1/N6ohWvC4EwNRcji
	KAe5uLcrOhLYKhgnAxm+LoFEoPaWl80kjG7oSZegmQ1JdPPqimjDK2ey+ZUKwRagf/ij22hVpb2ZY
	RZ8CqAtSwyMJmeOP77ot7qlC4cx7hwbUm7FxoH5s5CICX9bSL2NOg5pUuPSgViWhY6L3CUFOcY9jq
	tt7bpnSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKIC-00000009rrx-1Fgc;
	Sat, 28 Feb 2026 13:23:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKIB-00000009rrr-196e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 13:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D2B26001D;
	Sat, 28 Feb 2026 13:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2144C116D0;
	Sat, 28 Feb 2026 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772285014;
	bh=4Yj1EOrYm8+kTVyue/2AFT2KdrUGzw+HB8PkTXeSxio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chjrN0FdkuKv3ZAFUO1jVGIdRk2RZv+HZ9rWxUG7P52F1QwhWZJSnWgmJZcMOwNTL
	 YwxFqgTUuZfnt4ThNmWJrGv8TW417QRhQUbkfOwykDPBMH5H1VnucMa0X1wzy3KRqy
	 bgGtM60agNLBzUy+Za4e5dDBzlKsD2shgd5+6R+5AldNNgr6PEacB54BSrH0BWEzVQ
	 udh0tPAMI+ny8LtuixB8kgyAY0pQk1n8nx+xEJ0Xmxn5LlKerpMWbNczlNI68GbiP5
	 bH13AhoH4pBlqJUxxOs/T9FYJd4yY72GriCPDr5y83+FHmIYrDGHb7o5LYa55CloCI
	 9IuLGCcLzsmMg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 533B41AC58E5; Sat, 28 Feb 2026 13:23:31 +0000 (GMT)
Date: Sat, 28 Feb 2026 13:23:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Yifan Wu <wuyifan50@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	xiaqinxin@huawei.com, prime.zeng@hisilicon.com,
	wangyushan12@huawei.com, xuwei5@huawei.com, fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH 1/2] selftests/arm64: Implement cmpbr_sigill() to hwcap
 test
Message-ID: <aaLsU2sBQh3nW9c6@sirena.co.uk>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-2-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ASHESnB7++zp1NOZ"
Content-Disposition: inline
In-Reply-To: <20260227031933.4103333-2-wuyifan50@huawei.com>
X-Cookie: Think big.  Pollute the Mississippi.
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


--ASHESnB7++zp1NOZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2026 at 11:19:32AM +0800, Yifan Wu wrote:

>  static void cmpbr_sigill(void)
>  {
> -	/* Not implemented, too complicated and unreliable anyway */
> +	/* CBEQ x0, x0, +8 */
> +	asm volatile(".inst 0x74C00040" : : : "x0");
> +	/* UDF #0 */
> +	asm volatile("udf #0" : : : );
>  }

I don't expect it to make a difference but it'd be nice if these were a
single asm volatile statement, just to make it absolutely clear that no
instrumentation or anything is supposed to go between the two.

--ASHESnB7++zp1NOZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi7FIACgkQJNaLcl1U
h9D5ywf+PpCU63C+509/td+BWIUvUQQGyyK0Dt72wx27bQLQA5hKa2z3GggUFE4S
JSrtu+H1qBKKvgyuC+SnhEj0yTHWLrGMg7U4kCVEsg5bHT+Z75wMq/cBWzIYFKC/
v1jc24ZvGYUxasv2LQlxbphC/cjGNidebrHkdl+5+M04Ov/CTFzuBbTj4KqbLZ6n
dWOCQr85IgFQwzI+GqRpZG4ajhXjm0qZibgyTeDAm7JewFP1QFYO7+GY19PCiK9r
xnHRjGUcZb4isNjWXiMOo4p3Aho8FtL06JTIVkxT428tdvk5tGrJm1y/pHvamXaG
f/tdSX/RJGv0qP2W138B68L3kJwZMg==
=16LT
-----END PGP SIGNATURE-----

--ASHESnB7++zp1NOZ--

