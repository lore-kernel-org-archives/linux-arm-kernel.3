Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A72C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM9RZd2l8FHe/C2NQuJ72BJijZHInf4XljI+8SE3uUE=; b=v1YfRXFbi3hAoVqAiS7yh3J1k9
	Gg+8h39o/yQtBl5fstvmxBB8QdZ5x3QZgx93wvZP2l+6ptznuF2sinlACTrEuL1sSw5tLMqstZz+2
	GoYb/Kwzm7sAnNmEKObPrLaIQLQpyGj5m9R+QbTSLrFY5kcdFWPWSYmNHnCn0NODz8TivS7fbcwjM
	yLbzk1mpvhVc2hi1HZcSAuEUa3JCG3hLhs3rZPQvretcPSn3bP9R6Vw6HIf+SwPkuo31qOc5BmJ+8
	ZNVc1he1twVkFZcDLdVIetbyuTV3hpvjP2IIezc80Lq7BxmlayhpJ0izZFEWI/ITfPtdL69dbqrDO
	EV5kp6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZcT-00000004GgJ-3yE9;
	Tue, 15 Jul 2025 06:58:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZXe-00000004GE5-2uCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 06:53:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4171E12FC;
	Mon, 14 Jul 2025 23:53:20 -0700 (PDT)
Received: from [10.163.92.132] (unknown [10.163.92.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DAC13F66E;
	Mon, 14 Jul 2025 23:53:24 -0700 (PDT)
Message-ID: <cd8cba00-b495-4aab-b63c-699bb2c12d48@arm.com>
Date: Tue, 15 Jul 2025 12:23:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/28] coresight: Change device mode to atomic type
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Levi Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
 <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-1-23ebb864fcc1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_235330_923731_E03C4CD8 
X-CRM114-Status: GOOD (  24.55  )
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



On 01/07/25 8:23 PM, Leo Yan wrote:
> The device mode is defined as local type. This type cannot promise
> SMP-safe access.
> 
> Change to atomic type and impose relax ordering, which ensures the
> SMP-safe synchronisation and the ordering between the mode setting and
> relevant operations.


But have we really faced such problems on real systems due to local_t
or this is just an improvement ?

> 
> Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  include/linux/coresight.h | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 4ac65c68bbf44b98db22c3dad2d83a224ce5278e..5fd3d08824e5a91a197aa01daf0fc392392f3e55 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -251,15 +251,11 @@ struct coresight_trace_id_map {
>   *		by @coresight_ops.
>   * @access:	Device i/o access abstraction for this device.
>   * @dev:	The device entity associated to this component.
> - * @mode:	This tracer's mode, i.e sysFS, Perf or disabled. This is
> - *		actually an 'enum cs_mode', but is stored in an atomic type.
> - *		This is always accessed through local_read() and local_set(),
> - *		but wherever it's done from within the Coresight device's lock,
> - *		a non-atomic read would also work. This is the main point of
> - *		synchronisation between code happening inside the sysfs mode's
> - *		coresight_mutex and outside when running in Perf mode. A compare
> - *		and exchange swap is done to atomically claim one mode or the
> - *		other.
> + * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
> + *		an 'enum cs_mode' but stored in an atomic type. Access is always
> + *		through atomic APIs, ensuring SMP-safe synchronisation between
> + *		racing from sysFS and Perf mode. A compare-and-exchange
> + *		operation is done to atomically claim one mode or the other.
>   * @refcnt:	keep track of what is in use. Only access this outside of the
>   *		device's spinlock when the coresight_mutex held and mode ==
>   *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
> @@ -288,7 +284,7 @@ struct coresight_device {
>  	const struct coresight_ops *ops;
>  	struct csdev_access access;
>  	struct device dev;
> -	local_t	mode;
> +	atomic_t mode;
>  	int refcnt;
>  	bool orphan;
>  	/* sink specific fields */
> @@ -650,13 +646,14 @@ static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
>  static inline bool coresight_take_mode(struct coresight_device *csdev,
>  				       enum cs_mode new_mode)
>  {
> -	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> -	       CS_MODE_DISABLED;
> +	int curr = CS_MODE_DISABLED;
> +
> +	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
>  }
>  
>  static inline enum cs_mode coresight_get_mode(struct coresight_device *csdev)
>  {
> -	return local_read(&csdev->mode);
> +	return atomic_read_acquire(&csdev->mode);
>  }
>  
>  static inline void coresight_set_mode(struct coresight_device *csdev,
> @@ -672,7 +669,7 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
>  	WARN(new_mode != CS_MODE_DISABLED && current_mode != CS_MODE_DISABLED &&
>  	     current_mode != new_mode, "Device already in use\n");
>  
> -	local_set(&csdev->mode, new_mode);
> +	atomic_set_release(&csdev->mode, new_mode);
>  }
>  
>  struct coresight_device *coresight_register(struct coresight_desc *desc);
> 

