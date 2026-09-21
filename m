Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D45C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oYAGsVvEhdzXCWG+jA1/MT2C7mPbAr8X9h6EIfIhiA=; b=L9rrVSWlHwcffKx43SEAYDSzs1
	i71sn/5wu/aWhCkvzb9WxdV8WQjYEviUEJQhLWYmxPV/7f2gSlBNbPJMH/9WqEMxrB9S4hOKD76oe
	hkbKynO/qZ2yvofKXJlKmNW00e7TO0vjKhBbtqA6rUwilE8ER6850b1OQJwm9JalGI/VZQvxGRAEM
	Hgfk8Ti+pF6MO92oQ/jqrqkKuQaBzJmEMTYGwboteDEUvIKWgc0zA118yClG9maTWm5184sMWfYBf
	kn6S1ErXfKYaaG/YKScP7XW9nUbCd87s+IKy6OKN7/PQMhmYkco4SUG99a6Ot3H+a0IsJplWbxuzW
	K9wAdyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dS9-000000028ZA-3BdG;
	Mon, 21 Sep 2026 12:49:01 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dS7-000000028WL-1jrw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:49:00 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0FDAD5C;
	Mon, 21 Sep 2026 14:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1789994927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8oYAGsVvEhdzXCWG+jA1/MT2C7mPbAr8X9h6EIfIhiA=;
	b=HMNcECOFvWrzAxv7X6rh6ufMZzeR20RIFNOZLJPrJoTwjVmGqMgRjQhC8o3iWXnsMrK3go
	snIUKwUa8cCa6Qs1+nOuaHbEAtgEGa4E6KiJyMQGCnZllwH26bM3dbh16VOcVhJzwN7rLQ
	bpJ3pFruahOgtooN+AKT/f14q2LOyGObddcToHTinFpWEuwJfvTHByrSWU/W9LXps+Lt4y
	1FEtrgXQZYf3eAQ21ST63nOtDZ81TivcweH/LVk/lkZPNqQuylwn+h/8If71DMM3sWkpVT
	RWhNknTq27bzWl/SyXdCXMxqP4MZmopKytnGg0x+O6PoMmsrTHqwHwIP0yvY+w==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=dc334a3fcc535e0315e8224ae25d35c7ceb07b6cf064276ea636de9843ad;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 14:48:44 +0200
Message-Id: <DLL08SC6PWNS.2BUBIQYMBWIKQ@walle.cc>
Subject: Re: [PATCH v7 09/15] gpiolib: regmap: add gpio_regmap_get_chip()
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Long Zhao"
 <zl020895@163.com>, "Lee Jones" <lee@kernel.org>, <mfd@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, <soc@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_054859_598309_0CA44502 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

--dc334a3fcc535e0315e8224ae25d35c7ceb07b6cf064276ea636de9843ad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 1:15 PM CEST, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
>
> Let drivers that implement a custom irqchip retrieve the gpio_chip
> after registration. Attach a caller-provided irq_domain only when it
> is present.

So why do we need this? Why can't gpio-regmap register the
irq_domain?

-michael

--dc334a3fcc535e0315e8224ae25d35c7ceb07b6cf064276ea636de9843ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarEnrREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+LpuAYDE0AkurPddl0z6QE+hTeG4NZcB/7h42HL0
OIorjxt6Yf4Z474zjfRls7Q8TEb5PWABgPO0XMEiJFECr8eYcTJCzY4GwwWiB1JR
x0gMJHh8+WSi92hntm19knMXwoCPPyL1+A==
=LBa0
-----END PGP SIGNATURE-----

--dc334a3fcc535e0315e8224ae25d35c7ceb07b6cf064276ea636de9843ad--

