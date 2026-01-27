Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E698BD2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+I+mLF4YAEorTlAbMmKByo9K2y+AL+kUQW7XgZ1k6wg=; b=oOEiN5stamxs0mfF5uYnTCYNo1
	IQSVMf5B9285DwVSZyW0sB/uswaA6EAfV8Ry6YVCyhpAie7Nl8Fqk64ma3FOMjB08KzYy4LASj5Hh
	19Mqli2QVX8nbE/Ioz8iUREY7ZhiT0p8lRYFJjtdfPL0UGpJt51naZOXhXBxMamaUk9DUKf4HhysX
	0X4QclGWERkOQcEjo40X8eF6DhGrV0kSHJ32t67edXWPADpga0pvWNj0JqCxjsgcekn4rLMP5krD2
	dgMvZOn23ueZ2e5VcXneNfQsTWOzk9WIFTNHRapyVwyYlZ9W4h0+rGREPZC73uT6REEZbHa2rmJEP
	iBMAdKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiKY-0000000EFzP-1stT;
	Tue, 27 Jan 2026 12:38:02 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiKW-0000000EFyy-0OtS;
	Tue, 27 Jan 2026 12:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769517480; x=1801053480;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=klfkji3dA/BcUEdcu+FxnfdCOIEKdGDNWQxxFEl3RVo=;
  b=YOqlorJayQI0YpOX5GuAk3afTYJmdYTtCx+NZ8Lu0KMM5LvK1dJNgO6p
   TBVHJfPe5/RK+CioOTI2XJAZDkIYEFCdfSqtNaFfGghIYNfrkZxpTWajc
   k9nMmkMBqvjpW9vgHtNioIAeVfjMRNP4yxwBG0eMTbO5OSVfesYzkpkhQ
   9dW3ubz99WoTzYCrnQNB+wRFAa4TyneIqTMoTtTKcQpjQmGGxibByvvx0
   mU++A50jLoORoMQWymNBGWBIuxz9R0hYJdtX5ts0hFq26RxdWfNBYlqhL
   KBhCAJrafDYcr3jXyDUNkXWxMf8m4vY4HJEOqDehVRm6oI3gQgOx5h2eI
   A==;
X-CSE-ConnectionGUID: 3MClT9ogS+SFkTnQuiZbsQ==
X-CSE-MsgGUID: JpKEuTNNTv+wgbhcGqJw0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70800478"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70800478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:37:59 -0800
X-CSE-ConnectionGUID: XD0hjFQVSYCELvfSH4zETw==
X-CSE-MsgGUID: i7897sFcR2+Dl89FbwtX+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207863450"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.14]) ([10.124.240.14])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:37:52 -0800
Message-ID: <a97ff1d6-7712-4315-95ff-4079ffc752f7@linux.intel.com>
Date: Tue, 27 Jan 2026 20:37:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2 1/3] perf arch: Update arch headers to use relative
 UAPI paths
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zide Chen <zide.chen@intel.com>,
 Falcon Thomas <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Xudong Hao <xudong.hao@intel.com>
References: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com>
 <20260127070259.2720468-2-dapeng1.mi@linux.intel.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20260127070259.2720468-2-dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_043800_155159_D365ED2D 
X-CRM114-Status: GOOD (  15.25  )
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


On 1/27/2026 3:02 PM, Dapeng Mi wrote:
> The architectural specific headers perf_regs.h currently rely on the
> host architecture's 'asm/perf_regs.h'. This can lead to compilation
> inconsistencies or failures when including and building perf for a
> target architecture that differs from the host's architecture.
>
> Explicitly point to the UAPI headers within the tools source tree using
> relative paths. This ensures that perf is always built against the
> intended architecture.
>
> No functional changes are intended.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> ---
>  tools/perf/arch/arm/include/perf_regs.h       | 2 +-
>  tools/perf/arch/arm64/include/perf_regs.h     | 2 +-
>  tools/perf/arch/csky/include/perf_regs.h      | 1 +
>  tools/perf/arch/loongarch/include/perf_regs.h | 2 +-
>  tools/perf/arch/mips/include/perf_regs.h      | 2 +-
>  tools/perf/arch/powerpc/include/perf_regs.h   | 2 +-
>  tools/perf/arch/riscv/include/perf_regs.h     | 2 +-
>  tools/perf/arch/s390/include/perf_regs.h      | 2 +-
>  tools/perf/arch/x86/include/perf_regs.h       | 2 +-
>  9 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/tools/perf/arch/arm/include/perf_regs.h b/tools/perf/arch/arm/include/perf_regs.h
> index 75ce1c370114..20c54766e3a0 100644
> --- a/tools/perf/arch/arm/include/perf_regs.h
> +++ b/tools/perf/arch/arm/include/perf_regs.h
> @@ -4,7 +4,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/arm/include/uapi/asm/perf_regs.h"
>  
>  void perf_regs_load(u64 *regs);
>  
> diff --git a/tools/perf/arch/arm64/include/perf_regs.h b/tools/perf/arch/arm64/include/perf_regs.h
> index 58639ee9f7ea..372f2565a9dd 100644
> --- a/tools/perf/arch/arm64/include/perf_regs.h
> +++ b/tools/perf/arch/arm64/include/perf_regs.h
> @@ -5,7 +5,7 @@
>  #include <stdlib.h>
>  #include <linux/types.h>
>  #define perf_event_arm_regs perf_event_arm64_regs
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/arm64/include/uapi/asm/perf_regs.h"
>  #undef perf_event_arm_regs
>  
>  void perf_regs_load(u64 *regs);
> diff --git a/tools/perf/arch/csky/include/perf_regs.h b/tools/perf/arch/csky/include/perf_regs.h
> index 076c7746c8a2..9520e6aa319e 100644
> --- a/tools/perf/arch/csky/include/perf_regs.h
> +++ b/tools/perf/arch/csky/include/perf_regs.h
> @@ -7,6 +7,7 @@
>  #include <stdlib.h>
>  #include <linux/types.h>
>  #include <asm/perf_regs.h>

Oops, the above line was not removed. Would remove it in next version.


> +#include "../../../../arch/csky/include/uapi/asm/perf_regs.h"
>  
>  #define PERF_REGS_MASK	((1ULL << PERF_REG_CSKY_MAX) - 1)
>  #define PERF_REGS_MAX	PERF_REG_CSKY_MAX
> diff --git a/tools/perf/arch/loongarch/include/perf_regs.h b/tools/perf/arch/loongarch/include/perf_regs.h
> index 45c799fa5330..b86078a55e90 100644
> --- a/tools/perf/arch/loongarch/include/perf_regs.h
> +++ b/tools/perf/arch/loongarch/include/perf_regs.h
> @@ -4,7 +4,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/loongarch/include/uapi/asm/perf_regs.h"
>  
>  #define PERF_REGS_MAX PERF_REG_LOONGARCH_MAX
>  
> diff --git a/tools/perf/arch/mips/include/perf_regs.h b/tools/perf/arch/mips/include/perf_regs.h
> index 7082e91e0ed1..66655f0c4fea 100644
> --- a/tools/perf/arch/mips/include/perf_regs.h
> +++ b/tools/perf/arch/mips/include/perf_regs.h
> @@ -4,7 +4,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/mips/include/uapi/asm/perf_regs.h"
>  
>  #define PERF_REGS_MAX PERF_REG_MIPS_MAX
>  
> diff --git a/tools/perf/arch/powerpc/include/perf_regs.h b/tools/perf/arch/powerpc/include/perf_regs.h
> index 1c66f6ba6773..22b492a3dd58 100644
> --- a/tools/perf/arch/powerpc/include/perf_regs.h
> +++ b/tools/perf/arch/powerpc/include/perf_regs.h
> @@ -4,7 +4,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/powerpc/include/uapi/asm/perf_regs.h"
>  
>  void perf_regs_load(u64 *regs);
>  
> diff --git a/tools/perf/arch/riscv/include/perf_regs.h b/tools/perf/arch/riscv/include/perf_regs.h
> index d482edb413e5..89d5bbb8d2b8 100644
> --- a/tools/perf/arch/riscv/include/perf_regs.h
> +++ b/tools/perf/arch/riscv/include/perf_regs.h
> @@ -6,7 +6,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/riscv/include/uapi/asm/perf_regs.h"
>  
>  #define PERF_REGS_MASK	((1ULL << PERF_REG_RISCV_MAX) - 1)
>  #define PERF_REGS_MAX	PERF_REG_RISCV_MAX
> diff --git a/tools/perf/arch/s390/include/perf_regs.h b/tools/perf/arch/s390/include/perf_regs.h
> index 130dfad2b96a..9c95589965fe 100644
> --- a/tools/perf/arch/s390/include/perf_regs.h
> +++ b/tools/perf/arch/s390/include/perf_regs.h
> @@ -3,7 +3,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/s390/include/uapi/asm/perf_regs.h"
>  
>  void perf_regs_load(u64 *regs);
>  
> diff --git a/tools/perf/arch/x86/include/perf_regs.h b/tools/perf/arch/x86/include/perf_regs.h
> index f209ce2c1dd9..5495e5ca7cdc 100644
> --- a/tools/perf/arch/x86/include/perf_regs.h
> +++ b/tools/perf/arch/x86/include/perf_regs.h
> @@ -4,7 +4,7 @@
>  
>  #include <stdlib.h>
>  #include <linux/types.h>
> -#include <asm/perf_regs.h>
> +#include "../../../../arch/x86/include/uapi/asm/perf_regs.h"
>  
>  void perf_regs_load(u64 *regs);
>  

