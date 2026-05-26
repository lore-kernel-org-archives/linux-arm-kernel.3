Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B82BCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 00:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9A8i+I9Q0bd0mGRKrzkm/GeP+5Z2xtv0wmuEj11NpY=; b=nunMPkywSmTO6drye5fgGerveH
	5SL9V6sq35+bE391XawxcMPXcUMqsHY1ZvjCh1YY+6xMDDA2VWKIfYsB9DcZHdLwRAuNaihpW1CAu
	vX++Lb7ENXjNRMWNTbY0+UJkyvyQncJ6td0TU+Oxo6eHC1bfYkyRVeS3IvP5Q0c5emGC3r1j/ewcj
	o/f99fy1cEHV6fELhVwBRjqUek+3K6Uv14jT7JWRgQaogRpR29YNFMjqtCukzYacgF4Es2CIXXOEQ
	pr26CBk77u6g4pjWphoMVUZnFBX39szv0L9ETqCV+kT+EevxHTf6T0vdGwrasJ8Zu735n43EXAwav
	zoXuYYdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRfln-00000000iBC-3rdP;
	Tue, 26 May 2026 00:35:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRflm-00000000iAx-2TCo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 00:35:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E25160018;
	Tue, 26 May 2026 00:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A4A1F000E9;
	Tue, 26 May 2026 00:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779755741;
	bh=I9A8i+I9Q0bd0mGRKrzkm/GeP+5Z2xtv0wmuEj11NpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g/CIr9hchYDPByx01oAi2qwrhquu1yMYI0OBzFT8K/Y4jCs4W7L7pOMpFwQwdaRLc
	 N9K/DBBBJsqoUi/BY1IMTBe1YS5ssFoGdCXld80FDOsUujiiq6USR3rz2ggq5bHrFr
	 4V++hfA6pmAN9MVCXBeoaM9j+e+WYCEIqCPgFpSx3Gmj+SDx4yLC7uKQS0UWxZygBm
	 hzmG9Si9RnowhBEMKNL/gX6IZMxYxq/E/Xdq9JGboK4oYJ4m4jj4b+NmaYSKBTbPi7
	 8Nzw8mDj+furFu2XMBhng8XhVNQcs+fr34y+ylM0dQrxEJF/AZlj6j/dlxi18GMRlt
	 lI3l5Txc3AWMA==
Date: Mon, 25 May 2026 19:35:38 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v9 04/23] perf script: Sort includes and add missed
 explicit dependencies
Message-ID: <ahTq2mVUy61AkJN9@google.com>
References: <20260428071903.1886173-1-irogers@google.com>
 <20260522220435.2378363-1-irogers@google.com>
 <20260522220435.2378363-5-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522220435.2378363-5-irogers@google.com>
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

On Fri, May 22, 2026 at 03:04:15PM -0700, Ian Rogers wrote:
> Fix missing #include of pmu.h found while cleaning the evsel/evlist
> header files. Sort the remaining header files for consistency with the
> rest of the code. Doing this exposed a missing forward declaration of
> addr_location in print_insn.h, add this and sort the forward
> declarations.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
>  tools/perf/builtin-script.c  | 111 ++++++++++++++++++-----------------
>  tools/perf/util/print_insn.h |   5 +-
>  2 files changed, 60 insertions(+), 56 deletions(-)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index c0918006e0ab..e330ae7f725e 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -1,75 +1,78 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include "builtin.h"
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <signal.h>
> +#include <stdio.h>
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <linux/bitmap.h>
> +#include <linux/compiler.h>
> +#include <linux/ctype.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/stringify.h>
> +#include <linux/time64.h>
> +#include <linux/unaligned.h>
> +#include <linux/zalloc.h>
> +#include <sys/param.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <sys/utsname.h>
> +#include <unistd.h>
>  
> +#include <perf/evlist.h>
> +#include <subcmd/exec-cmd.h>
> +#include <subcmd/pager.h>
> +#include <subcmd/parse-options.h>
> +
> +#include "asm/bug.h"
> +#include "builtin.h"
> +#include "perf.h"
> +#include "print_binary.h"
> +#include "print_insn.h"
> +#include "ui/ui.h"
> +#include "util/annotate.h"
> +#include "util/auxtrace.h"
> +#include "util/cgroup.h"
> +#include "util/color.h"
>  #include "util/counts.h"
> +#include "util/cpumap.h"
> +#include "util/data.h"
>  #include "util/debug.h"
> +#include "util/dlfilter.h"
>  #include "util/dso.h"
> -#include <subcmd/exec-cmd.h>
> -#include "util/header.h"
> -#include <subcmd/parse-options.h>
> -#include "util/perf_regs.h"
> -#include "util/session.h"
> -#include "util/tool.h"
> -#include "util/map.h"
> -#include "util/srcline.h"
> -#include "util/symbol.h"
> -#include "util/thread.h"
> -#include "util/trace-event.h"
> +#include "util/dump-insn.h"
>  #include "util/env.h"
> +#include "util/event.h"
>  #include "util/evlist.h"
>  #include "util/evsel.h"
>  #include "util/evsel_fprintf.h"
>  #include "util/evswitch.h"
> +#include "util/header.h"
> +#include "util/map.h"
> +#include "util/mem-events.h"
> +#include "util/mem-info.h"
> +#include "util/metricgroup.h"
> +#include "util/path.h"
> +#include "util/perf_regs.h"
> +#include "util/pmu.h"
> +#include "util/record.h"
> +#include "util/session.h"
>  #include "util/sort.h"
> -#include "util/data.h"
> -#include "util/auxtrace.h"
> -#include "util/cpumap.h"
> -#include "util/thread_map.h"
> +#include "util/srcline.h"
>  #include "util/stat.h"
> -#include "util/color.h"
>  #include "util/string2.h"
> +#include "util/symbol.h"
>  #include "util/thread-stack.h"
> +#include "util/thread.h"
> +#include "util/thread_map.h"
>  #include "util/time-utils.h"
> -#include "util/path.h"
> -#include "util/event.h"
> -#include "util/mem-info.h"
> -#include "util/metricgroup.h"
> -#include "ui/ui.h"
> -#include "print_binary.h"
> -#include "print_insn.h"
> -#include <linux/bitmap.h>
> -#include <linux/compiler.h>
> -#include <linux/kernel.h>
> -#include <linux/stringify.h>
> -#include <linux/time64.h>
> -#include <linux/zalloc.h>
> -#include <linux/unaligned.h>
> -#include <sys/utsname.h>
> -#include "asm/bug.h"
> -#include "util/mem-events.h"
> -#include "util/dump-insn.h"
> -#include <dirent.h>
> -#include <errno.h>
> -#include <inttypes.h>
> -#include <signal.h>
> -#include <stdio.h>
> -#include <sys/param.h>
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <fcntl.h>
> -#include <unistd.h>
> -#include <subcmd/pager.h>
> -#include <perf/evlist.h>
> -#include <linux/err.h>
> -#include "util/dlfilter.h"
> -#include "util/record.h"
> +#include "util/tool.h"
> +#include "util/trace-event.h"
>  #include "util/unwind.h"
>  #include "util/util.h"
> -#include "util/cgroup.h"
> -#include "util/annotate.h"
> -#include "perf.h"
>  
> -#include <linux/ctype.h>
>  #ifdef HAVE_LIBTRACEEVENT
>  #include <event-parse.h>
>  #endif
> diff --git a/tools/perf/util/print_insn.h b/tools/perf/util/print_insn.h
> index 07d11af3fc1c..a54f7e858e49 100644
> --- a/tools/perf/util/print_insn.h
> +++ b/tools/perf/util/print_insn.h
> @@ -5,10 +5,11 @@
>  #include <stddef.h>
>  #include <stdio.h>
>  
> -struct perf_sample;
> -struct thread;
> +struct addr_location;
>  struct machine;
>  struct perf_insn;
> +struct perf_sample;
> +struct thread;
>  
>  #define PRINT_INSN_IMM_HEX		(1<<0)
>  
> -- 
> 2.54.0.794.g4f17f83d09-goog
> 

