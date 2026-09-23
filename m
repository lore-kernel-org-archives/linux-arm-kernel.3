Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CAEC98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aplh7dJTViOVzCjHVkbCEOKv4UcGtIR4VW/U3iKThjc=; b=OD0P3uP/v5yh3ALXGgbGZwRZIK
	3au4Z814kKsKVeKjdxsmaO94rTS0w0i1yzP/Mr299i4EA1lRtdpMDIvXcNiG5kSQh45Miv6yvmfiY
	4y2o8gkQJjQC1CD/fLSB8Z8NHDy+0MeBiZnPcpcwtyrwJF2Z/rIyu4uLf42VzQTXV+pFk+SVUslGj
	HsSmK5HaRW4dCZTW/X+6xB5nA+PgbsYkMO3aiGfhCfqu/MG8nX4jkvEZO0IzHeZPvEGTVexlakm93
	UAl0vvwqh3SzMcHS9sd1bq5T9t6WKk7L7lg8adofL4kOLAffMGFdF3NUC2lzLcaEkWV3lbiBxazY2
	cppJVmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Gut-00000007KmE-0VDU;
	Wed, 23 Sep 2026 06:57:19 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Guq-00000007Klm-00Vf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:57:17 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id DEC2A5D;
	Wed, 23 Sep 2026 08:57:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1790146623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aplh7dJTViOVzCjHVkbCEOKv4UcGtIR4VW/U3iKThjc=;
	b=a6C66CmseqidgmeBJlOBRw5wwOqfckQBCRM2EHmuSQ/tjDoUJVjdWa2uhEz2Q4mmrOA7RK
	BW6A+P9gGreJnsPw8EJSE+Bqvzjxyapc7ICNjHyyCA535LH730HY9e4T1hykVEOAnUDvHi
	i4VLXnxOHEFFImpmkRqu7Jkw5ng5DJuhnexpycD1ULRnQBacxQqEynR+TLkDGa6vHFGwmU
	36QfKryCCcIFwMv0FEcfsONjPbdAJ/nsz0Qsa3cTN5p79f7hbbHPOwWdeQey9efHdNRoeu
	hVrtQ/uGMgF7JMEFmmVoXg2Xl5QJ2K8bOjKFcmsFX28SrKZS27zNsozce6Kigg==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=66e4aab55ce6c10e65aac407de2f18ed76c4de06773e522fce8193b51364;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 23 Sep 2026 08:57:00 +0200
Message-Id: <DLMI0KJW4743.2J11ZTFS2FUH0@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "zl020895" <zl020895@163.com>
Subject: Re: [PATCH v7 09/15] gpiolib: regmap: add gpio_regmap_get_chip()
Cc: <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, <soc@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski"
 <brgl@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri
 Slaby" <jirislaby@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Lee Jones"
 <lee@kernel.org>, <mfd@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
 <DLL08SC6PWNS.2BUBIQYMBWIKQ@walle.cc>
 <650e4694.3f81.1a0c7598840.Coremail.zl020895@163.com>
In-Reply-To: <650e4694.3f81.1a0c7598840.Coremail.zl020895@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_235716_252675_1860B8BE 
X-CRM114-Status: GOOD (  12.42  )
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

--66e4aab55ce6c10e65aac407de2f18ed76c4de06773e522fce8193b51364
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Sep 22, 2026 at 6:22 AM CEST, zl020895 wrote:
> gpio-regmap can already attach a domain via config.irq_domain or
> regmap_irq_chip. PL061 cannot use regmap-irq: type is programmed in
> IS/IBE/IEV (including both-edge) and the parent IRQ is an AMBA chained
> demux.
>
> In v8 the custom linear domain used the gpio_chip as host_data, and
> that chip only exists after gpio_regmap_register(), so I added
> gpio_regmap_get_chip().
>
> I can drop the helper: create the domain with the PL061 private data as
> host_data, pass it in config.irq_domain, and let gpio-regmap register
> it. I will do that in the next revision if you agree.

Yes please. You shouldn't need any of gpio_chip members.

-michael

> At 2026-09-21 20:48:44, "Michael Walle" <michael@walle.cc> wrote:
>>On Tue Sep 15, 2026 at 1:15 PM CEST, Long Zhao via B4 Relay wrote:
>>> From: Long Zhao <longzhao@ambarella.com>
>>>
>>> Let drivers that implement a custom irqchip retrieve the gpio_chip
>>> after registration. Attach a caller-provided irq_domain only when it
>>> is present.
>>
>>So why do we need this? Why can't gpio-regmap register the
>>irq_domain?
>>
>>-michael


--66e4aab55ce6c10e65aac407de2f18ed76c4de06773e522fce8193b51364
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarN4PREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+EqJAYCURfSHF28/wy7zcS9T5rqwQKdtr6Vi+fm6
FKEPiUj0ESQUaJWITdtLmMhXUYTwU4sBgKrlZbW1f9Nl/NmxVqpSp5Yv9aq5pAEe
oRACiSMyH2ZwhTvQKxQkjpEcDZZyx4q0Fw==
=oMt8
-----END PGP SIGNATURE-----

--66e4aab55ce6c10e65aac407de2f18ed76c4de06773e522fce8193b51364--

