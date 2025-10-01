Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06CCCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Afs/O9ohbytPzVtT+vm0wkjpjoJ5LGdwgsslOuhozcs=; b=hTs53Zj7re2cyxoKsJovKJTbzW
	0mW5mbi26RhSouFKEqJcQGUmr7D4FpB5+vGRZ8ME+xCy8v+EG9ntXELkJuC/S6L2i1rXBJYHapmCc
	jk6T0hzpLlRa+9v2frEXxuvVOGlTsOxkvI+ZLErjBTyAHcy2jYQMQ33+SnGaKCb0BUuRa4LqbHyNs
	nbfVsrlbBygtpY0Ad2ZGDlulbQ/B7lrAAgd/JtVFSrx/p1+vPO+1H+kPh33rchbxmR9GVUyVfcMsI
	Lshu5YeHGE0I3UjYSlUQcBn7BEuTDQAN7bRbCqK3YmHxRY3zDaatKjMdJKS8CneTozlqyyZC0DiBI
	1jFZwJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wsa-000000082dL-1h0O;
	Wed, 01 Oct 2025 13:28:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wsX-000000082co-0pAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:28:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 155C116F2;
	Wed,  1 Oct 2025 06:28:10 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B49483F59E;
	Wed,  1 Oct 2025 06:28:17 -0700 (PDT)
Date: Wed, 1 Oct 2025 14:28:15 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
Message-ID: <20251001132815.GN7985@e132581.arm.com>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
 <20250930151414.GK7985@e132581.arm.com>
 <3a731a9e-0621-42b6-b7fc-4b0fd9b7da6e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a731a9e-0621-42b6-b7fc-4b0fd9b7da6e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062821_272167_F2B592C0 
X-CRM114-Status: GOOD (  19.13  )
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

On Wed, Oct 01, 2025 at 01:40:37PM +0100, James Clark wrote:

[...]

> > > @@ -103,6 +111,9 @@ static struct attribute *etm_config_formats_attr[] = {
> > >   	&format_attr_configid.attr,
> > >   	&format_attr_branch_broadcast.attr,
> > >   	&format_attr_cc_threshold.attr,
> > > +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> > > +	&format_attr_ts_level.attr,
> > > +#endif
> > 
> > By using .visible() callback for attrs, we can improve a bit code
> > without spreading "#ifdef IS_ENABLED()" in this file. E.g.,
> > 
> >     static umode_t format_attr_is_visible(struct kobject *kobj,
> >                                     struct attribute *attr, int n)
> >     {
> >          struct device *dev = kobj_to_dev(kobj);
> > 
> >          if (attr == &format_attr_ts_level.attr &&
> > 	    !IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
> >                  return 0;
> > 
> >          return attr->mode;
> >     }
> > 
> > Otherwise, LGTM:
> > 
> > Reviewed-by: Leo Yan <leo.yan@arm.com>
> > 
> 
> Unfortunately that won't work because you'd have to always include
> coresight-etm4x.h. This file is compiled for both arm32 and arm64 so it
> would break the arm32 build.
> 
> I could define the TTR_CFG_FLD_ts_level_* stuff somewhere else but then it
> becomes messier than just doing the #ifdefs here.

ATTR_CFG_FLD_ts_level_* is only used in coresight-etm4x-core.c, it is not
used in coresight-etm-perf.c. Thus, we don't need to include
coresight-etm4x.h in coresight-etm-perf.c. Do I miss anything?

A similiar case is the attr 'cc_threshold' is only used by ETMv4, it is
exported always. It is not bad for me to always expose these attrs but
in the are ignored in the ETMv3 driver - so we even don't need to
bother adding .visible() callback.

Thanks,
Leo

