Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6DEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B3gemxUmaJrs7DfKycRLMmy76Q0qp/FE8e2Q2hM4To=; b=ZFUth/OMRdKSaED0LefB0q/eqy
	LO1pnfcwPC/TtXxnSJN3xKNpCoqfHQfjSXVKQ9M8L6uXeNH2HFMe74ueIKaMiJ42a+sMPAJ20f28h
	GZsa0k6dZp/ZQB1XmReWj7AkxD2CHaU8oHKWrAUZwUbAdgX7lF6GIBZ8NAgROvEnROlaJFKgO04MZ
	We2bzMf4gVdK+Xq+hsy/CFSusqp7Bh0cKJSLOekdkXa+aeoL42WCr2gF4W3zrRRhuZOc2UUMRPfIY
	2pxfcgdCr90Tp4VMMf6qk1YL9F2ItbuxluUWIINPK5CP09aUShYVkGqe9pSY1E4IU/oLbg2lnchw9
	9AGQqvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwcI-00000006Ffo-0P0R;
	Mon, 20 Jan 2025 18:35:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvb6-00000006AQv-3u55;
	Mon, 20 Jan 2025 17:30:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so47058365e9.2;
        Mon, 20 Jan 2025 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737394199; x=1737998999; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0B3gemxUmaJrs7DfKycRLMmy76Q0qp/FE8e2Q2hM4To=;
        b=DO3vUijtzJejxaVcc5Yb6zN9zNVOZswcC9FCNlrk/ZDAO3TYT3y9qo/dG8E/Y3laU+
         Z4Ntb30Tb5JNei/VqXMHxpKTEwEc8mU1CgjjjbDZc0PbbjUbw5LKJVkKe/kvY1xF71e2
         BK/uroBsP2i7qfPEMsB2MOxAV+88CfbpU7DSAJ53g2ts53MQ1UKOJyx/8EKpiTY2sX5U
         NcAklJD0EIo04lXJ3dGU8yTZK7sakZUZGZInbvdmFfSfVG7vmEKhtn4n/ptZBG13R0Gv
         Qy+sngOTTss3AC8Zywf1m7gva8+8v7ikCFA5MWKY02HRhC9qVTSLSfpzXJr1BPvMbAE/
         JHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737394199; x=1737998999;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0B3gemxUmaJrs7DfKycRLMmy76Q0qp/FE8e2Q2hM4To=;
        b=k5xEXw1uiBgnemoAE9wW8NsEQkra3F2jhFOyF2Bu5xyEyzuych7k3D+BVydpEXa8Zd
         u1tEuGTybFhB+sHO5ECwsd3TdRQySsPiVWWmdBhcK10jNIlH0jrGnTJn2iI8CegVVUX0
         eVnOhmbAhreyn1rJaCOIHO0nhH+brANPpv3T97xXA/45PFEzB91BHGc2JoMAlvK3mXRG
         psin1tlfdnyQgkky5Pvq8X7pDr8xfYyIOKeEs7n2So7GlfGiy5JGuWhnZeNJ2+GhaYos
         dB55Dn297z2DL44+acFWg10j4favUW3e+Z4Tskx2JliFPSBMhe/7Li2zVpFSRmj2McuO
         1Owg==
X-Forwarded-Encrypted: i=1; AJvYcCUGncEOATIGepOIwMKknWtEOpyXBKdHmNHqSVj/zSwjqonxSzY7hwqjEFIimD79YWcM2P3YFYjvN8MK7Lqms70W@lists.infradead.org, AJvYcCULopocvBLh3Ex+574eDZ0zYXCIx4stwXfxtLEXIq25s2tH8zqiUE+WzdQ+zYmXIgRDqPeUTGiFBkcDeGp3R+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyKapZ+dtBbU3IsN5FNQ9q9mVhgca7Kl0Mz6D/lbKxCuNQFW/f
	A7t0zKqZwY3uDyIPasMCmN1m6m6M72IJFOl+cytXcV/2ljRMbKRj
X-Gm-Gg: ASbGncsGsbD8RKivWyosUl5jRsJNle4k7Tnol835+jiVqgDmMmfVgQFftczKU8cy/Tl
	1WR/3CCW3LcQZnURLQvLeLDrYjmj4IeRGrvhDAZCC3/r1cMz1AyNGc0AACmNVeWD+dQQbJzbu/k
	GhAQkmwWeP7M/WW0BlHV1W8zcbwwOCdNE/St3SV4oRj8cZPZ/SiF0X+eFqMwIzuvhDUdeldeHFp
	guvTBtqvP/DFrsr3hv5JTB7jrx0JFy3/juVrd5Kp6Kzb08xNt7Zt4J98jlYyOiwuDuR60rL8Ku+
	cdXHv0zA88iY1LuxrjoFkvsYxw==
X-Google-Smtp-Source: AGHT+IF1Ls2ZGh8+noLN6wNSkCbP/7nO9y+DgQ3y6uIFFRbvHCZR1LGZjFHMdzf8bf1nnMgw+5jwqA==
X-Received: by 2002:a05:600c:6a94:b0:434:f753:600f with SMTP id 5b1f17b1804b1-438914376b1mr117703705e9.19.1737394198893;
        Mon, 20 Jan 2025 09:29:58 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0efccf7sm137517235e9.0.2025.01.20.09.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:29:58 -0800 (PST)
Message-ID: <678e8816.050a0220.b6bb9.f588@mx.google.com>
X-Google-Original-Message-ID: <Z46IEs6HyZJd3eHV@Ansuel-XPS.>
Date: Mon, 20 Jan 2025 18:29:54 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy-ld Lu =?utf-8?B?KOWNouS4nCk=?= <Andy-ld.Lu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Wenbin Mei =?utf-8?B?KOaiheaWh+W9rCk=?= <Wenbin.Mei@mediatek.com>,
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
 <9e022bf13354f544962491cf8061ff3edb878c30.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e022bf13354f544962491cf8061ff3edb878c30.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_093000_977568_76D8FC2A 
X-CRM114-Status: GOOD (  39.83  )
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

On Thu, Jan 16, 2025 at 07:01:13AM +0000, Andy-ld Lu (卢东) wrote:
> On Wed, 2025-01-15 at 08:29 +0100, Christian Marangi wrote:
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
> >  	.support_new_rx = true,
> >  };
> >  
> > +static const struct mtk_mmc_compatible an7581_compat = {
> > +	.clk_div_bits = 12,
> > +	.recheck_sdio_irq = true,
> > +	.hs400_tune = false,
> > +	.pad_tune_reg = MSDC_PAD_TUNE0,
> > +	.async_fifo = true,
> > +	.data_tune = true,
> > +	.busy_check = true,
> > +	.stop_clk_fix = true,
> > +	.stop_dly_sel = 3,
> > +	.enhance_rx = true,
> > +	.support_64g = false,
> > +};
> > +
> >  static const struct of_device_id msdc_of_ids[] = {
> >  	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
> >  	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
> > @@ -680,7 +694,7 @@ static const struct of_device_id msdc_of_ids[] =
> > {
> >  	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},
> >  	{ .compatible = "mediatek,mt8196-mmc", .data = &mt8196_compat},
> >  	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
> > -
> > +	{ .compatible = "airoha,an7581-mmc", .data = &an7581_compat},
> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, msdc_of_ids);
> > @@ -1600,6 +1614,10 @@ static int msdc_ops_switch_volt(struct
> > mmc_host *mmc, struct mmc_ios *ios)
> >  	struct msdc_host *host = mmc_priv(mmc);
> >  	int ret;
> >  
> > +	/* Skip setting supply if not supported */
> > +	if (!mmc->supply.vqmmc)
> > +		return 0;
> > +
> Hi Christian,
> 
> I think here is no need. If you have not 'vqmmc' in the
> dts, IS_ERR(mmc->supply.vqmmc) would be -ENODEV and the corresponding
> flow would not be executed.
> 
> And another question, host->pins_default is just selected here, that
> would be lost.
>  
> >  	if (!IS_ERR(mmc->supply.vqmmc)) {
> >  		if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_330 &&
> >  		    ios->signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
> > @@ -1699,7 +1717,9 @@ static void msdc_enable_sdio_irq(struct
> > mmc_host *mmc, int enb)
> >  				dev_dbg(host->dev, "SDIO eint irq:
> > %d!\n", host->eint_irq);
> >  			}
> >  
> > -			pinctrl_select_state(host->pinctrl, host-
> > >pins_uhs);
> > +			/* Skip setting uhs pins if not supported */
> > +			if (host->pins_uhs)
> > +				pinctrl_select_state(host->pinctrl,
> > host->pins_uhs);
> >  		} else {
> >  			dev_pm_clear_wake_irq(host->dev);
> >  		}
> > @@ -2036,6 +2056,10 @@ static void msdc_ops_set_ios(struct mmc_host
> > *mmc, struct mmc_ios *ios)
> >  
> >  	msdc_set_buswidth(host, ios->bus_width);
> >  
> > +	/* Skip regulator if not supported */
> > +	if (!mmc->supply.vmmc)
> > +		goto skip_regulator;
> > +
> No need too.
> 
> >  	/* Suspend/Resume will do power off/on */
> >  	switch (ios->power_mode) {
> >  	case MMC_POWER_UP:
> > @@ -2071,6 +2095,7 @@ static void msdc_ops_set_ios(struct mmc_host
> > *mmc, struct mmc_ios *ios)
> >  		break;
> >  	}
> >  
> > +skip_regulator:
> >  	if (host->mclk != ios->clock || host->timing != ios->timing)
> >  		msdc_set_mclk(host, ios->timing, ios->clock);
> >  }
> > @@ -2816,9 +2841,12 @@ static int msdc_of_clock_parse(struct
> > platform_device *pdev,
> >  	if (IS_ERR(host->src_clk))
> >  		return PTR_ERR(host->src_clk);
> >  
> > -	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > -	if (IS_ERR(host->h_clk))
> > -		return PTR_ERR(host->h_clk);
> > +	/* AN7581 SoC doesn't have hclk */
> > +	if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> > +		host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > +		if (IS_ERR(host->h_clk))
> > +			return PTR_ERR(host->h_clk);
> > +	}
> devm_clk_get_optional could be used to instead here, no need to use
> compatible to distinguish.
>

I can make the hclk optional but I think this would affect also every
other compatible by hiding broken clock configuration.

> >  	host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> >  	if (IS_ERR(host->bus_clk))
> > @@ -2926,10 +2954,13 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >  		return PTR_ERR(host->pins_default);
> >  	}
> >  
> > -	host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > "state_uhs");
> > -	if (IS_ERR(host->pins_uhs)) {
> > -		dev_err(&pdev->dev, "Cannot find pinctrl uhs!\n");
> > -		return PTR_ERR(host->pins_uhs);
> > +	/* AN7581 doesn't have state_uhs pins */
> > +	if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> > +		host->pins_uhs = pinctrl_lookup_state(host->pinctrl,
> > "state_uhs");
> > +		if (IS_ERR(host->pins_uhs)) {
> > +			dev_err(&pdev->dev, "Cannot find pinctrl
> > uhs!\n");
> > +			return PTR_ERR(host->pins_uhs);
> > +		}
> >  	}
> Could you consider to set a dummy 'state_uhs' same as 'state_default'
> in the dts, that you could not use compatible to distinguish here.
> 

This is problematic, correct me if I'm wrong, you are suggesting to
assign the emmc pins to both default and uhs? This is problematic as the
pinctrl driver would complain that such pins are already assigned to
something. Also I don't think it's possible to assign these pins to a
dummy pin.

> >  
> >  	/* Support for SDIO eint irq ? */
> > @@ -3010,6 +3041,12 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >  		dev_err(&pdev->dev, "Cannot ungate clocks!\n");
> >  		goto release_clk;
> >  	}
> > +
> > +	/* AN7581 without regulator require tune to OCR values */
> > +	if (device_is_compatible(&pdev->dev, "airoha,an7581-mmc") &&
> > +	    !mmc->ocr_avail)
> > +		mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
> > +
> Maybe you could use regulator-fixed in the dts and configure min/max
> voltage to get ocr_avail, no need to set hard code here. 
> 

Also suggested by Wenbin Mei (梅文彬) and I just tried this.

This can't be done, fixed-regulator needs to have the same min and max
voltage or they fail to probe sooo fixed-regulator saddly can't be used
:(

I will send a new version of this with the other point corrected but I
think a compatible and these additional if is a must :(

> >  	msdc_init_hw(host);
> >  
> >  	if (mmc->caps2 & MMC_CAP2_CQE) {

-- 
	Ansuel

