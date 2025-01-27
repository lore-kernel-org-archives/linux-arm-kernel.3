Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDF0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XtVNyFhaDmOtGa9H3CTt03pn8J/z5TYUVA8y1OEQh4=; b=DHI9cYkxVf/u73iHJ44yLtgkEF
	z9WzHPyATsSHsMp3v2JBClBYuaPwqm09ekKksYBHqN7dVcgRaXOAzpqkV7vs/T4J7i56V/OvVxAC/
	RrFtkj8zUQBPNvTRYvj9W9SQqwo6la6Eu/85zNysmXNl9R4UurfWPnwuE7fgYNOt/8p6HUoai7fFM
	bSi9Znb/Q82fXhZhODwoEWXT01ehQO/jG6DHchuIhLymtxdehRITGXmwjezn+l8gvo3BVSle47cxh
	qH/W63frBBsgXYG43tlCkvnpd9kW4KkTcuJQcXOJiZ2EDoCwT83FvV79UBOtch6iVoHpsXz09NLv4
	bQ0l4jxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNWy-00000002EgI-28rU;
	Mon, 27 Jan 2025 11:43:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNVA-00000002EQs-0MxM;
	Mon, 27 Jan 2025 11:42:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-385df53e559so3180656f8f.3;
        Mon, 27 Jan 2025 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737978118; x=1738582918; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+XtVNyFhaDmOtGa9H3CTt03pn8J/z5TYUVA8y1OEQh4=;
        b=PMu5vyySRsVHOSUvrn73HwQxSxa4XaLAAUC3zn9kHbzJQscTDeAmTCzSEurYPk33qs
         wMoczxcJy8bW7POAsyy/ypeOdAqhxSICnmSyInABklE8qyo35JO/mubSwO07Y87Ivlze
         t4DhLRAvrxlfNOQMeF1Bt8uwxmBbXRdWo2Q+6654GTMSE9K/xFn9EVH6ajvRbS3wgI3+
         A77YnADsk+8AoVwOA7Z3Jpb+B8+nVrr76G/s6rY56OHH152q1w0IuUrgYbp/Y2v9OSPx
         rPqyeyjqyYI8RmxJZnAUsnT83eEdnw1mpqE5ssqoymZ50uRBO1K+Q6Db4AtGjF7gwzro
         pXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737978118; x=1738582918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XtVNyFhaDmOtGa9H3CTt03pn8J/z5TYUVA8y1OEQh4=;
        b=c/NbVTnOk10JhDNklnmN7tULk/slw0VIRSM33Q+Iy6JTaJzNAk9tP3SZr3JKTs1a6S
         FlRXsilXfZKXazX7TYTOLzLSB06e0U5rYBic5033A99MOzsr4pK1spEiRR9Gbd6sFJur
         02GxGcMIm7onzcbBY6xrD5uPVVxhseVyVR0REqT5TEfQgfkdjWeWFUVNm5sAhVMYW5qM
         s9smrB60PCuWHFBGkEJhd4pYcQ1VNodZ58I4cxImJVaeI+gD8sESne92CA/1i/JgTufS
         oJ+uiJB2uAP2UpKOd2TctzSjWMjUTqss1eUAhSKYEYdOiSaiiJ2/vCpOkqxkudVO3DLN
         Tpfg==
X-Forwarded-Encrypted: i=1; AJvYcCUiGBkQzn3P1xBPMJqY/V24DjPKo67U2ecZyhtUo6TO9a/wZdPd+OIkD+73bs3N4NvYa7uCkuH+XC4XK7ceqXs=@lists.infradead.org, AJvYcCWRXUfv5unL0vJNYKstbAoilzXLMH05/SV4ph43Rt3v/d4wRDu5v5wrMX/A2WW8VEJKjZXjsvRq8yTSYhuV9MZg@lists.infradead.org
X-Gm-Message-State: AOJu0YwoGCtviHEMukS8vQTv477D00p4J0FZrlr7awKT/hihexY+GUR7
	r6V0LZPEKREBb+oEg9a3DzpYwD5xJhlqmnOilJKJ18HowVfV+7Ax
X-Gm-Gg: ASbGncuMsd5VloR0Fh/aJi9V1MIqkw3GGEm4QmON6Y5C8/qdj7IYNgE5TFpy3/kjoRe
	Eldowd56W5yX7t7xuT89YgTnQXXwtpqN0IE2v2m/Ht6U7qH5WKARigymTXUYQYGuyaSWnLUU67W
	AXxUo2mhp2+kxZ+XGHG56ZLqZ6J4lgLkVtZOhMu+o26XEo/Go+XCl4HE0ShcxykVlWP0id/YTS5
	UlJSd8hLMdOt4vmVcLiJCefPG+tWnJCDHbNnZkpk+fYHCX0P/0ETy+yFzuduQjQpo5rY6wtfIFX
	yLXF6oSTNbkhiRstUNz60rkDa0K/cDSZtE7w
X-Google-Smtp-Source: AGHT+IFkEpKLuquJccYvDwAEwxGeqNBcauAv7evGVg9hq70Hw+uxJTs5RhVwP2zKsQFI0XfZVHwkZA==
X-Received: by 2002:a05:6000:2c5:b0:37d:4647:154e with SMTP id ffacd0b85a97d-38bf5655bd3mr33567277f8f.9.1737978118107;
        Mon, 27 Jan 2025 03:41:58 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188bf5sm11019301f8f.50.2025.01.27.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 03:41:57 -0800 (PST)
Message-ID: <67977105.5d0a0220.3b7c2.faad@mx.google.com>
X-Google-Original-Message-ID: <Z5dxA8ZalXlWhzPr@Ansuel-XPS.>
Date: Mon, 27 Jan 2025 12:41:55 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy-ld Lu =?utf-8?B?KOWNouS4nCk=?= <Andy-ld.Lu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Wenbin Mei =?utf-8?B?KOaiheaWh+W9rCk=?= <Wenbin.Mei@mediatek.com>,
	Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
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
 <9e022bf13354f544962491cf8061ff3edb878c30.camel@mediatek.com>
 <678e8816.050a0220.b6bb9.f588@mx.google.com>
 <eb064f0873fd47e7cbd07f8e403f11dd6060ff34.camel@mediatek.com>
 <6790bb32.5d0a0220.168b1e.7c5b@mx.google.com>
 <362d66661fcafc09c8d8d15be9e81823caa4ad1b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <362d66661fcafc09c8d8d15be9e81823caa4ad1b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_034200_133867_92B74542 
X-CRM114-Status: GOOD (  55.41  )
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

On Thu, Jan 23, 2025 at 01:42:03AM +0000, Andy-ld Lu (卢东) wrote:
> On Wed, 2025-01-22 at 10:32 +0100, Christian Marangi wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Tue, Jan 21, 2025 at 06:25:48AM +0000, Andy-ld Lu (卢东) wrote:
> > > On Mon, 2025-01-20 at 18:29 +0100, Christian Marangi wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > > 
> > > > 
> > > > On Thu, Jan 16, 2025 at 07:01:13AM +0000, Andy-ld Lu (卢东) wrote:
> > > > > On Wed, 2025-01-15 at 08:29 +0100, Christian Marangi wrote:
> > > > > > Add support for AN7581 MMC Host. The MMC Host controller is
> > > > > > based
> > > > > > on
> > > > > > mt7622 with the difference of not having regulator supply and
> > > > > > state_uhs
> > > > > > pins and hclk clock.
> > > > > > 
> > > > > > Some minor fixes are applied to check if the state_uhs pins
> > > > > > are
> > > > > > defined
> > > > > > and make hclk optional for the new airoha compatible.
> > > > > > 
> > > > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > > > ---
> > > > > >  drivers/mmc/host/mtk-sd.c | 55
> > > > > > ++++++++++++++++++++++++++++++++-
> > > > > > ----
> > > > > > --
> > > > > >  1 file changed, 46 insertions(+), 9 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/mmc/host/mtk-sd.c
> > > > > > b/drivers/mmc/host/mtk-
> > > > > > sd.c
> > > > > > index efb0d2d5716b..9d6868883c91 100644
> > > > > > --- a/drivers/mmc/host/mtk-sd.c
> > > > > > +++ b/drivers/mmc/host/mtk-sd.c
> > > > > > @@ -666,6 +666,20 @@ static const struct mtk_mmc_compatible
> > > > > > mt8196_compat = {
> > > > > >     .support_new_rx = true,
> > > > > >  };
> > > > > > 
> > > > > > +static const struct mtk_mmc_compatible an7581_compat = {
> > > > > > +   .clk_div_bits = 12,
> > > > > > +   .recheck_sdio_irq = true,
> > > > > > +   .hs400_tune = false,
> > > > > > +   .pad_tune_reg = MSDC_PAD_TUNE0,
> > > > > > +   .async_fifo = true,
> > > > > > +   .data_tune = true,
> > > > > > +   .busy_check = true,
> > > > > > +   .stop_clk_fix = true,
> > > > > > +   .stop_dly_sel = 3,
> > > > > > +   .enhance_rx = true,
> > > > > > +   .support_64g = false,
> > > > > > +};
> > > > > > +
> > > > > >  static const struct of_device_id msdc_of_ids[] = {
> > > > > >     { .compatible = "mediatek,mt2701-mmc", .data =
> > > > > > &mt2701_compat},
> > > > > >     { .compatible = "mediatek,mt2712-mmc", .data =
> > > > > > &mt2712_compat},
> > > > > > @@ -680,7 +694,7 @@ static const struct of_device_id
> > > > > > msdc_of_ids[] =
> > > > > > {
> > > > > >     { .compatible = "mediatek,mt8183-mmc", .data =
> > > > > > &mt8183_compat},
> > > > > >     { .compatible = "mediatek,mt8196-mmc", .data =
> > > > > > &mt8196_compat},
> > > > > >     { .compatible = "mediatek,mt8516-mmc", .data =
> > > > > > &mt8516_compat},
> > > > > > -
> > > > > > +   { .compatible = "airoha,an7581-mmc", .data =
> > > > > > &an7581_compat},
> > > > > >     {}
> > > > > >  };
> > > > > >  MODULE_DEVICE_TABLE(of, msdc_of_ids);
> > > > > > @@ -1600,6 +1614,10 @@ static int msdc_ops_switch_volt(struct
> > > > > > mmc_host *mmc, struct mmc_ios *ios)
> > > > > >     struct msdc_host *host = mmc_priv(mmc);
> > > > > >     int ret;
> > > > > > 
> > > > > > +   /* Skip setting supply if not supported */
> > > > > > +   if (!mmc->supply.vqmmc)
> > > > > > +           return 0;
> > > > > > +
> > > > > 
> > > > > Hi Christian,
> > > > > 
> > > > > I think here is no need. If you have not 'vqmmc' in the
> > > > > dts, IS_ERR(mmc->supply.vqmmc) would be -ENODEV and the
> > > > > corresponding
> > > > > flow would not be executed.
> > > > > 
> > > > > And another question, host->pins_default is just selected here,
> > > > > that
> > > > > would be lost.
> > > > > 
> > > > > >     if (!IS_ERR(mmc->supply.vqmmc)) {
> > > > > >             if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_330
> > > > > > &&
> > > > > >                 ios->signal_voltage !=
> > > > > > MMC_SIGNAL_VOLTAGE_180) {
> > > > > > @@ -1699,7 +1717,9 @@ static void msdc_enable_sdio_irq(struct
> > > > > > mmc_host *mmc, int enb)
> > > > > >                             dev_dbg(host->dev, "SDIO eint
> > > > > > irq:
> > > > > > %d!\n", host->eint_irq);
> > > > > >                     }
> > > > > > 
> > > > > > -                   pinctrl_select_state(host->pinctrl, host-
> > > > > > > pins_uhs);
> > > > > > 
> > > > > > +                   /* Skip setting uhs pins if not supported
> > > > > > */
> > > > > > +                   if (host->pins_uhs)
> > > > > > +                           pinctrl_select_state(host-
> > > > > > >pinctrl,
> > > > > > host->pins_uhs);
> > > > > >             } else {
> > > > > >                     dev_pm_clear_wake_irq(host->dev);
> > > > > >             }
> > > > > > @@ -2036,6 +2056,10 @@ static void msdc_ops_set_ios(struct
> > > > > > mmc_host
> > > > > > *mmc, struct mmc_ios *ios)
> > > > > > 
> > > > > >     msdc_set_buswidth(host, ios->bus_width);
> > > > > > 
> > > > > > +   /* Skip regulator if not supported */
> > > > > > +   if (!mmc->supply.vmmc)
> > > > > > +           goto skip_regulator;
> > > > > > +
> > > > > 
> > > > > No need too.
> > > > > 
> > > > > >     /* Suspend/Resume will do power off/on */
> > > > > >     switch (ios->power_mode) {
> > > > > >     case MMC_POWER_UP:
> > > > > > @@ -2071,6 +2095,7 @@ static void msdc_ops_set_ios(struct
> > > > > > mmc_host
> > > > > > *mmc, struct mmc_ios *ios)
> > > > > >             break;
> > > > > >     }
> > > > > > 
> > > > > > +skip_regulator:
> > > > > >     if (host->mclk != ios->clock || host->timing != ios-
> > > > > > >timing)
> > > > > >             msdc_set_mclk(host, ios->timing, ios->clock);
> > > > > >  }
> > > > > > @@ -2816,9 +2841,12 @@ static int msdc_of_clock_parse(struct
> > > > > > platform_device *pdev,
> > > > > >     if (IS_ERR(host->src_clk))
> > > > > >             return PTR_ERR(host->src_clk);
> > > > > > 
> > > > > > -   host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > > > > -   if (IS_ERR(host->h_clk))
> > > > > > -           return PTR_ERR(host->h_clk);
> > > > > > +   /* AN7581 SoC doesn't have hclk */
> > > > > > +   if (!device_is_compatible(&pdev->dev, "airoha,an7581-
> > > > > > mmc")) {
> > > > > > +           host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > > > > +           if (IS_ERR(host->h_clk))
> > > > > > +                   return PTR_ERR(host->h_clk);
> > > > > > +   }
> > > > > 
> > > > > devm_clk_get_optional could be used to instead here, no need to
> > > > > use
> > > > > compatible to distinguish.
> > > > > 
> > > > 
> > > > I can make the hclk optional but I think this would affect also
> > > > every
> > > > other compatible by hiding broken clock configuration.
> > > > 
> > > > > >     host->bus_clk = devm_clk_get_optional(&pdev->dev,
> > > > > > "bus_clk");
> > > > > >     if (IS_ERR(host->bus_clk))
> > > > > > @@ -2926,10 +2954,13 @@ static int msdc_drv_probe(struct
> > > > > > platform_device *pdev)
> > > > > >             return PTR_ERR(host->pins_default);
> > > > > >     }
> > > > > > 
> > > > > > -   host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > > > > > "state_uhs");
> > > > > > -   if (IS_ERR(host->pins_uhs)) {
> > > > > > -           dev_err(&pdev->dev, "Cannot find pinctrl
> > > > > > uhs!\n");
> > > > > > -           return PTR_ERR(host->pins_uhs);
> > > > > > +   /* AN7581 doesn't have state_uhs pins */
> > > > > > +   if (!device_is_compatible(&pdev->dev, "airoha,an7581-
> > > > > > mmc")) {
> > > > > > +           host->pins_uhs = pinctrl_lookup_state(host-
> > > > > > >pinctrl,
> > > > > > "state_uhs");
> > > > > > +           if (IS_ERR(host->pins_uhs)) {
> > > > > > +                   dev_err(&pdev->dev, "Cannot find pinctrl
> > > > > > uhs!\n");
> > > > > > +                   return PTR_ERR(host->pins_uhs);
> > > > > > +           }
> > > > > >     }
> > > > > 
> > > > > Could you consider to set a dummy 'state_uhs' same as
> > > > > 'state_default'
> > > > > in the dts, that you could not use compatible to distinguish
> > > > > here.
> > > > > 
> > > > 
> > > > This is problematic, correct me if I'm wrong, you are suggesting
> > > > to
> > > > assign the emmc pins to both default and uhs? This is problematic
> > > > as
> > > > the
> > > > pinctrl driver would complain that such pins are already assigned
> > > > to
> > > > something. Also I don't think it's possible to assign these pins
> > > > to a
> > > > dummy pin.
> > > > 
> > > 
> > > Maybe I have not expressed clearly...What I mean is that you could
> > > set
> > > as below, and the content of &mmc_pins_uhs is just copied from
> > > &mmc_pins_default.
> > > 
> > > mmc@1fa0e000 {
> > >       ...
> > >       pinctrl-names = "default", "state_uhs";
> > >       pinctrl-0 = <&mmc_pins_default>;
> > >       pinctrl-1 = <&mmc_pins_uhs>;
> > > }
> > 
> > Ok my bad. I did declared the second pin to pinctrl-0 instead of
> > adding
> > pinctrl-1. With that it does work correctly.
> > 
> > > > > > 
> > > > > >     /* Support for SDIO eint irq ? */
> > > > > > @@ -3010,6 +3041,12 @@ static int msdc_drv_probe(struct
> > > > > > platform_device *pdev)
> > > > > >             dev_err(&pdev->dev, "Cannot ungate clocks!\n");
> > > > > >             goto release_clk;
> > > > > >     }
> > > > > > +
> > > > > > +   /* AN7581 without regulator require tune to OCR values */
> > > > > > +   if (device_is_compatible(&pdev->dev, "airoha,an7581-mmc") 
> > > > > > &&
> > > > > > +       !mmc->ocr_avail)
> > > > > > +           mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
> > > > > > +
> > > > > 
> > > > > Maybe you could use regulator-fixed in the dts and configure
> > > > > min/max
> > > > > voltage to get ocr_avail, no need to set hard code here.
> > > > > 
> > > > 
> > > > Also suggested by Wenbin Mei (梅文彬) and I just tried this.
> > > > 
> > > > This can't be done, fixed-regulator needs to have the same min
> > > > and
> > > > max
> > > > voltage or they fail to probe sooo fixed-regulator saddly can't
> > > > be
> > > > used
> > > > :(
> > > > 
> > > > I will send a new version of this with the other point corrected
> > > > but
> > > > I
> > > > think a compatible and these additional if is a must :(
> > > 
> > > If use the fixed regulator such as below, you will get the same
> > > ocr_avail as 'MMC_VDD_32_33 | MMC_VDD_33_34' through
> > > mmc_regulator_get_ocrmask().
> > > 
> > > vmmc_3v3: regulator-vmmc-3v3 {
> > >       compatible = "regulator-fixed";
> > >       regulator-name = "vmmc";
> > >       regulator-min-microvolt = <3300000>;
> > >       regulator-max-microvolt = <3300000>;
> > >       regulator-always-on;
> > > }
> > 
> > Ok the code was a bit confusing but yes I can confirm that a 3.3
> > fixed
> > regulator define those 2 flags so also this is OK.
> > 
> > There is still the discussion about clock. You are totally against a
> > new
> > compatible for the hclk?
> > 
> As the comment in the v2 patches, the better way is to add a bool
> variable like 'needs_not_hclk' in the compat data, which is just true
> for you, and use !host->dev_comp->needs_not_hclk as the condition to
> get 'hclk'.
> 
> But I would like to confirm if the 'fixed-clock' could be supported in
> your project, which is also used in mt7622.dtsi, you may align 'hclk'
> to a dummy fixed-clock... 
>

Thanks I implemented with dummy clock + dummy regulator + dummy state so
we don't need an additional compatible. Thanks for the suggestions!

> > > > 
> > > > > >     msdc_init_hw(host);
> > > > > > 
> > > > > >     if (mmc->caps2 & MMC_CAP2_CQE) {
> > > > 
> > > > --
> > > >         Ansuel
> > 
> > --
> >         Ansuel

-- 
	Ansuel

