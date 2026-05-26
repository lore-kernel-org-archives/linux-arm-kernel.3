Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1F2CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OJa2o21mkJ9h69pPE4pTV9VioWjPVfkljpsjc3LcvA=; b=gU4o3Ewn6E5L5tWitjsSgpzeo9
	R5Iw4cF9xjnvdOwt59+QWQMjdPmHsqzuoRX1RW1Psd1/1Kbf27W0fPG5ogWNYqSjy+s9sB7b/MJf7
	2jMXdLOhsUOe4kvwbsqW8zj+0TlLbAho64qoVU3PNE15mVgFxD684iHUngfiCKrVbVgEQemZkfASk
	5tGx6GlSyoQOPKLsFq2k5m9pYDh5t/aY11N128UN+TOMGqryUjjllTVcpEp9sVQWzBbHGh1S2JlzM
	Ii+pnY9Ihetl3btg8mFYVPTZUb3oPBjq4Z1p9fq1BtY1qjNPomL5vSDFlUV9mzI9VWsrNv7KkP/aO
	UPELn6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfl0-00000000hye-2dAa;
	Tue, 26 May 2026 00:34:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfkz-00000000hyU-2X3A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:34:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABF9A60018;
	Tue, 26 May 2026 00:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DBD1F000E9;
	Tue, 26 May 2026 00:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779755692;
	bh=1OJa2o21mkJ9h69pPE4pTV9VioWjPVfkljpsjc3LcvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDLZ2QuY1GoKhRyM6IjiClv3ZyY0EMoVt21gXfq9E3WVXtU8knE4PWR8m1igIPPP7
	 CPIML+UmRymIqAtBmDeqkSQk0XYsAOrpTij6YcYZwyNCx9onUXml2JD6AE4p9cKums
	 H+qcypgU1TdpXh1N1jl+SkiocOR5YAoKkezPJjDrQlo8cMxQfYyzQfiBQAkx2VIuyd
	 /8+S8mFyRa+3fD5e0ZWdHcLYwfsaan8+P1bc9Eq/SI4omykzv8qPDy1xJrQ03CXp7Y
	 YEROQG70ZPplgnS6Y7MgKbMzldomE+iSCHzAj63KdV0+cxnBQD364S/sRU6Mfgdby/
	 l+xDVBMFdLfsQ==
Date: Mon, 25 May 2026 19:34:48 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 02/23] perf arch x86: Sort includes and add missed
 explicit dependencies
Message-ID: <ahTqqNaHESZ6F6fC@google.com>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <20260522220435.2378363-3-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522220435.2378363-3-irogers@google.com>
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

On Fri, May 22, 2026 at 03:04:13PM -0700, Ian Rogers wrote:
> Fix missing #includes found while cleaning the evsel/evlist header
> files. Sort the remaining header files for consistency with the rest
> of the code.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/arch/x86/util/intel-bts.c | 20 +++++++++++--------
>  tools/perf/arch/x86/util/intel-pt.c  | 29 +++++++++++++++-------------
>  2 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/perf/arch/x86/util/intel-bts.c b/tools/perf/arch/x86/util/intel-bts.c
> index 85c8186300c8..100a23d27998 100644
> --- a/tools/perf/arch/x86/util/intel-bts.c
> +++ b/tools/perf/arch/x86/util/intel-bts.c
> @@ -4,26 +4,30 @@
>   * Copyright (c) 2013-2015, Intel Corporation.
>   */
>  
> +#include "../../../util/intel-bts.h"
> +
>  #include <errno.h>
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> +
>  #include <linux/bitops.h>
> +#include <linux/kernel.h>
>  #include <linux/log2.h>
> +#include <linux/types.h>
>  #include <linux/zalloc.h>
>  
> +#include <internal/lib.h> // page_size
> +
> +#include "../../../util/auxtrace.h"
>  #include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
>  #include "../../../util/event.h"
> -#include "../../../util/evsel.h"
>  #include "../../../util/evlist.h"
> +#include "../../../util/evsel.h"
>  #include "../../../util/mmap.h"
> -#include "../../../util/session.h"
> +#include "../../../util/pmu.h"
>  #include "../../../util/pmus.h"
> -#include "../../../util/debug.h"
>  #include "../../../util/record.h"
> +#include "../../../util/session.h"
>  #include "../../../util/tsc.h"
> -#include "../../../util/auxtrace.h"
> -#include "../../../util/intel-bts.h"
> -#include <internal/lib.h> // page_size
>  
>  #define KiB(x) ((x) * 1024)
>  #define MiB(x) ((x) * 1024 * 1024)
> diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
> index c131a727774f..0307ff15d9fc 100644
> --- a/tools/perf/arch/x86/util/intel-pt.c
> +++ b/tools/perf/arch/x86/util/intel-pt.c
> @@ -3,36 +3,39 @@
>   * intel_pt.c: Intel Processor Trace support
>   * Copyright (c) 2013-2015, Intel Corporation.
>   */
> +#include "../../../util/intel-pt.h"
>  
>  #include <errno.h>
>  #include <stdbool.h>
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> +
>  #include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
>  #include <linux/log2.h>
> +#include <linux/types.h>
>  #include <linux/zalloc.h>
> -#include <linux/err.h>
>  
> -#include "../../../util/session.h"
> +#include <api/fs/fs.h>
> +#include <internal/lib.h> // page_size
> +#include <subcmd/parse-options.h>
> +
> +#include "../../../util/auxtrace.h"
> +#include "../../../util/config.h"
> +#include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
>  #include "../../../util/event.h"
>  #include "../../../util/evlist.h"
>  #include "../../../util/evsel.h"
>  #include "../../../util/evsel_config.h"
> -#include "../../../util/config.h"
> -#include "../../../util/cpumap.h"
>  #include "../../../util/mmap.h"
> -#include <subcmd/parse-options.h>
>  #include "../../../util/parse-events.h"
> -#include "../../../util/pmus.h"
> -#include "../../../util/debug.h"
> -#include "../../../util/auxtrace.h"
>  #include "../../../util/perf_api_probe.h"
> +#include "../../../util/pmu.h"
> +#include "../../../util/pmus.h"
>  #include "../../../util/record.h"
> +#include "../../../util/session.h"
>  #include "../../../util/target.h"
>  #include "../../../util/tsc.h"
> -#include <internal/lib.h> // page_size
> -#include "../../../util/intel-pt.h"
> -#include <api/fs/fs.h>
>  #include "cpuid.h"
>  
>  #define KiB(x) ((x) * 1024)
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

