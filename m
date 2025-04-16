Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B586C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGYyInFX7L0zA4qnVCckXuYs5mZYFg4l81JInrOgVmk=; b=ktK97jk7OOyCweEe5XXdEdIIlF
	p4zV0NHdjdg0NFZHJuQXTLfgJj7qhdt/ycXlNtPuOZwe3IhoGTr8yMpLnHoM0yKRsiigg2+vk3GI8
	fYO2udeYiCu7hgxm2G6t3U4dvULQmmYr5sUTdCI1AKlEoeOOa5QRr9xNvSi86HOyej9jJoZzBEf/n
	+T+nnSaS1NyxRwFh7MnMjIinS83WumJ+BE/3rYqSj3RyWyGyrKPCEzd4jM4yY5ef3I24I+xXK8nVx
	j6iGVWHe6U9TsD3UPKjUibsmz6rD3Vr5Pkbx/VdKorYNbHhJN2mxCLGJnAxdp/hutFHWnERfEp4IW
	9yYPfwFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56E4-0000000AMaw-3jYx;
	Wed, 16 Apr 2025 17:07:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55lI-0000000AHyh-1BFw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:37:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F38339;
	Wed, 16 Apr 2025 09:37:15 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADF403F59E;
	Wed, 16 Apr 2025 09:37:15 -0700 (PDT)
Date: Wed, 16 Apr 2025 17:37:13 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Message-ID: <Z__cuT5IW0Sbjqpg@pluto>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-3-cristian.marussi@arm.com>
 <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__UJUKaMRoFLYLc@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_093720_412291_656EE36D 
X-CRM114-Status: GOOD (  34.31  )
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

On Wed, Apr 16, 2025 at 06:00:37PM +0200, Johan Hovold wrote:
> On Tue, Apr 15, 2025 at 03:29:31PM +0100, Cristian Marussi wrote:
> > Add a common framework to describe SCMI quirks and associate them with a
> > specific platform or a specific set of SCMI firmware versions.
> > 

Hi Johan,

thanks for having a look..

> > All the matching SCMI quirks will be enabled when the SCMI core stack
> > probes and after all the needed SCMI firmware versioning information was
> > retrieved using Base protocol.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > RFC->V1
> > - added handling of impl_ver ranges in quirk definition
> > - make Quirks Framework default-y
> > - match on all NULL/0 too..these are quirks that apply always anywhere !
> > - depends on COMPILE_TEST too
> > - move quirk enable calling logic out of Base protocol init (triggers a
> >   LOCKDEP issues around cpu locks (cpufreq, static_branch_enable interactions..)
> 
> > +static void scmi_enable_matching_quirks(struct scmi_info *info)
> > +{
> > +	struct scmi_revision_info *rev = &info->version;
> > +	const char *compatible = NULL;
> > +	struct device_node *root;
> > +
> > +	root = of_find_node_by_path("/");
> > +	if (root) {
> > +		of_property_read_string(root, "compatible", &compatible);
> 
> Looks like you still only allow matching on the most specific compatible
> string.
> 
> As we discussed in the RFC thread, this will result in one quirk entry
> for each machine in a SoC family in case the issue is not machine
> specific.
> 

Well, yes but the solution would be to add multiple compatible on the
same quirk line, which is definitely less cumbersome than adding
multiple quirk defs for the same quirk but does NOT scale anyway....

...anyway I will add that possibility..or I am missing something more ?

> > +		of_node_put(root);
> > +	}
> > +
> > +	/* Enable applicable quirks */
> > +	scmi_quirks_enable(info->dev, compatible,
> > +			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
> > +}
> 
> > +static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
> > +{
> > +	const char *last, *first = quirk->impl_ver_range;
> > +	size_t len;
> > +	char *sep;
> > +	int ret;
> > +
> > +	quirk->start_range = 0;
> > +	quirk->end_range = 0xFFFFFFFF;
> > +	len = quirk->impl_ver_range ? strlen(quirk->impl_ver_range) : 0;
> > +	if (!len)
> > +		return 0;
> > +
> > +	last = first + len - 1;
> > +	sep = strchr(quirk->impl_ver_range, '-');
> > +	if (sep)
> > +		*sep = '\0';
> > +
> > +	if (sep == first) // -X
> > +		ret = kstrtouint(first + 1, 0, &quirk->end_range);
> > +	else // X OR X- OR X-y
> > +		ret = kstrtouint(first, 0, &quirk->start_range);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!sep)
> > +		quirk->end_range = quirk->start_range;
> > +	else if (sep != last) //x-Y
> 
> nit: space after // (if you insist on using c99 comments)
> 

..leftover...I'll remove C99

> > +		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
> > +
> > +	if (quirk->start_range > quirk->end_range)
> > +		return -EINVAL;
> > +
> > +	return ret;
> > +}
> 
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * System Control and Management Interface (SCMI) Message Protocol Quirks
> > + *
> > + * Copyright (C) 2025 ARM Ltd.
> > + */
> > +#ifndef _SCMI_QUIRKS_H
> > +#define _SCMI_QUIRKS_H
> > +
> > +#include <linux/static_key.h>
> > +#include <linux/types.h>
> > +
> > +#ifdef CONFIG_ARM_SCMI_QUIRKS
> > +
> > +#define DECLARE_SCMI_QUIRK(_qn)						\
> > +	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
> > +
> > +#define SCMI_QUIRK(_qn, _blk)						\
> > +	do {								\
> > +		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
> > +			(_blk);						\
> > +	} while (0)
> > +
> > +void scmi_quirks_initialize(void);
> > +void scmi_quirks_enable(struct device *dev, const char *compat,
> > +			const char *vend, const char *subv, const u32 impl);
> > +
> > +#else
> > +
> > +#define DECLARE_SCMI_QUIRK(_qn)
> > +#define SCMI_QUIRK(_qn, _blk)
> 
> As I mentioned earlier, wouldn't it be useful to always compile the
> quirk code in order to make sure changes to surrounding code does not
> break builds where the quirks are enabled?
> 
> For example, by adding something like
> 
> #define SCMI_QUIRK(_qn, _blk)						\
> 	do {								\
> 		if (0)							\
> 			(_blk);						\
> 	} while (0)
> 
> here?
> 

Yes I will do.

> I didn't really review this in detail, but it seems to work as intended
> when matching on vendor and version:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks,
Cristian

