Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11524C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+HY7XJbmdNHVYTCKXTCx/iteKlpELAA1uB2o3ffVBA=; b=cyFvooLekveCVfFixENltIDpVi
	n2XVELit+dWYib4c0UPME+wHg+VbkFFqhssqqmUh0TUa9Y9a/OWN867yYV2Nwscfr7K+49RfoOpca
	tZ6NkE4JsFzhwuk7LGHze00bhWJip1GA9xvUr8m3mcMX+XNS3+YGgJ0OGYKFGc80H258DYN5Q4YwU
	JmtEPRZQ9ZJQhF10sYd39btXFZKMC3x6gP+NV+hTyq2ExSkqXibqwls5BeCY90Ufuk0R0rF7nEO87
	PccnAENh5VpTUZRS0b13r8R9g4egTPIU3Uj26NQfJ3tGtJBlOSx/Q55Le+3lQZf+fsPirL7tbj5Jy
	WuZfjqew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMps-0000000C088-1IgJ;
	Thu, 03 Jul 2025 16:30:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKmK-0000000BdbN-2HUN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:19:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 463221596;
	Thu,  3 Jul 2025 07:18:53 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4150E3F66E;
	Thu,  3 Jul 2025 07:19:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:19:05 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 2/2] coresight: Add label sysfs node support
Message-ID: <20250703141905.GE1039028@e132581.arm.com>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-3-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130453.4265-3-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_071908_669313_9C98EB76 
X-CRM114-Status: GOOD (  22.89  )
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

On Thu, Jul 03, 2025 at 09:04:53PM +0800, Mao Jinlong wrote:

[...]

> +static ssize_t label_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +
> +	const char *str;
> +	int ret = 0;

No need to init ret to 0.

> +	ret = fwnode_property_read_string(dev_fwnode(dev), "label", &str);
> +	if (ret == 0)
> +		return scnprintf(buf, PAGE_SIZE, "%s\n", str);
> +	else
> +		return ret;
> +}
> +static DEVICE_ATTR_RO(label);
> +
>  static struct attribute *coresight_sink_attrs[] = {
>  	&dev_attr_enable_sink.attr,
> +	&dev_attr_label.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_sink);
>  
>  static struct attribute *coresight_source_attrs[] = {
>  	&dev_attr_enable_source.attr,
> +	&dev_attr_label.attr,
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(coresight_source);
>  
> +static struct attribute *coresight_link_attrs[] = {
> +	&dev_attr_label.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(coresight_link);
> +
> +static struct attribute *coresight_helper_attrs[] = {
> +	&dev_attr_label.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(coresight_helper);
> +

This change adds a 'label' entry for source, link, helper, and sink
components, but the documentation has only updated for three components:
CTI, funnel, and TPDM.

Should we also update the documentation for all relevant components,
such as ETM, ETR, etc.?

Additionally, patch 01 is missing the update to the ETM yaml file for
the new property. I checked patch v4 [1], which includes a change to
etm.yaml, but this change was dropped since v5. I briefly read the
v4 discussion thread and didn't see any mention of removing the ETM
related change. Did you see any particular issue when add label for
ETM devices?

Overall, this series is fine for me. Just please ensure that all
relevant components are covered for completeness.

Thanks,
Leo

[1] https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/

>  const struct device_type coresight_dev_type[] = {
>  	[CORESIGHT_DEV_TYPE_SINK] = {
>  		.name = "sink",
> @@ -390,6 +420,7 @@ const struct device_type coresight_dev_type[] = {
>  	},
>  	[CORESIGHT_DEV_TYPE_LINK] = {
>  		.name = "link",
> +		.groups = coresight_link_groups,
>  	},
>  	[CORESIGHT_DEV_TYPE_LINKSINK] = {
>  		.name = "linksink",
> @@ -401,6 +432,7 @@ const struct device_type coresight_dev_type[] = {
>  	},
>  	[CORESIGHT_DEV_TYPE_HELPER] = {
>  		.name = "helper",
> +		.groups = coresight_helper_groups,
>  	}
>  };
>  /* Ensure the enum matches the names and groups */
> -- 
> 2.17.1
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

