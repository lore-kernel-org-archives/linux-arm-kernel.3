Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D687C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=catZ+rI4m/BJcOvvOiYIEfBvFweih9z7ro3m7am8YRM=; b=xhqvupGtJ3TtzPHmLqTGcyQz+a
	E1tqWxuwBA6bCFWnIdkhv/51Z49qjohMOQXiz4+LPPGCpVl0vYXf0mYLNab40DFS2nrla4mN23lKh
	6QQnfWfPgFa+hprxIO5a3N6UACnn6jgETZn2JLf6eG5RuU2mC6RPM7fjm6jcGZFxmfir8L4VyUWVX
	cJHGzoefCf8QuSjLoAey4tGCliJRxghw8W/uGB8YCVUx5x6yzODuCg1toaHTuQJ1nR+8G0y5U/exI
	cXUctgVWd0yA3d8XV7dAXpueb6pSRJOLN7EgaKv0R+S0u41OiLu3OXWpMIAc0biHarFWUB7wK1miA
	tDsO4VVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKUM-0000000HADa-0pW6;
	Thu, 16 Jul 2026 11:42:50 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKUJ-0000000HACm-1iiY;
	Thu, 16 Jul 2026 11:42:48 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 77979167;
	Thu, 16 Jul 2026 13:42:44 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 13:42:44 +0200
Message-Id: <DJZYVQSJL0MO.143E5QFQRAXVV@kernel.org>
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
 <DJZY1YPMDLIN.3W0QOPEI9L8JA@kernel.org>
 <068b13e117464cf38b7b215eee72fe7a@realtek.com>
In-Reply-To: <068b13e117464cf38b7b215eee72fe7a@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_044247_604490_289F3443 
X-CRM114-Status: GOOD (  13.03  )
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

>> int (*value_xlate)(struct gpio_chip *chip, enum gpio_regmap_op op, unsig=
ned
>> int offset, unsigned int reg, unsigned int mask, unsigned int *value)
>>=20
>> mask shouldn't need to be a pointer as you don't have to modify it, do y=
ou?
>> reg_mask_xlate, already does that.
>>=20
>
> Actually, I do need to modify the 'mask', so it still needs to be passed
> as a pointer to this callback.
>
> Since the WREN enable bit and the data bit are located at different bit
> positions, the final 'mask' used in write API must be expanded to include
> both the WREN mask and the data mask.

You could still return both bits in the first xlate, no?

But yeah, that might be a bit asymmetrical and not intuitive. So
changing the mask (again) with the value sounds ok to me.

-michael

> Aside from needing 'mask' as a pointer, I completely agree with the rest =
of
> your suggested signature.
>
> Best Regards,
> Yu-Chun
>
>> -michael
>>=20
>> >               if (ret)
>> >                       return ret;
>> >       }
>> >
>> >       /* ignore input values which shadow the old output value */
>> >       if (gpio->reg_dat_base =3D=3D gpio->reg_set_base)
>> >               ret =3D regmap_write_bits(gpio->regmap, reg, mask,
>> mask_val);
>> >       else
>> >               ret =3D regmap_update_bits(gpio->regmap, reg, mask,
>> > mask_val);
>> >
>> >       return ret;
>> > }
>> >
>> > Best Regards,
>> > Yu-Chun


