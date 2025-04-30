Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81842C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci6XPXgfBhTiWX5a6xW0K6VCTM/gMsutnvk8OWurQMw=; b=sKFo/7LW9zP2JW2HGmq/P5WwbP
	TJozxQV/doHidA2vCpTp7ILhV60ronbuFpyxixNL0Wh8U8QQnrVK8oZdKr+LaRzDVko377kM4r3qe
	QQ15cd/NGn+KLXdSouUHWwFEqaWKXHGZAiPKo5l/R3xXjn0Xd1LKPSQ85zuJiLioSo5qjmyDetHrG
	6/r7Nw1EWdU3ZcEI0FJ5GZIOSVTIkJBjYFIRUSzjoZawG8QNlchQ76xuoL5GJMLvWegFOdq54LK4s
	CQ22KSx4moOIjOzWNVRtArQivlkgmVejcav99mN4ThixKTqwkVjql+Lnr6ougF4j06gTQ7L5Iba1V
	bfTU5kvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7mq-0000000D2Ko-1q3O;
	Wed, 30 Apr 2025 13:47:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7kt-0000000D26Y-1C69
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:45:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FB0D106F;
	Wed, 30 Apr 2025 06:45:35 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06E303F5A1;
	Wed, 30 Apr 2025 06:45:40 -0700 (PDT)
Message-ID: <f2ffb9fd-ec59-4e67-83a3-437b986ece73@arm.com>
Date: Wed, 30 Apr 2025 14:45:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] coresight: core: Disable helpers for devices that
 fail to enable
Content-Language: en-GB
To: Yabin Cui <yabinc@google.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250429231301.1952246-1-yabinc@google.com>
 <20250429231301.1952246-3-yabinc@google.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250429231301.1952246-3-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_064543_378211_C1149C2C 
X-CRM114-Status: GOOD (  18.22  )
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

On 30/04/2025 00:13, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

Again, this should have :

Fixes: 6148652807ba ("coresight: Enable and disable helper devices 
adjacent to the path")

I have added it locally

Rest looks good to me


Suzuki


> ---
>   drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index dabec7073aed..d3523f0262af 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   		/* Enable all helpers adjacent to the path first */
>   		ret = coresight_enable_helpers(csdev, mode, path);
>   		if (ret)
> -			goto err;
> +			goto err_disable_path;
>   		/*
>   		 * ETF devices are tricky... They can be a link or a sink,
>   		 * depending on how they are configured.  If an ETF has been
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			 * that need disabling. Disabling the path here
>   			 * would mean we could disrupt an existing session.
>   			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev, path);
>   				goto out;
> +			}
>   			break;
>   		case CORESIGHT_DEV_TYPE_SOURCE:
>   			/* sources are enabled from either sysFS or Perf */
> @@ -497,16 +499,19 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   			child = list_next_entry(nd, link)->csdev;
>   			ret = coresight_enable_link(csdev, parent, child, source);
>   			if (ret)
> -				goto err;
> +				goto err_disable_helpers;
>   			break;
>   		default:
> -			goto err;
> +			ret = -EINVAL;
> +			goto err_disable_helpers;
>   		}
>   	}
>   
>   out:
>   	return ret;
> -err:
> +err_disable_helpers:
> +	coresight_disable_helpers(csdev, path);
> +err_disable_path:
>   	coresight_disable_path_from(path, nd);
>   	goto out;
>   }


