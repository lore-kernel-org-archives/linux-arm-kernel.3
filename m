Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0E2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxV0WPJZV408YUN52aAIFYKQShHoF7rMMdGWn0YVmaU=; b=XOUS1O0asEq4q/IDM4NBWzw4lx
	YlLIOYiHaKdtK8vEkRWyo3+K9NIiqSUT1qnCq93jmCsZSRTtTWv7iIFmG0N6D2aYzoxejSjCPDfXU
	eHT/RmaBWjQ1QLxOkWdkQwRlMW7UFpaeTvNje9hQfByBpYtVyN8tSH7J4SYIRWeo4dfPPDfwffGbg
	8il2TXE4t2MPjx8cy0qa6Eb78svX9nihiO6H9zuejh6vqMq3Mo5fy/3r0EzsAqRXLweDNG6bEZw1J
	84UNLirUMS+IxvTsPSz163qF3WUCVOjqvg7y8ETzLbQ9+ZWUgXguMKTN3r2ObPbjyDHR3cP2ATCxU
	XrJuUpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYNP-00000007kWt-40Pg;
	Tue, 17 Jun 2025 15:37:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXIB-00000007YRK-3cxm;
	Tue, 17 Jun 2025 14:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1B3D629FE;
	Tue, 17 Jun 2025 14:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD6FC4CEE3;
	Tue, 17 Jun 2025 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750170482;
	bh=gbqLTYR0mAYgtvwgmxmyg1ZOj93y/Mo/xYgG/dsqrTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/GzYPdsKv0M2ulRiafSZdVlzU0gS+6D4PkCQW6oS3JbPWdVHW5IfLZWKcorb0Hxx
	 zE4i6P3XQErzWUHUdIZkeuVbiNGNxeQ5RvGq5VATTzaK9owPzY/2ydtIVga5cP7IHH
	 wn3oMDgyd5m8p1E6jg+73BWYXax8ZIMdorP74PuBnxVCy20zkvgdc5N86A7TEtbmhi
	 Kr0EDkNKqsToJRWkIXxQOMOqjYDRuv/bHgPblD1TsyOwxVMs3lIZduYVVbBom7hJPQ
	 m5PHZriiQiZKER4kHmuPZ9Kwxz8B4iQd/PisHnaNIazULBTMa4hu82a2DpZZQ5e2Di
	 LuyVbFcwKPJKg==
Date: Tue, 17 Jun 2025 16:28:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Brian Norris <briannorris@chromium.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: rockchip: round period/duty down on apply, up on
 get
Message-ID: <vb2wmbbbmwheovxkac36ab4omw6dj3owb4vhz7r7woumvawkp5@eeejjh6jt7wd>
References: <20250616-rockchip-pwm-rounding-fix-v2-1-a9c65acad7b6@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v7m5lcpzioclc2sh"
Content-Disposition: inline
In-Reply-To: <20250616-rockchip-pwm-rounding-fix-v2-1-a9c65acad7b6@collabora.com>
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


--v7m5lcpzioclc2sh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: rockchip: round period/duty down on apply, up on
 get
MIME-Version: 1.0

Hello Nicolas,

On Mon, Jun 16, 2025 at 05:14:17PM +0200, Nicolas Frattaroli wrote:
> With CONFIG_PWM_DEBUG=3Dy, the rockchip PWM driver produces warnings like
> this:
>=20
>   rockchip-pwm fd8b0010.pwm: .apply is supposed to round down
>   duty_cycle (requested: 23529/50000, applied: 23542/50000)
>=20
> This is because the driver chooses ROUND_CLOSEST for purported
> idempotency reasons. However, it's possible to keep idempotency while
> always rounding down in .apply.
>=20
> Do this by making get_state always round up, and making apply always
> round down. This is done with u64 maths, and setting both period and
> duty to U32_MAX (the biggest the hardware can support) if they would
> exceed their 32 bits confines.
>=20
> Fixes: 12f9ce4a5198 ("pwm: rockchip: Fix period and duty cycle approximat=
ion")
> Fixes: 1ebb74cf3537 ("pwm: rockchip: Add support for hardware readout")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I pondered if I should drop the Fixes: lines because I think this patch
shouldn't get backported to stable. But I think it's correct to keep
them and then just veto the backport if the stable guys pick it up.

Applied with a few cosmetic changes to the commit log to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

Thanks
Uwe

--v7m5lcpzioclc2sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhRe24ACgkQj4D7WH0S
/k69JAf/ZhADTd/ReNB0MbeK+eTaJsOHFQr+bYl7/xNVsNa4MMdXh50tNin4L2qN
9VjWB4g/M3N5XJjVzV8GW4GN5TgHPjP5XuEAxOfN4Cylp/T9/fcZ7N1fSoVuziGY
dijTKqjqWN1r6bTbc2G75iSajQE6U97rGVcqFQ3hKTQYWAhfib8RVnXfii/PBrqP
/Tn17j6s8alqHVw37ihMG45aPRNYLTursYwHA+XNN2Yjw/YnkF+VkZVpXNYxC3Dj
r3IbqxdoWj8wd4ZIPSTBkShBW7ruy93lxT+XrfnxxhkuJRcftuHne0e8p+tGVNeH
01I8F5vpsiL4Qh6H+CW4lox/PGAwLg==
=k0eL
-----END PGP SIGNATURE-----

--v7m5lcpzioclc2sh--

