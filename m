Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13E2C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 04:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ5ymlDTIzV7wNDvDD7WmZ2YFCgKkOaPtbuqG8J+Gkc=; b=Yza9hunXRjTtKlBnvqg9gSkLJC
	IFz0gu34oSIEEcZl9XGV7rPJDqUVkrmBe+SRo0QwzZO6xof5feHcLy/ao9qCv+E15iVg7eRUcPIGN
	5zSmpZJwvi1wjQngtg8iqc/ZsXF7TqgO6yWRB2oHz4v9rWYPwC0uTtLn5NyB2BAYfFt6degDhAa8i
	2jGp+Ghy5iYF/wUwyLJwPwfmryTb4aVCPFOVN6whOxjSDtJE8rUkclVhPY3PHZYyOeSk7EswK96lN
	CCyHC1C0cs2ZQzMaRLyeS5pftmjFUyuCThWt8uvOiTsoD6JsvcrfrXhxWLlyi4OakFeHmVA2Xwvhv
	O9nQe+4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenn6-0000000EWgV-2MiV;
	Mon, 03 Feb 2025 04:10:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenlm-0000000EWV7-2rXy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 04:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C81F61476;
	Sun,  2 Feb 2025 20:09:34 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E58D23F63F;
	Sun,  2 Feb 2025 20:09:05 -0800 (PST)
Message-ID: <b5257952-1968-4eb3-8969-e6e3fcb5efdd@arm.com>
Date: Mon, 3 Feb 2025 09:39:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 04/11] perf: arm_v7_pmu: Drop obvious comments for
 enabling/disabling counters and interrupts
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-4-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-4-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_200910_819700_23753111 
X-CRM114-Status: GOOD (  15.12  )
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



On 2/3/25 06:12, Rob Herring (Arm) wrote:
> The function calls for enabling/disabling counters and interrupts are
> pretty obvious as to what they are doing, and the comments don't add
> any additional value.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/perf/arm_v7_pmu.c | 44 --------------------------------------------
>  1 file changed, 44 deletions(-)
> 
> diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
> index 420cadd108e7..7fa88e3b64e0 100644
> --- a/drivers/perf/arm_v7_pmu.c
> +++ b/drivers/perf/arm_v7_pmu.c
> @@ -857,14 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
>  		return;
>  	}
>  
> -	/*
> -	 * Enable counter and interrupt, and set the counter to count
> -	 * the event that we're interested in.
> -	 */
> -
> -	/*
> -	 * Disable counter
> -	 */
>  	armv7_pmnc_disable_counter(idx);
>  
>  	/*
> @@ -875,14 +867,7 @@ static void armv7pmu_enable_event(struct perf_event *event)
>  	if (cpu_pmu->set_event_filter || idx != ARMV7_IDX_CYCLE_COUNTER)
>  		armv7_pmnc_write_evtsel(idx, hwc->config_base);
>  
> -	/*
> -	 * Enable interrupt for this counter
> -	 */
>  	armv7_pmnc_enable_intens(idx);
> -
> -	/*
> -	 * Enable counter
> -	 */
>  	armv7_pmnc_enable_counter(idx);
>  }
>  
> @@ -898,18 +883,7 @@ static void armv7pmu_disable_event(struct perf_event *event)
>  		return;
>  	}
>  
> -	/*
> -	 * Disable counter and interrupt
> -	 */
> -
> -	/*
> -	 * Disable counter
> -	 */
>  	armv7_pmnc_disable_counter(idx);
> -
> -	/*
> -	 * Disable interrupt for this counter
> -	 */
>  	armv7_pmnc_disable_intens(idx);
>  }
>  
> @@ -1476,12 +1450,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  
> -	/*
> -	 * Enable counter and interrupt, and set the counter to count
> -	 * the event that we're interested in.
> -	 */
> -
> -	/* Disable counter */
>  	armv7_pmnc_disable_counter(idx);
>  
>  	/*
> @@ -1494,10 +1462,7 @@ static void krait_pmu_enable_event(struct perf_event *event)
>  	else
>  		armv7_pmnc_write_evtsel(idx, hwc->config_base);
>  
> -	/* Enable interrupt for this counter */
>  	armv7_pmnc_enable_intens(idx);
> -
> -	/* Enable counter */
>  	armv7_pmnc_enable_counter(idx);
>  }
>  
> @@ -1797,12 +1762,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  
> -	/*
> -	 * Enable counter and interrupt, and set the counter to count
> -	 * the event that we're interested in.
> -	 */
> -
> -	/* Disable counter */
>  	armv7_pmnc_disable_counter(idx);
>  
>  	/*
> @@ -1815,10 +1774,7 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
>  	else if (idx != ARMV7_IDX_CYCLE_COUNTER)
>  		armv7_pmnc_write_evtsel(idx, hwc->config_base);
>  
> -	/* Enable interrupt for this counter */
>  	armv7_pmnc_enable_intens(idx);
> -
> -	/* Enable counter */
>  	armv7_pmnc_enable_counter(idx);
>  }
>  
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

