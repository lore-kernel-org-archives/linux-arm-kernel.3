Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2487EC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/yYflviKI5W+Z6DR8vKzrNKyIo9rWWDQto2xPyjjDI=; b=oTwHgYKB3xyQha++V/g1M+2eSY
	a97IIqtMhX2T1x3Fszv3ct7oLTSRG9TZHC2R7EuB1m9Z3R86l9L3Qugl86ipEQrkHrcW19s++4uk0
	nBcyV/mzql8YLx3BJ7rSTZgdH12Zf3B3qi2OBeJUm1DgV15nXnobpFOTYpl4ZNjzIRPpC2L36jVok
	+ks68p5FHZ6UfLPWETWyc+dKbtar6v+yjt7lsn/Nx8mkb/mSNf9jSzElJltjy5Y6Y67zMMgJ3MwIt
	uiA1KNSjSeSebKRmYuPVwZknZ/VfH5G7A5gEi31BGtPYVh/BuWwppq5GubivLBFDhSYtkGTXQe4Fz
	S5eoWkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa50-00000009buD-00Gz;
	Wed, 09 Jul 2025 19:03:42 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWIu-000000095Kp-0iCC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:01:49 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2AEDE46;
	Wed,  9 Jul 2025 17:01:39 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 17:01:38 +0200
Message-Id: <DB7M5DTXEACR.3N7DO1DM0PZB1@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn
 Guo" <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
In-Reply-To: <20250709112658.1987608-5-ioana.ciornei@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_080148_346678_2ED7C4E6 
X-CRM114-Status: GOOD (  28.14  )
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

Hi Ioana,

great to see another user of gpio-regmap.

On Wed Jul 9, 2025 at 1:26 PM CEST, Ioana Ciornei wrote:
> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS CPLD which are single register fixed-direction. This cannot be
> modeled using the gpio-regmap as-is since there is no way to
> present the true direction of a GPIO line.

You mean input and output mixed together in one register? At least
to me, that wasn't so obvious by the commit message, I had to look
at the actual driver.

> In order to make this use case possible, add a new callback to the
> gpio_config structure - .get_direction() - which can be used by user
> drivers to provide the fixed direction per GPIO line.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 17 ++++++++++++++++-
>  include/linux/gpio/regmap.h |  3 +++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 87c4225784cf..dac2acb26655 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -32,6 +32,8 @@ struct gpio_regmap {
>  	unsigned int reg_dir_in_base;
>  	unsigned int reg_dir_out_base;
> =20
> +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> +
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);
> @@ -129,6 +131,9 @@ static int gpio_regmap_get_direction(struct gpio_chip=
 *chip,
>  	unsigned int base, val, reg, mask;
>  	int invert, ret;
> =20
> +	if (gpio->get_direction)
> +		return gpio->get_direction(gpio, offset);
> +
>  	if (gpio->reg_dat_base && !gpio->reg_set_base)
>  		return GPIO_LINE_DIRECTION_IN;
>  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> @@ -163,7 +168,16 @@ static int gpio_regmap_set_direction(struct gpio_chi=
p *chip,
>  {
>  	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
>  	unsigned int base, val, reg, mask;
> -	int invert, ret;
> +	int invert, ret, dir;
> +
> +	if (gpio->get_direction) {
> +		dir =3D gpio->get_direction(gpio, offset);
> +		if (dir =3D=3D GPIO_LINE_DIRECTION_IN && output)
> +			return -EOPNOTSUPP;
> +		if (dir =3D=3D GPIO_LINE_DIRECTION_OUT && !output)
> +			return -EOPNOTSUPP;
> +		return 0;
> +	}

What is the intention here? Shouldn't there be just a .set_direction
op and if there isn't one, return EOPNOTSUPP?

In any case, that is unused code for your driver as far as I see,
because you neither set .reg_dir_in_base nor .reg_dir_out_base and
thus, .direction_input nor .direction_output are set within the
gpio_chip struct (see gpio_regmap_register()).

>  	if (gpio->reg_dir_out_base) {
>  		base =3D gpio_regmap_addr(gpio->reg_dir_out_base);
> @@ -247,6 +261,7 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>  	gpio->reg_clr_base =3D config->reg_clr_base;
>  	gpio->reg_dir_in_base =3D config->reg_dir_in_base;
>  	gpio->reg_dir_out_base =3D config->reg_dir_out_base;
> +	gpio->get_direction =3D config->get_direction;
> =20
>  	chip =3D &gpio->gpio_chip;
>  	chip->parent =3D config->parent;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index c722c67668c6..99fd973e61fa 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -37,6 +37,8 @@ struct regmap;
>   *			offset to a register/bitmask pair. If not
>   *			given the default gpio_regmap_simple_xlate()
>   *			is used.
> + * @get_direction:	(Optional) Callback to the user driver to return the
> + *			fixed direction of the GPIO line
>   * @drvdata:		(Optional) Pointer to driver specific data which is
>   *			not used by gpio-remap but is provided "as is" to the
>   *			driver callback(s).
> @@ -81,6 +83,7 @@ struct gpio_regmap_config {
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);
> +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> =20
>  	void *drvdata;
>  };


