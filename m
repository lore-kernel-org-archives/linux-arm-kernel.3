Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F93C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GU5bgiIwiBooyJdawhsjEUsmRYCncA7weQlPR+RPElI=; b=Cv+7ZRUnV2DLBUEVhtw01S+Tqg
	GEXn38QmKeS21jI6CLFNPSMvJ0YdriKS/2isiIvBUsN+P12Gcp+wiT+/bB32ml9WPPrwAmietD8Jo
	JnB/ZBfflJ5u0uWi17wWGuBG9NK/rmK/sPm12G8HzINBOCCPZO/1jb9H6ybX6KktGNCFcepPaVA4f
	Yhc9PYnxGP1W2scz8HaMjNjEC+N/nwJ5mUWpre3w8AJtpJzBH7toO4+0BVE7Z/k4DviW8KHivSNB2
	0xm+BSn7TAZDUEHjN46OpSKxGwXA6i1AJtev5KJDJ/uPMaBDAqLNAjkSFARv0Moo2n0iVnrHHU/ZS
	2fI9404w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLE9-0000000DOga-48Ep;
	Tue, 05 Aug 2025 17:13:29 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujKCY-0000000DEXy-3nN8;
	Tue, 05 Aug 2025 16:07:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45994a72356so336805e9.0;
        Tue, 05 Aug 2025 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754410065; x=1755014865; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GU5bgiIwiBooyJdawhsjEUsmRYCncA7weQlPR+RPElI=;
        b=F6k3Co2h2hDw7QPkoboetpU6eb4si5M6ZrTkyRqfbgKNOG5SZugr1EZIUbYdPmInbQ
         vwvtnh9qLb1NJ2vMOqZw6QLk+aO3yRdEQoGIT/47DeuZQDIehIHbVmOYdMbLBCgnRiL6
         0btiAtlGO9Q/a2Y4r0fJg5XfH4CAx+r6ZofSfXnzHw0kUseVMK8Epe8Y6XOO8YBukobI
         YGYJbB1In13mpIJnnjKu2okMbhvS4fvXFCWQDp6PAQExIyoLEKRSvK4KrRfDM+qQjgcw
         +yrF4GyeBeIIWAoXNh84YDRyEZ+1MYw35MILrp2DaFpwN86KIJhT3mXfWUNOBnU1lqS/
         GPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754410065; x=1755014865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GU5bgiIwiBooyJdawhsjEUsmRYCncA7weQlPR+RPElI=;
        b=CdpLYQFNc/zZbYRGJyBp4cvZuyPtt9wmFlywgoRLI3a0rFrmR/6hzckSzm1DhW/vvu
         bKJcuf6ElpKl6h4+l6khFRNA9Pqhj9ZFeFQrzuXW4y5sdrUJ49u8od99n0UjgTiz7gU3
         v5W943UmJisdKFCwlotHw4ihqe5Zpo6NdbX4nsTB3DwhMyhL29dJLDiJCFdYiqAs9Xpv
         I285aqH0lJDsSEFCOoMWE374NA4vppl+1xzjUMgTV+F7BdvPR2JTvOvdZh8B54mpxtE/
         PQPzizYPgdgukyd5FloXGUxFC7sTPgADUl1MjNJZ2M98IYu/flDM8V5uIEF5YThGGQCL
         Ceew==
X-Forwarded-Encrypted: i=1; AJvYcCUT96Z6kWnx2aHy0vMV/WutItFzsJHISIV1PQG0/ShtirCxUBXI8+E8F3zz9eRXUBmMxdnOBYdDgZcYnG2T8cSW@lists.infradead.org, AJvYcCVW2fW5m7q6IDibLWCtK+Gi7p0dE+qRNE6PRtmYx4bsbdu6BlUmStbz+pTumslFbUsfN5+6y4VqEbPhW56B8Lw=@lists.infradead.org, AJvYcCX4XvErMqf6R8elem5Wg9uBUxdWGKEjhreU3Esiwp27/aSCVh4sPIzg/n0Xz7hIIP6PLPIaRJfMACQa/9lXdfA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ0V+1gEHbm1f4CDF+mc76WWsmBN8zm9Sb87nvvNT4+mZC5+Es
	Ot70hOwv7wrgJ5hzhqzDL304mEWnwyQIBwbhoKVMwlRY9Nks9zdmgaO/
X-Gm-Gg: ASbGncsChdxjDwca33mopSLWnppaGGTCcq71RyTa/gONNYgA5SS72Ks6frzDgbbwAvg
	XwWzbgilIo0qEB0/q0f3vQ2yCk7aHxGKV8PbjpMJDfnRr5/rbBZBbr4kX994j8FMs7w03D5AaCq
	bf04FyKIVRNhk+MmxSo6lHtQkdNsyuR9mB6MV8LPO/TVd5nwg2tdL+5nVSBxE1dAGYDH8DAZGuS
	SGLoULQcD8Lpx+66bkJdDOhbGRV/vB9K7CWf1nAWcI+3CtxeOtV5OkJzxms632rBaKBkAgjmZjV
	0f+UQYsymQF7wfC4XJK5C4phg6n3uwxmsJlSIUa6c7LrTGlkNMbepjdalmfuXOwK07cg2paIT9W
	pVkIWe8/QoMy35w==
X-Google-Smtp-Source: AGHT+IEVF2LDgHDXN1VzGtGccdIlvCW+TzXU0H2YrdmX5ZHgSwBhCDp/boeIm8qUq3oh8mVv9xUiog==
X-Received: by 2002:a05:600c:15cb:b0:459:dbc2:201e with SMTP id 5b1f17b1804b1-459e611e82fmr2217115e9.9.1754410064607;
        Tue, 05 Aug 2025 09:07:44 -0700 (PDT)
Received: from nsa ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5862fd9sm10943955e9.16.2025.08.05.09.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:07:44 -0700 (PDT)
Date: Tue, 5 Aug 2025 17:08:00 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Francesco Dolcini <francesco@dolcini.it>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Song Qiang <songqiang1304521@gmail.com>, 
	Crt Mori <cmo@melexis.com>, kernel@axis.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] iio: Remove error prints for
 devm_add_action_or_reset()
Message-ID: <szxvwg52wljg2hv55g2cx7xybpa53he2dpbecc6cimafoupe6d@qzeqdrwwoqcj>
References: <pndectqm7te.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pndectqm7te.a.out@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_090746_955975_DAA6A15D 
X-CRM114-Status: GOOD (  24.16  )
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

On Tue, Aug 05, 2025 at 11:33:33AM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
> Changes in v2:
> 
> * Split the patch to one seperate patch for each sub-system.
> 
> Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
> 
>  drivers/iio/accel/msa311.c          | 2 +-
>  drivers/iio/adc/ad4130.c            | 3 +--
>  drivers/iio/adc/ad7124.c            | 2 +-
>  drivers/iio/adc/ad7173.c            | 3 +--
>  drivers/iio/adc/mt6577_auxadc.c     | 3 +--
>  drivers/iio/adc/pac1921.c           | 3 +--
>  drivers/iio/adc/rockchip_saradc.c   | 3 +--
>  drivers/iio/adc/ti-ads1119.c        | 3 +--
>  drivers/iio/adc/ti-ads7924.c        | 6 ++----
>  drivers/iio/frequency/adf4350.c     | 3 +--
>  drivers/iio/light/al3000a.c         | 2 +-
>  drivers/iio/light/apds9306.c        | 2 +-
>  drivers/iio/light/bh1745.c          | 3 +--
>  drivers/iio/light/opt4001.c         | 3 +--
>  drivers/iio/light/opt4060.c         | 3 +--
>  drivers/iio/magnetometer/als31300.c | 2 +-
>  drivers/iio/magnetometer/tmag5273.c | 2 +-
>  drivers/iio/proximity/vl53l0x-i2c.c | 3 +--
>  drivers/iio/temperature/mlx90635.c  | 6 ++----
>  19 files changed, 21 insertions(+), 36 deletions(-)

+1

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

> 
> diff --git a/drivers/iio/accel/msa311.c b/drivers/iio/accel/msa311.c
> index 3e10225410e8..2ccb22317bdc 100644
> --- a/drivers/iio/accel/msa311.c
> +++ b/drivers/iio/accel/msa311.c
> @@ -1195,7 +1195,7 @@ static int msa311_probe(struct i2c_client *i2c)
>  	 */
>  	err = devm_add_action_or_reset(dev, msa311_powerdown, msa311);
>  	if (err)
> -		return dev_err_probe(dev, err, "can't add powerdown action\n");
> +		return err;
>  
>  	err = pm_runtime_set_active(dev);
>  	if (err)
> diff --git a/drivers/iio/adc/ad4130.c b/drivers/iio/adc/ad4130.c
> index 6cf790ff3eb5..ff778a44323f 100644
> --- a/drivers/iio/adc/ad4130.c
> +++ b/drivers/iio/adc/ad4130.c
> @@ -2035,8 +2035,7 @@ static int ad4130_probe(struct spi_device *spi)
>  
>  	ret = devm_add_action_or_reset(dev, ad4130_disable_regulators, st);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to add regulators disable action\n");
> +		return ret;
>  
>  	ret = ad4130_soft_reset(st);
>  	if (ret)
> diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
> index 9808df2e9242..4481a4ca7ac3 100644
> --- a/drivers/iio/adc/ad7124.c
> +++ b/drivers/iio/adc/ad7124.c
> @@ -1300,7 +1300,7 @@ static int ad7124_probe(struct spi_device *spi)
>  		ret = devm_add_action_or_reset(&spi->dev, ad7124_reg_disable,
>  					       st->vref[i]);
>  		if (ret)
> -			return dev_err_probe(dev, ret, "Failed to register disable handler for regulator #%d\n", i);
> +			return ret;
>  	}
>  
>  	st->mclk = devm_clk_get_enabled(&spi->dev, "mclk");
> diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
> index 4413207be28f..d15e305d3380 100644
> --- a/drivers/iio/adc/ad7173.c
> +++ b/drivers/iio/adc/ad7173.c
> @@ -1717,8 +1717,7 @@ static int ad7173_fw_parse_device_config(struct iio_dev *indio_dev)
>  
>  	ret = devm_add_action_or_reset(dev, ad7173_disable_regulators, st);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to add regulators disable action\n");
> +		return ret;
>  
>  	ret = device_property_match_property_string(dev, "clock-names",
>  						    ad7173_clk_sel,
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 3343b54e8e44..fe9e3ece3fda 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -297,8 +297,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  
>  	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "Failed to add action to managed power off\n");
> +		return ret;
>  
>  	ret = devm_iio_device_register(&pdev->dev, indio_dev);
>  	if (ret < 0)
> diff --git a/drivers/iio/adc/pac1921.c b/drivers/iio/adc/pac1921.c
> index 72aa4ca2e5a4..35433250b008 100644
> --- a/drivers/iio/adc/pac1921.c
> +++ b/drivers/iio/adc/pac1921.c
> @@ -1279,8 +1279,7 @@ static int pac1921_probe(struct i2c_client *client)
>  	ret = devm_add_action_or_reset(dev, pac1921_regulator_disable,
>  				       priv->vdd);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -			"Cannot add action for vdd regulator disposal\n");
> +		return ret;
>  
>  	msleep(PAC1921_POWERUP_TIME_MS);
>  
> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
> index bd62daea0a3e..926971cb50bf 100644
> --- a/drivers/iio/adc/rockchip_saradc.c
> +++ b/drivers/iio/adc/rockchip_saradc.c
> @@ -527,8 +527,7 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
>  	ret = devm_add_action_or_reset(&pdev->dev,
>  				       rockchip_saradc_regulator_disable, info);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "failed to register devm action\n");
> +		return ret;
>  
>  	ret = regulator_get_voltage(info->vref);
>  	if (ret < 0)
> diff --git a/drivers/iio/adc/ti-ads1119.c b/drivers/iio/adc/ti-ads1119.c
> index d2f86e1ec656..3e4f79dfb078 100644
> --- a/drivers/iio/adc/ti-ads1119.c
> +++ b/drivers/iio/adc/ti-ads1119.c
> @@ -778,8 +778,7 @@ static int ads1119_probe(struct i2c_client *client)
>  
>  	ret = devm_add_action_or_reset(dev, ads1119_powerdown, st);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to add powerdown action\n");
> +		return ret;
>  
>  	return devm_iio_device_register(dev, indio_dev);
>  }
> diff --git a/drivers/iio/adc/ti-ads7924.c b/drivers/iio/adc/ti-ads7924.c
> index b1f745f75dbe..46255c530cb4 100644
> --- a/drivers/iio/adc/ti-ads7924.c
> +++ b/drivers/iio/adc/ti-ads7924.c
> @@ -399,8 +399,7 @@ static int ads7924_probe(struct i2c_client *client)
>  
>  	ret = devm_add_action_or_reset(dev, ads7924_reg_disable, data->vref_reg);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to add regulator disable action\n");
> +		return ret;
>  
>  	ret = ads7924_reset(indio_dev);
>  	if (ret < 0)
> @@ -414,8 +413,7 @@ static int ads7924_probe(struct i2c_client *client)
>  
>  	ret = devm_add_action_or_reset(dev, ads7924_set_idle_mode, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "failed to add idle mode action\n");
> +		return ret;
>  
>  	/* Use minimum signal acquire time. */
>  	ret = regmap_update_bits(data->regmap, ADS7924_ACQCONFIG_REG,
> diff --git a/drivers/iio/frequency/adf4350.c b/drivers/iio/frequency/adf4350.c
> index 47f1c7e9efa9..6665409a9a87 100644
> --- a/drivers/iio/frequency/adf4350.c
> +++ b/drivers/iio/frequency/adf4350.c
> @@ -673,8 +673,7 @@ static int adf4350_probe(struct spi_device *spi)
>  
>  	ret = devm_add_action_or_reset(&spi->dev, adf4350_power_down, indio_dev);
>  	if (ret)
> -		return dev_err_probe(&spi->dev, ret,
> -				     "Failed to add action to managed power down\n");
> +		return ret;
>  
>  	return devm_iio_device_register(&spi->dev, indio_dev);
>  }
> diff --git a/drivers/iio/light/al3000a.c b/drivers/iio/light/al3000a.c
> index 6f301c067045..9871096cbab3 100644
> --- a/drivers/iio/light/al3000a.c
> +++ b/drivers/iio/light/al3000a.c
> @@ -94,7 +94,7 @@ static int al3000a_init(struct al3000a_data *data)
>  
>  	ret = devm_add_action_or_reset(dev, al3000a_set_pwr_off, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to add action\n");
> +		return ret;
>  
>  	ret = regmap_write(data->regmap, AL3000A_REG_SYSTEM, AL3000A_CONFIG_RESET);
>  	if (ret)
> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
> index f676da245aa7..5eb33e8e3ad9 100644
> --- a/drivers/iio/light/apds9306.c
> +++ b/drivers/iio/light/apds9306.c
> @@ -1309,7 +1309,7 @@ static int apds9306_probe(struct i2c_client *client)
>  
>  	ret = devm_add_action_or_reset(dev, apds9306_powerdown, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to add action or reset\n");
> +		return ret;
>  
>  	ret = devm_iio_device_register(dev, indio_dev);
>  	if (ret)
> diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
> index 4e9bd8f831f7..c7c604c96f6e 100644
> --- a/drivers/iio/light/bh1745.c
> +++ b/drivers/iio/light/bh1745.c
> @@ -814,8 +814,7 @@ static int bh1745_init(struct bh1745_data *data)
>  
>  	ret = devm_add_action_or_reset(dev, bh1745_power_off, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to add action or reset\n");
> +		return ret;
>  
>  	return 0;
>  }
> diff --git a/drivers/iio/light/opt4001.c b/drivers/iio/light/opt4001.c
> index ba4eb82d9bc2..95167273bb90 100644
> --- a/drivers/iio/light/opt4001.c
> +++ b/drivers/iio/light/opt4001.c
> @@ -428,8 +428,7 @@ static int opt4001_probe(struct i2c_client *client)
>  					opt4001_chip_off_action,
>  					chip);
>  	if (ret < 0)
> -		return dev_err_probe(&client->dev, ret,
> -				     "Failed to setup power off action\n");
> +		return ret;
>  
>  	return devm_iio_device_register(&client->dev, indio_dev);
>  }
> diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
> index 566f1bb8fe2a..7a1b6c703823 100644
> --- a/drivers/iio/light/opt4060.c
> +++ b/drivers/iio/light/opt4060.c
> @@ -1299,8 +1299,7 @@ static int opt4060_probe(struct i2c_client *client)
>  
>  	ret = devm_add_action_or_reset(dev, opt4060_chip_off_action, chip);
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret,
> -				     "Failed to setup power off action\n");
> +		return ret;
>  
>  	ret = opt4060_setup_buffer(chip, indio_dev);
>  	if (ret)
> diff --git a/drivers/iio/magnetometer/als31300.c b/drivers/iio/magnetometer/als31300.c
> index f72af829715f..928e1378304c 100644
> --- a/drivers/iio/magnetometer/als31300.c
> +++ b/drivers/iio/magnetometer/als31300.c
> @@ -373,7 +373,7 @@ static int als31300_probe(struct i2c_client *i2c)
>  
>  	ret = devm_add_action_or_reset(dev, als31300_power_down, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to add powerdown action\n");
> +		return ret;
>  
>  	indio_dev->info = &als31300_info;
>  	indio_dev->modes = INDIO_DIRECT_MODE;
> diff --git a/drivers/iio/magnetometer/tmag5273.c b/drivers/iio/magnetometer/tmag5273.c
> index 2ca5c26f0091..bdb656b031b1 100644
> --- a/drivers/iio/magnetometer/tmag5273.c
> +++ b/drivers/iio/magnetometer/tmag5273.c
> @@ -642,7 +642,7 @@ static int tmag5273_probe(struct i2c_client *i2c)
>  	 */
>  	ret = devm_add_action_or_reset(dev, tmag5273_power_down, data);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "failed to add powerdown action\n");
> +		return ret;
>  
>  	ret = pm_runtime_set_active(dev);
>  	if (ret < 0)
> diff --git a/drivers/iio/proximity/vl53l0x-i2c.c b/drivers/iio/proximity/vl53l0x-i2c.c
> index ef4aa7b2835e..b92fbd27755b 100644
> --- a/drivers/iio/proximity/vl53l0x-i2c.c
> +++ b/drivers/iio/proximity/vl53l0x-i2c.c
> @@ -352,8 +352,7 @@ static int vl53l0x_probe(struct i2c_client *client)
>  
>  	error = devm_add_action_or_reset(&client->dev, vl53l0x_power_off, data);
>  	if (error)
> -		return dev_err_probe(&client->dev, error,
> -				     "Failed to install poweroff action\n");
> +		return ret;
>  
>  	indio_dev->name = "vl53l0x";
>  	indio_dev->info = &vl53l0x_info;
> diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
> index f7f88498ba0e..1175c7887ae1 100644
> --- a/drivers/iio/temperature/mlx90635.c
> +++ b/drivers/iio/temperature/mlx90635.c
> @@ -977,8 +977,7 @@ static int mlx90635_probe(struct i2c_client *client)
>  	ret = devm_add_action_or_reset(&client->dev, mlx90635_disable_regulator,
>  				       mlx90635);
>  	if (ret < 0)
> -		return dev_err_probe(&client->dev, ret,
> -				     "failed to setup regulator cleanup action\n");
> +		return ret;
>  
>  	ret = mlx90635_wakeup(mlx90635);
>  	if (ret < 0)
> @@ -986,8 +985,7 @@ static int mlx90635_probe(struct i2c_client *client)
>  
>  	ret = devm_add_action_or_reset(&client->dev, mlx90635_sleep, mlx90635);
>  	if (ret < 0)
> -		return dev_err_probe(&client->dev, ret,
> -				     "failed to setup low power cleanup\n");
> +		return ret;
>  
>  	ret = regmap_read(mlx90635->regmap_ee, MLX90635_EE_VERSION, &dsp_version);
>  	if (ret < 0)
> 
> base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
> -- 
> 2.39.5
> 

