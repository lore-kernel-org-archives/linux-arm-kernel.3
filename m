Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5028BC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGyMRXlBqxsa6NsBs2dAupg/0hJPhc72oU4rEQG37WU=; b=QYnyHIpwy7GVYVSmyQvFhBAzkN
	mLTw9Tcs6RCScmLTOoAdcXrWqvFMCFU/Ad2S42qnvliSZwvPXAEmsZEewqiu5eVoLhnzRXHXvn/OE
	7ErPizDuFJo0biKzD3gDsisyI/6k/B7AcM1e7yi4AObuVY36u10LQuAtbvHF8rYXwcKMcmHVZNwWa
	DlSzZEI/7CEAW2P3VDQAd6ME+CIPiFhbh8r2Fyr8UZl/znLzYp1KT7UBLC5vzIWl8qLFOJ7s1GBG3
	com/dCDe5ND3jSn0r61jDKJNj8ivLseCBJgii0GETyPJmxSGOb4GbFZg/sBkGDavY9LuZPw6/PQkf
	eAEC0c9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4EV-0000000ByBO-0HDs;
	Fri, 28 Feb 2025 17:33:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4AK-0000000BxSQ-1gFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:28:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98E59150C;
	Fri, 28 Feb 2025 09:29:02 -0800 (PST)
Received: from [10.57.79.187] (unknown [10.57.79.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BA9B3F6A8;
	Fri, 28 Feb 2025 09:28:45 -0800 (PST)
Message-ID: <f44efd1a-1f6e-456d-9395-de2a55ef2279@arm.com>
Date: Fri, 28 Feb 2025 17:28:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drivers/thermal/exymos: Use guard notation when
 acquiring mutex
To: Anand Moon <linux.amoon@gmail.com>
References: <20250216195850.5352-1-linux.amoon@gmail.com>
 <20250216195850.5352-5-linux.amoon@gmail.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
In-Reply-To: <20250216195850.5352-5-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_092848_533993_FB2446E0 
X-CRM114-Status: GOOD (  17.13  )
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



On 2/16/25 19:58, Anand Moon wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: new patch
> ---
>   drivers/thermal/samsung/exynos_tmu.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index fe090c1a93ab..a34ba3858d64 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -256,7 +256,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>   	unsigned int status;
>   	int ret = 0;
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   	clk_enable(data->clk_sec);
>   
> @@ -270,7 +270,6 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
>   
>   	clk_disable(data->clk_sec);
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   
>   	return ret;
>   }
> @@ -292,13 +291,12 @@ static int exynos_thermal_zone_configure(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   
>   	data->tmu_set_crit_temp(data, temp / MCELSIUS);
>   
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   
>   	return 0;
>   }
> @@ -325,12 +323,11 @@ static void exynos_tmu_control(struct platform_device *pdev, bool on)
>   {
>   	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   	data->tmu_control(pdev, on);
>   	data->enabled = on;
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   }
>   
>   static void exynos_tmu_update_bit(struct exynos_tmu_data *data, int reg_off,
> @@ -645,7 +642,7 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
>   		 */
>   		return -EAGAIN;
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   
>   	value = data->tmu_read(data);
> @@ -655,7 +652,6 @@ static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
>   		*temp = code_to_temp(data, value) * MCELSIUS;
>   
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   
>   	return ret;
>   }
> @@ -720,11 +716,10 @@ static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
>   	if (temp && temp < MCELSIUS)
>   		goto out;
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   	data->tmu_set_emulation(data, temp);
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   	return 0;
>   out:
>   	return ret;
> @@ -760,14 +755,13 @@ static irqreturn_t exynos_tmu_threaded_irq(int irq, void *id)
>   
>   	thermal_zone_device_update(data->tzd, THERMAL_EVENT_UNSPECIFIED);
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   
>   	/* TODO: take action based on particular interrupt */
>   	data->tmu_clear_irqs(data);
>   
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -987,7 +981,7 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
>   {
>   	struct exynos_tmu_data *data = thermal_zone_device_priv(tz);
>   
> -	mutex_lock(&data->lock);
> +	guard(mutex)(&data->lock);
>   	clk_enable(data->clk);
>   
>   	if (low > INT_MIN)
> @@ -1000,7 +994,6 @@ static int exynos_set_trips(struct thermal_zone_device *tz, int low, int high)
>   		data->tmu_disable_high(data);
>   
>   	clk_disable(data->clk);
> -	mutex_unlock(&data->lock);
>   
>   	return 0;
>   }

IMO you should be able to even use something like we have
core framework:

guard(thermal_zone)(tz);

Your mutex name is simply 'lock' in the struct exynos_tmu_data
so you should be able to leverage this by:

guard(exynos_tmu_data)(data);

Please try that.

