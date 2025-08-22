Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768CDCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVNj7XuCRYzgakERnKLvBNWM2bucmEROJFI6LqjhvO4=; b=SNgHSpEKr+HHwCICEFTaYEe7cX
	AhWO+AJerVNN9HaFzfgB72Yulrdikosm6eSlTZAr/wJ5KqtBDGTueGfTZsm5N++AxG7zkFvSTx9Cm
	HY4KLygvZ3cWkdNR9JDKmZlJNG+4+emav1zMC7npmMJI6NrjUBjnXQw8t8W9x8WEOnEJakAgjlg2t
	g0OzD4ECod9/ABv+QcvUyOsUjMoLzoVZz0+cpotdHS4Fhl6w6Kgf5yKz8tcE2v3ayPrIWfnsEppz3
	yc1V5IHIrf201M0qUXDVBqGB5Dlib1vcC4E8xgdZ1p1f0k22ivpEs5mq/W698v7AO4IEIj2hqYj3x
	HNklYJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPr3-00000002IQh-272J;
	Fri, 22 Aug 2025 11:22:45 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIFS-00000001MF4-2ZqX;
	Fri, 22 Aug 2025 03:15:28 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1755832522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVNj7XuCRYzgakERnKLvBNWM2bucmEROJFI6LqjhvO4=;
	b=LA8CP65OXnnR9gteh1dgRcomRR3qHjJm1l0KP+WuXv9Ef4pVYSQ+RBQwYmk+ZxAg+xQccJ
	YtJ9i4GQobi6N8AJmrfSOt7M0iQpBRJcxx++tj2uGCtZ4078K8OBQ6T2tR1Mx6gJ8ALAqF
	dJAfmbVPQMcwW36IWEjYUZjwJYQZvNp6qcCLzMofDMt6bpcyDJLO7YOHCrwN38IR3d3Xgi
	3PdCAC7emnQwyNFo8JZGYGVxp6XTZ8j3e+0WXXfjSYIaFMTdYLnk/lwdfMHyLMnmDi0tXT
	lrHVz6c0hGwphutvAe7xtpr40XnP+zyzH1U41r8Mq/wAf43Sj+VcDV6iGsreow==
Date: Fri, 22 Aug 2025 05:15:22 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Diederik de Haas
 <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 2/3] thermal: rockchip: shut up GRF warning
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-2-c7e2d35017b8@kernel.org>
Message-ID: <2951de6ac036c7e8c62a940d2ed029ea@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_201526_988187_4EB8DA50 
X-CRM114-Status: GOOD (  19.00  )
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

Hello Sebastian,

On 2025-08-20 19:40, Sebastian Reichel wrote:
> Most of the recent Rockchip devices do not have a GRF associated
> with the tsadc IP. Let's avoid printing a warning on those devices.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/thermal/rockchip_thermal.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Thanks for the patch!  It's looking good to me, and it's virtually
identical to my rather old patch that I implemented a while ago, but
never submitted to the mailing list(s).

Please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> diff --git a/drivers/thermal/rockchip_thermal.c
> b/drivers/thermal/rockchip_thermal.c
> index
> 7b18a705dfade6fa7318b28c2b57544a4446c1cc..c49ddf70f86e7beaf0190b1b3e93f5e6b2f72b2c
> 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -74,6 +74,7 @@ struct chip_tsadc_table {
>   * @tshut_temp: the hardware-controlled shutdown temperature value,
> with no trim
>   * @tshut_mode: the hardware-controlled shutdown mode (0:CRU 1:GPIO)
>   * @tshut_polarity: the hardware-controlled active polarity (0:LOW 
> 1:HIGH)
> + * @grf_required: true, if a GRF is required for proper functionality
>   * @initialize: SoC special initialize tsadc controller method
>   * @irq_ack: clear the interrupt
>   * @control: enable/disable method for the tsadc controller
> @@ -97,6 +98,9 @@ struct rockchip_tsadc_chip {
>  	enum tshut_mode tshut_mode;
>  	enum tshut_polarity tshut_polarity;
> 
> +	/* GRF availability */
> +	bool grf_required;
> +
>  	/* Chip-wide methods */
>  	void (*initialize)(struct regmap *grf,
>  			   void __iomem *reg, enum tshut_polarity p);
> @@ -1098,6 +1102,7 @@ static const struct rockchip_tsadc_chip
> px30_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* 2 channels for tsadc */
> +	.grf_required = true,
>  	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp = 95000,
>  	.initialize = rk_tsadcv4_initialize,
> @@ -1119,6 +1124,7 @@ static const struct rockchip_tsadc_chip
> rv1108_tsadc_data = {
>  	/* cpu */
>  	.chn_offset = 0,
>  	.chn_num = 1, /* one channel for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1141,6 +1147,7 @@ static const struct rockchip_tsadc_chip
> rk3228_tsadc_data = {
>  	/* cpu */
>  	.chn_offset = 0,
>  	.chn_num = 1, /* one channel for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1163,6 +1170,7 @@ static const struct rockchip_tsadc_chip
> rk3288_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 1,
>  	.chn_num = 2, /* two channels for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1185,6 +1193,7 @@ static const struct rockchip_tsadc_chip
> rk3328_tsadc_data = {
>  	/* cpu */
>  	.chn_offset = 0,
>  	.chn_num = 1, /* one channels for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_CRU, /* default TSHUT via CRU */
>  	.tshut_temp = 95000,
>  	.initialize = rk_tsadcv2_initialize,
> @@ -1206,6 +1215,7 @@ static const struct rockchip_tsadc_chip
> rk3366_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> +	.grf_required = true,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1228,6 +1238,7 @@ static const struct rockchip_tsadc_chip
> rk3368_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1250,6 +1261,7 @@ static const struct rockchip_tsadc_chip
> rk3399_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> +	.grf_required = true,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1272,6 +1284,7 @@ static const struct rockchip_tsadc_chip
> rk3568_tsadc_data = {
>  	/* cpu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 2, /* two channels for tsadc */
> +	.grf_required = true,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1294,6 +1307,7 @@ static const struct rockchip_tsadc_chip
> rk3576_tsadc_data = {
>  	/* top, big_core, little_core, ddr, npu, gpu */
>  	.chn_offset = 0,
>  	.chn_num = 6, /* six channels for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1318,6 +1332,7 @@ static const struct rockchip_tsadc_chip
> rk3588_tsadc_data = {
>  	/* top, big_core0, big_core1, little_core, center, gpu, npu */
>  	.chn_offset = 0,
>  	.chn_num = 7, /* seven channels for tsadc */
> +	.grf_required = false,
>  	.tshut_mode = TSHUT_MODE_GPIO, /* default TSHUT via GPIO give PMIC */
>  	.tshut_polarity = TSHUT_LOW_ACTIVE, /* default TSHUT LOW ACTIVE */
>  	.tshut_temp = 95000,
> @@ -1594,12 +1609,10 @@ static int rockchip_configure_from_dt(struct
> device *dev,
>  		return -EINVAL;
>  	}
> 
> -	/* The tsadc wont to handle the error in here since some SoCs didn't
> -	 * need this property.
> -	 */
>  	thermal->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> -	if (IS_ERR(thermal->grf))
> -		dev_warn(dev, "Missing rockchip,grf property\n");
> +	if (IS_ERR(thermal->grf) && thermal->chip->grf_required)
> +		return dev_err_probe(dev, PTR_ERR(thermal->grf),
> +				     "Missing rockchip,grf property\n");
> 
>  	rockchip_get_trim_configuration(dev, np, thermal);

