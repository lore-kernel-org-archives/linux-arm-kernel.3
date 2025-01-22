Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D02C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV31ap+hTk7A9j35eAwWYQDQxUENrLNo4C4Wd2gbJZI=; b=KLmkeeit6neMizVIC+hyTwdus0
	T3ofJUzMIpx+K8vPgbbdmyfIKXRbJUxKQYoB8JNf9AlGR85ihPZeSOXN6h/qgz5gdKmwxjKcWfVRJ
	1qq4UF1pgoBlpaaB9NGWxudiF4D0lRP+7GrQowJO8dAtGbRuoPyrhjJDapuPJzF55x9xAK9EV11L4
	U7cFOHpUg4e0JeLHrL4zRp4G7p5p+zuEBYV/AY7rrQsYxjhy0ZCEXYeWpJyYez0a+YW6cixGRwTw4
	dVtL2pwW6hc4CCD4ptt54wNMp0wRdwMCmpEBO8eac2esxuUCgYDDEHcySIJAPE3lm3cUwMg0ws7Ff
	06rpqi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taX7V-00000009o6g-1VmZ;
	Wed, 22 Jan 2025 09:33:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taX6D-00000009nrf-008x;
	Wed, 22 Jan 2025 09:32:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3863703258fso388414f8f.1;
        Wed, 22 Jan 2025 01:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737538355; x=1738143155; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YV31ap+hTk7A9j35eAwWYQDQxUENrLNo4C4Wd2gbJZI=;
        b=TRi8rBWvvfxTGh8ZjFveGIm2gOpO8Va8sjABBXTcYtg6xVA+uCSaxw/FRUc+YF07sK
         95WVs/EGsi+hoa0xU47rrYBxz3EmOGjKYWdRoaEnEurn7qkzVBocZK1RdP6Fs0htSmV2
         /ZCCUDEsMGJhCRptP8mzhbPlKS0BxzpJ1/KFKEUXcym4DJP4gJ3IBTDEL29JpRnZ3ZNG
         Oy8IWS/RiIJY6AnLC742aan7u8PelXULgtav0BLzi6lQT8TBFTDhkADuD22kyyNVWp2M
         53S+sZzxJsUOCDFyyzYjc5iEPb75WzG0jE7pynkh7mdKbFV/J33gNjL0VS31bV7j6bqf
         6UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538355; x=1738143155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YV31ap+hTk7A9j35eAwWYQDQxUENrLNo4C4Wd2gbJZI=;
        b=SR8Cgf2VOphtw3YtPvGjhYiYiWdVRafcs74i0ga4YLus6221toQgpGucL3YG+TFYFu
         hQ/ydr8gv+L+0kSwmfDwdteVmIXGtRk+pdumPQrMEf9XgeLT7PidHX1kATnYFCQNQDkH
         xyTiFijhZ+y/E1XDfsvSWK2DuYgXCRTpoHV4iS9tGbmYvmKvNUzpxpajP7b0UUf5F1EV
         UKdv0stlAp1nkKct7l6u3sLVOvDW27FZHyMfGtWUcU7vXCzjnDKmR1NVoIFHfMfCRD8s
         9+07HdVzkwr1qNPmriUfmrrKsMq0IltLGEod/tERAUJaRrHRPS+Hz9k6WAAa11Jvrnak
         wHDg==
X-Forwarded-Encrypted: i=1; AJvYcCW+P5QHNDji6f+afcF3QmjRWHP1F1LIJnknPLeAviOcv4dt35XwmKhXfNSEdyol9m9YEwFzo2mxYTbmPUfGV7A=@lists.infradead.org, AJvYcCXsPrzhWHJQgANWqmQ57jlk+qkpe9ELDc8aR9LVCKeKHG5buiW/575jQ+Or3FymSe+lj9boec/pG9gYNP3Oa0Zd@lists.infradead.org
X-Gm-Message-State: AOJu0YxPphnZ2XUbC5SEdwNdJDdHM3UnHDB9tIMILBnvp02dMKFw6mqT
	9g0Eb/x4+edv9EPehkkxW9zwh4iLDsjOhYA2PsQjz8LOFp/J7P1K
X-Gm-Gg: ASbGncvxzuo8ujuVGLW++jQm2c54uskFiHu1FV3opDDSfK+/IqxHOWUMC3Ecp3od+s/
	qENwI21zJeg15CH5Ej+xkaijWtzUP2ehf8upKIpEGrlO6mUUlUsS+YBPvR38jqox7GxLqAxADiN
	tdjEtlZcSatm5DaE/ZdGBSYnO/40xP8+KOD4vdAkHNtKgdaK6arsr/aeXA8qvswsYISbPXYBdZT
	eR48w2bDWHygBZsxolSCwGpLe8y9hiDpBcmhL7uTuxAxAPitxWaNwKc8L51q4+VV3TjTUL0mTuj
	lQwLi7TBwdR5/BBaKhp71salGA==
X-Google-Smtp-Source: AGHT+IEPa16/GommLca/ZabHQ6R/9IpeTlIhByFGnz2RnxfnxdP8CfDb1RQsqRARjMyM70FdR1u6+w==
X-Received: by 2002:adf:9dce:0:b0:38a:88bc:aea6 with SMTP id ffacd0b85a97d-38bec4f592amr16953017f8f.6.1737538354689;
        Wed, 22 Jan 2025 01:32:34 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327e19fsm16106067f8f.93.2025.01.22.01.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:32:34 -0800 (PST)
Message-ID: <6790bb32.5d0a0220.168b1e.7c5b@mx.google.com>
X-Google-Original-Message-ID: <Z5C7L3W26Ae_vlE4@Ansuel-XPS.>
Date: Wed, 22 Jan 2025 10:32:31 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb064f0873fd47e7cbd07f8e403f11dd6060ff34.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_013237_064650_87D1C614 
X-CRM114-Status: GOOD (  53.67  )
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

On Tue, Jan 21, 2025 at 06:25:48AM +0000, Andy-ld Lu (卢东) wrote:
> On Mon, 2025-01-20 at 18:29 +0100, Christian Marangi wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Thu, Jan 16, 2025 at 07:01:13AM +0000, Andy-ld Lu (卢东) wrote:
> > > On Wed, 2025-01-15 at 08:29 +0100, Christian Marangi wrote:
> > > > Add support for AN7581 MMC Host. The MMC Host controller is based
> > > > on
> > > > mt7622 with the difference of not having regulator supply and
> > > > state_uhs
> > > > pins and hclk clock.
> > > > 
> > > > Some minor fixes are applied to check if the state_uhs pins are
> > > > defined
> > > > and make hclk optional for the new airoha compatible.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  drivers/mmc/host/mtk-sd.c | 55 ++++++++++++++++++++++++++++++++-
> > > > ----
> > > > --
> > > >  1 file changed, 46 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-
> > > > sd.c
> > > > index efb0d2d5716b..9d6868883c91 100644
> > > > --- a/drivers/mmc/host/mtk-sd.c
> > > > +++ b/drivers/mmc/host/mtk-sd.c
> > > > @@ -666,6 +666,20 @@ static const struct mtk_mmc_compatible
> > > > mt8196_compat = {
> > > >     .support_new_rx = true,
> > > >  };
> > > > 
> > > > +static const struct mtk_mmc_compatible an7581_compat = {
> > > > +   .clk_div_bits = 12,
> > > > +   .recheck_sdio_irq = true,
> > > > +   .hs400_tune = false,
> > > > +   .pad_tune_reg = MSDC_PAD_TUNE0,
> > > > +   .async_fifo = true,
> > > > +   .data_tune = true,
> > > > +   .busy_check = true,
> > > > +   .stop_clk_fix = true,
> > > > +   .stop_dly_sel = 3,
> > > > +   .enhance_rx = true,
> > > > +   .support_64g = false,
> > > > +};
> > > > +
> > > >  static const struct of_device_id msdc_of_ids[] = {
> > > >     { .compatible = "mediatek,mt2701-mmc", .data =
> > > > &mt2701_compat},
> > > >     { .compatible = "mediatek,mt2712-mmc", .data =
> > > > &mt2712_compat},
> > > > @@ -680,7 +694,7 @@ static const struct of_device_id
> > > > msdc_of_ids[] =
> > > > {
> > > >     { .compatible = "mediatek,mt8183-mmc", .data =
> > > > &mt8183_compat},
> > > >     { .compatible = "mediatek,mt8196-mmc", .data =
> > > > &mt8196_compat},
> > > >     { .compatible = "mediatek,mt8516-mmc", .data =
> > > > &mt8516_compat},
> > > > -
> > > > +   { .compatible = "airoha,an7581-mmc", .data = &an7581_compat},
> > > >     {}
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, msdc_of_ids);
> > > > @@ -1600,6 +1614,10 @@ static int msdc_ops_switch_volt(struct
> > > > mmc_host *mmc, struct mmc_ios *ios)
> > > >     struct msdc_host *host = mmc_priv(mmc);
> > > >     int ret;
> > > > 
> > > > +   /* Skip setting supply if not supported */
> > > > +   if (!mmc->supply.vqmmc)
> > > > +           return 0;
> > > > +
> > > 
> > > Hi Christian,
> > > 
> > > I think here is no need. If you have not 'vqmmc' in the
> > > dts, IS_ERR(mmc->supply.vqmmc) would be -ENODEV and the
> > > corresponding
> > > flow would not be executed.
> > > 
> > > And another question, host->pins_default is just selected here,
> > > that
> > > would be lost.
> > > 
> > > >     if (!IS_ERR(mmc->supply.vqmmc)) {
> > > >             if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_330 &&
> > > >                 ios->signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
> > > > @@ -1699,7 +1717,9 @@ static void msdc_enable_sdio_irq(struct
> > > > mmc_host *mmc, int enb)
> > > >                             dev_dbg(host->dev, "SDIO eint irq:
> > > > %d!\n", host->eint_irq);
> > > >                     }
> > > > 
> > > > -                   pinctrl_select_state(host->pinctrl, host-
> > > > > pins_uhs);
> > > > 
> > > > +                   /* Skip setting uhs pins if not supported */
> > > > +                   if (host->pins_uhs)
> > > > +                           pinctrl_select_state(host->pinctrl,
> > > > host->pins_uhs);
> > > >             } else {
> > > >                     dev_pm_clear_wake_irq(host->dev);
> > > >             }
> > > > @@ -2036,6 +2056,10 @@ static void msdc_ops_set_ios(struct
> > > > mmc_host
> > > > *mmc, struct mmc_ios *ios)
> > > > 
> > > >     msdc_set_buswidth(host, ios->bus_width);
> > > > 
> > > > +   /* Skip regulator if not supported */
> > > > +   if (!mmc->supply.vmmc)
> > > > +           goto skip_regulator;
> > > > +
> > > 
> > > No need too.
> > > 
> > > >     /* Suspend/Resume will do power off/on */
> > > >     switch (ios->power_mode) {
> > > >     case MMC_POWER_UP:
> > > > @@ -2071,6 +2095,7 @@ static void msdc_ops_set_ios(struct
> > > > mmc_host
> > > > *mmc, struct mmc_ios *ios)
> > > >             break;
> > > >     }
> > > > 
> > > > +skip_regulator:
> > > >     if (host->mclk != ios->clock || host->timing != ios->timing)
> > > >             msdc_set_mclk(host, ios->timing, ios->clock);
> > > >  }
> > > > @@ -2816,9 +2841,12 @@ static int msdc_of_clock_parse(struct
> > > > platform_device *pdev,
> > > >     if (IS_ERR(host->src_clk))
> > > >             return PTR_ERR(host->src_clk);
> > > > 
> > > > -   host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > > -   if (IS_ERR(host->h_clk))
> > > > -           return PTR_ERR(host->h_clk);
> > > > +   /* AN7581 SoC doesn't have hclk */
> > > > +   if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> > > > +           host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > > +           if (IS_ERR(host->h_clk))
> > > > +                   return PTR_ERR(host->h_clk);
> > > > +   }
> > > 
> > > devm_clk_get_optional could be used to instead here, no need to use
> > > compatible to distinguish.
> > > 
> > 
> > I can make the hclk optional but I think this would affect also every
> > other compatible by hiding broken clock configuration.
> > 
> > > >     host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> > > >     if (IS_ERR(host->bus_clk))
> > > > @@ -2926,10 +2954,13 @@ static int msdc_drv_probe(struct
> > > > platform_device *pdev)
> > > >             return PTR_ERR(host->pins_default);
> > > >     }
> > > > 
> > > > -   host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > > > "state_uhs");
> > > > -   if (IS_ERR(host->pins_uhs)) {
> > > > -           dev_err(&pdev->dev, "Cannot find pinctrl uhs!\n");
> > > > -           return PTR_ERR(host->pins_uhs);
> > > > +   /* AN7581 doesn't have state_uhs pins */
> > > > +   if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> > > > +           host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > > > "state_uhs");
> > > > +           if (IS_ERR(host->pins_uhs)) {
> > > > +                   dev_err(&pdev->dev, "Cannot find pinctrl
> > > > uhs!\n");
> > > > +                   return PTR_ERR(host->pins_uhs);
> > > > +           }
> > > >     }
> > > 
> > > Could you consider to set a dummy 'state_uhs' same as
> > > 'state_default'
> > > in the dts, that you could not use compatible to distinguish here.
> > > 
> > 
> > This is problematic, correct me if I'm wrong, you are suggesting to
> > assign the emmc pins to both default and uhs? This is problematic as
> > the
> > pinctrl driver would complain that such pins are already assigned to
> > something. Also I don't think it's possible to assign these pins to a
> > dummy pin.
> > 
> Maybe I have not expressed clearly...What I mean is that you could set
> as below, and the content of &mmc_pins_uhs is just copied from
> &mmc_pins_default.
> 
> mmc@1fa0e000 {
> 	...
> 	pinctrl-names = "default", "state_uhs";
> 	pinctrl-0 = <&mmc_pins_default>;
> 	pinctrl-1 = <&mmc_pins_uhs>;
> }

Ok my bad. I did declared the second pin to pinctrl-0 instead of adding
pinctrl-1. With that it does work correctly.

> > > > 
> > > >     /* Support for SDIO eint irq ? */
> > > > @@ -3010,6 +3041,12 @@ static int msdc_drv_probe(struct
> > > > platform_device *pdev)
> > > >             dev_err(&pdev->dev, "Cannot ungate clocks!\n");
> > > >             goto release_clk;
> > > >     }
> > > > +
> > > > +   /* AN7581 without regulator require tune to OCR values */
> > > > +   if (device_is_compatible(&pdev->dev, "airoha,an7581-mmc") &&
> > > > +       !mmc->ocr_avail)
> > > > +           mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
> > > > +
> > > 
> > > Maybe you could use regulator-fixed in the dts and configure
> > > min/max
> > > voltage to get ocr_avail, no need to set hard code here.
> > > 
> > 
> > Also suggested by Wenbin Mei (梅文彬) and I just tried this.
> > 
> > This can't be done, fixed-regulator needs to have the same min and
> > max
> > voltage or they fail to probe sooo fixed-regulator saddly can't be
> > used
> > :(
> > 
> > I will send a new version of this with the other point corrected but
> > I
> > think a compatible and these additional if is a must :(
> If use the fixed regulator such as below, you will get the same
> ocr_avail as 'MMC_VDD_32_33 | MMC_VDD_33_34' through
> mmc_regulator_get_ocrmask().
> 
> vmmc_3v3: regulator-vmmc-3v3 {
> 	compatible = "regulator-fixed";
> 	regulator-name = "vmmc";
> 	regulator-min-microvolt = <3300000>;
> 	regulator-max-microvolt = <3300000>;
> 	regulator-always-on;
> }

Ok the code was a bit confusing but yes I can confirm that a 3.3 fixed
regulator define those 2 flags so also this is OK.

There is still the discussion about clock. You are totally against a new
compatible for the hclk? 

> > 
> > > >     msdc_init_hw(host);
> > > > 
> > > >     if (mmc->caps2 & MMC_CAP2_CQE) {
> > 
> > --
> >         Ansuel

-- 
	Ansuel

