Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B178D26D64
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yYivR6m7de4bVDJo8K4370S1d12YvRa0ve7K/19OdA=; b=FkkzhkdIL5HzdTDSIopNz/FrKp
	SOuqSjP8FJ6YwpKVnnE5X6w+kMXKNzj12gZ38ycGI+aaDyPNmUhiNpiAGuyomwcU+zxK30Mx00VTR
	kSqYx3HjlkWTtUCcI33U1gMX04RgzIpDuXddrHlxHm8hvK92jNY4Zc+BSII5Kfrm/mczhSkBFWX5S
	z9BMvm7+ylv2PAJlRDrWH2OpfZazn9s7+Fc3dTz/fgIVFNNEzHh1HMu0A10VOhe0pZVTQH0An5Xaa
	Ap6k41Rbk29soLe/5uVAIn7qLx6QFDYoerkXFUI6sfN/W4DUR+jzbxHhvhV7+z4FIaNPrceNP6Y+/
	D3sNG7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veE62-00000002SKY-28gS;
	Fri, 09 Jan 2026 15:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veE60-00000002SJt-3JXg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB8E360151;
	Fri,  9 Jan 2026 15:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2E2C4CEF1;
	Fri,  9 Jan 2026 15:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767971291;
	bh=+yYivR6m7de4bVDJo8K4370S1d12YvRa0ve7K/19OdA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=rHPNztUNBvwrgM0+tRT43MKzu+mXAx8v7Lt9DNa4Z11mWqsBgqYXFdOwknanHxt8h
	 xbQ+zcfZOdDV9rRQ/PFWBjxLzN0goMyVYNufIck5vIT+c2JDzBmkf+jNrUZ2SD3exR
	 t9xSQpiEvKToocxG/iOHoTui6oawpqrQ2FYY8kpkBjz4HJSn1dQMZWg/uWo2Ynwjv/
	 5eNuHBce79tUeJlVpeV6tda5gFVTIiuKnxXKjsvF1ZOBaC6p2tH6C0otpMhovgdKz8
	 ez547ye1cbQArVuQK+dby5qd0afLjaykn72q5lBEZsWA6RionYN6Y2FOjEEfZBm7RR
	 DvoH40ihTouFw==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 09 Jan 2026 16:08:07 +0100
Message-Id: <DFK5IKWIJYLM.2CCXMRAXS0LYI@kernel.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Alexey Klimov" <alexey.klimov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
 <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
 <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
 <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
In-Reply-To: <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
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

--409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

>> Not sure this is still valid. Because I've just learned that
>> apparently, the arm64 Image shall be made smaller and thus "need
>> a driver for rootfs" isn't a valid reason for =3Dy anymore.
>>
>
> Is a switch to disable shared GPIO management entirely via Kconfig
> (depending on CONFIG_EXPERT) good enough for you?

I don't really need that (as I'd also need a PMIC driver, which
probably won't be accepted either as =3Dy), maybe other do. Not sure,
up to you.

-michael

--409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaWEZ1xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jb6QF/cKSDNHxnvueWH5aVmuyPcce5VtwNVM28
ulztUB/LQdv1McH02EzbRVwRhh0VAP+PAX9TgaecNELyf37cr7SC2SmZQ15ZqBwR
xXpQ0WmkfDXKsuE5DRyyGgZF13/qGopvROE=
=If2G
-----END PGP SIGNATURE-----

--409e69e9e42622a8efaea00c6722208abb1f34df3b9e30332a381e829f3b--

