Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E67CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0euLdxJnWy0EoxKDZrB4CSHo7mPetTf1x1QsmKsxErs=; b=n2QXiWTQ8ulyC9Lt9yFrIZJnwx
	TAgMvMmeeSbiMSQbtWrhQJ02RXcc6cuq+lyTbT3WrNXrhjSH0RNRQSWxFz/vqGNcx8tCCL4UPZ0wx
	OlsC32HbBi0W3+v+4iDOWv3keBNPkLWjNtEtm5w4X2ODMbin8mpWyr4YlIk75joy8PG/TrjMMbV+F
	nLcv3oSqQ3QOCvrijOyFV5B+4Ptdm/ynJNQiqs6TJHLx1nT3IFDGNX+i2q5iRhIZZp8RCdSBkq8Wk
	KwAbO+MUkXqXRawNqeILtcRUXr+GHgzmQMK8+2AZwiajqE9VVDX6Mwx5ftTKRa7+zzlybZObx+WJ0
	GNOrWjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfkY-00000000huT-29mi;
	Tue, 26 May 2026 00:34:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfkV-00000000htw-3Ett
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:34:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E09340012;
	Tue, 26 May 2026 00:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B1C1F000E9;
	Tue, 26 May 2026 00:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779755661;
	bh=0euLdxJnWy0EoxKDZrB4CSHo7mPetTf1x1QsmKsxErs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nNsx6HUUrBFi1hstkNcO6rfTFM6VKyf23dX5e/5h9sw5LaG+20/FtCnYANJmHVMxL
	 Zy7NV8yGNYZ30ubtmiZTkJxeofpy1QJyvWlQPp46UH7egFpCAkVQ6W81mB12VnkXUu
	 ayhHPM52ILxNsNalIjA5KJCnW/GSEtE1/0HaVhV1TbHI8/morqLwraLvxHnRqx9bIu
	 HzlHcCA0LA79933C9k5Liacf1G7kBLk9+SFjeO1HLeTmGDGIzITNmGlsiMYWAcJcts
	 6fjRT32ONMvjFel9AkbTOkcvRxpBYxbtryXrVIHtz/MpRsDfFIiaipi6gBNGDOQ25Q
	 ZHjDk5EUsMIog==
Date: Mon, 25 May 2026 19:34:17 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 01/23] perf arch arm: Sort includes and add missed
 explicit dependencies
Message-ID: <ahTqiZ_EQXR3PFxp@google.com>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <20260522220435.2378363-2-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522220435.2378363-2-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_173423_834096_B65418DE 
X-CRM114-Status: GOOD (  13.48  )
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

On Fri, May 22, 2026 at 03:04:12PM -0700, Ian Rogers wrote:
> Fix missing #includes found while cleaning the evsel/evlist header
> files. Sort the remaining header files for consistency with the rest
> of the code.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/arch/arm/util/cs-etm.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
> index b7a839de8707..cdf8e3e60606 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -3,10 +3,13 @@
>   * Copyright(C) 2015 Linaro Limited. All rights reserved.
>   * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>   */
> +#include "../../../util/cs-etm.h"
> +
> +#include <errno.h>
> +#include <stdlib.h>
>  
> -#include <api/fs/fs.h>
> -#include <linux/bits.h>
>  #include <linux/bitops.h>
> +#include <linux/bits.h>
>  #include <linux/compiler.h>
>  #include <linux/coresight-pmu.h>
>  #include <linux/kernel.h>
> @@ -14,25 +17,24 @@
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <linux/zalloc.h>
> +#include <sys/stat.h>
> +
> +#include <api/fs/fs.h>
> +#include <internal/lib.h> // page_size
>  
> -#include "cs-etm.h"
> -#include "../../../util/debug.h"
> -#include "../../../util/record.h"
>  #include "../../../util/auxtrace.h"
>  #include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
>  #include "../../../util/event.h"
>  #include "../../../util/evlist.h"
>  #include "../../../util/evsel.h"
> -#include "../../../util/perf_api_probe.h"
>  #include "../../../util/evsel_config.h"
> +#include "../../../util/perf_api_probe.h"
> +#include "../../../util/pmu.h"
>  #include "../../../util/pmus.h"
> -#include "../../../util/cs-etm.h"
> -#include <internal/lib.h> // page_size
> +#include "../../../util/record.h"
>  #include "../../../util/session.h"
> -
> -#include <errno.h>
> -#include <stdlib.h>
> -#include <sys/stat.h>
> +#include "cs-etm.h"
>  
>  struct cs_etm_recording {
>  	struct auxtrace_record	itr;
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

