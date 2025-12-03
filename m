Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7EDD15DAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UcfEBlYj3+1K00hRdMeWt8hXmCyz0S/a1GesiyGyrg=; b=Nps+tQDafkUMAzyzP+/Pb6Izam
	hQikBsimoxcyBjJZsrIjRyzqXSfQpe1CyUgjmqO5XY5eCy4tcALku5KsXPHa0UhOCarwy/K4oLPAQ
	ho5Ab5/0dn749lJu488YLJuLit1yk1CULONdusRId0uumg6YaSakAuc7iksY5g8hE/46vqu+jDjmv
	r2qSopvvI5Or5JPNlh16VZRIuHx1TAwY32d4tG7Mdo9XFEMzo9hBiK5MdsnZl+aTSpbGJCRjJes1i
	qLTT1E0vOAQke66ekuOQ15mYSQglOexF8L3ZwbBW5UlnAvwzCg+uBWZZA6fMaX9XppGvwSRY5tHKR
	lSuBl8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpWF-00000006mpC-1rXH;
	Wed, 03 Dec 2025 16:15:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpWC-00000006mom-2IJO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 16:15:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60832339;
	Wed,  3 Dec 2025 08:15:44 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E40523F66E;
	Wed,  3 Dec 2025 08:15:49 -0800 (PST)
Message-ID: <d8c6111f-28ba-4046-bcd5-67233e8ed4ca@arm.com>
Date: Wed, 3 Dec 2025 16:15:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] coresight: core: add a new API to retrieve the
 helper device
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-2-1db9e621441a@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-2-1db9e621441a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_081552_709978_1B10641C 
X-CRM114-Status: GOOD (  20.23  )
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

On 08/09/2025 03:01, Jie Gan wrote:
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
> index 042c4fa39e55..018b1119c48a 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,41 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
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

> +					      int type)

nit: enum coresight_dev_subtype_helper subtype

Otherwise looks good to me

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
> +		if (helper->subtype.helper_subtype == type) {
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
>    * coresight_get_in_port_dest: get the in-port number of the dest device
>    * that is connected to the src device.
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index e51b22b8ebde..f80122827934 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>   				   enum cs_mode mode);
>   int coresight_get_in_port_dest(struct coresight_device *src,
>   			       struct coresight_device *dest);
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +					      int type);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   int etm_readl_cp14(u32 off, unsigned int *val);
> 


