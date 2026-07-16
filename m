Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDAAC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSBslohgYW2TzFSyJljgvww/L4fNmWRdmb3wtG2jrbg=; b=FDIGtzyOPYcx7khD1CwKb80bmY
	CAzxOZoQ+AB8HwATnwDKqAyvZnivZae9RWkji/tq065IaAfJkG+jccSMIBCBhFWFP2DskJgPohxBr
	ir8wkn3Ly81g6R7TBRikVWItvfDxyWfbLrfv/GyAJI7ZjokORULcqG0JeIvvyuuCiI+1BQ7n8HD5Z
	EOoBz65WBwL1QqTLbLFtSFJUa4TIXQkh2eQMV76A9pULZrp9742YwEbpj7YC7kFJUBW+cR01Cm2hz
	8IdhFr6UnNADJf+rrq19lFGGOCcJgd21xLcRIfYCe6tXKp7auH0EHwQQoNWL76tQ8E92qRUG4WTy3
	oGFflu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJsi-0000000H5bW-09Sh;
	Thu, 16 Jul 2026 11:03:56 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJsf-0000000H5as-2n7N;
	Thu, 16 Jul 2026 11:03:54 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BA6F22AA;
	Thu, 16 Jul 2026 13:03:50 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 13:03:50 +0200
Message-Id: <DJZY1YPMDLIN.3W0QOPEI9L8JA@kernel.org>
Cc: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "afaerber@suse.com" <afaerber@suse.com>, "andy@kernel.org"
 <andy@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dlechner@baylibre.com" <dlechner@baylibre.com>,
 =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 "jic23@kernel.org" <jic23@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linusw@kernel.org"
 <linusw@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org"
 <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>, "robh@kernel.org"
 <robh@kernel.org>, =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
 <stanley_chang@realtek.com>, =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
 <tychang@realtek.com>, "wbg@kernel.org" <wbg@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
X-Mailer: aerc 0.20.0
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
 <alim_HGTD5RCupav@ashevche-desk.local>
 <9ee344c1d9c642bdb7d3b85bc922fe66@realtek.com>
In-Reply-To: <9ee344c1d9c642bdb7d3b85bc922fe66@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_040353_853862_7E63DC47 
X-CRM114-Status: GOOD (  16.53  )
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

Hi,

On Thu Jul 16, 2026 at 12:47 PM CEST, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B] wrote:
> I checked with our internal hardware engineers. The WREN bit was designed=
 to
> avoid race conditions, which requires both the data bit and the WREN bit =
to be
> updated simultaneously within the same register.

Your mail just arrived as I was writing my reply. So yeah, that's
basically what I was saying.

> I have a new idea that might be similar to Michael's suggestion.

If not almost exactly what I had in mind. :)

> We can
> introduce a new callback to allow the driver to intercept and modify the
> mask and the value. By doing so, the driver can determine the correspondi=
ng
> WREN bit based on the original mask, and assemble the WREN bit into this =
new
> callback function right before the final write API is executed.
>
> The idea looks like:
>
> static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
> 			   int val)
> {
> 	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
> 	unsigned int base =3D gpio_regmap_addr(gpio->reg_set_base);
> 	unsigned int reg, mask, mask_val, wren_reg, wren_mask;
> 	int ret;
>
> 	ret =3D gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &re=
g, &mask);
> 	if (ret)
> 		return;
>
> 	if (val)
> 		mask_val =3D mask;
> 	else
> 		mask_val =3D 0;
>
>     /* Let the driver modify the mask and mask_val to include WREN */
> 	if (gpio->value_xlate) {
> 		ret =3D gpio->value_xlate(&mask, &mask_val);

Yeah, but you probably also have to pass gpio :) And at this point
I'd call it value not mask_val anymore. And the signature should
probably looks somthing like:

int (*value_xlate)(struct gpio_chip *chip, enum gpio_regmap_op
op, unsigned int offset, unsigned int reg, unsigned int mask,
unsigned int *value)

mask shouldn't need to be a pointer as you don't have to modify it,
do you? reg_mask_xlate, already does that.

-michael

> 		if (ret)
> 			return ret;
> 	}
>
> 	/* ignore input values which shadow the old output value */
> 	if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
> 		ret =3D regmap_write_bits(gpio->regmap, reg, mask, mask_val);
> 	else
> 		ret =3D regmap_update_bits(gpio->regmap, reg, mask, mask_val);
>
> 	return ret;
> }
>
> Best Regards,
> Yu-Chun


