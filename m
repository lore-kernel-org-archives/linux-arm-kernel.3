Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BA1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DetP18Q3F5Qy8qOHacqW0nR2X6Tj/3bujsBkITQAtBA=; b=WfNSDiiml1WjAKg30jhPOyFl+f
	mqTp+ChsausikdETOvXMKD8mLYhpZzwUgxIs2bc32gs7qANwOidNaLz62VOtgcy5TYctn+ItwwTVi
	A8TmpzGBKAkKlMSRoW5hFLWq8gbRPnWpqJ3EQ5S6NK4hv2U/SMQ89p/EcwoPceNxZFOIPOrQMHIcF
	xvUInei0MfUf2izqUIRT+XLDQ2fCiv/f3FKw/8Ne5BAdiR463p/R9KSxA44baL/Z9gzfWPoIZkPLB
	2XSV7U0FKlPsoi/49veOOc8j8vlmz6yzpTHT7GTEx6otEznwYPA702z/oo7RJrAF5V/NE583zfI/k
	qm5K7GPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dso-00000002DLj-2x4i;
	Mon, 21 Sep 2026 13:16:34 +0000
Received: from 0001.3ffe.de ([159.69.201.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dsm-00000002DLM-2pqK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:16:33 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 0178042D;
	Mon, 21 Sep 2026 15:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1789996590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DetP18Q3F5Qy8qOHacqW0nR2X6Tj/3bujsBkITQAtBA=;
	b=QkziG/3JtLzslZEjZyidfzcMcsDU1U2gHbWNCUb5Xa0LArR8od+VuLfz19G2/63zzisVJo
	fmF+OXlCfLPZkjRwHChfxIgq5PKReYjpZ9c3e8xyXgj5317/WFdinzHZOaxK3fC6Wv56Iz
	w7ArbFfiSHxWX3fASKQ8LHDm/Z9I0yyjz9TyCK5Wxv/ByaB0S3R6Ti2an6D6LzCJ/r2s2Z
	eaNkGOrZP9WrVqNwgrydhN7EH+D+YpbVRx7eX1YLYAkTM+xvA8ugZOCnNUIK4syKxzPnBp
	I78cTT1gf400oVtfXVFZlCaflwq5V10SaHwWX1FSm1vS7pEuAsoEw3CG6JEVeQ==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c9d24f83f23e2edfc9d90c2c898338cc459c7915a06afe5933f249ce504e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 15:16:27 +0200
Message-Id: <DLL0U0B337I6.AI24GMAN59FN@walle.cc>
Subject: Re: [PATCH v7 10/15] gpio: pl061: convert to gpio-regmap and a
 custom irqchip
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
 <20260915-cv75-v5-v7-10-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-10-3297d3fbc9c0@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_061632_864770_E4550DD6 
X-CRM114-Status: UNSURE (   5.83  )
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

--c9d24f83f23e2edfc9d90c2c898338cc459c7915a06afe5933f249ce504e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 1:15 PM CEST, Long Zhao via B4 Relay wrote:
> +	config.reg_dat_base =3D GPIO_REGMAP_ADDR(regs->dat);
> +	config.reg_set_base =3D GPIO_REGMAP_ADDR(regs->dat);
> +	config.reg_dir_out_base =3D regs->dir;

config.reg_dir_out_base =3D GPIO_REGMAP_ADDR(regs->dir);

--c9d24f83f23e2edfc9d90c2c898338cc459c7915a06afe5933f249ce504e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarEuLBEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+IxAAYCOUetYEj05vb5mcfKxxZcArWJOU9zLHL1r
Ce1TB0csezyqfYbCaGf0HO6KRvjd3lUBewa2+jLRtEnP71K1v/9VXbPr/fdO49oY
WoJLneVfRBsoGhZUcSmwv5KuL6L0u+4QRQ==
=Y/cv
-----END PGP SIGNATURE-----

--c9d24f83f23e2edfc9d90c2c898338cc459c7915a06afe5933f249ce504e--

