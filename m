Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ACCC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eoq8Ip4Lg2/aL44gQkJ166eIGqKVZnzBY67DvJxGBM=; b=0IikWjeJHb+mQP2/kGlm1Y3FQc
	RZQCF7o5LTt2XTQUQD9Lx/6xQ696vpiznmkHiZ/SJ42dixAJJUdvZqPjf74A8OnBQQvr9bVK0VB5J
	d9MzR5yPAds2zs8orwHFTlblQRBrjYLMKVUU+qlLlADDdVkTAdgwqN45s4Jx7PVESU+AYtwZl90Yn
	B+S+xor5dJmca0yojgw7CCw77ngK5l1sQ4kEjZurHIYHylFIL/5UIEV/1fWucgXbDY7kOckQF/0om
	ijDv9AmYa4hzHvLeIW664u7ksF2e0Q1kaG6Il9nu8hkITcYCoG2Wz5uD+XiLSOzceW0IKImtFnA5y
	lWaPYUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMmr-0000000G1R7-202F;
	Sat, 15 Mar 2025 08:22:29 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttMlC-0000000G1KB-0QdY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 08:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742026845;
 bh=3eoq8Ip4Lg2/aL44gQkJ166eIGqKVZnzBY67DvJxGBM=;
 b=w7LqclMASyLeWLBzlcFEXPkiES7tVScMS+1BxvSTE89GzPrEB1p7LQHRolowru1ucr7l03jUY
 Ddk8uUcswC9f4cOl81j5XzT7OOEu3i3KpDgQ2Lp4cZSghAVDz1mD0fphdqSkLSJlMO0At7A/xPb
 6Cge+KV0yS2T9NAMLvJKjY2Jr1TbXME/QlJJ9R1TsNBe6MHibBpMYajEbJ/IPAbT/Rcz4MLD0mV
 asOtoCKP6G80giXu/c21kEy+Vnyx/yGGutwvC++3B720iy6PKbIS0TPBNk44Sc3Ocpf7bNPqvZs
 9oJhppVYUrMMuAABG20UnHPAslUYewRhlez2CvAkVPJQ==
X-Forward-Email-ID: 67d5383dca5d7787a43350e7
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <6c355664-50dd-4efd-94b7-9d93c02d3e80@kwiboo.se>
Date: Sat, 15 Mar 2025 09:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] thermal: rockchip: Support RK3576 SoC in the
 thermal driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Ye Zhang <ye.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Sebastian Reichel
 <sebastian.reichel@collabora.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
References: <20250228-rk3576-tsadc-upstream-v3-0-4bfbb3b699b9@collabora.com>
 <20250228-rk3576-tsadc-upstream-v3-3-4bfbb3b699b9@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250228-rk3576-tsadc-upstream-v3-3-4bfbb3b699b9@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_012046_172319_C84BDAD8 
X-CRM114-Status: GOOD (  18.46  )
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

Hi Nicolas,

On 2025-02-28 21:06, Nicolas Frattaroli wrote:
> From: Ye Zhang <ye.zhang@rock-chips.com>
> 
> The RK3576 SoC has six TS-ADC channels: TOP, BIG_CORE, LITTLE_CORE,
> DDR, NPU and GPU.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> [ported to mainline, reworded commit message]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/thermal/rockchip_thermal.c | 42 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index a8ad85feb68fbb7ec8d79602b16c47838ecb3c00..bec1930bebd87859a7e519cfc9f05e10b1c31e87 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1061,6 +1061,22 @@ static void rk_tsadcv3_tshut_mode(int chn, void __iomem *regs,
>  	writel_relaxed(val_cru, regs + TSADCV3_HSHUT_CRU_INT_EN);
>  }
>  
> +static void rk_tsadcv4_tshut_mode(int chn, void __iomem *regs,
> +				  enum tshut_mode mode)
> +{
> +	u32 val_gpio, val_cru;
> +
> +	if (mode == TSHUT_MODE_GPIO) {
> +		val_gpio = TSADCV2_INT_SRC_EN(chn) | TSADCV2_INT_SRC_EN_MASK(chn);
> +		val_cru = TSADCV2_INT_SRC_EN_MASK(chn);
> +	} else {
> +		val_cru = TSADCV2_INT_SRC_EN(chn) | TSADCV2_INT_SRC_EN_MASK(chn);
> +		val_gpio = TSADCV2_INT_SRC_EN_MASK(chn);
> +	}
> +	writel_relaxed(val_gpio, regs + TSADCV3_HSHUT_GPIO_INT_EN);
> +	writel_relaxed(val_cru, regs + TSADCV3_HSHUT_CRU_INT_EN);
> +}

This function is identical to rk_tsadcv3_tshut_mode() in mainline.

Should the v3 function be renamed to v4 in mainline to match vendor
kernel to avoid confusion?

> +
>  static const struct rockchip_tsadc_chip px30_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
> @@ -1284,6 +1300,28 @@ static const struct rockchip_tsadc_chip rk3568_tsadc_data = {
>  	},
>  };
>  
> +static const struct rockchip_tsadc_chip rk3576_tsadc_data = {
> +	/* top, big_core, little_core, ddr, npu, gpu */
> +	.chn_offset = 0,
> +	.chn_num = 6, /* six channels for tsadc */
> +	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
> +	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
> +	.tshut_temp = 95000,

Here the default is GPIO and 95 deg, in DT node the default is override
to CRU and 120 deg.

Any reason that is not the default here?

Regards,
Jonas

> +	.initialize = rk_tsadcv8_initialize,
> +	.irq_ack = rk_tsadcv4_irq_ack,
> +	.control = rk_tsadcv4_control,
> +	.get_temp = rk_tsadcv4_get_temp,
> +	.set_alarm_temp = rk_tsadcv3_alarm_temp,
> +	.set_tshut_temp = rk_tsadcv3_tshut_temp,
> +	.set_tshut_mode = rk_tsadcv4_tshut_mode,
> +	.table = {
> +		.id = rk3588_code_table,
> +		.length = ARRAY_SIZE(rk3588_code_table),
> +		.data_mask = TSADCV4_DATA_MASK,
> +		.mode = ADC_INCREMENT,
> +	},
> +};
> +
>  static const struct rockchip_tsadc_chip rk3588_tsadc_data = {
>  	/* top, big_core0, big_core1, little_core, center, gpu, npu */
>  	.chn_offset = 0,
> @@ -1342,6 +1380,10 @@ static const struct of_device_id of_rockchip_thermal_match[] = {
>  		.compatible = "rockchip,rk3568-tsadc",
>  		.data = (void *)&rk3568_tsadc_data,
>  	},
> +	{
> +		.compatible = "rockchip,rk3576-tsadc",
> +		.data = (void *)&rk3576_tsadc_data,
> +	},
>  	{
>  		.compatible = "rockchip,rk3588-tsadc",
>  		.data = (void *)&rk3588_tsadc_data,
> 


