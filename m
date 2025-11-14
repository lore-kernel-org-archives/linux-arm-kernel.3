Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5188CE7B1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYPx3Iwn0SRg8X/Yra1qw75giYDVmbFRJ4eRzoGnCz0=; b=PkE5peg8m0A0llnqxt8gIE7Mu2
	9Tx4lxin3ZnLw7lQT9WZiPvUQDcXcInR6tlISH9uydKtZYA2EFAksVxJac5tM3aqDfSqWzh2LNToX
	EfIJHir1F87fv15vrOoQpqWuUiy9JK/lvJk3YXsEPiLaG4h7LPyv0bajXwYB9HO3H+tp7KVmcjy33
	M2cSM/6ARApd6/VIpUAwvZusVNZNy/OvvuIGa4Jl1AIBJGEyiJg+Qr2e3ebm3VpgYvaAvthy3fDbw
	aqQLrW1yg4uU00VdL7hs9fTRV5FeV3aAmL6pL33wXxg+X/GD8Cm26SDtqowJD6c9sm16RRY9gKxnq
	bwWYTJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvCy-0000000CPKB-1OjQ;
	Fri, 14 Nov 2025 14:55:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvCv-0000000CPJl-0DWp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:55:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC5DD1063;
	Fri, 14 Nov 2025 06:55:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0344C3F66E;
	Fri, 14 Nov 2025 06:55:22 -0800 (PST)
Date: Fri, 14 Nov 2025 14:55:21 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 04/13] coresight: Hide unused ETMv3 format attributes
Message-ID: <20251114145521.GD3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_065525_152387_785FE008 
X-CRM114-Status: GOOD (  21.64  )
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

On Wed, Nov 12, 2025 at 03:22:10PM +0000, James Clark wrote:
> ETMv3 only has a few attributes, and setting unused ones results in an
> error, so hide them to begin with.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 17afa0f4cdee..91132abca244 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -106,8 +106,27 @@ static struct attribute *etm_config_formats_attr[] = {
>  	NULL,
>  };
>  
> +static umode_t etm_format_attr_is_visible(struct kobject *kobj,
> +					  struct attribute *attr, int unused)
> +{
> +	/* ETM4 has all attributes */
> +	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> +		return attr->mode;
> +
> +	/* ETM3 only has these attributes */
> +	if (attr == &format_attr_cycacc.attr ||
> +	    attr == &format_attr_timestamp.attr ||
> +	    attr == &format_attr_retstack.attr ||
> +	    attr == &format_attr_sinkid.attr ||
> +	    attr == &format_attr_configid.attr)

Do we support configid for ETM3?

> +		return attr->mode;

It is good to give a bit information why only these attributes
supported, e.g.,

  /*
   * ETM3 only support subset attributes (see ETM3X_SUPPORTED_OPTIONS),
   * keep 'sinkid' attr for specifying sink ID.
   */

Two side topics but not issues caused this patch:

- Since CTXTID/CTXTID2 is only used for ETM4x, we can remove "#if
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)" from the
  format_attr_contextid_show() function.

- etm_parse_event_config() does not check attr->config3, thus user
  sets 'cc_threshold' it will slip without any error report.

Thanks,
Leo

> +
> +	return 0;
> +}
> +
>  static const struct attribute_group etm_pmu_format_group = {
>  	.name   = "format",
> +	.is_visible = etm_format_attr_is_visible,
>  	.attrs  = etm_config_formats_attr,
>  };
>  
> 
> -- 
> 2.34.1
> 

