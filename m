Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F85C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=; b=KL4FQR8HO7PaSjhGKUZDLUEWun
	HNCbJi2dMl9X3bD1ep8sfnJjN2ieys3V+G9WOvs6cGOHk4mkg9CN5HlNkU4nxO/Cu5ARpY7/avHLN
	H+c7morOyg9iy2pMb0DbMzb6dELrLics8WhlKtmYb+IT9Ck7LdzA89i8DIxyaa4qu75fzBPDA6nLM
	UDkqEk4VIRPbjQjbxUMfIinemk6QwUq8k+Twh2ukvqZEoCEEXVBXz8seNkc6Z2jJt/G7WSD3IN0cR
	Gcd9vxM4EfRDJmtXTN/WOoJLlYyeHIrWn4mNBexy8WUuxvnqVFzBrpN4IMZ1jW8hnv8q3aEkGxWoK
	WqklI3mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsfY-0000000AGkY-2jQr;
	Wed, 18 Jun 2025 13:17:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrSI-0000000A2fC-250R;
	Wed, 18 Jun 2025 11:59:51 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-553b5165cf5so5771375e87.0;
        Wed, 18 Jun 2025 04:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750247988; x=1750852788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
        b=Sm5HsPJLup4haN+JTiS5dCBzV5qwGUWxJaJnd1kqik9iodi2WZ73WJSGoiQdGyui4x
         pIyC26+GKjBvWLyliIgCmvhIgpDv2OaolUSEOE5B5nXSwQl6S38TM58usn1YXP6uwNYF
         PjcpVd8AYjoUgVIp9mUt7/HpBrRS6JY28KrnDer8OB0tJfyCVZQpZKc1HOJ8H0cBUUNK
         AgP6r2twMnmHOwyANBIq86FxF+him+ya4OYg1psOm8blQ5vlLmlTqYf6BQL4DaGunMVL
         BdbG9W9GkO+IJs9e7J4UVSYBiFPEOWAXxlPwQJMXtPBELma4IY41Ciq3BCznLUql0r+r
         I6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247988; x=1750852788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TQmvTgeWB4YgSToPjAwaMsmcK/mn8xvOCLcOf55+Dk=;
        b=vwOpX+f/NfZrmj+5ofHEJEz1brKdzSvMz4eYtIG1qMu690LLlMIPdyccURVI1zDPRv
         +MdiY/jI5g5QiR1vAK/oNiPYGvIpSigRQV2tVGGeva5fWdpo0+uDkgWuA2v4RkoH9ORg
         YmS+QuLXL3diOmyio/JlacyrpgKu/+BSf+TL8i1+qshQGJSwOpyF6OtyFrXatdQk+IOR
         ivXNO4PCrE92T3a4oSKO82Sf7o4Q2tw072eEI1dKyHbovKPH+sKF29JXnEUPqXoybNAP
         0uwvzTzLx7MR1lM8dfoCg6fb5+dpDdaQI/XH2w5EWFyAL42gO039hFQMx01r2FV1lhAn
         vkvw==
X-Forwarded-Encrypted: i=1; AJvYcCVefe15V1Y530m+HIwdhFOGqFjrLepLwjdYD47yM7GYXCYRz0jnjtzRqdMF3rm8oZ6aqPvAkDZ/xvVBijc=@lists.infradead.org, AJvYcCXLEZs9m7/WRGofItyM5Q26zKyzdLRYY/0BF+Wzk9hGSe/Sn0dgLkYqt4A3h9iFhs6T0rrcrrADkZdLPQ1l1wct@lists.infradead.org
X-Gm-Message-State: AOJu0YxmyV4/xOIEE0XA67Zn2/KNYB22d+37MbmLPrlxq3xENXzSAgdB
	3P1NPPTV2D9K+a/Umrje6v5okQjJIpGknZMH/NExeKbRPSSPcLfoFkt0
X-Gm-Gg: ASbGncv0ockWqQOddN3mDRQM40ACJ3J6Jb1sMx85FMj5KuCPE3qCVWXN7uTPZrz+N0Y
	TdQdWn92A7SElDw/0ytyDSLBPl1KtolIPxpIp+doUMXOdoZEX2kuvxPANzXDhh7iMlY27+uqJo7
	rjlUbGNVPvH8fjJGzu7w8S9Q75p6OKqZq8sh6Wowsv2dz+YoP45Vn46dMoCkZdHbRs4pmqVFO1h
	lMTpsbygA+kTZGQYfDo8t2FXHFEHmEBPxpSFj6kUEUgZn8fzF0YHaG1HewhT7gFgzR4D8rDDjfM
	ViposAzLiyQRTPvZHVmKh1XzovxzyvxU/+adBQB9NjWk6F6KLLUS2yZwN2GaqjYa2urNU5GxCiX
	9vg==
X-Google-Smtp-Source: AGHT+IEEuLAvgr2OL57VbH9FchKBqYmVVAHa3AT4JbHjg5k/1SYfHWucA3kEC25R23C9uvFFL7j1Sg==
X-Received: by 2002:a2e:b8c4:0:b0:32b:2f36:4d92 with SMTP id 38308e7fff4ca-32b4a413262mr52990161fa.12.1750247987973;
        Wed, 18 Jun 2025 04:59:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-32b7dafc837sm1702891fa.47.2025.06.18.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:59:47 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:59:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter
 callbacks
Message-ID: <2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_045950_538725_0685E1D2 
X-CRM114-Status: GOOD (  22.36  )
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

On 2025-06-10 14:33:11 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-mmio.c | 53 ++++++++++++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 4841e4ebe7a67d0f954e9a6f995ec5758f124edd..9169eccadb238efe944d494054b1e009f16eee7f 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -211,11 +211,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>  	return 0;
>  }
>  
> -static void bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_none(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
> +	return 0;
>  }
>  
> -static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  	unsigned long flags;
> @@ -230,10 +231,12 @@ static void bgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	gc->write_reg(gc->reg_dat, gc->bgpio_data);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> -				 int val)
> +static int bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
> +				int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  
> @@ -241,9 +244,11 @@ static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
>  		gc->write_reg(gc->reg_set, mask);
>  	else
>  		gc->write_reg(gc->reg_clr, mask);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +static int bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>  	unsigned long mask = bgpio_line2mask(gc, gpio);
>  	unsigned long flags;
> @@ -258,6 +263,8 @@ static void bgpio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  	gc->write_reg(gc->reg_set, gc->bgpio_data);
>  
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +
> +	return 0;
>  }
>  
>  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> @@ -298,21 +305,25 @@ static void bgpio_set_multiple_single_reg(struct gpio_chip *gc,
>  	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>  
> -static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +static int bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			       unsigned long *bits)
>  {
>  	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_dat);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> -				   unsigned long *bits)
> +static int bgpio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
> +				  unsigned long *bits)
>  {
>  	bgpio_set_multiple_single_reg(gc, mask, bits, gc->reg_set);
> +
> +	return 0;
>  }
>  
> -static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> -					  unsigned long *mask,
> -					  unsigned long *bits)
> +static int bgpio_set_multiple_with_clear(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
>  {
>  	unsigned long set_mask, clear_mask;
>  
> @@ -322,6 +333,8 @@ static void bgpio_set_multiple_with_clear(struct gpio_chip *gc,
>  		gc->write_reg(gc->reg_set, set_mask);
>  	if (clear_mask)
>  		gc->write_reg(gc->reg_clr, clear_mask);
> +
> +	return 0;
>  }
>  
>  static int bgpio_dir_return(struct gpio_chip *gc, unsigned int gpio, bool dir_out)
> @@ -510,18 +523,18 @@ static int bgpio_setup_io(struct gpio_chip *gc,
>  	if (set && clr) {
>  		gc->reg_set = set;
>  		gc->reg_clr = clr;
> -		gc->set = bgpio_set_with_clear;
> -		gc->set_multiple = bgpio_set_multiple_with_clear;
> +		gc->set_rv = bgpio_set_with_clear;
> +		gc->set_multiple_rv = bgpio_set_multiple_with_clear;
>  	} else if (set && !clr) {
>  		gc->reg_set = set;
> -		gc->set = bgpio_set_set;
> -		gc->set_multiple = bgpio_set_multiple_set;
> +		gc->set_rv = bgpio_set_set;
> +		gc->set_multiple_rv = bgpio_set_multiple_set;
>  	} else if (flags & BGPIOF_NO_OUTPUT) {
> -		gc->set = bgpio_set_none;
> -		gc->set_multiple = NULL;
> +		gc->set_rv = bgpio_set_none;
> +		gc->set_multiple_rv = NULL;
>  	} else {
> -		gc->set = bgpio_set;
> -		gc->set_multiple = bgpio_set_multiple;
> +		gc->set_rv = bgpio_set;
> +		gc->set_multiple_rv = bgpio_set_multiple;
>  	}
>  
>  	if (!(flags & BGPIOF_UNREADABLE_REG_SET) &&
> @@ -654,7 +667,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
>  	}
>  
>  	gc->bgpio_data = gc->read_reg(gc->reg_dat);
> -	if (gc->set == bgpio_set_set &&
> +	if (gc->set_rv == bgpio_set_set &&
>  			!(flags & BGPIOF_UNREADABLE_REG_SET))
>  		gc->bgpio_data = gc->read_reg(gc->reg_set);
>  
> 
> -- 
> 2.48.1
> 

Isn't this missing to convert gc->set() to gc-set_rv() in several
places?

Without the attached diff I get a null pointer reference on e.g. the
spacemit k1 driver.

Regards,
Klara Modin

--

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb23..57622f45d33e 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 
 	return bgpio_dir_return(gc, gpio, true);
 }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
 	bgpio_dir_out(gc, gpio, val);
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }

