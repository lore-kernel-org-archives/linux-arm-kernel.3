Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D553CD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+cUJZOydKXdWDpZXEceW0s0RozWR5kA7NjUSuPBp1M=; b=TGENID8NLU+BU8sUuKm5GGCAHy
	sHYmCvmRBaDgu9MF/0w0ymKYgs79ANrC3jZosusYkTZ52zGz0uAJ+g6J4PMphT8PPRqHnRzAg0z7k
	rv1MrS2bobuPI6ya98R1ev7qEOJtUDbHXnqzELT8h5OUM8vm3PVz0OCBnOOR8eSWBHlusWo6rN4sc
	CJEXUE44RUoUuf8b7ph2+PFFm7X8Vm67vNIG3xE3vkBKn7dXK7AUHRvx+ATqQuz9tygme5P3Vo4BF
	v0yCU9IPonrmpJ2yJogrw+mnTiGaV5wCjuawKX+fHi1GDBu3IiSuoKKvnU3jQzR70/QfOGlxc6d2Q
	GezH5BPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZltD-0000000Gu13-1N2v;
	Wed, 17 Jun 2026 08:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZltB-0000000Gu0s-2DX8;
	Wed, 17 Jun 2026 08:44:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E79924038C;
	Wed, 17 Jun 2026 08:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4CC831F0155C;
	Wed, 17 Jun 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781685888;
	bh=q+cUJZOydKXdWDpZXEceW0s0RozWR5kA7NjUSuPBp1M=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=fJqsmqL5tZ/r2VH0IDbyLmtJ/fMTxFUKdxTuwnVob95x+LB24GU7YsTTyi0kN1dQF
	 HKvf3Emei2d/BcrOnOP1KutEq1B6Ic8FXQLLNstMBnQ+vCB8arEO2UAMlNqolz/yZz
	 O1kzRxFmtv4oway1kQfPzAixZQxuVvW5lPcAxfoVBRkLr7dAcJk5KhyqqGFNwKnQ5x
	 M2TjnNUC1yfK5Xx+cZjrGR6UTDHD3Mf/1vySIaaSQ45uQIs/+wxJeaNRDB5oCGkTYW
	 TdWIw29fD8sraD3l/V4vuCaOUGHPF7BaCUrbPm+XkwJkxx1+9hAO8VomFrq08nyW0R
	 eo3cPgfwBLH5g==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ae7d6270ac9333222e92442123309da8a5c3fc1e7564e8b96e096513da81;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 17 Jun 2026 10:44:44 +0200
Message-Id: <DJB6XO07EC8Q.1X9P752MLFB4N@kernel.org>
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
In-Reply-To: <39de4d4ada5446e7a33e48c43f410439@realtek.com>
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

--ae7d6270ac9333222e92442123309da8a5c3fc1e7564e8b96e096513da81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Jun 17, 2026 at 10:36 AM CEST, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B] wrote:
>>>>> Without an accessor like gpio_regmap_get_gpiochip(), we cannot=20
>>>>> retrieve the gpio_chip instantiated inside gpio-regmap.c to fulfill=
=20
>>>>> these requirements in our
>>>>> map() function.
>>
>> Why is gpiochip_irq_reqres() called in the first place? Isn't that only
>> called if the irq handling is set up via gc->irq.chip and not via=20
>> gpiochip_irqchip_add_domain() like in gpio-regmap?
>>
>
> The panic was caused by my driver including 'GPIOCHIP_IRQ_RESOURCE_HELPER=
S',
> which forced the call to 'gpiochip_irq_reqres()' and crashed.

But why did you use it if your irq domain isn't managed by the
gpiolib, but rather your own irq domain? Before going with option #3
I'd double check if that is correct in your driver.

-michael

--ae7d6270ac9333222e92442123309da8a5c3fc1e7564e8b96e096513da81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCajJefRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hggAGA48SYycuQ31SATiLygkbvb0W1zefVePET
gk6JbWW8iIuoG0dOdIPsod0/pPg692m9AYDoGRmD/J1tvhi2B28P6PCSOkTa7yRs
HmpBeIQ/pXUXteE59FADrOs+i7f7s0N8AxU=
=kuX1
-----END PGP SIGNATURE-----

--ae7d6270ac9333222e92442123309da8a5c3fc1e7564e8b96e096513da81--

