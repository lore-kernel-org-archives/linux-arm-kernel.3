Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1080BD6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKlCS8OZu4PrLGT2UeR6+NeFmazF+j5Q010ogjlfIJI=; b=mG/R/KSdWaXW2My6mt9KW+iYvr
	HjQActugBMkr2C9ppvcmI6EauduZlRbkoXlTDP6keMZVPKodpGFEkS3yDQiAYnr4+MmNjfrUrrSWn
	l2loGCAv/9M6J9cqwkYgPwXnQrCSEVQg9dUitjrzLs0/aZvRXg/1Ut0z/2rsfNJBegyiPxM88YbzA
	9xz4yBwtUSe1Bx0WBS94NkN7i9I7szlVQnKPQnmWZbCNUOdSG8uaPh92kImvp0h1E/iLOLkJUp2ca
	0SK2GWYIAYQdcBcnl9ZHWkR+Wp4KMIiM+2Y5U6H3z9o3HFSu5SgS4eazFHTLJNUG+/xam5rOc+NdE
	QWh/lkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI9K-00000008x2Z-49QX;
	Thu, 18 Dec 2025 17:50:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI9J-00000008x25-32JK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Dec 2025 17:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AKlCS8OZu4PrLGT2UeR6+NeFmazF+j5Q010ogjlfIJI=; b=Ej+LbNgKSSazarfYjWdvFtZjIy
	PkyU56V8ecrBb05s6L9fPtzO29vSUTLW/9YXvDAOiXNvxxrpHUmpcbt20bDiuhEXKHd9VV3sTNeDh
	dOY2+pF3lGeJWfBMfmaultXGdsxV2f+Y/vtlWNR6qMFFyESdWsEoKTg+GN8seeFOV+FVgeXr/7PGe
	mOcJ3pVhjOkSYzyalye1i1tuRKXLD5TrGGIeFcLEnQIMcftMGKzejWCstMNlPabdtCPHS8/1hqv0O
	HCuyyrwRqKSQGcIrWtAtGmw7s0kCqb++uIm+WBakvqs6hv5jpCcLGrcsZrEk1XnuaxVfHSKvz87TB
	JrTk5bEQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWHHn-00000009Jpr-3nyl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:55:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF0CFEC;
	Thu, 18 Dec 2025 09:50:36 -0800 (PST)
Received: from [10.57.74.203] (unknown [10.57.74.203])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EB363F73F;
	Thu, 18 Dec 2025 09:50:40 -0800 (PST)
Message-ID: <dd043b78-d60c-4a79-85a8-9f352a4d89e1@arm.com>
Date: Thu, 18 Dec 2025 17:50:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_165532_307151_88B7026D 
X-CRM114-Status: GOOD (  19.28  )
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

On 11/12/2025 06:10, Jie Gan wrote:
> Retrieving the helper device of the specific coresight device based on
> its helper_subtype because a single coresight device may has multiple types
> of the helper devices.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 0e8448784c62..667883ccb4b7 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -585,6 +585,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>   
> +/**
> + * coresight_get_helper: find the helper device of the assigned csdev.
> + *
> + * @csdev: The csdev the helper device is conntected to.
> + * @type:  helper_subtype of the expected helper device.
> + *
> + * Retrieve the helper device for the specific csdev based on its
> + * helper_subtype.
> + *
> + * Return: the helper's csdev upon success or NULL for fail.
> + */
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +					      enum coresight_dev_subtype_helper subtype)

We have almost a similar function in coresight-core.c :

coresight_find_output_type(pdata, type, subtype).

Please could we reuse that, instead of adding similar funcitons ?

Please be careful about the mutex.

Suzuki

> +{
> +	int i;
> +	struct coresight_device *helper;
> +
> +	/* protect the connections */
> +	mutex_lock(&coresight_mutex);
> +	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +		helper = csdev->pdata->out_conns[i]->dest_dev;
> +		if (!helper || !coresight_is_helper(helper))
> +			continue;
> +
> +		if (helper->subtype.helper_subtype == subtype) {
> +			mutex_unlock(&coresight_mutex);
> +			return helper;
> +		}
> +	}
> +	mutex_unlock(&coresight_mutex);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_helper);
> +
>   /**
>    * coresight_get_in_port: Find the input port number at @csdev where a @remote
>    * device is connected to.
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index cbf80b83e5ce..8e39a4dc7256 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -157,6 +157,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>   				   enum cs_mode mode);
>   int coresight_get_in_port(struct coresight_device *csdev,
>   			  struct coresight_device *remote);
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +					      enum coresight_dev_subtype_helper subtype);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   int etm_readl_cp14(u32 off, unsigned int *val);
> 


