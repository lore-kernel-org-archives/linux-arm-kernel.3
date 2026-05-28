Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0634ECD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgjmeW78rD13mHYzhJgpVuSdQjz5aeo3YrgK6lN61G4=; b=X7dQDIrivGjElt0M4i39ID1jD0
	KL1LP+Q32MSD/Xd4XWHWL9J/wZO5DuPGAGuc5aFWlXOCPP7RGpLJXbIEUz6zwDzMlQ7nd6ZJPq/CV
	1feo7eDz976J1C1ONeBgE4uuv/428fJ1eQ2ehdX3ae7jbT5mP+QFRghJSWbY/KJeK+k2pHAHWjGOB
	9fUEV31uSg8NBZmFaU0fBJ1KIeXdCjD3Jc11e3Nv89dWbmeqATNqZPwikx6GW0Gn2nnMWC9hQEodm
	4u5oSpUHSfkCPwHsGLpQMcpHWWpScjTuDq2EPqE9icJC688XrX7m0jBQ6msK+yfJULH3uCPjHes9I
	UwHO9QFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSboI-00000005ra4-14WW;
	Thu, 28 May 2026 14:34:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSboE-00000005rZe-1WbL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:34:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 760FA22BE;
	Thu, 28 May 2026 07:33:56 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A1383F905;
	Thu, 28 May 2026 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779978841; bh=/UwOL76EqNEZSoPltmJb5GnpmYkCriGEkJZgCQmEnDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFEfJnJGI6Z1qEZ63O49miq5gSplk1akeFYygXLeMZYxmSGdY9rqNHjpWgztjJ6uu
	 zTft2PvO4EuD5Y7dwV8cc5ucG91/fgax/agufXaFZGMnjYwJzr2a3E7o1F9rrs5AVa
	 tMVgEVQq4QWFPC+Dwbz7wXgd13aQuXPbGdrSLKwk=
Date: Thu, 28 May 2026 15:33:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <20260528143358.GF101133@e132581.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-10-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519154812.254884-10-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_073406_591538_6651FB6C 
X-CRM114-Status: GOOD (  29.72  )
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

On Tue, May 19, 2026 at 04:48:08PM +0100, Yeoreum Yun wrote:
> In the perf enable path, there are missing cases where
> cscfg_csdev_disable_active_config() is not called:
> 
>   - Branch broadcast is selected but not supported by the hardware
>   - etm4_enable_hw() fails
> 
> This can lead to a leak of config_desc->active_cnt.
> Fix this by properly calling cscfg_csdev_disable_active_config()
> in these error paths.
> 
> Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index f0a9f2ef4b27..0889937811cb 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -899,6 +899,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			 * Missing BB support could cause silent decode errors
>  			 * so fail to open if it's not supported.
>  			 */
> +			if (cfg_hash)
> +				cscfg_csdev_disable_active_config(csdev);
>  			ret = -EINVAL;
>  			goto out;
>  		} else {
> @@ -915,6 +917,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  			    struct coresight_path *path)
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	struct perf_event_attr *attr = &event->attr;
>  	int ret;
>  
>  	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
> @@ -926,7 +929,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  	/* Configure the tracer based on the session's specifics */
>  	ret = etm4_parse_event_config(csdev, event);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	drvdata->trcid = path->trace_id;
>  
> @@ -935,16 +938,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  
>  	/* And enable it */
>  	ret = etm4_enable_hw(drvdata);
> -
> -out:
> -	/* Failed to start tracer; roll back to DISABLED mode */
>  	if (ret) {
> -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> -		return ret;
> +		if (ATTR_CFG_GET_FLD(attr, configid))
> +			cscfg_csdev_disable_active_config(csdev);
> +		goto err;
>  	}
>  
>  	csdev->path = path;
>  	return 0;
> +
> +err:
> +	/* Failed to start tracer; roll back to DISABLED mode */
> +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> +	return ret;
>  }

Seems to me, it is not readable if spread error handling into both child
and parent functions. I would like we can stick to use the same function
for resource allocation and rollback for failures.

How about below change (I did not verify it yet):

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 0889937811cb..8347efb2069b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -794,8 +794,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
 	};
 	struct perf_event_attr *attr = &event->attr;
-	unsigned long cfg_hash;
-	int preset, cc_threshold;
+	int cc_threshold;
 	u8 ts_level;
 
 	/* Clear configuration from previous run */
@@ -882,16 +881,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 		/* bit[12], Return stack enable bit */
 		config->cfg |= TRCCONFIGR_RS;
 
-	/*
-	 * Set any selected configuration and preset. A zero configid means no
-	 * configuration active, preset = 0 means no preset selected.
-	 */
-	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
-	if (cfg_hash) {
-		preset = ATTR_CFG_GET_FLD(attr, preset);
-		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
-	}
-
 	/* branch broadcast - enable if selected and supported */
 	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
 		if (!caps->trcbb) {
@@ -899,8 +888,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			 * Missing BB support could cause silent decode errors
 			 * so fail to open if it's not supported.
 			 */
-			if (cfg_hash)
-				cscfg_csdev_disable_active_config(csdev);
 			ret = -EINVAL;
 			goto out;
 		} else {
@@ -918,7 +905,8 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct perf_event_attr *attr = &event->attr;
-	int ret;
+	unsigned long cfg_hash;
+	int preset, ret;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return -EINVAL;
@@ -931,6 +919,18 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	if (ret)
 		goto err;
 
+	/*
+	 * Set any selected configuration and preset. A zero configid means no
+	 * configuration active, preset = 0 means no preset selected.
+	 */
+	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
+	if (cfg_hash) {
+		preset = ATTR_CFG_GET_FLD(attr, preset);
+		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
+		if (ret)
+			goto err;
+	}
+
 	drvdata->trcid = path->trace_id;
 
 	/* Populate pause state */
@@ -938,15 +938,15 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
-	if (ret) {
-		if (ATTR_CFG_GET_FLD(attr, configid))
-			cscfg_csdev_disable_active_config(csdev);
-		goto err;
-	}
+	if (ret)
+		goto err_enable_hw;
 
 	csdev->path = path;
 	return 0;
 
+err_enable_hw:
+	if (cfg_hash)
+		cscfg_csdev_disable_active_config(csdev);
 err:
 	/* Failed to start tracer; roll back to DISABLED mode */
 	coresight_set_mode(csdev, CS_MODE_DISABLED);

