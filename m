Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8D6C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvTLKvSQpuCiDdffaS3I8x/SM0bH9fBSa3d9YrdgdKc=; b=E1Fjj3XXS94QumGhwQ44JAkkN1
	AtMc1gq0gbPNiWCn+4zpGG5mNWfEAMg9HEMr1AJDXmmwVw56Vgz78vCb2CM4sRDEWlImP4Ttea2U3
	vyWsT/uhnvR9ydBppm0/0WDN4uUdoLKT2jcAO7J47f7FNiBJj13dnf0Tk3xJqIUH7oldrTsgXifxb
	o8VclMsjy9f+GAbx1QI8AUb6S+G88cUn2fQV9C3qvH4QWhndbGRUbjhTIbtCaKJbw0KyAzbbIrNHE
	FDLxY/KYExu3faO+BlCbhIMrcSBtZz9+GTnCQTrtIQKLIVfjj5MCP00R2Jww0Efr/Ao1WzGeZf6mk
	TX30Tcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSzB-0000000BCsv-2UNp;
	Tue, 03 Jun 2025 14:51:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSwy-0000000BCbP-2Xmq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 14:49:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so38198545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748962151; x=1749566951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TvTLKvSQpuCiDdffaS3I8x/SM0bH9fBSa3d9YrdgdKc=;
        b=PuYqM+WKcAPny1+EA+wKqExUw5Q/fy8/ryRXpMZjpU0Ij0VtQhzWS8CEPtv7qly1LY
         547U4rDnctm8LPN9+q4UCy4K2q6kw/GjXYtzFWwZeRMzxRM133nINfMauC8AWBBiJoqE
         ShzEgNIXw/F4dpyOVLN7isnPU38hHoU5Tj0Y8kw/uydk2Y3ZkRRmBfBkLgEHPuhZFLRu
         jSvaJXBBdUhoYqFS1UkxWRnHmjGKsjFZWsjvVB2N010CHwJdY+u0fyROPAvFPkXpFFSm
         NQKUDOUiz1QiaizAlCzYphnVRp62BPx9jDjoCPfUxBhOnuDJpbZTdfRxL/gMezNP/Rz5
         /PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962151; x=1749566951;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvTLKvSQpuCiDdffaS3I8x/SM0bH9fBSa3d9YrdgdKc=;
        b=Mgr+wlmjmfNjsT7TbAKzU0s63URzuXE93fxzz9jZe2JyqtG3OaJ0BxXcTFkgMQju5D
         YiCrYWoORGuPX99X5Ryvx4+rnmS7MlSrSEEZ6JUvp1Hc230P+Sx0v6ulpoJt57m/j/QZ
         qhYARpGKUWLrUESTwYQrUmNtHNEsHNfdSot8fpEURTzczaV+VW6D9Y4mNJnLIPD/R3fT
         WvRo7MF/mgQPEVgW0x0eGXUwNCjIUJakI3Y8uRDL9tNk8dVZUGEeMBna02dnDEknaMFW
         Vmjo9R9K6Xoz5HAfnU1ajhk4gGlLxAKh6rWOfywgvCddQUB0FXWZ+KtZl8Baw5ptf3Tu
         /XTA==
X-Forwarded-Encrypted: i=1; AJvYcCX/u34O2UWoYwK1fzzcG45oRZiKUhjEMP+6jq70NuPtCZni2UThiPM/Etj5JDHrgMYc7d5tFbAfWA2U4l5l0wG1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj4DELO9l1SR/UUnoigtq8m+1ZB5LMk0cKKVBGH7T+hIXm/HzY
	DYOSG4RihKL+RCg8ACqlE23AjXVaswHitvqC/icvCs2IvIXf7qhyFPslMlnRPO28CxE=
X-Gm-Gg: ASbGncuzef4y0Nu5VIlVjuc/ToWQJ6WosoQlmEl1PsXk6g6IHu4MbO1USP+k+davuCm
	2RJAz0fTpheIqtp3l7HfyRzKukg1QCrPhl/wfGBQHwuUFCrzVxLmJ4AE7VYKB6Y2e1KlMx5gkqU
	kq/viKlpJ9jJtScpsBI6MNMOXL3leli8nPhpC6pRRZdSDptUd2y7yCjagl8KEgRyhFwGoOCwPso
	vyyEIwxOoSdo4zt24HeGHcNvTcTzAXKLbRRAIujjXal6s7ys3lB0lZtQkz2duBDMsBB8kqPVVhy
	P5LFkgvbyGtTyjYMrk0L74L16bqNIzjFZ/cv2KcxPmpvssN5C4tKTyHr
X-Google-Smtp-Source: AGHT+IGM1w69XaPnMZ5l/p3c3JHC4HJog7OJudCJs8q/Ej/AjRQlWLqiM4/E7z8dnl7nT/42D+ZMBw==
X-Received: by 2002:a05:600c:681b:b0:43d:fa5d:9314 with SMTP id 5b1f17b1804b1-450d887f9ecmr126931655e9.32.1748962150772;
        Tue, 03 Jun 2025 07:49:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000e3esm164104105e9.22.2025.06.03.07.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:49:10 -0700 (PDT)
Message-ID: <fd3a797f-3912-45e3-9af8-c978e25e60dd@linaro.org>
Date: Tue, 3 Jun 2025 15:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/11] coresight: Control path during CPU PM
To: Leo Yan <leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-7-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250516160742.1200904-7-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_074912_658382_EF57625D 
X-CRM114-Status: GOOD (  23.51  )
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



On 16/05/2025 5:07 pm, Leo Yan wrote:
> This commit extends control over CoreSight components on an activated path
> during CPU PM.
> 
> An activated path is recorded in the 'path' field of coresight_device
> structure.  The patch pointer is cleared when the path is disabled.

patch -> path

> Traverses the links on the path to disable and re-enable components during
> CPU low-power modes.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 8f565bb3c535..075d485dcea5 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -596,6 +596,94 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>   	goto out;
>   }
>   
> +static int coresight_save_path(struct coresight_path *path)
 > +{> +	u32 type;
> +	struct coresight_node *nd;
> +	struct coresight_device *source, *sink;
> +
> +	if (!path)
> +		return 0;
> +
> +	source = coresight_get_source(path);
> +
> +	/*
> +	 * Do a sanity check as the source device must have been enabled when
> +	 * run at here.
> +	 */
> +	if (coresight_get_mode(source) == CS_MODE_DISABLED)
> +		return -EINVAL;
> +
> +	sink = coresight_get_sink(path);
> +
> +	/*
> +	 * Disable links. Deliberately to skip disabling the sink to avoid
> +	 * latency.
> +	 */
> +	nd = list_first_entry(&path->path_list, struct coresight_node, link);
> +	list_for_each_entry_continue(nd, &path->path_list, link) {
> +		struct coresight_device *csdev, *parent, *child;
> +
> +		csdev = nd->csdev;
> +		type = csdev->type;
> +
> +		/* Adjust type for LINKSINK */
> +		if (type == CORESIGHT_DEV_TYPE_LINKSINK)
> +			type = (csdev == sink) ? CORESIGHT_DEV_TYPE_SINK :
> +						 CORESIGHT_DEV_TYPE_LINK;
> +

Not sure if we want to disable helper devices too?

> +		if (type != CORESIGHT_DEV_TYPE_LINK)
> +			continue;
> +
> +		parent = list_prev_entry(nd, link)->csdev;
> +		child = list_next_entry(nd, link)->csdev;
> +		coresight_disable_link(csdev, parent, child, source);
> +	}
> +
> +	return 0;
> +}
> +
> +static void coresight_restore_path(struct coresight_path *path)
> +{
> +	int ret;
> +	u32 type;
> +	struct coresight_device *source, *sink;
> +	struct coresight_node *nd;
> +
> +	if (!path)
> +		return;
> +
> +	source = coresight_get_source(path);
> +	if (coresight_get_mode(source) == CS_MODE_DISABLED)
> +		return;
> +
> +	sink = coresight_get_sink(path);
> +
> +	list_for_each_entry_reverse(nd, &path->path_list, link) {
> +		struct coresight_device *csdev, *parent, *child;
> +
> +		csdev = nd->csdev;
> +		type = csdev->type;
> +
> +		if (type == CORESIGHT_DEV_TYPE_LINKSINK)
> +			type = (csdev == sink) ? CORESIGHT_DEV_TYPE_SINK :
> +						 CORESIGHT_DEV_TYPE_LINK;
> +
> +		if (type != CORESIGHT_DEV_TYPE_LINK)
> +			continue;
> +
> +		parent = list_prev_entry(nd, link)->csdev;
> +		child = list_next_entry(nd, link)->csdev;
> +		ret = coresight_enable_link(csdev, parent, child,
> +					    coresight_get_source(path));
> +		if (ret) {
> +			dev_err(&csdev->dev, "Failed to restore\n");
> +			coresight_disable_path_from(path, nd);
> +			return;
> +		}
> +	}
> +}
> +
>   struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
> @@ -1605,9 +1693,15 @@ static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
>   	case CPU_PM_ENTER:
>   		if (coresight_save_source(source))
>   			return NOTIFY_BAD;
> +
> +		if (coresight_save_path(source->path)) {
> +			coresight_restore_source(source);
> +			return NOTIFY_BAD;
> +		}
>   		break;
>   	case CPU_PM_EXIT:
>   	case CPU_PM_ENTER_FAILED:
> +		coresight_restore_path(source->path);
>   		coresight_restore_source(source);
>   		break;
>   	default:


