Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF2DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSpSn34kjWmBvtXA8K3ovIVNWhH0vO4IGWxw00mivH4=; b=Azi1TPqr/s+op6hXK9Sqn2kdNC
	Y6bqyXChCOQRcUYAuLFn7YRa3CgH9zDWhOyvXPKuOzhEj/oQztZuJMSRyis1Boigs3iAvBcPn/y0B
	GUve2Dx6YaxMwCcOdHZuEIt/gTNE0siBkxu+KwcjsanxeV0OhtXJQVzg+cegjYJ6Sb7Fp40Dv7MNs
	JbFAGdUBPm8sY6XdhnzapeToe6EVFGEiqvv9G4WcG9c0lRhEE7jjwHhyxrynDqtYtc4vOrERPdRBy
	z4n+5/2pMomo6j4CbjDEgIM/wykuA9GxJ5AeOw+/wDSPGcY/SnRYPuCjo1ZmPArHfdWXFMV5+0NRQ
	sPr2FjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ImP-0000000ATm9-1j9r;
	Thu, 02 Oct 2025 12:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ImM-0000000ATlW-3bbR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:51:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F374168F;
	Thu,  2 Oct 2025 05:51:17 -0700 (PDT)
Received: from [10.57.3.58] (unknown [10.57.3.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EA613F66E;
	Thu,  2 Oct 2025 05:51:24 -0700 (PDT)
Message-ID: <422560ee-50e8-4298-80c8-de46c521117a@arm.com>
Date: Thu, 2 Oct 2025 13:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/31] coresight: Change device mode to atomic type
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_055127_035469_EC8E13A8 
X-CRM114-Status: GOOD (  25.23  )
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

On 15/09/2025 11:33, Leo Yan wrote:
> The device mode is defined as local type. This type cannot promise
> SMP-safe access.
> 
> Change to atomic type and impose relax ordering, which ensures the
> SMP-safe synchronisation and the ordering between the mode setting and
> relevant operations.
> 
> Fixes: 22fd532eaa0c ("coresight: etm3x: adding operation mode for etm_enable()")


Do we really have an issue here ? I thought we modify the mode under
spinlock. Also the fixes commit looks odd. The mode was added to the 
coresight device only recently. Prior to that, it was part of drvdata 
and was serialized by the respective spinlocks. So I don't see how this
was an issue.

Suzuki



> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   include/linux/coresight.h | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 6de59ce8ef8ca45c29e2f09c1b979eb7686b685f..3e5e5acd0c7fcde7d312d440da4355faaf682c7b 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -251,15 +251,11 @@ struct coresight_trace_id_map {
>    *		by @coresight_ops.
>    * @access:	Device i/o access abstraction for this device.
>    * @dev:	The device entity associated to this component.
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
>    * @refcnt:	keep track of what is in use. Only access this outside of the
>    *		device's spinlock when the coresight_mutex held and mode ==
>    *		CS_MODE_SYSFS. Otherwise it must be accessed from inside the
> @@ -288,7 +284,7 @@ struct coresight_device {
>   	const struct coresight_ops *ops;
>   	struct csdev_access access;
>   	struct device dev;
> -	local_t	mode;
> +	atomic_t mode;
>   	int refcnt;
>   	bool orphan;
>   	/* sink specific fields */
> @@ -621,13 +617,14 @@ static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
>   static inline bool coresight_take_mode(struct coresight_device *csdev,
>   				       enum cs_mode new_mode)
>   {
> -	return local_cmpxchg(&csdev->mode, CS_MODE_DISABLED, new_mode) ==
> -	       CS_MODE_DISABLED;
> +	int curr = CS_MODE_DISABLED;
> +
> +	return atomic_try_cmpxchg_acquire(&csdev->mode, &curr, new_mode);
>   }
>   
>   static inline enum cs_mode coresight_get_mode(struct coresight_device *csdev)
>   {
> -	return local_read(&csdev->mode);
> +	return atomic_read_acquire(&csdev->mode);
>   }
>   
>   static inline void coresight_set_mode(struct coresight_device *csdev,
> @@ -643,7 +640,7 @@ static inline void coresight_set_mode(struct coresight_device *csdev,
>   	WARN(new_mode != CS_MODE_DISABLED && current_mode != CS_MODE_DISABLED &&
>   	     current_mode != new_mode, "Device already in use\n");
>   
> -	local_set(&csdev->mode, new_mode);
> +	atomic_set_release(&csdev->mode, new_mode);
>   }
>   
>   struct coresight_device *coresight_register(struct coresight_desc *desc);
> 


