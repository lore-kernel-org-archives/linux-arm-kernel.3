Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853B7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OYubTWT8W8gnW2hhHvEDsMeF0+M/5DJGx32z/EmZG8=; b=ELhHBpMnEU7Pq7dUvBinXeMSVK
	5t8/4O6sXQjKp3daO6/hieEW/2caeYTN6dDs1dOOnYxIhlwvrzh6DVUqAr+NpQeDGoG47xAy2B3MQ
	z16htj9+Zw+ZPh/3SYnqspvzP35FwOA/0OiZkbNer/rjQjstlVzjh0mWnwZIGjLUOkeZITbk0oakO
	WJDu5QW5YzwIeAsEq9Wo5KtcZL8shGcY7lliHghq6ohCCVfVvGhPQt2xTghi20h1KokWHO05dxOel
	nP1HZlSAuQXYVD/N0xTuZWZlY/soX9gUk47Q0LBIRH//csnVgmNKp+PpNcA4NBfj8aDIHWFI1HEK0
	m3iJHP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq8x-0000000BbIN-0Pe0;
	Thu, 09 Jan 2025 10:52:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq71-0000000Bb3Q-3uOS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85CF7A41845;
	Thu,  9 Jan 2025 10:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9720EC4CED2;
	Thu,  9 Jan 2025 10:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736419802;
	bh=v/ZX0nveeTxcISRHnJrYeW7lXV7b87UAzk1p1JK2HOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0lJJM3x2c41USk6C1JeDOTyGVuQDXXz+gVmijXo5AF6XODcuMFfbeyN3RhLJKsIc
	 7nvDO4/F2HBHIyIUumizh8oEQVPlHX6e838VeZDg4/DMRNd6RrMh7fNm1LcAvaLkZj
	 rtonkX8nKUpZ8fjzLlrXkYgiGwA1qpWbC1T/Erw9fSUeJdYMkUW9xZ4OtWc23lMAek
	 nGxeOG68VhSgFJWuV1uRA+143PyrPFO8AhA1mWvrSvcuSvKCODY/a08+SPeeIptZwV
	 pp31jI1Qe0/TV7ANXsJdMYkXS8rYjsb+5jW81lAkVGroF72VsuR29rafu1/J+iks4G
	 7KYNknZjuxZLA==
Date: Thu, 9 Jan 2025 10:49:56 +0000
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, wbg@kernel.org, jic23@kernel.org,
	ukleinek@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 2/9] mfd: stm32-timers: add support for stm32mp25
Message-ID: <20250109104956.GD6763@google.com>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
 <20241218090153.742869-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218090153.742869-3-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_025004_102890_F26CA3CD 
X-CRM114-Status: GOOD (  28.82  )
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

On Wed, 18 Dec 2024, Fabrice Gasnier wrote:

> Add support for STM32MP25 SoC. Use newly introduced compatible, to handle
> new features.
> Identification and hardware configuration registers allow to read the
> timer version and capabilities (counter width, number of channels...).
> So, rework the probe to avoid touching ARR register by simply read the
> counter width when available. This may avoid messing with a possibly
> running timer.
> Also add useful bit fields to stm32-timers header file.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/mfd/stm32-timers.c       | 32 +++++++++++++++++++++++++++++++-
>  include/linux/mfd/stm32-timers.h |  9 +++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index 650724e19b88..6f217c32482c 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/reset.h>
>  
>  #define STM32_TIMERS_MAX_REGISTERS	0x3fc
> @@ -173,6 +174,32 @@ static void stm32_timers_get_arr_size(struct stm32_timers *ddata)
>  	regmap_write(ddata->regmap, TIM_ARR, arr);
>  }
>  
> +static int stm32_timers_probe_hwcfgr(struct device *dev, struct stm32_timers *ddata)
> +{
> +	u32 val;
> +
> +	ddata->ipidr = (uintptr_t)device_get_match_data(dev);

Are you sure this cast is needed?

> +	if (!ddata->ipidr) {
> +		/* fallback to legacy method for probing counter width */

Sentences start with uppercase chars.

> +		stm32_timers_get_arr_size(ddata);
> +		return 0;
> +	}
> +
> +	regmap_read(ddata->regmap, TIM_IPIDR, &val);
> +	/* Sanity check on IP identification register */

This seems obvious, thus superfluous.

> +	if (val != ddata->ipidr) {
> +		dev_err(dev, "Unexpected identification: %u\n", val);

"Unexpected model number"?
"Unsupported device detected"?

> +		return -EINVAL;
> +	}
> +
> +	regmap_read(ddata->regmap, TIM_HWCFGR2, &val);

'/n' here.

> +	/* Counter width in bits, max reload value is BIT(width) - 1 */
> +	ddata->max_arr = BIT(FIELD_GET(TIM_HWCFGR2_CNT_WIDTH, val)) - 1;
> +	dev_dbg(dev, "TIM width: %ld\n", FIELD_GET(TIM_HWCFGR2_CNT_WIDTH, val));

How useful is this now the driver has been developed?

> +	return 0;
> +}
> +
>  static int stm32_timers_dma_probe(struct device *dev,
>  				   struct stm32_timers *ddata)
>  {
> @@ -285,7 +312,9 @@ static int stm32_timers_probe(struct platform_device *pdev)
>  	if (IS_ERR(ddata->clk))
>  		return PTR_ERR(ddata->clk);
>  
> -	stm32_timers_get_arr_size(ddata);
> +	ret = stm32_timers_probe_hwcfgr(dev, ddata);
> +	if (ret)
> +		return ret;
>  
>  	ret = stm32_timers_irq_probe(pdev, ddata);
>  	if (ret)
> @@ -320,6 +349,7 @@ static void stm32_timers_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id stm32_timers_of_match[] = {
>  	{ .compatible = "st,stm32-timers", },
> +	{ .compatible = "st,stm32mp25-timers", .data = (void *)STM32MP25_TIM_IPIDR },
>  	{ /* end node */ },
>  };
>  MODULE_DEVICE_TABLE(of, stm32_timers_of_match);
> diff --git a/include/linux/mfd/stm32-timers.h b/include/linux/mfd/stm32-timers.h
> index f09ba598c97a..23b0cae4a9f8 100644
> --- a/include/linux/mfd/stm32-timers.h
> +++ b/include/linux/mfd/stm32-timers.h
> @@ -33,6 +33,9 @@
>  #define TIM_DCR		0x48			/* DMA control register			*/
>  #define TIM_DMAR	0x4C			/* DMA register for transfer		*/
>  #define TIM_TISEL	0x68			/* Input Selection			*/
> +#define TIM_HWCFGR2	0x3EC			/* hardware configuration 2 Reg (MP25)	*/
> +#define TIM_HWCFGR1	0x3F0			/* hardware configuration 1 Reg (MP25)	*/
> +#define TIM_IPIDR	0x3F8			/* IP identification Reg (MP25)		*/
>  
>  #define TIM_CR1_CEN		BIT(0)					/* Counter Enable				*/
>  #define TIM_CR1_DIR		BIT(4)					/* Counter Direction				*/
> @@ -100,6 +103,9 @@
>  #define TIM_BDTR_BKF(x)		(0xf << (16 + (x) * 4))
>  #define TIM_DCR_DBA		GENMASK(4, 0)				/* DMA base addr				*/
>  #define TIM_DCR_DBL		GENMASK(12, 8)				/* DMA burst len				*/
> +#define TIM_HWCFGR1_NB_OF_CC	GENMASK(3, 0)				/* Capture/compare channels			*/
> +#define TIM_HWCFGR1_NB_OF_DT	GENMASK(7, 4)				/* Complementary outputs & dead-time generators */
> +#define TIM_HWCFGR2_CNT_WIDTH	GENMASK(15, 8)				/* Counter width				*/
>  
>  #define MAX_TIM_PSC				0xFFFF
>  #define MAX_TIM_ICPSC				0x3
> @@ -113,6 +119,8 @@
>  #define TIM_BDTR_BKF_MASK			0xF
>  #define TIM_BDTR_BKF_SHIFT(x)			(16 + (x) * 4)
>  
> +#define STM32MP25_TIM_IPIDR	0x00120002
> +
>  enum stm32_timers_dmas {
>  	STM32_TIMERS_DMA_CH1,
>  	STM32_TIMERS_DMA_CH2,
> @@ -151,6 +159,7 @@ struct stm32_timers_dma {
>  
>  struct stm32_timers {
>  	struct clk *clk;
> +	u32 ipidr;
>  	struct regmap *regmap;
>  	u32 max_arr;
>  	struct stm32_timers_dma dma; /* Only to be used by the parent */
> -- 
> 2.25.1
> 

-- 
Lee Jones [李琼斯]

