Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3853CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoJCIs+BumcnDS6tSfe22Cpk52o4jWKDT1eCLGyeN7I=; b=H2BpbfL0AymR7lC0BE8Rz6E1im
	oCFem5PWQ3t0Han+oa4VKM0MKANXoXW7td91kAZQ32haw2W0JUtKS2hH/F+ygRVi/oLcR5mMIuJbF
	bzRT8m3eQX1MBVLtDVaUNoONy2RAnYetVOERvcF9FJpe8vaGDwkmbpv1pXCAFGn5VZYnuV7Pv5myg
	T7iYuehAFOX9SyaWzui1EkByKXV6oFiBoMOGNoIGAm0yO6KTX2uFCR6TxPjl8SPXVRYZeiubxxlXL
	rJ07cNUcT9accLZIIDRJOH4EIfeJBDFDLZvt5zEmCxtJTluUPqsNOjpD0lq5xlk8b0onZtaJnKTMb
	13MZsmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbxc-00000005sEW-0weY;
	Thu, 28 May 2026 14:43:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbxZ-00000005sE1-1ytd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:43:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2547322BE;
	Thu, 28 May 2026 07:43:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3F733F905;
	Thu, 28 May 2026 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779979424; bh=TA4DO2tutucSmnsPezj88rJH8VgrWEtDABxFp+R8U54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qw/z2GHpbhVhhMELrrHLxE1NwtZBR9ALkpMzJrG0On1FMfpZ9QwfrXcaQOXxZVbfD
	 JiDSZ6uWlv5HBtco0cbZM6z7VVbF/m/HxdFZH1rVxs5a8Jk74Z0kt0SND5NuqG4hsq
	 q8T6xphiH9c8r+ll/KvnPvUkySjWhZR1qTs1aJM4=
Date: Thu, 28 May 2026 15:43:40 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 09/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <ahhUnJSIvGabGbQe@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-10-yeoreum.yun@arm.com>
 <20260528143358.GF101133@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528143358.GF101133@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_074345_594053_7CC5D1FB 
X-CRM114-Status: GOOD (  32.91  )
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

Hi Leo,

> On Tue, May 19, 2026 at 04:48:08PM +0100, Yeoreum Yun wrote:
> > In the perf enable path, there are missing cases where
> > cscfg_csdev_disable_active_config() is not called:
> > 
> >   - Branch broadcast is selected but not supported by the hardware
> >   - etm4_enable_hw() fails
> > 
> > This can lead to a leak of config_desc->active_cnt.
> > Fix this by properly calling cscfg_csdev_disable_active_config()
> > in these error paths.
> > 
> > Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  .../hwtracing/coresight/coresight-etm4x-core.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index f0a9f2ef4b27..0889937811cb 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -899,6 +899,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >  			 * Missing BB support could cause silent decode errors
> >  			 * so fail to open if it's not supported.
> >  			 */
> > +			if (cfg_hash)
> > +				cscfg_csdev_disable_active_config(csdev);
> >  			ret = -EINVAL;
> >  			goto out;
> >  		} else {
> > @@ -915,6 +917,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
> >  			    struct coresight_path *path)
> >  {
> >  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > +	struct perf_event_attr *attr = &event->attr;
> >  	int ret;
> >  
> >  	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
> > @@ -926,7 +929,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
> >  	/* Configure the tracer based on the session's specifics */
> >  	ret = etm4_parse_event_config(csdev, event);
> >  	if (ret)
> > -		goto out;
> > +		goto err;
> >  
> >  	drvdata->trcid = path->trace_id;
> >  
> > @@ -935,16 +938,19 @@ static int etm4_enable_perf(struct coresight_device *csdev,
> >  
> >  	/* And enable it */
> >  	ret = etm4_enable_hw(drvdata);
> > -
> > -out:
> > -	/* Failed to start tracer; roll back to DISABLED mode */
> >  	if (ret) {
> > -		coresight_set_mode(csdev, CS_MODE_DISABLED);
> > -		return ret;
> > +		if (ATTR_CFG_GET_FLD(attr, configid))
> > +			cscfg_csdev_disable_active_config(csdev);
> > +		goto err;
> >  	}
> >  
> >  	csdev->path = path;
> >  	return 0;
> > +
> > +err:
> > +	/* Failed to start tracer; roll back to DISABLED mode */
> > +	coresight_set_mode(csdev, CS_MODE_DISABLED);
> > +	return ret;
> >  }
> 
> Seems to me, it is not readable if spread error handling into both child
> and parent functions. I would like we can stick to use the same function
> for resource allocation and rollback for failures.
> 
> How about below change (I did not verify it yet):
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 0889937811cb..8347efb2069b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -794,8 +794,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
>  	};
>  	struct perf_event_attr *attr = &event->attr;
> -	unsigned long cfg_hash;
> -	int preset, cc_threshold;
> +	int cc_threshold;
>  	u8 ts_level;
>  
>  	/* Clear configuration from previous run */
> @@ -882,16 +881,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  		/* bit[12], Return stack enable bit */
>  		config->cfg |= TRCCONFIGR_RS;
>  
> -	/*
> -	 * Set any selected configuration and preset. A zero configid means no
> -	 * configuration active, preset = 0 means no preset selected.
> -	 */
> -	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> -	if (cfg_hash) {
> -		preset = ATTR_CFG_GET_FLD(attr, preset);
> -		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> -	}
> -
>  	/* branch broadcast - enable if selected and supported */
>  	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
>  		if (!caps->trcbb) {
> @@ -899,8 +888,6 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>  			 * Missing BB support could cause silent decode errors
>  			 * so fail to open if it's not supported.
>  			 */
> -			if (cfg_hash)
> -				cscfg_csdev_disable_active_config(csdev);
>  			ret = -EINVAL;
>  			goto out;
>  		} else {
> @@ -918,7 +905,8 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  {
>  	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>  	struct perf_event_attr *attr = &event->attr;
> -	int ret;
> +	unsigned long cfg_hash;
> +	int preset, ret;
>  
>  	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
>  		return -EINVAL;
> @@ -931,6 +919,18 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  	if (ret)
>  		goto err;
>  
> +	/*
> +	 * Set any selected configuration and preset. A zero configid means no
> +	 * configuration active, preset = 0 means no preset selected.
> +	 */
> +	cfg_hash = ATTR_CFG_GET_FLD(attr, configid);
> +	if (cfg_hash) {
> +		preset = ATTR_CFG_GET_FLD(attr, preset);
> +		ret = cscfg_csdev_enable_active_config(csdev, cfg_hash, preset);
> +		if (ret)
> +			goto err;
> +	}
> +
>  	drvdata->trcid = path->trace_id;
>  
>  	/* Populate pause state */
> @@ -938,15 +938,15 @@ static int etm4_enable_perf(struct coresight_device *csdev,
>  
>  	/* And enable it */
>  	ret = etm4_enable_hw(drvdata);
> -	if (ret) {
> -		if (ATTR_CFG_GET_FLD(attr, configid))
> -			cscfg_csdev_disable_active_config(csdev);
> -		goto err;
> -	}
> +	if (ret)
> +		goto err_enable_hw;
>  
>  	csdev->path = path;
>  	return 0;
>  
> +err_enable_hw:
> +	if (cfg_hash)
> +		cscfg_csdev_disable_active_config(csdev);
>  err:
>  	/* Failed to start tracer; roll back to DISABLED mode */
>  	coresight_set_mode(csdev, CS_MODE_DISABLED);

No. since preset overrides the "perf configuratoin" formerly but
this code makes it vice versa. Also, cfg_hash and prest is also part of
etm4_parse_event_config(), and it doesn't seem to good to separate
cfgfs handling from that function.

IMHO, It would be better to keep this as it is.

-- 
Sincerely,
Yeoreum Yun

