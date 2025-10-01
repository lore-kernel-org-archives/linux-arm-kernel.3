Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BFCCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/mbW3oUI2ev/Xn41+hBhGFx3Jot6bEDdi+bVuuqRas=; b=BmxkvC/ApSrStSIDTVbONuv5BI
	jKnaVc/cedNoSf6A4thrq/whw7GjzwQe01lWQt8WgGHN3q0XIf07kDi/OHXfMF/NxooAXGdOzxxs8
	TBUaR8kB78GWWWlO2/WvBfOdNKbPydN+3zo6nadqCSgIxvB2WKhF5Y9ytEUTGs3y7XnavjQDtIfye
	NJ3UDflS3hAVf3aP8ZLopWEEJesgbMnNHMcMdgq3Hl4PEXAuOw8GizC8M34X+dyep+M/E3WP+5hqb
	+PSj+VvxY1xFUfW4fhgwDXqht7wv6JM2C4puzwCT4jqkOhFhyRlZrir+lHjqW5Nsyrwu1PGJpH15f
	L9AVi5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x36-000000083gd-3IeI;
	Wed, 01 Oct 2025 13:39:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3x34-000000083gG-0vO0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:39:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 443B216F2;
	Wed,  1 Oct 2025 06:39:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E624E3F59E;
	Wed,  1 Oct 2025 06:39:12 -0700 (PDT)
Date: Wed, 1 Oct 2025 14:39:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] coresight: Add format attribute for setting the
 timestamp interval
Message-ID: <20251001133910.GO7985@e132581.arm.com>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
 <20250814-james-cs-syncfreq-v2-5-c76fcb87696d@linaro.org>
 <20250930151414.GK7985@e132581.arm.com>
 <3a731a9e-0621-42b6-b7fc-4b0fd9b7da6e@linaro.org>
 <20251001132815.GN7985@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001132815.GN7985@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_063914_299235_516E12AF 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Oct 01, 2025 at 02:28:15PM +0100, Coresight ML wrote:

[...]

> > Unfortunately that won't work because you'd have to always include
> > coresight-etm4x.h. This file is compiled for both arm32 and arm64 so it
> > would break the arm32 build.
> > 
> > I could define the TTR_CFG_FLD_ts_level_* stuff somewhere else but then it
> > becomes messier than just doing the #ifdefs here.
> 
> ATTR_CFG_FLD_ts_level_* is only used in coresight-etm4x-core.c, it is not
> used in coresight-etm-perf.c. Thus, we don't need to include
> coresight-etm4x.h in coresight-etm-perf.c. Do I miss anything?

Now I understand that you are using GEN_PMU_FORMAT_ATTR, so need to
used TTR_CFG_FLD_ts_level_* macro defined in coresight-etm4x.h.

Thanks,
Leo

