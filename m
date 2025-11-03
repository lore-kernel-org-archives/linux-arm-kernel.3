Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265ABCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 20:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G48lqrWAp84CtID4B43TXDF7qk3ftwUyHuTZcwxiNGQ=; b=b32dnxvW4aeHrd0FkgO275Td9B
	8QdiPncmTPcJDtlNzjri3oJRydEhQ2J9ESzEztIjBryt8pcl1+R+SDRKvf3B6RPHKVRzlW3eDHm/M
	DD7u2nMBsLL8Lj77WzgD/6jRIsAjk8EhWe5uOzfOn9argNl99AS7M6ZIMED1PYw/sJHISAg1RS/q6
	iQ9ni+t3ueodQi6TuPSJMpiEPxUs9S8jiZY0mQtXy6YasaSuaUIBgzP8q+0PskD3vvORihj6KO8w/
	z3Ps3x/okYnTttJ5r4clBuJKSH2WjM0vIblVkkEbRKRV+TY4U7oTZP0jJo9lVpdGCels4kMoUrDmc
	XkUPuAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1F2-0000000AbfO-3DpI;
	Mon, 03 Nov 2025 20:33:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG1Ez-0000000AbfB-1VdK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 20:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FE11600AC;
	Mon,  3 Nov 2025 20:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8219EC4CEE7;
	Mon,  3 Nov 2025 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762202004;
	bh=KFUkblgsEEN8vjzJcuGJbVZaQoZIH0aQ8mp6eqbsoos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lEfWB4g1GdxFAt8hlanFY7fEBht94H5mGkqLwHdxhsLsE2X0yixYFGj0GpmBcyoWd
	 L7z2RcQferEDtJl/EEiGHiFLXzA2w1iFMy8zvcZKZb8I08Q9Hub5F7JMAF2Qma6pj9
	 2l19cmg7+ecolAxCb7+81aubrLESR9IR1fP3TCcYqzW6F9MJMeKVIAezxZYkB/0Vu0
	 MsBkrWlFEsqu2wWhjBvMwyAPfFCBtvCsccaUIxmTbjroOSBkCXTyMwpE9E/VJc6OWu
	 gTURDw3pn5LcsqKwQbaQGeAEM6MmOI98DU/kOkc5zvWtKGMzWjnYG6/zA22JUiAmx/
	 aEli4xMn44xiQ==
Date: Mon, 3 Nov 2025 17:33:20 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org,
	mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org,
	mingo@redhat.com, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] perf vendor events arm64 AmpereOneX: Fix spelling
 typo in the metrics file
Message-ID: <aQkRkLMYTGLVJAuZ@x1>
References: <20251103014633.1213-1-chuguangqing@inspur.com>
 <20251103014633.1213-2-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103014633.1213-2-chuguangqing@inspur.com>
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

On Mon, Nov 03, 2025 at 09:46:33AM +0800, Chu Guangqing wrote:
> The json file incorrectly used "acceses" instead of "accesses".

Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
 
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>  .../arch/arm64/ampere/ampereonex/metrics.json    | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> index 6817cac149e0..a29aadc9b2e3 100644
> --- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> +++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/metrics.json
> @@ -388,55 +388,55 @@
>          "MetricExpr": "L1D_CACHE_RW / L1D_CACHE",
>          "BriefDescription": "L1D cache access - demand",
>          "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "l1d_cache_access_prefetches",
>          "MetricExpr": "L1D_CACHE_PRFM / L1D_CACHE",
>          "BriefDescription": "L1D cache access - prefetch",
>          "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "l1d_cache_demand_misses",
>          "MetricExpr": "L1D_CACHE_REFILL_RW / L1D_CACHE",
>          "BriefDescription": "L1D cache demand misses",
>          "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "l1d_cache_demand_misses_read",
>          "MetricExpr": "L1D_CACHE_REFILL_RD / L1D_CACHE",
>          "BriefDescription": "L1D cache demand misses - read",
>          "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "l1d_cache_demand_misses_write",
>          "MetricExpr": "L1D_CACHE_REFILL_WR / L1D_CACHE",
>          "BriefDescription": "L1D cache demand misses - write",
>          "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "l1d_cache_prefetch_misses",
>          "MetricExpr": "L1D_CACHE_REFILL_PRFM / L1D_CACHE",
>          "BriefDescription": "L1D cache prefetch misses",
>          "MetricGroup": "Cache",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "ase_scalar_mix",
>          "MetricExpr": "ASE_SCALAR_SPEC / OP_SPEC",
>          "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) scalar operations",
>          "MetricGroup": "Instructions",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      },
>      {
>          "MetricName": "ase_vector_mix",
>          "MetricExpr": "ASE_VECTOR_SPEC / OP_SPEC",
>          "BriefDescription": "Proportion of advanced SIMD data processing operations (excluding DP_SPEC/LD_SPEC) vector operations",
>          "MetricGroup": "Instructions",
> -        "ScaleUnit": "100percent of cache acceses"
> +        "ScaleUnit": "100percent of cache accesses"
>      }
>  ]
> -- 
> 2.43.7
> 

