Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE1C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wos0TNL78fyhGvrTFiYrEZxgYaMHol2UDLlgx/6hyNA=; b=b5HfmYbQrC67LEJPpeotsUa66U
	o4ENGgLQwiYhMkXQ4dSU7kdhYCoPPDrPiQjQLK/73GTFdZ/H0wl4sW3e1cLkZaYMtwDtbTjmavrbV
	YCgK5D+E3GtUoz9hq8mY7YdKIQbq3liov6jRbpNmJ7fenxK3rghoon6MUettC8QxxgDHQFcdbp1mF
	UBF6vco0XeM1DBHQvKjKJ/KU0eEvrDsSZtpq38JyqeJ5+DpCJiHfeP0X9ErkZDQu7htSeWmS9pf0M
	YJCjsyfIEHJS+HzrwHJTgCzElrBTqNy5m7MJChbp+xQ8k95TseC9SpJPGyyDBK1aepujFRXoN0JAH
	w1xPcjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2H9-00000007Y2e-1QMy;
	Tue, 10 Jun 2025 16:56:39 +0000
Received: from out-72.smtpout.orange.fr ([193.252.22.72] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzRp-000000073TE-1O7I;
	Tue, 10 Jun 2025 13:55:32 +0000
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id OzRPua8DmtcjXOzRWucHgO; Tue, 10 Jun 2025 15:55:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1749563722;
	bh=Wos0TNL78fyhGvrTFiYrEZxgYaMHol2UDLlgx/6hyNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=P1KTZe1XOW4D9HHqh6ZcZ6lv4WTcn/C7pVhRAa1+zaEydyluMc6OJtiq4BSuGvwo4
	 zZ6F8wPPNkIkgGWGp/7Kyz2SVyDorWCGgcbNdx52rvy4HTnz+/LXR4Ge5+jVFOYWcL
	 ToqLT+TnHFeMaIpGMdK2C0vGayPFMxyqHv/UlevhhFAUGG+IEbv6uZRYU6vt3W+X6b
	 jNkofwCMDpTA15G3gbYju8BKiSvLoIgQj3Oo393CFWP4cRNRLyvTi0il1sTGjZ0QHr
	 7JBMs8s9gzJV3uKUgQama8YgXie5Mjte3Jg4AaIMGKQwPs5boHg6UVLzq1JoWP7jOQ
	 VG2tBogHDMxng==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Jun 2025 15:55:22 +0200
X-ME-IP: 124.33.176.97
Message-ID: <b2f87cff-3a81-482b-bfdd-389950b7ec8e@wanadoo.fr>
Date: Tue, 10 Jun 2025 22:55:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: can: mcp251x: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
 <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-3-35668dd1c76f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_065529_780011_106D02F2 
X-CRM114-Status: GOOD (  18.47  )
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

On 10/06/2025 at 21:37, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This does not match the address with which you sent the patch: brgl@bgdev.pl

> ---
>  drivers/net/can/spi/mcp251x.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/can/spi/mcp251x.c b/drivers/net/can/spi/mcp251x.c
> index ec5c64006a16f703bc816983765584c5f3ac76e8..7545497d14b46c6388f3976c2bf7b9a99e959c1e 100644
> --- a/drivers/net/can/spi/mcp251x.c
> +++ b/drivers/net/can/spi/mcp251x.c
> @@ -530,8 +530,8 @@ static int mcp251x_gpio_get_multiple(struct gpio_chip *chip,
>  	return 0;
>  }
>  
> -static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			     int value)
> +static int mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			    int value)
>  {
>  	struct mcp251x_priv *priv = gpiochip_get_data(chip);
>  	u8 mask, val;
> @@ -545,9 +545,11 @@ static void mcp251x_gpio_set(struct gpio_chip *chip, unsigned int offset,
>  
>  	priv->reg_bfpctrl &= ~mask;
>  	priv->reg_bfpctrl |= val;
> +
> +	return 0;

mcp251x_gpio_set() calls mcp251x_write_bits() which calls mcp251x_spi_write()
which can fail.

For this change to really make sense, the return value of mcp251x_spi_write()
should be propagated all the way around.

>  }
>  
> -static void
> +static int
>  mcp251x_gpio_set_multiple(struct gpio_chip *chip,
>  			  unsigned long *maskp, unsigned long *bitsp)
>  {
> @@ -561,7 +563,7 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
>  	val = FIELD_PREP(BFPCTRL_BFS_MASK, val);
>  
>  	if (!mask)
> -		return;
> +		return 0;
>  
>  	mutex_lock(&priv->mcp_lock);
>  	mcp251x_write_bits(priv->spi, BFPCTRL, mask, val);
> @@ -569,6 +571,8 @@ mcp251x_gpio_set_multiple(struct gpio_chip *chip,
>  
>  	priv->reg_bfpctrl &= ~mask;
>  	priv->reg_bfpctrl |= val;
> +
> +	return 0;

Same as above.

>  }
>  
>  static void mcp251x_gpio_restore(struct spi_device *spi)
> @@ -594,8 +598,8 @@ static int mcp251x_gpio_setup(struct mcp251x_priv *priv)
>  	gpio->get_direction = mcp251x_gpio_get_direction;
>  	gpio->get = mcp251x_gpio_get;
>  	gpio->get_multiple = mcp251x_gpio_get_multiple;
> -	gpio->set = mcp251x_gpio_set;
> -	gpio->set_multiple = mcp251x_gpio_set_multiple;
> +	gpio->set_rv = mcp251x_gpio_set;
> +	gpio->set_multiple_rv = mcp251x_gpio_set_multiple;
>  	gpio->base = -1;
>  	gpio->ngpio = ARRAY_SIZE(mcp251x_gpio_names);
>  	gpio->names = mcp251x_gpio_names;
> 

Yours sincerely,
Vincent Mailhol


