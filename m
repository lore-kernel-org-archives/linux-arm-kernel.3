Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6C2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PthmcenNKrolSRMH0N7RG+Bwb34ZUG9tcOjM0VatAA=; b=hfxqOKj+NKqNufra0FbAU/Tmsi
	jJEiVpZJOkqfhVB3dLTjZis++/G6Q94ZU+Nsmm9rt9bYmySBYjmKqrvikkDrsEK/HOw5NQ+BR6bFD
	pwm0uKx4zO3ZLGVgRW3pzElyo1Z9A78OiFlI5agh/kzTWi3ULd2TBmsSIRRbXiqn7QEqwxMjZM52D
	V+CocQSXwRuUUJFO9bUElWo1NjVgQvP/vLA7YmkIe0sPN9jyisP8pG78lBK/Ai1vkqcT1QEoIwbfW
	Hcw36jLd06LuZF/EILGFlh5cCzXaB46MH9oiBpaU2RuRkMvM8fWdqS5UUEeeQSfP4Ti7K5bZkuI1D
	igX+4hUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bsh-000000052l8-1Adw;
	Tue, 15 Apr 2025 08:42:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bmz-0000000522s-1YfM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:37:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EBF339;
	Tue, 15 Apr 2025 01:37:00 -0700 (PDT)
Received: from [10.57.68.100] (unknown [10.57.68.100])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58BBB3F694;
	Tue, 15 Apr 2025 01:36:59 -0700 (PDT)
Message-ID: <6abf897b-bbde-4586-941d-9915f15f1934@arm.com>
Date: Tue, 15 Apr 2025 09:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
To: Anand Moon <linux.amoon@gmail.com>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-4-linux.amoon@gmail.com>
Content-Language: en-US
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
 Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20250410063754.5483-4-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_013705_456871_FCE9ED22 
X-CRM114-Status: GOOD (  16.76  )
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



On 4/10/25 07:37, Anand Moon wrote:
> As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> if e-Fuse value is out of this range, then thermal sensor may not
> sense thermal data properly. Refactors the efuse value
> initialization logic within exynos_map_dt_data function by
> replacing the nested if-else statements with a switch statement.
> Ensures proper initialization of efuse values based on the SOC type.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v5: None
> v4: None
> v3: Improve the logic to convert if/else to switch
> ---
>   drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index ac3b9d2c900c..a71cde0a4b17 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
>   		data->gain = 8;
>   		data->reference_voltage = 16;
>   		data->efuse_value = 55;
> -		if (data->soc != SOC_ARCH_EXYNOS5420 &&
> -		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
> +		data->max_efuse_value = 100;
> +		switch (data->soc) {
> +		case SOC_ARCH_EXYNOS3250:
> +		case SOC_ARCH_EXYNOS4412:
> +		case SOC_ARCH_EXYNOS5250:
> +		case SOC_ARCH_EXYNOS5260:
>   			data->min_efuse_value = 40;
> -		else
> +			break;
> +		case SOC_ARCH_EXYNOS5420:
> +		case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +			data->min_efuse_value = 16;
> +			data->max_efuse_value = 76;
> +			break;
> +		default:
>   			data->min_efuse_value = 0;
> -		data->max_efuse_value = 100;
> +			break;
> +		}
>   		break;
>   	case SOC_ARCH_EXYNOS5433:
>   		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;

I should have added that in earlier version: LGTM,

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

