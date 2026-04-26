Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535D3FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxbl4epg48KUX2MzjpAavq4/tG2sfpxD57DOODEbyl0=; b=3LI5MYjNzQtIDZx39cYoS9dlzw
	+VETDLrRXTrAd+d1t+rFyzEKurzcwIjxWf/Nl2iaiHK9aua3nmNkrXcxjngwRUQmLO+1i3enq3/vz
	l1RDYLEsxUznx9oHOw1hcrhOKufPJrp+ozGuzg7qshjxqbf3ZSwp7jcjK9udmAVuEg40kDV5B2MvE
	DOcdoV3ncxWFcYhM3JT2nJ72gbbmOEXp1nb4S+1mhZE6VJcMqGG66e9ZlYDlUL7nWYbQ01NwyWsHE
	nybJOlqeB0METGwyE2EdWH+4ZMT2UpG1vTVZmgmiZT0xMGg/wGRlHpM9OpyflH/P1irOdvxTQBvzD
	5ACADiag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwRD-0000000FQpa-1IWB;
	Sun, 26 Apr 2026 10:10:07 +0000
Received: from mail-m128112.netease.com ([103.209.128.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGwR9-0000000FQp2-0lpP;
	Sun, 26 Apr 2026 10:10:05 +0000
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c2b8e6e5;
	Sun, 26 Apr 2026 18:09:58 +0800 (GMT+08:00)
Message-ID: <544c8d66-b242-4895-b8de-2f1dfdd0c7b4@rock-chips.com>
Date: Sun, 26 Apr 2026 18:09:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Cc: kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dc9446f9103a3kunm6b0f68e1145d79
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQh5KTlZPHh0aGBkaTU
	MdQhpWFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=eb4I3kZaySR2+F0gMBqA+RVFFlrWOKdh4b1SAYLJKcnbvJzdFS3sxr68WQO9M8q2IYHeje3rvXLc0fvoKnlmY70h3B0YqxEyL/k1lwEJe3P43wERT4kvuBmCEXLea3V6AmnaLYA6wjfjEaWn+q21PmIEP8kRvTgW6DbdSnvdcoQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=sxbl4epg48KUX2MzjpAavq4/tG2sfpxD57DOODEbyl0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_031003_792296_689E6886 
X-CRM114-Status: GOOD (  31.50  )
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

Hi Nicolas，

On 4/20/2026 9:52 PM, Nicolas Frattaroli wrote:
> The Rockchip RK3576 brings with it a new PWM IP, in downstream code
> referred to as "v4". This new IP is different enough from the previous
> Rockchip IP that I felt it necessary to add a new driver for it, instead
> of shoehorning it in the old one.
> 
> Add this new driver, based on the PWM core's waveform APIs. Its platform
> device is registered by the parent mfpwm driver, from which it also
> receives a little platform data struct, so that mfpwm can guarantee that
> all the platform device drivers spread across different subsystems for
> this specific hardware IP do not interfere with each other.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   MAINTAINERS                   |   1 +
>   drivers/pwm/Kconfig           |  11 ++
>   drivers/pwm/Makefile          |   1 +
>   drivers/pwm/pwm-rockchip-v4.c | 383 ++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 396 insertions(+)
> 
......
> diff --git a/drivers/pwm/pwm-rockchip-v4.c b/drivers/pwm/pwm-rockchip-v4.c
> new file mode 100644
> index 000000000000..b7de72c433c5
> --- /dev/null
> +++ b/drivers/pwm/pwm-rockchip-v4.c
> @@ -0,0 +1,383 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2025 Collabora Ltd.
> + *
> + * A Pulse-Width-Modulation (PWM) generator driver for the generators found in
> + * Rockchip SoCs such as the RK3576, internally referred to as "PWM v4". Uses
> + * the MFPWM infrastructure to guarantee exclusive use over the device without
> + * other functions of the device from different drivers interfering with its
> + * operation while it's active.
> + *
> + * Technical Reference Manual: Chapter 31 of the RK3506 TRM Part 1, a SoC which
> + * uses the same PWM hardware and has a publicly available TRM.
> + * https://opensource.rock-chips.com/images/3/36/Rockchip_RK3506_TRM_Part_1_V1.2-20250811.pdf
> + *
> + * Authors:
> + *     Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> + *
> + * Limitations:
> + * - The hardware supports both completing the currently running period
> + *   on disable (by switching to oneshot mode with a single repetition and
> + *   only disable when the complete irq fires), and abrupt disable (freeze).
> + *   Only the latter is implemented in the driver.
> + * - When the output is disabled, the pin will remain driven to whatever state
> + *   it last had.

This limitation exists because after disabling the PWM output via 
registers, the actual shutdown only happens after the current period 
completes.

Therefore, the better approach is to add a delay of one full period
before disabling &rockchip_mfpwm_func.core.

> + * - Adjustments to the duty cycle will only take effect during the next period.
> + * - Adjustments to the period length will only take effect during the next
> + *   period.
> + * - The hardware only supports offsets in [0, period - duty_cycle]
> + */
> +
......
> +
> +	if (wfhw->rate) {
> +		if (!was_enabled) {
> +			dev_dbg(&chip->dev, "Enabling PWM output\n");
> +			ret = clk_enable(pc->pwmf->core);
> +			if (ret)
> +				goto err_mfpwm_release;
> +			ret = clk_set_rate_exclusive(pc->pwmf->core, wfhw->rate);
> +			if (ret) {
> +				clk_disable(pc->pwmf->core);
> +				goto err_mfpwm_release;
> +			}
> +
> +			/*
> +			 * Output should be on now, acquire device to guarantee
> +			 * exclusion with other device functions while it's on.
> +			 *
> +			 * It's highly unlikely that this fails, as mfpwm has
> +			 * already been acquired before, and this is just a
> +			 * usage counter increase. Not worth the added
> +			 * complexity of clearing the PWMV4_REG_ENABLE again,
> +			 * especially considering the CTRL_UPDATE_EN behaviour.
> +			 */
> +			ret = mfpwm_acquire(pc->pwmf);
> +			if (ret) {
> +				clk_rate_exclusive_put(pc->pwmf->core);
> +				clk_disable(pc->pwmf->core);
> +				goto err_mfpwm_release;
> +			}
> +		}
> +	} else if (was_enabled) {
> +		dev_dbg(&chip->dev, "Disabling PWM output\n");

Delay for one full PWM period before disabling the dclk.

Although this may introduce some latency for disable -> re-enable 
operations, it ensures that the state after shutdown aligns with the 
actual polarity configuration.

> +		clk_rate_exclusive_put(pc->pwmf->core);
> +		clk_disable(pc->pwmf->core);
> +		/* Output is off now, extra release to balance extra acquire */
> +		mfpwm_release(pc->pwmf);
> +	}
> +
> +err_mfpwm_release:
> +	mfpwm_release(pc->pwmf);
> +
> +	return ret;
> +}
> +
> 

Best regards,
Damon


