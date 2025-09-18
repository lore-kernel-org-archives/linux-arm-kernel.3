Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DCFCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1avZBp4evDlhh67o+utoYVDsarM0T9O9NS2m/wter0w=; b=g5JvcBUtvOAxJWx0fg+UIhvSl3
	xpRiIeztCc2/Lb0kPJ3SjYTHLhl0u0Th9QBdLssqWz6GQ57jFgGqG4v7RqMe7DOWT/XtKwwv9dMKq
	ajMnZtId8YzIBeQmTMFowr182sWp78c+B6XgjyFyYngoJtgLHWPjLIYGCw7jezqx9rcwna/zgOsH0
	4ebDaxISomt36eNIWwCC7+eL6SX4htNpAjxo6rTarkfLb3H8HhM5Men2E93FAIWeND501jUEoWge9
	fOI/NwoSLiHEgYcVjr/5tQQKOWqdxdXVmkAFpFBO5Yl7XHaWKTq/ivoQZBI3xCPGwgrdWdZuXWuZY
	mH+r3gNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCA2-0000000H8c2-0C3S;
	Thu, 18 Sep 2025 10:46:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC9z-0000000H8al-2chz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:46:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13F51A2D;
	Thu, 18 Sep 2025 03:46:34 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 930233F673;
	Thu, 18 Sep 2025 03:46:38 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:46:12 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 4/7] arm64: cputype: Add Cortex-A720AE definitions
Message-ID: <aMvi9PdW5Nd9UMvE@J2N7QTR9R3.cambridge.arm.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87h5x0numo.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5x0numo.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034643_704224_7545D94D 
X-CRM114-Status: GOOD (  15.86  )
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

On Thu, Sep 18, 2025 at 06:26:55AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A720AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> ... in Table A-187
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 661735616787e..b10eba7f52476 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -96,6 +96,7 @@
>  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
>  #define ARM_CPU_PART_CORTEX_X925	0xD85
>  #define ARM_CPU_PART_CORTEX_A725	0xD87
> +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
>  
>  #define APM_CPU_PART_XGENE		0x000
> @@ -185,6 +186,7 @@
>  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
>  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
>  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
>  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
>  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
> -- 
> 2.43.0
> 

