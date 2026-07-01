Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA29C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SM1GnM3FZH6KNcTrP19RmJuHes6Nt+u+2Rizwvv6xXU=; b=Lm/KmWSfT9W1c+jP2dqmB2N560
	KdvKaYSZsMUrvHVVw97B1X4Uhn/JOve0C5pHT2TYGyU0rbBIXHe+dX6fbGSjY2VxtMad/ezp1Nlg/
	aMcxL5e6TOJicDjAyZPQSUTPVxLbOph4EQRVB/XfZxB+rbq6SrkQ8g1W7f6RBqLNQvL4Gf/cPHim9
	rWJ1PVAi3IshaWot9ADF1am8eeJwRJ9IEWPRaS1puoq1G5vThoRXSaSgodQYBn1hgOZpYWwBZ0JsM
	aikzt7QCAebaWsd1TY/agengxwG6Ar1h/JEzsj+iDzBJyoOYvQbF6ijAibKXlLDZkLqGIxKy9aHs3
	rFWaF9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqZ1-000000013gP-05Dr;
	Wed, 01 Jul 2026 08:44:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqYz-000000013fO-3fXY;
	Wed, 01 Jul 2026 08:44:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id B7FBB600AB;
	Wed,  1 Jul 2026 08:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EA7DA1F00A3A;
	Wed,  1 Jul 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782895495;
	bh=SM1GnM3FZH6KNcTrP19RmJuHes6Nt+u+2Rizwvv6xXU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=K4q9bOBG9Kb6RxXPQiTbJLl/vCMKDv8pUVjbrb2R6/Uly5XcmTYkqDGA9tKMFow6E
	 1h3L3P5YCThmlnVOcIFDDzlnxYVhUtw5kWg/peIEAkhnhymPhC95xcCse7uZH0p0Td
	 OpwfVJm+/ktVneJcYCCVolHLFsQ68qqW2kl9tHlhAEGLe3P0ll4EUIolWK+hYfjXfy
	 P4MjOUk5ZY/MdLwDu0cW9SMIo9nLiDNc4Ja97Zsq5we6+VsvBspOVD7UR/cwv81Y15
	 ArYUAKhgEDNAJPztX6EHCwNpkfQMLgAiL6UYgNhgg1bb2o8g3Ca9/fyPY8nRIEmRWO
	 dRhQRQk2E6fAw==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 01 Jul 2026 10:44:51 +0200
Message-Id: <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
 "wbg@kernel.org" <wbg@kernel.org>, "mathieu.dubois-briand@bootlin.com"
 <mathieu.dubois-briand@bootlin.com>, "lars@metafoo.de" <lars@metafoo.de>,
 "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "jic23@kernel.org" <jic23@kernel.org>, "nuno.sa@analog.com"
 <nuno.sa@analog.com>, "andy@kernel.org" <andy@kernel.org>,
 "dlechner@baylibre.com" <dlechner@baylibre.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
 <stanley_chang@realtek.com>, =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
 <james.tai@realtek.com>, =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?=
 <eleanor.lin@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
In-Reply-To: <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
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

--9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
> On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.org> =
wrote:
>
>> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot retri=
eve the
>> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these require=
ments in our
>> >>> map() function.
>>
>> Why is gpiochip_irq_reqres() called in the first place? Isn't that
>> only called if the irq handling is set up via gc->irq.chip and not
>> via gpiochip_irqchip_add_domain() like in gpio-regmap?
>
> Not really, the gpiochip_irq_reqres() is called to mark that a
> GPIO line is used for IRQ, so the gpiolib cannot turn this
> GPIO into an output line, gpiod_direction_out() will fail
> on lines used for IRQ. So it's a failsafe.
>
> You can live without it of course, but then you don't get
> this failsafe.

Thanks for the explanation! So did I make a mistake years ago by
adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
("gpiolib: Introduce gpiochip_irqchip_add_domain()")

As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
to be a gpio_chip, which isn't the case (in general) for an
externally allocated domain, is it?

-michael

--9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakTThBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hRPAGAqo6DNepJTnnCNzb/3GwKnJXqVuz6ob9v
5QmRvDiF57B2o/TvziZGaN2H5NzwI+VXAX9U4o48VR1vxZAo8Rz2J/Lz3hBMf9Jn
hz6tFnYqWzJmQPwvHzOfkIbQr8fbtkj9Tlc=
=Vyla
-----END PGP SIGNATURE-----

--9135228af664d572f1986b21b4fb54103924b9231b5a0e744b356b75f7b8--

