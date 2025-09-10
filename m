Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12926CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jbz+9kZABW3cOHYYP2015Xps74/maa0Z8Vvlpi5UWNA=; b=itU4w/wkZwqcOJBiJJPzwDSMPM
	jZRUsriTmg4lo8dd3q6npQZpGPFNqdbpqJU3M687c1tL/S+HToH9htR3NmCEm4KyimEqOnx4cBfKK
	m/d79ScCpkKElUQvE48Iz1WSnP39LFslw1rWKPXypM18zqcPvzrLq2KPusRp8SAvXs9LdIFZfQU9z
	BAN5sd7jgeuK5TzXdcN+rX4pS3qzz0L6UsL5C7KcGNT/Ah5Rabq82HY8Fe2pG2B1gOOH8qvKO6qJN
	5b5Btuim1vCflWBRsxbeQIHgIDaSZcHuLmMmftesUO1h4BgCm7IXpmDetfGLTRJnC01pOjdVn52ci
	Dc6gDBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLLz-0000000EWnI-43eh;
	Wed, 10 Sep 2025 13:59:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLLv-0000000EWip-2KeR;
	Wed, 10 Sep 2025 13:59:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93C7116F8;
	Wed, 10 Sep 2025 06:59:06 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C10343F694;
	Wed, 10 Sep 2025 06:59:09 -0700 (PDT)
Message-ID: <3da64b80-ecdc-4b86-a4ca-3b4a9d75d9c4@arm.com>
Date: Wed, 10 Sep 2025 14:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/10] drm/panthor: move panthor_devfreq struct to
 header
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-7-7b6c2d6be221@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250905-mt8196-gpufreq-v1-7-7b6c2d6be221@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065915_710921_80148C83 
X-CRM114-Status: GOOD (  19.96  )
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

On 05/09/2025 11:23, Nicolas Frattaroli wrote:
> In order to make files other than panthor_devfreq.c be able to touch the
> members of a panthor_devfreq instance, it needs to live somewhere other
> than the .c file.
> 
> Move it into the panthor_devfreq.h header, so that the upcoming MediaTek
> MFG devfreq can use it as well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ---------------------------
>  drivers/gpu/drm/panthor/panthor_devfreq.h | 36 ++++++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 8903f60c0a3f06313ac2008791c210ff32b6bd52..02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -12,38 +12,6 @@
>  #include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  
> -/**
> - * struct panthor_devfreq - Device frequency management
> - */
> -struct panthor_devfreq {
> -	/** @devfreq: devfreq device. */
> -	struct devfreq *devfreq;
> -
> -	/** @gov_data: Governor data. */
> -	struct devfreq_simple_ondemand_data gov_data;
> -
> -	/** @busy_time: Busy time. */
> -	ktime_t busy_time;
> -
> -	/** @idle_time: Idle time. */
> -	ktime_t idle_time;
> -
> -	/** @time_last_update: Last update time. */
> -	ktime_t time_last_update;
> -
> -	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
> -	bool last_busy_state;
> -
> -	/**
> -	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
> -	 * last_busy_state.
> -	 *
> -	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
> -	 * and panthor_devfreq_record_{busy,idle}().
> -	 */
> -	spinlock_t lock;
> -};
> -
>  static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
>  {
>  	ktime_t now, last;
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index f8e29e02f66cb3281ed4bb4c75cda9bd4df82b92..e8b5ccddd45c52ee3215e9c84c6ebd9109640282 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -4,11 +4,45 @@
>  #ifndef __PANTHOR_DEVFREQ_H__
>  #define __PANTHOR_DEVFREQ_H__
>  
> +#include <linux/devfreq.h>
> +
>  struct devfreq;
>  struct thermal_cooling_device;
>  
>  struct panthor_device;
> -struct panthor_devfreq;
> +
> +/**
> + * struct panthor_devfreq - Device frequency management
> + */
> +struct panthor_devfreq {
> +	/** @devfreq: devfreq device. */
> +	struct devfreq *devfreq;
> +
> +	/** @gov_data: Governor data. */
> +	struct devfreq_simple_ondemand_data gov_data;
> +
> +	/** @busy_time: Busy time. */
> +	ktime_t busy_time;
> +
> +	/** @idle_time: Idle time. */
> +	ktime_t idle_time;
> +
> +	/** @time_last_update: Last update time. */
> +	ktime_t time_last_update;
> +
> +	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
> +	bool last_busy_state;
> +
> +	/**
> +	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
> +	 * last_busy_state.
> +	 *
> +	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
> +	 * and panthor_devfreq_record_{busy,idle}().
> +	 */
> +	spinlock_t lock;
> +};
> +
>  
>  int panthor_devfreq_init(struct panthor_device *ptdev);
>  
> 


