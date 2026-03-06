Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B88F0182F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t83Axom1tffNpjjNme47abpxJCCo6O+lB052M06q9bA=; b=RfpWV2fQhW+MBkw0KhjlTdD20l
	fZhsHxWndtczauduRYx6IaKXwOV0yumWcj0RW+NygsDgSi9Dhr1b89CoC8SXian6zf/aW2xT485Rf
	DNuUw9E9JWHZ08a2Hjxjs8O+OenD4J7t40bjTQRoIFziEMcxs9NlhVaGznfVLriLhcS1o/hF83tea
	LuWxYTrxDssoydyI0oPW38xBeIyL0JwGLePeMkn9V0w7z03YiQi5o1ts2w/WnhyQMLcPEh9svTtgF
	s/JGGLa623gsz2CxFv1g2iYueonHALYGUkwkbJDw1J0PO5356qVH+yDD0xcXhJqJl66liBY8PbWgh
	0M/pQHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUHJ-00000003e4K-1AuB;
	Fri, 06 Mar 2026 12:27:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUHG-00000003e3a-35UE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 12:27:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75C48497;
	Fri,  6 Mar 2026 04:27:25 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F77D3F694;
	Fri,  6 Mar 2026 04:27:31 -0800 (PST)
Date: Fri, 6 Mar 2026 12:27:29 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] perf cs-etm: Finish removal of ETM_OPT_*
Message-ID: <20260306122729.GL1098637@e132581.arm.com>
References: <20260306-james-perf-remove-etm_opt-v1-0-03c662380361@linaro.org>
 <20260306-james-perf-remove-etm_opt-v1-1-03c662380361@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-james-perf-remove-etm_opt-v1-1-03c662380361@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_042734_809880_5264257D 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 06, 2026 at 11:24:45AM +0000, Coresight ML wrote:

[...]

> -static int cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm)
> +static void cs_etm__setup_timeless_decoding(struct cs_etm_auxtrace *etm,
> +					    u64 *metadata)

nitpick: here it can avoid a new argument "metadata", directly retrieve
from etm->metadata[0].  Otherwise, LGTM.

