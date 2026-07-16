Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438E9C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5XRNJnPZSAm5lm9IWfGalOvrFDddPu+vsDu/YFgQc4=; b=3SKramfxlj1FUSEfji0UeYTjjK
	wSuSvIAJpQg+g2w+JHT2lpqLJrDUR9kFf6wwBHxHkLh4o6JrQCk5Bi97X8RpGmM/WJdmwDa75jPb6
	pYuBHfJLrfomiOBK6tC/dUr4Wv36LlzYzEThH9zQoVyIFr4eNzNcl3K2g8+LMd6wqDJfok6T0L5Te
	/QmpincdRd1BvzUqkno/TkwxCGuddgBOOrnBGnFOqHAPdCtCeH2KIF4mue4KJUDZWp6g7B/bhm0Ob
	+F9IqpYi/S8BP4zn0E6KHcdbU0U9PHN81c0A97+ydYE1T1FRzAiyt8fL86LX5h4J+Kpuk/ehkH8Dy
	etgrag2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFZ4-0000000GXY6-3Eo8;
	Thu, 16 Jul 2026 06:27:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFZ2-0000000GXXj-3o0f;
	Thu, 16 Jul 2026 06:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y5XRNJnPZSAm5lm9IWfGalOvrFDddPu+vsDu/YFgQc4=; b=K6J+Cblw9p8Hb7CIZ+hO/oHfRj
	jzyvqqfu7ejEX2FVl8aoDqcJ+F4MyGPFV0amGbbCCuMdTgSvcvlxsqsbWsfyh0f8luIw/NwsnOx9f
	FAI41Ni75m/jkw4G1JyyGgil18T60UzkR0wEAjklZ9gnyd5m0f5KqQf1180zi/tgPR8llKPXF1mT9
	qqX9rvoCmT3hPDSOU99Ui8JyVpjJc5Om0J2fptnQSqezNfl0emnQ3CFmP/g/ex6cInDu86CsL4+Ty
	aArmehBiblz4x3TKFLbd0GcQn7R24G1MWHN7c67Tzdr8/oLw4ZbkHVszHjRVtfknStxSdsBZ3WLaV
	R5gwJA/w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkFYy-0000000Dodn-44TD;
	Thu, 16 Jul 2026 06:27:19 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66G6QGYf83437599, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784183176; bh=Y5XRNJnPZSAm5lm9IWfGalOvrFDddPu+vsDu/YFgQc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=fBeupTKWxRaRBWdddptFNMx+fjL1aA6jvZEhiWo8xxEpGRLymmABf0praAWzC3g5k
	 2cHUBltj+ZFZb3Qg6TcXr7ifpSJOs1tGxpDYZX0ZY2NkgYoL0iSUHrjoJ+03HtNxEF
	 9soMuSEBLZoQOXOAKVCuiw5YehRRF6QpmzX4CoHu4cLzLywNgvx9xLZt+0+drbx/y8
	 BNvaRbF6zQMmLzGS85PfCM6k1N0Fibv3tGTAgSqWP2WUH5sHO8FrDWPe0oFLC2Wtd+
	 vnbnCapIptOEC67x3wBP3WFhWrVDgP1qvaHkJnuUGqhHIFCTn1amJG9scr5LpVpb4l
	 LUknsjKR0nl1g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66G6QGYf83437599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 14:26:16 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 14:26:15 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Jul 2026 14:26:14 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <eleanor.lin@realtek.com>
CC: <Michael.Hennerich@analog.com>, <afaerber@suse.com>, <andy@kernel.org>,
	<brgl@kernel.org>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
	<devicetree@vger.kernel.org>, <dlechner@baylibre.com>,
	<james.tai@realtek.com>, <jic23@kernel.org>, <krzk+dt@kernel.org>,
	<lars@metafoo.de>, <linus.walleij@linaro.org>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-realtek-soc@lists.infradead.org>, <mathieu.dubois-briand@bootlin.com>,
	<mwalle@kernel.org>, <nuno.sa@analog.com>, <robh@kernel.org>,
	<stanley_chang@realtek.com>, <tychang@realtek.com>, <wbg@kernel.org>
Subject: RE: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and write-enable support
Date: Thu, 16 Jul 2026 14:26:14 +0800
Message-ID: <20260716062614.1507243-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_072717_875451_60F92DAC 
X-CRM114-Status: GOOD (  24.80  )
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

Hi all,

>> > @@ -185,7 +218,7 @@ static int gpio_regmap_set_direction(struct
>> gpio_chip *chip,
>> >                                    unsigned int offset, bool output)
>> > {
>> >       struct gpio_regmap *gpio = gpiochip_get_data(chip);
>> > -     unsigned int base, val, reg, mask;
>> > +     unsigned int base, val, reg, mask, wren_mask;
>> >       int invert, ret;
>> >
>> >       if (gpio->reg_dir_out_base) {
>> > @@ -198,7 +231,12 @@ static int gpio_regmap_set_direction(struct
>> gpio_chip *chip,
>> >               return -ENOTSUPP;
>> >       }
>> >
>> > -     ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
>> > +     ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_OP, base,
>> offset, &reg, &mask);
>> > +     if (ret)
>> > +             return ret;
>> > +
>> > +     ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_DIR_WREN_OP,
>> base, offset, &reg,
>> > +                                &wren_mask);
>> 
>> What constrains these two to provide the same value back for reg?
>> To me it seems like the write enable might well be in a different register.
>> 
>> >       if (ret)
>> >               return ret;
>> >
>> > @@ -207,7 +245,7 @@ static int gpio_regmap_set_direction(struct
>> gpio_chip *chip,
>> >       else
>> >               val = output ? mask : 0;
>> >
>> > -     return regmap_update_bits(gpio->regmap, reg, mask, val);
>> > +     return regmap_update_bits(gpio->regmap, reg, mask | wren_mask,
>> > + val | wren_mask);
>> >  }
>> >
>> >  static int gpio_regmap_direction_input(struct gpio_chip *chip,
>
> My initial design indeed assumed that the WREN mask and Data mask reside in
> the same register.
>  
> Regarding WREN support, especially if WREN and Data use separate registers, I
> came up with three ideas. Which direction do you prefer?
>  
> Approach 1: Provide Custom Callbacks in config (Let consumer driver handle it)
> We can add '.set' and '.set_direction' function pointers in
> 'struct gpio_regmap_config'. If a driver requires WREN, it can implement these
> callbacks itself.
> 
> static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset, int val)
> {
>         struct gpio_regmap *gpio = gpiochip_get_data(chip);
>  
>         /* If the driver provides a custom set (to handle WREN), delegate to it */
>         if (gpio->set) {
>                 gpio->set(chip, offset, val);
>                 return;
>         }
>         /* ... existing generic regmap logic ... */
> }
>
> Pros: Clean core, no need to touch existing drivers' xlate signature. The consumer
> driver handles its own locking for different registers.
> Cons: It feels a bit strange and inconsistent to expose only '.set' and
> '.set_direction' overrides while keeping other operations entirely abstracted.
>  
> Approach 2: Handle separate WREN register in the core (with locking concerns)
> We keep the 'XX_WREN_OP' in 'xlate'. If someone needs WREN and 'wren_reg != reg',
> we write to both.
>  
> static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
>                            int val)
> {
>         /* skip */
>         ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &wren_reg,
>                                    &wren_mask);
>         if (ret == -ENOTSUPP)
>                 has_wren = false;
>         else if (ret)
>                 return ret;
> 
>        ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
> 
>        if (has_wren && reg == wren_reg) {
>                mask |= wren_mask;
>                mask_val |= wren_mask;
>                has_wren = false;
>        }
> 
>        if (has_wren)
>                ret = regmap_set_bits(gpio->regmap, wren_reg, wren_mask); 
> 
>         /* ignore input values which shadow the old output value */
>         if (gpio->reg_dat_base == gpio->reg_set_base)
>                 ret = regmap_write_bits(gpio->regmap, reg, mask, mask_val);
>         else
>                 ret = regmap_update_bits(gpio->regmap, reg, mask, mask_val);
>  
>         return ret;
> }
>  
> Pros: Keeps all WREN logic unified inside the core framework.
> Cons: Introduces a locking issue. writing to 'wren_reg' and then 'reg' requires an
> external lock to be atomic, which seems to defeat the purpose of relying on regmap's
> internal lock. 
> 
> Approach 3: Assume WREN and Data always share the same register
> 
> static int gpio_regmap_set(struct gpio_chip *chip, unsigned int offset, int val)
> {
>         /* ... */
>         ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_WREN_OP, base, offset, &reg, &wren_mask);
>         if (ret == -ENOTSUPP)
>                 wren_mask = 0;
>         else if (ret)
>                 return ret;
>  
>         ret = gpio->reg_mask_xlate(gpio, GPIO_REGMAP_SET_OP, base, offset, &reg, &mask);
>  
>         ret = regmap_update_bits(gpio->regmap, reg, mask | wren_mask, mask_val | wren_mask);
>         return ret;
> }
>  
> Regarding this approach, I would like to ask from your experience: Is it
> actually common for hardware designs to place WREN and Data bits in completely
> different registers for GPIO operations?
> 
> If they practically always share the same register, this simpler approach might
> suffice.
>  
> Best Regards,
> Yu Chun Lin
> 

If there are no further concerns, I will proceed with the third approach and
send out v6.

Thanks.
Yu-Chun

