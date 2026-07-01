Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D96FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mP0e90CvY990VFp7DBQ0zX9hoQdSW13F7tPZWoQRh4s=; b=sNn5su+jcT+/2C+8vc/VXd3LbU
	CvgyVqLCAEb5DrFXodEKqDsNpwwCoWKt5V6aA68XZunQi3ytmNzh/EDtjScIeelJQB0rICu/mtfDJ
	fBuVCwHuoyyCTo3TXolZrBVyp/kAOOneUne1xfTtF9fiQUxtBJ2d8xAg/W3BMPzU4RNujeoWFfgl5
	cjhGXuhylUdteshu9xpantIY7bNjXT8lhchYrb4kHaXTAyM4HBbMbSMtWUJEt8+5MdoIVGb0oCPKr
	Jhi+zZ8AaiLb07bu1XwQLoTeXXl3zYV1S8uF/dIwblAY5/pz7s3xd0PxxtaiLvkfHZ/Xv7Sfb2YpN
	MEM3f+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetLJ-00000001TP1-14Cn;
	Wed, 01 Jul 2026 11:43:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetLH-00000001TOf-3rdL;
	Wed, 01 Jul 2026 11:43:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id C90B06001D;
	Wed,  1 Jul 2026 11:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 040251F000E9;
	Wed,  1 Jul 2026 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782906178;
	bh=mP0e90CvY990VFp7DBQ0zX9hoQdSW13F7tPZWoQRh4s=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=W+aesSNaRj6xDDx+gCKAkWRHIzE3qBTdxq9B5csJjx0biTRJzU32MDfU4A4U3m1oT
	 jY8QKneD0SkKgOmxqt0oCl0PL96dLMa/uwtVGg+FMp9OJiyf94wdcHPpHn0t09YmW5
	 FY/E4G4KgtTNsmKBQu4P7iUS4Q/6NEJMpZYTDTys25LicEOwh/hO9C8DMI66GCvbJb
	 co5Kh9B3LHQ3AqB0jAjPFw7JxlgHLnqx+74IcXPV9kM6qs4J3j5dkvmtYpYfig7CM1
	 +CkzQGFlDWg217jSX1pU/NdtzbdMCaVTYrfpe0lz4hZO+dv3tQdXifg3+Y+uZ5KTox
	 6QMUkdFsh/5rA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=66ec2de313caad83fa7b88719e14937926b75988ac63d56f9ce9c52a842f;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 01 Jul 2026 13:42:55 +0200
Message-Id: <DJN7HPMWJLXG.157YRMNW34NJQ@kernel.org>
Subject: Re: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Cc: "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
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
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Andy Shevchenko"
 <andy.shevchenko@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
 <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
 <akTyDzdrt949VnWK@ashevche-desk.local>
 <akT8Niv1ddo-uWmc@ashevche-desk.local>
In-Reply-To: <akT8Niv1ddo-uWmc@ashevche-desk.local>
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

--66ec2de313caad83fa7b88719e14937926b75988ac63d56f9ce9c52a842f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 1, 2026 at 1:38 PM CEST, Andy Shevchenko wrote:
> On Wed, Jul 01, 2026 at 01:55:11PM +0300, Andy Shevchenko wrote:
>> On Wed, Jul 01, 2026 at 01:01:10PM +0300, Andy Shevchenko wrote:
>> > On Wed, Jul 1, 2026 at 11:44=E2=80=AFAM Michael Walle <mwalle@kernel.o=
rg> wrote:
>> > > On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
>> > > > On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kerne=
l.org> wrote:
>> > > >
>> > > >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we canno=
t retrieve the
>> > > >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these =
requirements in our
>> > > >> >>> map() function.
>> > > >>
>> > > >> Why is gpiochip_irq_reqres() called in the first place? Isn't tha=
t
>> > > >> only called if the irq handling is set up via gc->irq.chip and no=
t
>> > > >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
>> > > >
>> > > > Not really, the gpiochip_irq_reqres() is called to mark that a
>> > > > GPIO line is used for IRQ, so the gpiolib cannot turn this
>> > > > GPIO into an output line, gpiod_direction_out() will fail
>> > > > on lines used for IRQ. So it's a failsafe.
>> > > >
>> > > > You can live without it of course, but then you don't get
>> > > > this failsafe.
>> > >
>> > > Thanks for the explanation! So did I make a mistake years ago by
>> > > adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
>> > > ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
>> > >
>> > > As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
>> > > to be a gpio_chip, which isn't the case (in general) for an
>> > > externally allocated domain, is it?
>> >=20
>> > So the whole issue comes from the fact that the IRQ chip is not marked
>> > as immutable. For immutable IRQ chips (which all GPIO provides should
>> > have) there is no such issue to begin with, id est there is no
>> > gpiochip_irq_reqres() callback assigned (and respective _relres).
>>=20
>> Ah, for immutable chips we put either custom ones or
>> GPIOCHIP_IRQ_RESOURCE_HELPERS which actually refers to those callbacks.
>>=20
>> So, if the domain is external, it should also provide irq_request_resour=
ces
>> and release callbacks. In the custom case we can wrap gpiochip_reqres_ir=
q()
>> and gpiochip_relres_irq() respectively.
>>=20
>> But we need to have a struct gpio_chip pointer for them. And note, the
>> IRQ chip data can be anything in that case, so it's not a requirement.
>
> And looking back for implementation in v3 the whole mistake was to use
> GPIOCHIP_IRQ_RESOURCE_HELPERS. It just wanted custom callbacks with
> the IRQ chip data assigned to whatever from which we may then deduce
> struct gpio_chip. It does *not* require to be struct gpio_chip.
> The local driver data structure should keep pointer to struct gpio_regmap=
.
> That one can be used in the respective .irq_request_resources() and
> .irq_release_resources(). The default ones for gpio-regmap may also
> be provided via a macro, say GPIO_REGMAP_IRQ_RESOURCE_HELPERS.
>
> Hence I don't see the need of having gpio_regmap_get_gpiochip() helper
> and driver can be implemented using gpio-regmap and external IRQ domain.
>
> What did I miss?

IMHO nothing, that's exactly my understanding, too. Except for the
GPIO_REGMAP_IRQ_RESOURCE_HELPERS. See my previous mail. Because that
would have to be set by regmap-irq.

-michael


--66ec2de313caad83fa7b88719e14937926b75988ac63d56f9ce9c52a842f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakT9PxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jYjQF9Gz3dJXM6TuUZSyWng71nPci0aL0VH5LP
dNpe5FVqJ4Ior5jpzAeunvyMv81lG/+KAYDqi5CgF2b7DtiKxlORD3txD8udK4gO
MmqRdaSeG1BgwQIw81pxT3l8f1mcc70WhBE=
=tciR
-----END PGP SIGNATURE-----

--66ec2de313caad83fa7b88719e14937926b75988ac63d56f9ce9c52a842f--

