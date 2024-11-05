Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92552D31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=; b=o7imCnRyq2O7frdcE3mc4xbBNV
	napnq+eFgK8doJp9c4BQLp5Eo+i6OTiTrp0cSpkGg3PkF19TWdA12qy2R+NXYZnjerUWLvIdYkeom
	g+ukpXcHP0bFxTdEMi5u74R1QGy7K1l2DHg3sUHbpcZzM8M5F29I6AARrn2ZBtaDuc9LIPnCOcdz5
	x7ky4Neqtf2KqZdX0s5JQOb9amyk7/zYIs92NFaHfkPxuP5N7XKG75OZeUvKjln/KbzlX7vI7urSG
	qHig4+VIn+fWOKopq7fe9gt11btaPsXz3gwEGgeTF5ctZ+czOl4HDkyaBSET9LBc8vM8bo9WNmUET
	KADeRHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mf0-000000005jL-19Ym;
	Tue, 05 Nov 2024 16:44:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MBw-000000000HI-1OX9;
	Tue, 05 Nov 2024 16:14:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539ee1acb86so5706416e87.0;
        Tue, 05 Nov 2024 08:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823241; x=1731428041; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=;
        b=g9LZduL+X1+RkGq+xMAxxtCwN+dliZGTkAV1IddX/aTjXkB2xkU7zX6QgzdrFOmXkK
         D9F4qgT5p7xUW176BSxiFe4RXOTb17e+eYd1Z42MpvHjyHhnQgAW1F4Sq9+505MrE5Lm
         B5gGM83LHl3aEJ7fjXQka1DavPpT/7RitM03oy4vZav70LRMvq6VvX/whlVYnoJr08dG
         H6lL4aG4rsElUVLQZ4arzvJktIbse0zaCLIP+VaaE88By9eVA8elnlyASAJMLTyNpIXN
         e0RR7getqmxNAkzW6qNhFE4QV06KAWefDP/UssQzyUKN8Qs/9nO95XoFwywoVBinHDQk
         Lt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823241; x=1731428041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsgC3GUt52fG7g3FJ6lyd/7Hq8DIyDZOCFrlqdAN2z8=;
        b=GnsFR3SJnjVm84/0Rm5zOyQFXOc2o6HsEdZ+gZ4B35etrRoHnxF6Ds8lZxu3efjrDE
         lterVlbt5Pj5+3njmNaT5mljtAuYtJe0YK765uFiarfx9L7dRvsePlOrH+/oaB3x9q+9
         95rY02FJ32S/JiP5u/JAf1areNpLhw1efeL5DdEHZokXu4hexGm5RZMhnr+rVSRqIEAT
         EXDP8thGcPUWadi79fn+icLNyiKWPp4zTm1r60GLlliN313CF/hhpMTpw7UMSuq1Nw/2
         m5MCQoujFTrv1NBN8xKWIKHtrXF3ORdEzGQSDv4hAqhBj8dHDyrV+TMi4FR0959N0dL0
         zmMg==
X-Forwarded-Encrypted: i=1; AJvYcCUeTG06cM+C/Y9vYPDxQ6X80z8HNLNsNk9GBy+hN6ckovmkc9b/nkr6Hz1VwSCnYRYyIq5JpjyjAfAU1GJsDMgi@lists.infradead.org, AJvYcCVYsq/Ao+Lw0dP/ftSA4QOdg3+a1Jd6ln6ASHf/m59IjZlma0PBpyMCeE+AVFs+wR33AgRJ5qUSQO8XPMPZcvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWO0wP6CbUO54XUD4xqtqGNxUHOMx6UCt36uQPVnjeYfd8VK2o
	qyIRYxXck0TwBEGlsGBM0ygMaIfqJlYOApGvSr8Mx86CA3+nEUZ1
X-Google-Smtp-Source: AGHT+IF8BLVkWOaws14kIJqjSIzF39hKa71k2p8OWLa7ITtzulUErFMEpSbUuonylZ3cZrDAMvQP+w==
X-Received: by 2002:a05:6512:3a95:b0:53b:1fe4:3fb9 with SMTP id 2adb3069b0e04-53d65e2474fmr7828089e87.49.1730823240757;
        Tue, 05 Nov 2024 08:14:00 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcc073sm2168565e87.212.2024.11.05.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:14:00 -0800 (PST)
Date: Tue, 5 Nov 2024 19:13:59 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v10 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZypER5bqLAlH7VxK@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20241030072229.1013235-1-wenst@chromium.org>
 <20241030072229.1013235-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241030072229.1013235-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_081404_401201_972FECE7 
X-CRM114-Status: GOOD (  25.88  )
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

On 24-10-30 15:22, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

> diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
> index df95aa6ad90e..a232f3cbb252 100644
> --- a/include/linux/i2c-of-prober.h
> +++ b/include/linux/i2c-of-prober.h
> @@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   *
>   * The following helpers are provided:
>   * * i2c_of_probe_simple_enable()
> + * * i2c_of_probe_simple_cleanup_early()
>   * * i2c_of_probe_simple_cleanup()
>   */
>  
> @@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve resources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty string ("") if GPIO
> + *	       line is unnamed.
>   * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().
> + * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed to msleep().
> + * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set to logical high,
> + *			   to enable the component.
> + *
> + * This describes power sequences common for the class of components supported by the
> + * simple component prober:
> + * * @gpio_name is configured to the non-active setting according to @gpio_assert_to_enable.
> + * * @supply_name regulator supply is enabled.
> + * * Wait for @post_power_on_delay_ms to pass.
> + * * @gpio_name is configured to the active setting according to @gpio_assert_to_enable.
> + * * Wait for @post_gpio_config_delay_ms to pass.
>   */
>  struct i2c_of_probe_simple_opts {
>  	const char *res_node_compatible;
>  	const char *supply_name;
> +	const char *gpio_name;
>  	unsigned int post_power_on_delay_ms;
> +	unsigned int post_gpio_config_delay_ms;
> +	bool gpio_assert_to_enable;

This header is missing '#include <linux/types.h>' for bool
type. Otherwise compilation may fail with following error:

```
./include/linux/i2c-of-prober.h:117:9: error: unknown type name ‘bool’
  117 |         bool gpio_assert_to_enable;
      |         ^~~~
./include/linux/i2c-of-prober.h:12:1: note: ‘bool’ is defined in header ‘<stdbool.h>’; this is probably fixable by adding ‘#include <stdbool.h>’
   11 | #include <linux/kconfig.h>
  +++ |+#include <stdbool.h>
   12 |
```

>  };
>  
> +struct gpio_desc;
>  struct regulator;
>  
>  struct i2c_of_probe_simple_ctx {
> @@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
>  	const struct i2c_of_probe_simple_opts *opts;
>  	/* private: internal fields for helpers. */
>  	struct regulator *supply;
> +	struct gpio_desc *gpiod;
>  };
>  
>  int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
> +void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
>  void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
>  
>  extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
> -- 
> 2.47.0.163.g1226f6d8fa-goog
> 

-- 
Best regards,
Andrey Skvortsov

