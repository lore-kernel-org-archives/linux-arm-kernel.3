Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E821CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsxWkMmDM5b7XJHZjFJBYku1/ogQ/3//LWB7vEI+twI=; b=LTPkx3MTMZgoc/Fj6XiEytbnul
	d1uMg4W57GY8hAGQUmPGne2lCyJVUB5HdF/0gpcZBssLQit/B7YdMHxQ2q5gk5fm3b5ZgHNRmCpD1
	j9Iv6Ekq/i7nsoPZcfUZ6vbuIC/oMf0IH/hTaOR6UWboxvXpsrmabvmF2SDMJydqApSucKeEJzd0C
	wwGWe0qOqDA7XMnwq0XSZip5n20YJYqsqfOhRyD/EIIr1KaMgihyyfVuujgNSF5xQW4iRayEPpJLq
	JosNN80wyrBx6vQ4WsaU1sp9n7iLM1pB4JTiBbnQpJ8zg5YwJezbWo5Fn1fAVAtTdtpLHzAYVg+vF
	dHx8OASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRflO-00000000i4W-356O;
	Tue, 26 May 2026 00:35:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRflM-00000000i3k-1ZaB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0641F40779;
	Tue, 26 May 2026 00:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A71F000E9;
	Tue, 26 May 2026 00:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779755715;
	bh=LsxWkMmDM5b7XJHZjFJBYku1/ogQ/3//LWB7vEI+twI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAkP6SUzZFl8T/BBdwDVGvpefVXJFa4oDSLVSU1+lJNQLZnBYq4Ob4dYEHWynFtAg
	 pcU3vNbCSXGmu2p0x4YT2hxelyblrcAh7ub9Srw7sOfwLBC5/nvgp+wQgmE7+3VPtM
	 Oq8b8IXXQFuQsITYmkW2RV2PduzWCJwsEbCOOTkPCn8BcNidNgreiw6JQe6r1XLUwV
	 CDTiwYYRBQTteqKc1TCUlV72LbmhYw/RUZIr7NiS70wOQHvOISU/nIfX7EA545Af0Y
	 kZ966788JTKt6W+Fz48TeMEJsyJiaz3Gm/8GdzQh65EHe4/WaAbSH0JpSYMLn8R3Q3
	 ujHTP3F6onPYw==
Date: Mon, 25 May 2026 19:35:12 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 03/23] perf tests: Sort includes and add missed
 explicit dependencies
Message-ID: <ahTqwPZJ2Q9vCPzZ@google.com>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <20260522220435.2378363-4-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522220435.2378363-4-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_173516_452344_383C471D 
X-CRM114-Status: GOOD (  13.87  )
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

On Fri, May 22, 2026 at 03:04:14PM -0700, Ian Rogers wrote:
> Fix missing #includes found while cleaning the evsel/evlist header
> files. Sort the remaining header files for consistency with the rest
> of the code.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/tests/hwmon_pmu.c  | 14 +++++++++-----
>  tools/perf/tests/mmap-basic.c | 18 +++++++++++-------
>  2 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/tests/hwmon_pmu.c b/tools/perf/tests/hwmon_pmu.c
> index 4aa4aac94f09..ada6e445c4c4 100644
> --- a/tools/perf/tests/hwmon_pmu.c
> +++ b/tools/perf/tests/hwmon_pmu.c
> @@ -1,15 +1,19 @@
>  // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
> -#include "debug.h"
> -#include "evlist.h"
>  #include "hwmon_pmu.h"
> -#include "parse-events.h"
> -#include "tests.h"
> +
>  #include <errno.h>
> +
>  #include <fcntl.h>
> -#include <sys/stat.h>
>  #include <linux/compiler.h>
>  #include <linux/kernel.h>
>  #include <linux/string.h>
> +#include <sys/stat.h>
> +
> +#include "debug.h"
> +#include "evlist.h"
> +#include "parse-events.h"
> +#include "pmus.h"
> +#include "tests.h"
>  
>  static const struct test_event {
>  	const char *name;
> diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
> index a18d84d858aa..a69cd1046e9a 100644
> --- a/tools/perf/tests/mmap-basic.c
> +++ b/tools/perf/tests/mmap-basic.c
> @@ -1,25 +1,29 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <errno.h>
> -#include <fcntl.h>
>  #include <inttypes.h>
>  #include <stdlib.h>
> +
> +#include <fcntl.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +
>  #include <perf/cpumap.h>
> +#include <perf/evlist.h>
> +#include <perf/mmap.h>
>  
>  #include "cpumap.h"
>  #include "debug.h"
>  #include "event.h"
>  #include "evlist.h"
>  #include "evsel.h"
> -#include "thread_map.h"
> +#include "pmu.h"
> +#include "pmus.h"
>  #include "tests.h"
> +#include "thread_map.h"
>  #include "util/affinity.h"
>  #include "util/mmap.h"
>  #include "util/sample.h"
> -#include <linux/err.h>
> -#include <linux/kernel.h>
> -#include <linux/string.h>
> -#include <perf/evlist.h>
> -#include <perf/mmap.h>
>  
>  /*
>   * This test will generate random numbers of calls to some getpid syscalls,
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

