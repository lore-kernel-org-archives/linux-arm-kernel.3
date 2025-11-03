Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B655ACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93FBKrK0toqosvLDln27pA8mtH7ilIFrTvv6JsRg2ss=; b=gTeDm8kejz3zVIiicas1X6AgVQ
	P+B1UW/YxhbRFulIxH92gz39yKerSdsZVJprqQHR+ut0k4YeeBEP6J1WrfPsoIgpqcQPGo01Tyc7x
	+xD2a8BFYy9zv9Nt0myYAGQccoUsYhZ0UVQnVEfsPhCm5DYhdn88DOoNZs7jkSQs7KEAfgt6fh97+
	xMC++JwDQEAxNiGSQW0n/QW9R5VL5qzqTjBDHaLJMLvO858w7ihryDf6cbyFdTt5EcaIcDrEg5NNK
	LyAOqFVbSW7S+ozZzVu3gjd86jqxoCZuZFjTyjyTWQeHSRPusVHJljMR73LFwHgYwCbV/q9ewhzIY
	u085QnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxKI-0000000AFx1-0ZWP;
	Mon, 03 Nov 2025 16:22:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxKF-0000000AFwG-2gcJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:22:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5103C43436;
	Mon,  3 Nov 2025 16:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EDEC4CEE7;
	Mon,  3 Nov 2025 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762186955;
	bh=93FBKrK0toqosvLDln27pA8mtH7ilIFrTvv6JsRg2ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJHdEwDV9C4QptAxVCFZz6DjBvfRwdYFCCEA1JO4GzFVJpaeF/mZoYwy3xP2fRKkd
	 IdGMbAFwkOvGDurcVGnCenCOcoP4ygIh9XNhXh+rmMjiuqFpPSvzYiIhLd343CT3jf
	 Q6moRwBooDU8gsg6reguK04iUT/v4Himfbh8MgWRP7OIIzso/c9ZkrYORJ8Z2T+rNX
	 161FW2ZnK75SG3F69VI1PFR209K/IyhKflXWPr6ufX7iSBKe/xYUO40/M+VyGWd5bw
	 OwF5EdYzMvXjDIs2hn4vp5/bbotv0a6kCC4VxJAi3A7tQO4UJebcKElOxAaoCqF4qD
	 aNhq3528ce5VA==
Date: Mon, 3 Nov 2025 16:22:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	linux-kselftest@vger.kernel.org, shuah@kernel.org, will@kernel.org
Subject: Re: [PATCH] kselftest/arm64: Align zt-test register dumps
Message-ID: <aQjWyM9Eyboav5R2@finisterre.sirena.org.uk>
References: <20251103160417.1023545-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lnNBZ32XwriuUaA"
Content-Disposition: inline
In-Reply-To: <20251103160417.1023545-1-mark.rutland@arm.com>
X-Cookie: A mushroom cloud has no silver lining.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_082235_694269_5C48C5DE 
X-CRM114-Status: UNSURE (   9.56  )
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


--5lnNBZ32XwriuUaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 03, 2025 at 04:04:17PM +0000, Mark Rutland wrote:
> The zt-test output is awkward to read, as the 'Expected' value isn't
> dumped on its own line and isn't aligned with the 'Got' value beneath.

Reviewed-by: Mark Brown <broonie@kernel.org>

The other tests all print either a register or row number after the PID
and iteration but there's nothing equivalent for ZT0, the newline got
deleted along with those logs since it's wrapped into the number print.

--5lnNBZ32XwriuUaA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkI1sQACgkQJNaLcl1U
h9Cx7wf/bR6vlLy2s6mopoo2jg7WKsRYwpZil6D18mN+KgBkNsuHa37wpbcWa8KH
LD5oRHAFT8yPH67RoQagBbgWJH08bbKJTChT/kzHGKN2M9RJvtNwZPRVO2g5SBmx
666C2q1ROkLMTocaWaXmJb2I/ru/itfNwg5v4u1JtFol9k/i06BwjySrrHf3HslC
7swocDKz1ucp3a+H3d0cWjJ0fZIMonVw7/kylOnxhHRA/Y9IthHKJRGOZHTnLAxT
lX5JV2VhK2bLG2UM/DvSl4Itnxg2/XLCq7px1/TTL7APeP1Xt9whQKiQuDYqMIHJ
JFicZpB956ZXA1VOkJqWixJKs+lrbg==
=m3CS
-----END PGP SIGNATURE-----

--5lnNBZ32XwriuUaA--

