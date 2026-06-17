Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C99CCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmpVju6t1H4zbdKM4jpMagQX9IqAMGicbUC5PSgBpBQ=; b=FoDLNQyUQOdYI0p0R0QlI6Vjhr
	lyDNhvIE+Tcf3+Fzhol3cnn2lC2rwleuH0AAbqvShtQnDa8G6cU5KvpQT/bkWEoE/8jFWzqxhettq
	xlgrakImQbrOH6L7slk0LeaqtOSO3IW+q7MTEHN1bB2PXW8FISRPZw/RMGXoTvco0+LA79745KAst
	n2heqmb/jh3pbixzLIgLf2CyNJ/PPWOJPSW23YZrmHsTbRXU4RjwVEpVKJspfiXrvlkIXL6pSKiFY
	dUokV1BAczQqSl3hrp5HnVZvKVCfsFuxFKH5kwesxLgWruQb+c3ta7C7PQwWfZFrxU01mwSUbeEQg
	w1y4rR5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoJO-0000000HDix-344f;
	Wed, 17 Jun 2026 11:20:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZoJN-0000000HDiZ-1lwW;
	Wed, 17 Jun 2026 11:20:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 319094071C;
	Wed, 17 Jun 2026 11:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8A03E1F000E9;
	Wed, 17 Jun 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695201;
	bh=QmpVju6t1H4zbdKM4jpMagQX9IqAMGicbUC5PSgBpBQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=PhZtZrAG+elWGzO5YoCFGusWT/CYMgHWieRPrvrURowNfPQ3i90TlohgdoYcZWStV
	 63YhnI3BEDnLp5pOeFtRmfuARqqxNNxDhOQBibpKrVfEpRUJ/jLpgUka9Xe/kxuX0L
	 8xm8dxJsy5nDd1ML0Wlkpm3O3TLHWPbZ+YVom7RLrXbub6DtIw740NjKhMPj2dSzTH
	 iXTyyDktgyQ1pGUf7Qja511gLgGeKC4saFivTLL14M9sbarXAmMUFN622usU9e8zo6
	 LBq5lmcQUPVmNk6vga/hZra0w+OqfwBJoS6mJHaQr2DApaZDdDPQL8goTVyk3UfXIK
	 sUlA5j1Pdejxw==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=30991a780f930c85dbe063c06cf260d6554dfbcf048d534393a8b0204307;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 17 Jun 2026 13:19:56 +0200
Message-Id: <DJBA8HX2E2HL.3H9NMHA9PW7N2@kernel.org>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Cc: "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com"
 <afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "lars@metafoo.de" <lars@metafoo.de>, "Michael.Hennerich@analog.com"
 <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org"
 <andy@kernel.org>, "dlechner@baylibre.com" <dlechner@baylibre.com>,
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
 <james.tai@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <39de4d4ada5446e7a33e48c43f410439@realtek.com>
 <DJB6XO07EC8Q.1X9P752MLFB4N@kernel.org>
 <61c053a5a8e6461f9e6fcd40b6b5064d@realtek.com>
In-Reply-To: <61c053a5a8e6461f9e6fcd40b6b5064d@realtek.com>
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

--30991a780f930c85dbe063c06cf260d6554dfbcf048d534393a8b0204307
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Jun 17, 2026 at 11:54 AM CEST, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B] wrote:
> Hi Michael,
>
>> Hi,
>>
>> On Wed Jun 17, 2026 at 10:36 AM CEST, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=
=90=9B] wrote:
>>>>>>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot=20
>>>>>>> retrieve the gpio_chip instantiated inside gpio-regmap.c to=20
>>>>>>> fulfill these requirements in our
>>>>>>> map() function.
>>>>
>>>> Why is gpiochip_irq_reqres() called in the first place? Isn't that=20
>>>> only called if the irq handling is set up via gc->irq.chip and not=20
>>>> via
>>>> gpiochip_irqchip_add_domain() like in gpio-regmap?
>>>>
>>>
>>> The panic was caused by my driver including=20
>>> 'GPIOCHIP_IRQ_RESOURCE_HELPERS', which forced the call to 'gpiochip_irq=
_reqres()' and crashed.
>>
>> But why did you use it if your irq domain isn't managed by the gpiolib, =
but rather your own >irq domain? Before going with option #3 I'd double che=
ck if that is correct in your driver.
>>
>> -michael
>
> Do you mean that a custom IRQ domain shouldn't be mixed with gpiolib feat=
ures like
> 'GPIOCHIP_IRQ_RESOURCE_HELPERS'?

Honestly, I'm not sure. I've never done anything with irq domains
except for using the regmap_irq_chip. But from what I can tell is
that GPIOCHIP_IRQ_RESOURCE_HELPERS are tied to the handling with
gc->irq.chip, which isn't used at all if you add the domain via
gpiochip_irqchip_add_domain(). Please correct me if I'm wrong
though.

-michael

> Additional information: our GPIO controller receives 3 separate interrupt=
 lines.
> Because the standard 'regmap_irq_chip' mechanism in 'gpio-regmap' does no=
t support
> this multi-line hardware design, we are forced to create our own IRQ doma=
in and pass
> it via 'config->irq_domain'.=20
>
> Given this constraint (that we must use our own IRQ domain), are you sugg=
esting
> that we should implement our own 'irq_request_resources' and
> 'irq_release_resources' callbacks instead of relying on
> 'GPIOCHIP_IRQ_RESOURCE_HELPERS'?
>
> But if that is the case, we would much prefer to let the core gpiolib han=
dle
> these resource and state management tasks for us *as proposed in option 3=
), rather=20
> than duplicating the effort in our driver.
>
> Best Regards,
> Yu-Chun


--30991a780f930c85dbe063c06cf260d6554dfbcf048d534393a8b0204307
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCajKC3RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iFxwGA9GnpxKtX1eMaDBRZLS2qXUO5rwxnfcPH
PrpuryubAiSmq4+/qWts4440bm64mrTxAYC8thI7zuN+jL1FtOZG+peZJT8y/pS2
Y9xeRMo/jVCMUytnXmfeeRq8Ax2WJG+bC3Q=
=l7H9
-----END PGP SIGNATURE-----

--30991a780f930c85dbe063c06cf260d6554dfbcf048d534393a8b0204307--

