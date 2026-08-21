Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BB2C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bloMdIx1erIxNEo6r5ccnCWGkwjtqp1KC4sGsNoKRCs=; b=YWYe58ED13CQvSQ0aUlPG/ebFS
	4/X8292r+0K6WL1amlnC4Fjd2V5/QNmyH1qhsPrVA/XwtwSU5WxRbPvjXEgkQnQy47HZZLPNxDSnT
	pcIjOjGpSqTDSzeqyL0dJR/QO3C8uvwtsc/rMA1XnmMylbLMn4ad28cKbmDiHfSuohLvnUA5wpbIq
	UlQ5tZT5EgKpUdNATr7vxXAHvXj8bJne+c1lkPdHntXTVmYp58/i44n+uFROL09ON3JXE/hXY8/IK
	EkK1BtN+Ds7U4PY37VCjuLd+gwaqCK1kT+N3B4FawQ2NU2JKEKQQz0avVCxtmVZ9RI+xfqAtpgn4u
	OXnB6uFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxROi-0000000DiAY-351g;
	Fri, 21 Aug 2026 15:43:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxROh-0000000DiA2-29F7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:43:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E51E840C0D;
	Fri, 21 Aug 2026 15:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4051F000E9;
	Fri, 21 Aug 2026 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787326990;
	bh=bloMdIx1erIxNEo6r5ccnCWGkwjtqp1KC4sGsNoKRCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nrl3XYKFmIFu+1hP2ijxIdOKyFmsG2Jq9bgNDI96dsjzOqx47hIL/R5gZAe5Qld8X
	 kKra3OiiP8Hws5o7Ch9sIr2QRFxOc48dAyCdFYA6EsmDi+6KM9op0i02ft10+qcEJ5
	 kkBslkpoBjRdPhg2sfelFCci0Pwdt9BoBLuEdirTmDyhfp0XBCwW1CNE9+j04nbjup
	 R701wcm8KKbXNpgjeto5IssdtWnxMpaQd9LKfiv+UiqyPkwGhYVn2Qrf8VIZDTkH08
	 ZjiKJD1Z23fxG3qeEUjBup29F54DSxTmZ3Zha7uRmiB9tzcfG/DJNfkL6NlLQppqsL
	 iOvW+B6DO/6Fg==
Date: Fri, 21 Aug 2026 16:43:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] selftests/arm64: Treat KSM merge_across_nodes as
 optional
Message-ID: <918c46fc-f6ca-43a7-9629-0d8abb1c1e54@sirena.org.uk>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
 <20260821141556.4065894-4-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kglZDEHs6OmuKvS6"
Content-Disposition: inline
In-Reply-To: <20260821141556.4065894-4-usama.anjum@arm.com>
X-Cookie: Package sold by weight, not volume.
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


--kglZDEHs6OmuKvS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 03:15:51PM +0100, Muhammad Usama Anjum wrote:

> +static bool merge_across_nodes_available(void)
> +{
> +	const char *path = PATH_KSM "merge_across_nodes";
> +
> +	if (!access(path, R_OK | W_OK))
> +		return true;
> +	if (errno == ENOENT)
> +		return false;
> +
> +	ksft_exit_fail_msg("Unable to read and write %s: %s\n", path,
> +			   strerror(errno));
> +}

If prerequistites for the test aren't available I'd expect this to be a
skip rather than a fail.

--kglZDEHs6OmuKvS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIcgkACgkQJNaLcl1U
h9ALkQf/ZCJ29Aa9p/LhguuXln2b5yf1sALxuc/dqCZcWcS4tCu232TPnpB48Skg
YTl77e9f+duMFOuKabuwuopz7r7EI4tcIGFR1vkw0+Y3A3h6JpHwdCgo0EB3lww7
d/ag9bMjCpyzHy/pSzytYu7Zv21g5co/CMtWDZhkgQpBoAZ5EZJdLRGdGiaRqzXs
xlyymUIK2FFSRo+XJ/4AlRPwSmHAXGY+WCm0S+MvI7w9rXZYQAR3MHxOVwS1lTup
P6Dl1wZK7BOrCPaweXvWQ7n1Ts465xLcbkn/y8rmzFNsSCaNA8yRW6Ktx/iU8Qtk
gqSziD1ZuEwvUmR6D4aBIBRR/GJBqQ==
=PW0u
-----END PGP SIGNATURE-----

--kglZDEHs6OmuKvS6--

