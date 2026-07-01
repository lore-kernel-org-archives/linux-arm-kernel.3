Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9pSgGl8YkLBQ2exZouesGTns5v/BpmUC/xFWMtiDqs=; b=LS5ySnvxhn0EGgSYuSiLXd0nW8
	0pR3CUDdR6ChmqXl1k44UPhceF9zRnObGzURVXb9GeDB+j2bJMtTG5/7B50TfJgDLdKYAFkjH0Vd6
	UViIGDytGyvWQW19H5udEZHU1NICPvd7nw21+ET+oH2zQtyb5OemgMIwX7PgLov6J2KFuifcMjFz/
	4/XSjxM/3yxmGRE8vJd5aR7LxFalG+RMvOQpip3qG4HYMSpBEdr6S3J0g4XJDpM7EDb8QNehjU+vd
	/LO/3WIKdxIHmngf7bQy5PsYEEYkklfKyvaOVot10ymwaHbdWnYMEE3etWU2ZSgZnAYZIVWFTfU8C
	0jGUaOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetHQ-00000001T9y-34c4;
	Wed, 01 Jul 2026 11:39:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetHO-00000001T9Q-3s6g;
	Wed, 01 Jul 2026 11:38:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 4C19643D85;
	Wed,  1 Jul 2026 11:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id ADD151F000E9;
	Wed,  1 Jul 2026 11:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782905938;
	bh=h9pSgGl8YkLBQ2exZouesGTns5v/BpmUC/xFWMtiDqs=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=h0tPhmIuRQaVWZmQCLWf+J9ulT43fnQMsgoGsDBGPQgsPgKwOU4mn77ycRulCL/js
	 7PuktulmhmiKcJHPpug2x1AhrpH5ktLis70a07NbKQJbqFDeylRNEGfG6j3gtEkBM4
	 XgG+YF2Sc5reZpX/GBjB/D529lGlL2ZocWLe8WKjWuTA+wkPqTKrzd5x1PgS/iAsVv
	 AlsjI67zsaX+egQICbHu+5AtkaSZP+DJWTDdidFfXCeCnk3j8c+3YkHhTeFVaTluPT
	 Sfm5/z98r4P9PvuOA2cFJfQjeKhsMrUoK+fcXAVoiSYJTqVK6m1kHeHllXcsOqyTOj
	 VLZcxtm9LRlWw==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 01 Jul 2026 13:38:54 +0200
Message-Id: <DJN7EN61AJGW.2TV8JLMVRFTJ@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Andy Shevchenko"
 <andy.shevchenko@gmail.com>
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
X-Mailer: aerc 0.20.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <CAD++jLncD2ZjH3aedOkGNYP3FyZ=i7Pb0OcKKZKuMOPGNjM_nQ@mail.gmail.com>
 <DJN3PDTPJ3L6.24P71OQFB6C98@kernel.org>
 <CAHp75VeTp4eYQ4QBoeH2VyVhUivxNn1CaC9jskmeg-1zTAOYLQ@mail.gmail.com>
 <akTyDzdrt949VnWK@ashevche-desk.local>
In-Reply-To: <akTyDzdrt949VnWK@ashevche-desk.local>
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

--dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 1, 2026 at 12:55 PM CEST, Andy Shevchenko wrote:
> On Wed, Jul 01, 2026 at 01:01:10PM +0300, Andy Shevchenko wrote:
>> On Wed, Jul 1, 2026 at 11:44=E2=80=AFAM Michael Walle <mwalle@kernel.org=
> wrote:
>> > On Fri Jun 19, 2026 at 11:08 PM CEST, Linus Walleij wrote:
>> > > On Mon, Jun 8, 2026 at 4:41=E2=80=AFPM Michael Walle <mwalle@kernel.=
org> wrote:
>> > >
>> > >> >>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot =
retrieve the
>> > >> >>> gpio_chip instantiated inside gpio-regmap.c to fulfill these re=
quirements in our
>> > >> >>> map() function.
>> > >>
>> > >> Why is gpiochip_irq_reqres() called in the first place? Isn't that
>> > >> only called if the irq handling is set up via gc->irq.chip and not
>> > >> via gpiochip_irqchip_add_domain() like in gpio-regmap?
>> > >
>> > > Not really, the gpiochip_irq_reqres() is called to mark that a
>> > > GPIO line is used for IRQ, so the gpiolib cannot turn this
>> > > GPIO into an output line, gpiod_direction_out() will fail
>> > > on lines used for IRQ. So it's a failsafe.
>> > >
>> > > You can live without it of course, but then you don't get
>> > > this failsafe.
>> >
>> > Thanks for the explanation! So did I make a mistake years ago by
>> > adding the gpiochip_irqchip_add_domain(), see commit 6a45b0e2589f
>> > ("gpiolib: Introduce gpiochip_irqchip_add_domain()")
>> >
>> > As Yu-Chun found, gpiochip_irq_reqres() expect the irq chip data
>> > to be a gpio_chip, which isn't the case (in general) for an
>> > externally allocated domain, is it?
>>=20
>> So the whole issue comes from the fact that the IRQ chip is not marked
>> as immutable. For immutable IRQ chips (which all GPIO provides should
>> have) there is no such issue to begin with, id est there is no
>> gpiochip_irq_reqres() callback assigned (and respective _relres).
>
> Ah, for immutable chips we put either custom ones or
> GPIOCHIP_IRQ_RESOURCE_HELPERS which actually refers to those callbacks.
>
> So, if the domain is external, it should also provide irq_request_resourc=
es
> and release callbacks. In the custom case we can wrap gpiochip_reqres_irq=
()
> and gpiochip_relres_irq() respectively.

Exactly. And its seems that this should have been possible with this
series, too.

Apart from that, most drivers use regmap-irq with gpio-regmap. For
this we'd probably have to add something to regmap-irq because that
module owns the irq_chip.

> But we need to have a struct gpio_chip pointer for them. And note, the
> IRQ chip data can be anything in that case, so it's not a requirement.

That's what I've meant. Conceptionally, it should be part of
gpiochip_irqchip_add_domain()/gpiolib, so a user doesn't have to
have that knowledge. But I don't see how this could be achieved.

-michael

--dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCakT8ThIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j29wF9F2RjUXkQCFlw9MAhKebih0vk6rnt8RJH
ZVGS/bJEnhLaCTuy3+MEHzj8ym4L4W4SAYDXrMLoVwpYVA+hB0NyniGo6j0kkPTA
T1NARfzcR/ZyvhE6qaERxH1/f+1E21odLOE=
=g4tC
-----END PGP SIGNATURE-----

--dcd813d04f8d378108c13e0073cb9d5d673b85bfdaa1fe7fae31e7cfd056--

