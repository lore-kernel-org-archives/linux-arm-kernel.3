Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AE4D44165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxvLKM0bNhMgDY9bHlRSPhBjrdjq5IG2dfXvn+jrPY0=; b=lPoTraRgIl9BMbi7fELOJ1JEvl
	xqBQU7EANkJ/ww3EdVlhhpK3pviWn1ib9qHgC9sj73hmCxa47v2bAu2Tut/TcA6/JV2EziRqr9ws4
	SeL9WcEeCJclliE6e3ripmYEeNRb4RSO9zqktHX4IoiLNY+y5VSdSthI3yqwzVg2CeVt5ccZ3i9Hz
	u5FIPTIdneSD0G1A7n/9PD+L9qyBzNivoQxySlDNj6ZoSiQSTR0HW4TtMmnKtjVT5vLbLzKA6THmY
	d0r1uxJencyN75USQzXKCaguOADmJlzNQCWft8SEQyr01rl2G3IVfVV+ZJjlGhHWnzvPhB4B1Pj6i
	P/l/jfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPSy-0000000Cj7f-0HSV;
	Tue, 19 Nov 2024 14:44:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPS1-0000000Cj0S-1a9P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 14:43:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7E7E5C3D3B;
	Tue, 19 Nov 2024 14:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C26DC4CECF;
	Tue, 19 Nov 2024 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732027412;
	bh=ZxvLKM0bNhMgDY9bHlRSPhBjrdjq5IG2dfXvn+jrPY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGky+BBRYQduW1jWNZzx5eiIKtSEdCIWdXGSH/PbDT90uDhpfoiqtxOUgbcUT5jgX
	 4dvnen2vCoNHtBKgnLqw3dqdFSLF35E0skC+FmiqHhzTuGY4EU8kd7SSros5NuXaLV
	 8ThyTDf7PdNG6jejM8QFVfo4JcDkwvOkCS6vIcQ4FTfW1PYlUkzrsUOpPqV7C8ALzV
	 6sUWqYD3HFRERD3L6Dn5uPO2baIMU9uOZmiwtiyKaP5hgx2Zhr+hH9+/0jjaEfTExi
	 ZY8HFIrn6GT2shUdWd5cujrUi8GiVb7wVWXWLh7Fy4AmiZQ9mI3yJvmntxhLXZm4aK
	 IQrfAugTXs0fA==
Date: Tue, 19 Nov 2024 15:43:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <20241119-prudent-jasmine-lizard-195cef@houat>
References: <20241119140805.3345412-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bbh5op4rp7zacygy"
Content-Disposition: inline
In-Reply-To: <20241119140805.3345412-1-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_064333_501170_CA147C98 
X-CRM114-Status: GOOD (  20.03  )
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


--bbh5op4rp7zacygy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
MIME-Version: 1.0

On Tue, Nov 19, 2024 at 03:08:05PM +0100, Paul Kocialkowski wrote:
> From: Paul Kocialkowski <contact@paulk.fr>
>=20
> The sunxi external interrupts (available from GPIO pins) come with a
> built-in debouncing mechanism that cannot be disabled. It can be
> configured to use either the low-frequency oscillator (32 KHz) or the
> high-frequency oscillator (24 MHz), with a pre-scaler.
>=20
> The pinctrl code supports an input-debounce device-tree property to set
> a specific debouncing period and choose which clock source is most
> relevant. However the property is specified in microseconds, which is
> longer than the minimal period achievable from the high-frequency
> oscillator without a pre-scaler.

That can be fixed by introducing a new property with a ns resolution.

> When the property is missing, the reset configuration is kept, which
> selects the low-frequency oscillator without pre-scaling. This severely
> limits the possible interrupt periods that can be detected.
>=20
> Instead of keeping this default, use the minimal debouncing period from
> the high-frequency oscillator without a pre-scaler to allow the largest
> possible range of interrupt periods.
>=20
> This issue was encountered with a peripheral that generates active-low
> interrupts for 1 us. No interrupt was detected with the default setup,
> while it is now correctly detected with this change.

I don't think it's wise. If the debouncing is kept as is, the worst case
scenario is the one you had: a device doesn't work, you change it,
everything works.

If we set it up as fast as it can however, then our risk becomes
thousands of spurious interrupts, which is much more detrimental to the
system.

And that's without accounting the fact that devices might have relied on
that default for years

Maxime

--bbh5op4rp7zacygy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZzykEQAKCRAnX84Zoj2+
diw8AXwPEvKvZSexckPVmceqVmzVwPo9YwJrS+DitvJ95ldcD40YdZHdCu5AjBao
e+XhY+ABgOgEGGr/j6zPLo8Y5ot34kniaBX5Xx/Ej3W3uHV0gQDVY5V/mn8BbSIb
t4BJ6wtFAg==
=iQOi
-----END PGP SIGNATURE-----

--bbh5op4rp7zacygy--

