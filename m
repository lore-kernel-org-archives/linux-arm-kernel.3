Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S43y0m3tyKSbLzLPY8izdYm9kJrJvv8tLOFrmfdNees=; b=e/C81vEcEJuNi7BsZljkmup0Mi
	MrKKos9xl98daUBJrRFGRw7Ky7kErgmCbmHzaO2BLtIagVIqDF8MxqcURuNt4XDMOwS1r1LtKYdZj
	k5ll6S0gzoiN9oNoqkUFcUEz5xMlP2A/C+Uo9udq8V2THZmjbTC17KMnbZ9Vg6Gwf00UDtFNHKDci
	Glb3Dxs6lWgSjyRYwHxWQZwqSa3upjMEpTPrZYjXAcau0/jaxXXO99bWrFjj9RotNruNwRfSiSq0i
	0jpgc8biSVAkIc8S6ywADEotLcJBjxJjEGv5ufB72k7kEOoprAkK4TvYXZtBrygQxoALAI3L9YNyL
	64AAwV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIXD-00000009meP-37ry;
	Mon, 13 Jul 2026 15:25:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIXC-00000009me6-3mlm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:25:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 63D3F4115F;
	Mon, 13 Jul 2026 15:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BA0DC1F000E9;
	Mon, 13 Jul 2026 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783956330;
	bh=S43y0m3tyKSbLzLPY8izdYm9kJrJvv8tLOFrmfdNees=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PvjiS1ySjBxGgAFmCGinmhv4SzIJetqPWK2oOsciLLvUzevNxwZzKrnKco5PyQaU6
	 BKsTYAPKR2J6Kh0mjgr/UclLbvazIBakYOB+FcrL5D+5dtZhW3gOkHsROEsZgQZE6D
	 9UBWSqOBS6Wf13NAaVRxumh0TmZ/MB8ICez37rS9TBQGhpjtmgHm9U+g7PMrBhBPjY
	 uy+wc1HWfhUwM6vsLtQ6MtxzDg/5AXZh+rSFcOxkVwqu8HUBUeRFxFftRsTY0k6QQo
	 ctKIosS1KYbxU7YFv8CMc5GjmrYw89ZD9XyUP81gcPo4lHL9ueX8D/Tpd1ngcd09qE
	 kLD7Z/PTiO+mg==
Date: Mon, 13 Jul 2026 17:25:27 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/samsung_pwm: switch to
 raw_spinlock_t type
Message-ID: <alUC6X7GgvxPUelM@monoceros>
References: <CGME20260713085705eucas1p26616e64d55f903a6f87dd67e8f8da1a9@eucas1p2.samsung.com>
 <20260713085653.1145015-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oqbewf4c2d6juqpk"
Content-Disposition: inline
In-Reply-To: <20260713085653.1145015-1-m.szyprowski@samsung.com>
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


--oqbewf4c2d6juqpk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clocksource/drivers/samsung_pwm: switch to
 raw_spinlock_t type
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 10:56:53AM +0200, Marek Szyprowski wrote:
>  drivers/clocksource/samsung_pwm_timer.c | 22 +++++++++++-----------
>  drivers/pwm/pwm-samsung.c               | 22 +++++++++++-----------
>  include/clocksource/samsung_pwm.h       |  2 +-
>  3 files changed, 23 insertions(+), 23 deletions(-)

Assuming this will be applied via the clocksource tree:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--oqbewf4c2d6juqpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpVA2UACgkQj4D7WH0S
/k5qfQf+O0q9IgJiIhTIoZb+PFNLzFpJUfTgt80QNJfsw0CNjUnDubvaD00Jx6CB
0+3gpys6WaM2CnAeAFNuwdQd5gknOHyywKF6iWw6E9CWCjAK8Y2QfvuCHCkoLdp/
ahqtz6RRZr7wm58CesLNihyINKtzOZirlvtrzk4ES2pLB7okf86yajwDAnV6NsfM
spfGp7exy3/fv4zYkFzYu2mVS7sUDuxI9AwjwAlOpFNKIUg35dFi2SAnWZbmZUPA
/NpyBmClhBY84AJqyX2qce3qGpt8UNgFtwW4RwE+3N+EN0mdj+hnSf7kLdYOyBuN
N6SV9wAHRF2h8eUWrss8woO01oVNDg==
=BfQ7
-----END PGP SIGNATURE-----

--oqbewf4c2d6juqpk--

