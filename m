Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9D8C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St9QVpMeJZt7kBp7YQlB/8fQhV3xxyBiullWLJdrNxQ=; b=DFVpwxbOjrGjKAJ+BK1l8yT0qu
	fzPLgofQA8nai7dc2EXZh91AybcVG33cFSakmlN9rnL/Y71nNImofH5BINXnIPztTltSNMK0zIhap
	XKGhbKYBcInsj7ACNrhwtnSMga7TrT0uJgWQf58eH87e1P57F5Wh6pnwF6g511DOU7X3HtEm+jDjP
	D61aos1BBZJCiDSUnRi2BXi8bWpfDGtY8BGrjm8vMtUHL/NkJgsZAw7mwROpy/7dairIewwh+eq5B
	m3CnYvaHNwweg3WHO/7a1ERGCM2ToQHDBmPRhqun+f2YRBFFpLLttW5qbyt/Rs5s7l7UGTfBv5jCi
	AdhBMzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI0t-00000002O51-3qyp;
	Mon, 27 Jul 2026 09:52:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI0s-00000002O4m-2jmD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:52:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BD9243D49;
	Mon, 27 Jul 2026 09:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC4A1F00A3A;
	Mon, 27 Jul 2026 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145966;
	bh=St9QVpMeJZt7kBp7YQlB/8fQhV3xxyBiullWLJdrNxQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=D7LQDNNDA7yxSPg3t7gWSrmlFcqdt2c4J7KYSntBViU2wjlSdLb0+Q27vZVQzJpOT
	 PdCgS/AZVotWK/j93cN4YMEKNnPQ9sG2rSPVFMYjFBq6gKITUvWYJNgJR+7YpdMKm6
	 1eDDNXfmoxcrDjdAgYcDLw/VeqfyCNUB+a+VXsoGMdChXLJBsaNfhiPvuZRHkRZpRR
	 0ww54bMCUf7GYR6CC66yuQp0GYo+VnQs07X4x2EwT8EpzTWaSCDrNtVABHaTNRO8QU
	 z89fHxTAj1S3a5To+QFDn+UhhhB9aAfwXCxlHCaL2+NgtAQT0w9xln6SEBdDc0I/q0
	 OYcomXxi4de8A==
Message-ID: <1666c7f9-4d32-495f-a737-3fc06872690b@kernel.org>
Date: Mon, 27 Jul 2026 11:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v1 2/7] media: em28xx: Split
 em28xx_pctv_290e_set_lna_gpio() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-media@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260715185112.1323510-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 15/07/2026 20:46, Andy Shevchenko wrote:
> Split em28xx_pctv_290e_set_lna_gpio() helper in order to deduplicate
> the GPIO request and setting.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/usb/em28xx/em28xx-dvb.c | 31 ++++++++++++---------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
> index 8482fc4045ea..ef148a27c94d 100644
> --- a/drivers/media/usb/em28xx/em28xx-dvb.c
> +++ b/drivers/media/usb/em28xx/em28xx-dvb.c
> @@ -737,17 +737,14 @@ static void pctv_520e_init(struct em28xx *dev)
>  				regs[i].r, regs[i].len);
>  };
>  
> -static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
> +static int em28xx_pctv_290e_set_lna_gpio(struct em28xx *dev, u32 lna)
>  {
> -	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> -	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
> -	struct em28xx *dev = i2c_bus->dev;
>  #ifdef CONFIG_GPIOLIB_LEGACY
>  	struct em28xx_dvb *dvb = dev->dvb;
>  	int ret;
>  	unsigned long flags;
>  
> -	if (c->lna == 1)
> +	if (lna == 1)
>  		flags = GPIOF_OUT_INIT_HIGH; /* enable LNA */
>  	else
>  		flags = GPIOF_OUT_INIT_LOW; /* disable LNA */
> @@ -761,11 +758,20 @@ static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
>  	return ret;
>  #else
>  	dev_warn(&dev->intf->dev, "%s: LNA control is disabled (lna=%u)\n",
> -		 KBUILD_MODNAME, c->lna);
> +		 KBUILD_MODNAME, lna);
>  	return 0;
>  #endif
>  }
>  
> +static int em28xx_pctv_290e_set_lna(struct dvb_frontend *fe)
> +{
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	struct em28xx_i2c_bus *i2c_bus = fe->dvb->priv;
> +	struct em28xx *dev = i2c_bus->dev;
> +
> +	return em28xx_pctv_290e_set_lna_gpio(dev, c->lna);
> +}
> +
>  static int em28xx_pctv_292e_set_lna(struct dvb_frontend *fe)
>  {
>  	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> @@ -1920,19 +1926,10 @@ static int em28xx_dvb_init(struct em28xx *dev)
>  				goto out_free;
>  			}
>  
> -#ifdef CONFIG_GPIOLIB_LEGACY
>  			/* enable LNA for DVB-T, DVB-T2 and DVB-C */
> -			result = gpio_request_one(dvb->lna_gpio,
> -						  GPIOF_OUT_INIT_LOW, NULL);
> -			if (result)
> -				dev_err(&dev->intf->dev,
> -					"gpio request failed %d\n",
> -					result);
> -			else
> -				gpio_free(dvb->lna_gpio);
> +			em28xx_pctv_290e_set_lna_gpio(dev, 0);
>  
> -			result = 0; /* continue even set LNA fails */
> -#endif
> +			/* continue even set LNA fails */
>  			dvb->fe[0]->ops.set_lna = em28xx_pctv_290e_set_lna;
>  		}
>  


