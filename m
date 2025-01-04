Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468E3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jK0s23VokbFuxovaEfAVFvmAMtNeeZT0/QSCobD0rPI=; b=x7ko8tssA0M6muvHk3WlLBtD/9
	tFsDkDJC0rYQGL9SEIOuQjaEKH5O8DuwPtJgkupnrOiC9bqgn7okfFtYkaTzdVvV7lWnCY4pTrkVu
	LHZkCrv+b1l5ToHtdGQAgOi/Ee9Z8Lvjzyok7Xumq6vL6pr1BATSCFrcswMnGDXm/DTn1X9624Ddj
	AqkTUWk4JFr1guculSqG660Zt8UuJZ1CfKBSY3WDkIpGR05jJRW8hIc0QreP7bqYWi0cwQNlT9zH6
	gmhUH6HXkhKzT+JryWxHCBDGIS0Nx8XTN4oPGowETcoVqpigylAMDrKWrAmTF4MunG+wCPurfoHD6
	Vtp4LvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU4hc-0000000F4rf-39Pl;
	Sat, 04 Jan 2025 14:00:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU4gS-0000000F4kO-0ZCQ;
	Sat, 04 Jan 2025 13:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45D56A40AC6;
	Sat,  4 Jan 2025 13:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3762EC4CED1;
	Sat,  4 Jan 2025 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735999159;
	bh=4n1bUXFAX1wVT1KsrzG+8WwspZWcX0SLePYj+L4Un+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jTa8YRn1JZwSxkRuIT5DIPHiVeeRyilrkHcgh0hOQVUargj5dkAmfKINI/Moj8vdk
	 /j5RvYC6ohzW8W6WXg0r86x0oS94gS8PXyqTyznpwRXdY0dLvBgnGHmAfheAbNoBJO
	 Gj1NOqu2TM+W85SO3/ELFqzAExAgoG9Mt2XdDxEnNTD6vCwvvYVZVklbc6vqqk1MZ4
	 0iioKgm4yCb8j9jcHpacG7MezcPIrdpHmqGNsO8J7Jz8hC2XgyqxsF8bZJXABK+b5C
	 +0aAw9CK3l44HuCfHZVLB0Uk+rglW15+H9bGN9yFz9IZUMxtySLzNsBDYiSCOefq3G
	 vXOdptBIGjQmg==
Date: Sat, 4 Jan 2025 13:59:12 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, gnstark@salutedevices.com, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 christianshewitt@gmail.com
Subject: Re: [RFC PATCH v1 2/2] iio: adc: meson: add support for the GXLX
 SoC
Message-ID: <20250104135912.390ec87c@jic23-huawei>
In-Reply-To: <20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
	<20241231194207.2772750-3-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_055920_316548_771781CF 
X-CRM114-Status: GOOD (  28.30  )
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

On Tue, 31 Dec 2024 20:42:07 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The SARADC IP on the GXLX SoC itself is identical to the one found on
> GXL SoCs. However, GXLX SoCs require poking the first three bits in the
> MESON_SAR_ADC_REG12 register to get the three MPLL clocks (used as clock
> generators for the audio frequencies) to work.
> 
> The reason why there are MPLL clock bits in the ADC register space is
> entirely unknown and it seems that nobody is able to comment on this.
> So clearly mark this as a workaround and add a warning so users are
> notified that this workaround can change (once we know what these bits
> actually do).

So IIUC this is to make some non ADC component work.
How are you handling dependencies?  The ADC driver might not be loaded or
is there some reason it definitely is at the point where the audio driver
loads?

Jonathan

> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/iio/adc/meson_saradc.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 997def4a4d2f..df15a2566ec7 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -160,6 +160,11 @@
>  	#define MESON_SAR_ADC_REG11_EOC				BIT(1)
>  	#define MESON_SAR_ADC_REG11_VREF_SEL			BIT(0)
>  
> +#define MESON_SAR_ADC_REG12					0x30
> +	#define MESON_SAR_ADC_REG12_MPLL0_UNKNOWN		BIT(0)
> +	#define MESON_SAR_ADC_REG12_MPLL1_UNKNOWN		BIT(1)
> +	#define MESON_SAR_ADC_REG12_MPLL2_UNKNOWN		BIT(2)
> +
>  #define MESON_SAR_ADC_REG13					0x34
>  	#define MESON_SAR_ADC_REG13_12BIT_CALIBRATION_MASK	GENMASK(13, 8)
>  
> @@ -326,6 +331,7 @@ struct meson_sar_adc_param {
>  	u8					cmv_select;
>  	u8					adc_eoc;
>  	enum meson_sar_adc_vref_sel		vref_voltage;
> +	bool					enable_mpll_clock_workaround;
>  };
>  
>  struct meson_sar_adc_data {
> @@ -995,6 +1001,15 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
>  				    priv->param->cmv_select);
>  		regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG11,
>  				   MESON_SAR_ADC_REG11_CMV_SEL, regval);
> +
> +		if (priv->param->enable_mpll_clock_workaround) {
> +			dev_warn(dev,
> +				 "Enabling unknown bits to make the MPLL clocks work. This may change so always update dtbs and kernel together\n");
> +			regmap_write(priv->regmap, MESON_SAR_ADC_REG12,
> +				     MESON_SAR_ADC_REG12_MPLL0_UNKNOWN |
> +				     MESON_SAR_ADC_REG12_MPLL1_UNKNOWN |
> +				     MESON_SAR_ADC_REG12_MPLL2_UNKNOWN);
> +		}
>  	}
>  
>  	ret = clk_set_parent(priv->adc_sel_clk, priv->clkin);
> @@ -1219,6 +1234,17 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
>  	.cmv_select = 1,
>  };
>  
> +static const struct meson_sar_adc_param meson_sar_adc_gxlx_param = {
> +	.has_bl30_integration = true,
> +	.clock_rate = 1200000,
> +	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
> +	.resolution = 12,
> +	.disable_ring_counter = 1,
> +	.vref_voltage = VREF_VOLTAGE_1V8,
> +	.cmv_select = true,
> +	.enable_mpll_clock_workaround = true,
> +};
> +
>  static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
>  	.has_bl30_integration = true,
>  	.clock_rate = 1200000,
> @@ -1267,6 +1293,11 @@ static const struct meson_sar_adc_data meson_sar_adc_gxl_data = {
>  	.name = "meson-gxl-saradc",
>  };
>  
> +static const struct meson_sar_adc_data meson_sar_adc_gxlx_data = {
> +	.param = &meson_sar_adc_gxlx_param,
> +	.name = "meson-gxlx-saradc",
> +};
> +
>  static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>  	.param = &meson_sar_adc_gxl_param,
>  	.name = "meson-gxm-saradc",
> @@ -1298,6 +1329,9 @@ static const struct of_device_id meson_sar_adc_of_match[] = {
>  	}, {
>  		.compatible = "amlogic,meson-gxl-saradc",
>  		.data = &meson_sar_adc_gxl_data,
> +	}, {
> +		.compatible = "amlogic,meson-gxlx-saradc",
> +		.data = &meson_sar_adc_gxlx_data,
>  	}, {
>  		.compatible = "amlogic,meson-gxm-saradc",
>  		.data = &meson_sar_adc_gxm_data,


