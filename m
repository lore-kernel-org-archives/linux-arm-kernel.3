Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42586C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHxCj/WeuO0V6P+rYLNraNK+W/B4StlcnsBL6N3GDhw=; b=WB0crrGjtl/V8bStYdklE0oR0V
	N2jn9g3RHlKRP9anBdEjRTE+5nDhKdj6ebPVKh+0Oadi81h6Tg6Vq8iesZLS3Ilmyrav6gPtcqTv8
	T9T2bpVDa21xAZwP02MvDSNmuAHHolBlxUlRMtR215/0snhKCFyPQVIKl/mfDw6EHoBZGYjIWfsuM
	qyA0m+79qbXjbm3HxdMtZQSaQNG64nXteyvvAh7jKbJKqOghzx0gHaiZSxXEmXhPbf1/woMuDPA6M
	Hw95pvw6ScazXXLdTBGQiY0gXuJ1eaaOSZEw1Dp2PRG7ehJsyq4dlX8hTuG2xcv2r76Ihnu34IHVA
	5ICLScFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GL3-00000001JJR-1nto;
	Mon, 14 Apr 2025 09:42:50 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4G3m-00000001Gak-3Mwv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 09:25:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAC1043308;
	Mon, 14 Apr 2025 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744622692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHxCj/WeuO0V6P+rYLNraNK+W/B4StlcnsBL6N3GDhw=;
	b=XD9uxQEPOqb9XH3Y8lP0LIktXX66Zjcgrrr02TlP/0pcgaoLtzpbsqyGFrJHxuFsaiaNLo
	XCfsbd+c6COT9G7i9LIOBvAf2Yz0KF7yAfdpXU6EeeIm/Q9Cu6Hf9clpBPnMbyCDj7OQBf
	z1S9Q7xvLcls6qTSrmbAKP2WFczvfCOtyPxnkPeuf7XT88+UpmHvLYDC6mOAOmeLv3FVVF
	DiiF3R+Z0B6owa7XveaS/KmRN729YKFbEwnZBy55MiT2bKAiAwDJNaD40HC/0x0DOnCYYV
	PLs2VuqnQv6ZOSNMUV5dBnZ91zfSjN3CR57bZ/5KvsvTZL2bMBHcuCbekrrbww==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Apr 2025 11:24:51 +0200
Message-Id: <D9694O0MKV31.3SY6ZCTSKXWI9@bootlin.com>
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Chenyuan Yang" <chenyuan0y@gmail.com>, <linus.walleij@linaro.org>,
 <brgl@bgdev.pl>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevvffhofhfjgesthhqredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduteeltdevjedvkeelueejhfdvleeiueetvdfgveffffekueeghffhieduleejveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghhvghnhihurghntdihsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtt
 hhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_022459_143263_6073779F 
X-CRM114-Status: GOOD (  19.04  )
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

Hello Chenyuan, Linus, Bartosz,

On Sat Apr 12, 2025 at 9:31 PM CEST, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
>
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
>
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 966942ae4936 ("gpio: nomadik: extract GPIO platform driver from dr=
ivers/pinctrl/nomadik/")
> ---
>  drivers/gpio/gpio-nomadik.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> index fa19a44943fd..dbc4cdddf4df 100644
> --- a/drivers/gpio/gpio-nomadik.c
> +++ b/drivers/gpio/gpio-nomadik.c
> @@ -262,8 +262,11 @@ static unsigned int nmk_gpio_irq_startup(struct irq_=
data *d)
>  {
>  	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>  	struct nmk_gpio_chip *nmk_chip =3D gpiochip_get_data(gc);
> +	int ret;
> =20
> -	clk_enable(nmk_chip->clk);
> +	ret =3D clk_enable(nmk_chip->clk);
> +	if (ret)
> +		return ret;
>  	nmk_gpio_irq_unmask(d);
>  	return 0;
>  }

Returning a negative value whereas the ->irq_startup() [0] return value
is an unsigned int? From some quick godbolt testing and briefly reading
the spec it looks safe to do a round trip (signed->unsigned->signed),
though not ideal to my eyes.

The caller is __irq_startup() [1].

As for why irq_startup returns an unsigned int, I am unsure. The kernel
Git history isn't enough to know more. The startup field in struct
hw_interrupt_type appeared on v2.3.14 [2], so no commit message to
explain decisions.

Seeing the __irq_startup() code, my proposal would be to turn the return
value to a signed int, but I haven't exhaustively checked codepaths.

Thanks,

[0]: https://elixir.bootlin.com/linux/v6.13.7/source/include/linux/irq.h#L5=
03
[1]: https://elixir.bootlin.com/linux/v6.13.7/source/kernel/irq/chip.c#L244
[2]: https://elixir.bootlin.com/linux/2.3.14/source/include/linux/irq.h#L21

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


