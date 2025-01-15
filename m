Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D643C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJlS2BHE74secUz9CB0R8O3ilQB+OB3FuTYckR6ubFM=; b=NArrln7WbVdpSmh+vM/i142PFb
	H5iwgiiZTZwyBdoTX1lWWRAGHp6yReriIilLC8DE//slUJ6DPXNrh7evwggnytXtfWbZzJzhV8lPA
	6VOBb951pMKWid6wepUkMt+oj8sF2akGAbRRWxyBidBw6S3DfbZ+bCxJkfGX4G49kP0yhXPxazBZU
	C/jxaYYA1sfjasllVSXpc39PdCDRBywD7WFyphBK9QoIOtgj1OanwiYqaGX+m86KAKv1Iz0hY6bQn
	kQQ/lnwu5YbeLsL60wq865GYTSkjd2H348hdnzTB/hnEUwiYh7UwuwXR0y6Hnrki3lNl70Z8uDyfR
	BEQonE4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzve-0000000BO16-3fxG;
	Wed, 15 Jan 2025 09:43:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzoI-0000000BMNa-0ooE;
	Wed, 15 Jan 2025 09:35:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385deda28b3so3572054f8f.0;
        Wed, 15 Jan 2025 01:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736933736; x=1737538536; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bJlS2BHE74secUz9CB0R8O3ilQB+OB3FuTYckR6ubFM=;
        b=Ugi0DuTQxXdl6P88fqbV6b+n4rINIoL9X7sXY3qKmtDk+Cio6WycrSTHlbn0Splq56
         9j/jChU4Bj2lWPGpK7txdHeMAFsPqlEKGyytGBvTVtI9YO3rXLmwBW4bHIhYPH5LCArI
         xMbvDZJ8fi9Kers8gB+tWpag7AI6JGPtT68QG52+h+lUev+1PfBgvZkryS/EFfNooNzX
         EAz99Sjfl6mchIDf64MadSoP6zu9JKS6ytQ6T6GPQCoxl5eJvREEILQ2vWfnBopWeeNd
         8qE342QsipcadQDVnXnggrFVn6+1y6MKsLZStpk7ouYTr8yvT3NDXsh48AqYNHmKXBm4
         pPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736933736; x=1737538536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJlS2BHE74secUz9CB0R8O3ilQB+OB3FuTYckR6ubFM=;
        b=NZJJYPgeXcn5JrrWyw0R8wXnUzm4odyaaFC3orSKQHDXZVjMaA6a/MerxYjxhayk+2
         IBZiWO1N42Uk1HyzZTi1RWDUXiiolmu9El9E9TxwPU2MtiiniEuVwhk/RyqK6wOJ+KnR
         Sctswz9iySGMoeZxC9O7qHq4YCyzNQb5hcy/j5VtiZQiBjTVUDT/7aMO5Mb0q31qxPDd
         vQGqiSvnVOztthNMFMnVojLQQpnmPPajMtnQopx8FjNkwpPX9gZVsDLbVKjpj35f5hx2
         5neezS/hlyYblXwascCoyJZ7PrUUT97DiPX/U6gG+FOVJ1MHs/slyAV63KpfC844R6OE
         0lXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYIYnCympyPPvoLa3C8iJAHFw+ghMoqKn/ChRfUpKVG2yIUhLjQINEOC6rX+oFhgzyeeZ38S6u5TsLqxnjuU=@lists.infradead.org, AJvYcCWIZIcBGT+TNZbCUEvgrumR4+zq1zbMR+Onwtn1yyWGZqzYSPmwy3BHt0MwHfLg3u8b36l0nIAEL5fZVgpZhDiz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/OHBGn4MRVYxvXiq/cj5v4z8uabV3sRN1MENKGRkh53FJecm3
	oBZ1ua50XTwxHhpi1uyxaqGZXzg7I5/b6cEQtnGVknNlP1pjjz1g
X-Gm-Gg: ASbGncuo/hpGnlDt3HjH+bFbxHi675A5dyIXv1yiFLIr99Hj2FWYl3mKoNtPQT+t7AU
	5EpjJqY74DitSgpwkIv6NoE+k5xIezVhTc+AJKxgYEYxNgCIT+Ib49mbW1vdlBjoXZ1P5Y1Wkti
	BDUoY3uyrtOnZSZOP238prbOj5xDRbI/incbNz3XasNeoolnGHmcKRW/pH59V3tvo1D3Hw1ziLp
	0Dlxnzmp1oOpLGoQpT2N/4wDOcDLld128PkG6tU3EhKFTc4IblGk9iYXAXHSo7czudlgxUHX08k
	+D7955kXZJ1x
X-Google-Smtp-Source: AGHT+IH2JuWof//uVdkBpA3QQVNZsi6lClPHa+2DDtdHWYts1qlYQ7sw3xXHB+R64tKJpk2Eii7oWg==
X-Received: by 2002:a05:6000:1542:b0:38a:a047:6c0b with SMTP id ffacd0b85a97d-38aa0476d5amr17286510f8f.35.1736933736287;
        Wed, 15 Jan 2025 01:35:36 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c16ba82csm21964055e9.1.2025.01.15.01.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:35:35 -0800 (PST)
Message-ID: <67878167.050a0220.9eba5.7501@mx.google.com>
X-Google-Original-Message-ID: <Z4eBZlZnSRjlhKen@Ansuel-XPS.>
Date: Wed, 15 Jan 2025 10:35:34 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Wenbin Mei =?utf-8?B?KOaiheaWh+W9rCk=?= <Wenbin.Mei@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	upstream <upstream@airoha.com>
Subject: Re: [PATCH 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
References: <20250115073026.31552-1-ansuelsmth@gmail.com>
 <20250115073026.31552-2-ansuelsmth@gmail.com>
 <a00c76b9752410ea86d6cac0f774d5d1ea45891d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a00c76b9752410ea86d6cac0f774d5d1ea45891d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_013538_256498_CA9F9A0C 
X-CRM114-Status: GOOD (  33.10  )
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

On Wed, Jan 15, 2025 at 09:33:35AM +0000, Wenbin Mei (梅文彬) wrote:
> On Wed, 2025-01-15 at 08:29 +0100, Christian Marangi wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > Add support for AN7581 MMC Host. The MMC Host controller is based on
> > mt7622 with the difference of not having regulator supply and
> > state_uhs
> > pins and hclk clock.
> > 
> > Some minor fixes are applied to check if the state_uhs pins are
> > defined
> > and make hclk optional for the new airoha compatible.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/mmc/host/mtk-sd.c | 55 ++++++++++++++++++++++++++++++++-----
> > --
> >  1 file changed, 46 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index efb0d2d5716b..9d6868883c91 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -666,6 +666,20 @@ static const struct mtk_mmc_compatible
> > mt8196_compat = {
> >         .support_new_rx = true,
> >  };
> > 
> > +static const struct mtk_mmc_compatible an7581_compat = {
> > +       .clk_div_bits = 12,
> > +       .recheck_sdio_irq = true,
> > +       .hs400_tune = false,
> > +       .pad_tune_reg = MSDC_PAD_TUNE0,
> > +       .async_fifo = true,
> > +       .data_tune = true,
> > +       .busy_check = true,
> > +       .stop_clk_fix = true,
> > +       .stop_dly_sel = 3,
> > +       .enhance_rx = true,
> > +       .support_64g = false,
> > +};
> > +
> >  static const struct of_device_id msdc_of_ids[] = {
> >         { .compatible = "mediatek,mt2701-mmc", .data =
> > &mt2701_compat},
> >         { .compatible = "mediatek,mt2712-mmc", .data =
> > &mt2712_compat},
> > @@ -680,7 +694,7 @@ static const struct of_device_id msdc_of_ids[] =
> > {
> >         { .compatible = "mediatek,mt8183-mmc", .data =
> > &mt8183_compat},
> >         { .compatible = "mediatek,mt8196-mmc", .data =
> > &mt8196_compat},
> >         { .compatible = "mediatek,mt8516-mmc", .data =
> > &mt8516_compat},
> > -
> > +       { .compatible = "airoha,an7581-mmc", .data = &an7581_compat},
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, msdc_of_ids);
> > @@ -1600,6 +1614,10 @@ static int msdc_ops_switch_volt(struct
> > mmc_host *mmc, struct mmc_ios *ios)
> >         struct msdc_host *host = mmc_priv(mmc);
> >         int ret;
> > 
> > +       /* Skip setting supply if not supported */
> > +       if (!mmc->supply.vqmmc)
> > +               return 0;
> > +
> >         if (!IS_ERR(mmc->supply.vqmmc)) {
> >                 if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_330 &&
> >                     ios->signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
> > @@ -1699,7 +1717,9 @@ static void msdc_enable_sdio_irq(struct
> > mmc_host *mmc, int enb)
> >                                 dev_dbg(host->dev, "SDIO eint irq:
> > %d!\n", host->eint_irq);
> >                         }
> > 
> > -                       pinctrl_select_state(host->pinctrl, host-
> > >pins_uhs);
> > +                       /* Skip setting uhs pins if not supported */
> > +                       if (host->pins_uhs)
> > +                               pinctrl_select_state(host->pinctrl,
> > host->pins_uhs);
> >                 } else {
> >                         dev_pm_clear_wake_irq(host->dev);
> >                 }
> > @@ -2036,6 +2056,10 @@ static void msdc_ops_set_ios(struct mmc_host
> > *mmc, struct mmc_ios *ios)
> > 
> >         msdc_set_buswidth(host, ios->bus_width);
> > 
> > +       /* Skip regulator if not supported */
> > +       if (!mmc->supply.vmmc)
> > +               goto skip_regulator;
> > +
> If power_mode is MMC_POWER_UP, we need to execute the related flow.
> Now it will skip mmc_init_hw(host), which will cause problems.
> BTW, can this be implemented using a fix regulator? if ok, no need
> to modify here.

Yes I didn't think of that, I will test if this is possible and reply
back, thanks for the hint.

> >         /* Suspend/Resume will do power off/on */
> >         switch (ios->power_mode) {
> >         case MMC_POWER_UP:
> > @@ -2071,6 +2095,7 @@ static void msdc_ops_set_ios(struct mmc_host
> > *mmc, struct mmc_ios *ios)
> >                 break;
> >         }
> > 
> > +skip_regulator:
> >         if (host->mclk != ios->clock || host->timing != ios->timing)
> >                 msdc_set_mclk(host, ios->timing, ios->clock);
> >  }
> > @@ -2816,9 +2841,12 @@ static int msdc_of_clock_parse(struct
> > platform_device *pdev,
> >         if (IS_ERR(host->src_clk))
> >                 return PTR_ERR(host->src_clk);
> > 
> > -       host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > -       if (IS_ERR(host->h_clk))
> > -               return PTR_ERR(host->h_clk);
> > +       /* AN7581 SoC doesn't have hclk */
> > +       if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> > +               host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > +               if (IS_ERR(host->h_clk))
> > +                       return PTR_ERR(host->h_clk);
> > +       }
> > 
> >         host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> >         if (IS_ERR(host->bus_clk))
> > @@ -2926,10 +2954,13 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >                 return PTR_ERR(host->pins_default);
> >         }
> > 
> > -       host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > "state_uhs");
> > -       if (IS_ERR(host->pins_uhs)) {
> > -               dev_err(&pdev->dev, "Cannot find pinctrl uhs!\n");
> > -               return PTR_ERR(host->pins_uhs);
> > +       /* AN7581 doesn't have state_uhs pins */
> > +       if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> > +               host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > "state_uhs");
> > +               if (IS_ERR(host->pins_uhs)) {
> > +                       dev_err(&pdev->dev, "Cannot find pinctrl
> > uhs!\n");
> > +                       return PTR_ERR(host->pins_uhs);
> > +               }
> >         }
> > 
> >         /* Support for SDIO eint irq ? */
> > @@ -3010,6 +3041,12 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >                 dev_err(&pdev->dev, "Cannot ungate clocks!\n");
> >                 goto release_clk;
> >         }
> > +
> > +       /* AN7581 without regulator require tune to OCR values */
> > +       if (device_is_compatible(&pdev->dev, "airoha,an7581-mmc") &&
> > +           !mmc->ocr_avail)
> > +               mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
> > +
> >         msdc_init_hw(host);
> > 
> >         if (mmc->caps2 & MMC_CAP2_CQE) {
> > --
> > 2.45.2
> > 

-- 
	Ansuel

