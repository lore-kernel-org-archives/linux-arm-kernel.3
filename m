Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B013C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjY8nihSa+14PYvQpMxpTs0m3kf0MoEea4JV54XPQY4=; b=1DnW1xHTw2kh35FuIDrK6HBAD1
	lyQVPvELPSm4PaQCdwO4g4pL/NrTR91f6KWobYzRSHpPAcuhgjCu2eN5FDICw/4qxxbIyANr/kTaG
	+Gg2Nk4wd+h1jdib275uFmbTvTIhU5km6U1oTTc/f8+TY+TqHo1/qnQbBKxXq9h8/F+hqITzVqqql
	PB0dyLC50hrWW2w3SXJd+hWeBOsB53z/gvdG3Hd0tSLCwHfqjhr/vuixKqLDoOsHmiuz/Hmelr14X
	M4lmGTxqQyF9Ec4zMf7BHqiP5AwQ6+a+ggvhnHekbc/DLIqt80w0S0HbkDo0sOG89pYm7ZypBfHFk
	l9EXVl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrfj-00000000ufm-0osT;
	Tue, 25 Aug 2026 13:58:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrfh-00000000ufW-2RYM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:58:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E929B43AB4;
	Tue, 25 Aug 2026 13:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2862A1F00A3A;
	Tue, 25 Aug 2026 13:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787666316;
	bh=bjY8nihSa+14PYvQpMxpTs0m3kf0MoEea4JV54XPQY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ggZV74CzysRLzkvXdqoL33TiYoBioJRkxGdThUYBXfTwRjYL9fSP0lYjJMjp1pNOY
	 NhQsSorURrAkau2/oLfr5en++cOyWiXXmofla/l9CjWUHURmIwWrScbA3fM2qXwBcw
	 ENNp3iOYziT7q8xU+QhuyDfbH5YhB+/T+aHBniAoU7G3uPoqyJ8D79KKJzZ/Ju1c3e
	 NLJFTysNJFh3jyXptOJ+LhxN4SX9UDHkJ0MbwD/rKpDbHnUAMvXT9jzixeH6xnYVOF
	 Z0T6OhvPA4/dqGegtXXooob6mZYU0h0/cxxBUau6G/6S+wwktSW+s1vwqMrmqZf4zv
	 hLcdb2pZaPm3g==
Date: Tue, 25 Aug 2026 14:58:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] selftests/arm64: Print missing MTE TAP headers
Message-ID: <7eb6dd48-dc45-4c94-a4bb-cd09c6ac4045@sirena.org.uk>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-2-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BgV6j/ngKs/TWJZq"
Content-Disposition: inline
In-Reply-To: <20260825111929.2882324-2-usama.anjum@arm.com>
X-Cookie: Exact change only.
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


--BgV6j/ngKs/TWJZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2026 at 12:18:34PM +0100, Muhammad Usama Anjum wrote:
> Most MTE tests set a TAP plan and emit results without first printing
> the TAP version header. Direct execution therefore starts with a plan
> such as "1..20" instead of "TAP version 13".

Reviewed-by: Mark Brown <broonie@kernel.org>

--BgV6j/ngKs/TWJZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqNn4YACgkQJNaLcl1U
h9C1KAf/TOSuU7iQfwTN5kCkWjoopdtHlE7OYSYpBiZTvOzRy4epYZUkl4rgFnWh
bkHUiGgc0c1jp9tuoPncOHVI5u/wpKGEwQ7m1AGUFBMkielIqMzgwe3Q+EK73B3i
L8wT24DbIYy1jHHuq9n3QSjUbbXIWQxtiN92EC/invE6XMixPNiflB/fl1lstFtA
/LI00EDzBABXvy05IloMYzY2KyGTGZdU3S7TboE61KhnZsUBF10I88wWx7oOKZdn
JSaWPRZ4JjFivqH7zTQ1HUNEG3Rf9IoodD+V7j9pR8OPAootdfl8iXvgOkAc2drl
sZdztaQV67FJcMw9XT9iWQyTAYj6iw==
=k/nT
-----END PGP SIGNATURE-----

--BgV6j/ngKs/TWJZq--

