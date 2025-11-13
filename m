Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10F9CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcVmJIMIDUBpoNFh8IIlD/pWCnPcll42RAeZea12pT8=; b=zdQU9Vnmi16OkKNFfw29hm6EJ/
	LKaRu1bn2q9viXpYUMRsH3myfKXo8DnvzjXzdvimWfvXqSoKefuVh5XD1z1LwiDquakfUbeRuYEZK
	/TZGAK7Xx5xrXP43ZI7pws6lU9r2y8sOtIqhb+FO4yZaR9/TwPUDEvHmYfUJbKVFIQAXBKqn3FZYz
	W+DI0r3KHKRjHPO8eAUZLmhiYqF6lfIu/0Tr7F/UeSUFJHID1dLQa4Y0tF5jLo6YtnLpNtDf9f0H3
	/P6lj66dSimywy2et8WeDuB5o1g47ck8MtuF3Sx0gi1PCNfKABg4tzMdxAVSMyrSmNqSuF5gg0I9y
	RfGkCIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYLR-0000000Ac6P-1QNR;
	Thu, 13 Nov 2025 14:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJYLQ-0000000Ac6I-3Bem
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 14:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1597160272;
	Thu, 13 Nov 2025 14:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182D7C113D0;
	Thu, 13 Nov 2025 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763044236;
	bh=qH4DioWsSdddifokanN44++630Ul0UCbsrzeONqMNSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5t+1LVBMmNcg3CUNoXBE1h3k+ZjGeBYM2uZBvVfRI0zJhzYeOyS+d/zngO8f9DMi
	 +j/VDe2MxRKXnHlcfBEaB1TpdSyAkhBRTQxmUyx/bH652wc7zFcvn1hAI1itNRuKTo
	 sGVc7wYfQWa5FRCHEnnjEhLQ0re84a5DpVqPR/QIZJdZUcbKlF4u/Cai22OruMQtky
	 ztO4pFoakumctnpI4svigQxI8WZH1ZPzI6ygN3HmA5R1coUzgvrYA7hub5Ukzrrpui
	 5/YPeMqVF9ZUxTB5/jWJNY8aysUyjnNx18WChJx3EqefU1XZhhNuEE/hQkG9DkvXH5
	 temUs1VNuy4yA==
Date: Thu, 13 Nov 2025 14:30:28 +0000
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"Dr . David Alan Gilbert" <linux@treblig.org>,
	Job Sava <jsava@criticallink.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v7 3/6] Input: mc13783-pwrbutton: convert pdata members
 to array
Message-ID: <20251113143028.GJ1949330@google.com>
References: <20251031195718.1586-1-akurz@blala.de>
 <20251031195718.1586-4-akurz@blala.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031195718.1586-4-akurz@blala.de>
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

On Fri, 31 Oct 2025, Alexander Kurz wrote:

> As preparation for the extension of support for all three mc13xxx
> variants, convert the members of mc13xxx_buttons_platform_data to
> arrays to allow index access within the next commit.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 42 +++++++++++++-------------
>  include/linux/mfd/mc13xxx.h            |  8 ++---

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 23 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 20f68aab6edf..2ee115d77b1c 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -108,24 +108,24 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	reg |= (pdata->b1on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
> -	reg |= (pdata->b2on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> -	reg |= (pdata->b3on_flags & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
> +	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
> +	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
> +	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
>  
>  	priv->pwr = pwr;
>  	priv->mc13783 = mc13783;
>  
>  	mc13xxx_lock(mc13783);
>  
> -	if (pdata->b1on_flags & MC13783_BUTTON_ENABLE) {
> -		priv->keymap[0] = pdata->b1on_key;
> -		if (pdata->b1on_key != KEY_RESERVED)
> -			__set_bit(pdata->b1on_key, pwr->keybit);
> +	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
> +		priv->keymap[0] = pdata->b_on_key[0];
> +		if (pdata->b_on_key[0] != KEY_RESERVED)
> +			__set_bit(pdata->b_on_key[0], pwr->keybit);
>  
> -		if (pdata->b1on_flags & MC13783_BUTTON_POL_INVERT)
> +		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
>  
> -		if (pdata->b1on_flags & MC13783_BUTTON_RESET_EN)
> +		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
>  			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
>  
>  		irq = platform_get_irq_byname(pdev, "b1on");
> @@ -144,15 +144,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		priv->irq[0] = irq;
>  	}
>  
> -	if (pdata->b2on_flags & MC13783_BUTTON_ENABLE) {
> -		priv->keymap[1] = pdata->b2on_key;
> -		if (pdata->b2on_key != KEY_RESERVED)
> -			__set_bit(pdata->b2on_key, pwr->keybit);
> +	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
> +		priv->keymap[1] = pdata->b_on_key[1];
> +		if (pdata->b_on_key[1] != KEY_RESERVED)
> +			__set_bit(pdata->b_on_key[1], pwr->keybit);
>  
> -		if (pdata->b2on_flags & MC13783_BUTTON_POL_INVERT)
> +		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
>  
> -		if (pdata->b2on_flags & MC13783_BUTTON_RESET_EN)
> +		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
>  			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
>  
>  		irq = platform_get_irq_byname(pdev, "b2on");
> @@ -171,15 +171,15 @@ static int mc13783_pwrbutton_probe(struct platform_device *pdev)
>  		priv->irq[1] = irq;
>  	}
>  
> -	if (pdata->b3on_flags & MC13783_BUTTON_ENABLE) {
> -		priv->keymap[2] = pdata->b3on_key;
> -		if (pdata->b3on_key != KEY_RESERVED)
> -			__set_bit(pdata->b3on_key, pwr->keybit);
> +	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
> +		priv->keymap[2] = pdata->b_on_key[2];
> +		if (pdata->b_on_key[2] != KEY_RESERVED)
> +			__set_bit(pdata->b_on_key[2], pwr->keybit);
>  
> -		if (pdata->b3on_flags & MC13783_BUTTON_POL_INVERT)
> +		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
>  			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
>  
> -		if (pdata->b3on_flags & MC13783_BUTTON_RESET_EN)
> +		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)
>  			reg |= MC13783_POWER_CONTROL_2_ON3BRSTEN;
>  
>  		irq = platform_get_irq_byname(pdev, "b3on");
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.h
> index dd46fe424a80..4437ab80fcf8 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -181,12 +181,8 @@ struct mc13xxx_leds_platform_data {
>  #define MC13783_BUTTON_RESET_EN		(1 << 4)
>  
>  struct mc13xxx_buttons_platform_data {
> -	int b1on_flags;
> -	unsigned short b1on_key;
> -	int b2on_flags;
> -	unsigned short b2on_key;
> -	int b3on_flags;
> -	unsigned short b3on_key;
> +	int b_on_flags[3];
> +	unsigned int b_on_key[3];
>  };
>  
>  #define MC13783_TS_ATO_FIRST	false
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

