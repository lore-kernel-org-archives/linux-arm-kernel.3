Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42208C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZPDJgZWgisJUQZrFyipZ8ejAC1WmZtOOAu1IAp9XnU=; b=aQ0KD5b3rdg5GoCC1pAwrDLm++
	cX2cM1YXiYM9AWeog4dGbEEA1GC5w5HjQxya90/T8q24tEjUTE//wcGIZe8mA4RhEufHv0YHLjfjQ
	29ht7Uf6wi0ZoRZ+nOWHwlkGgP0deW4ONGqtIIRIod9ZnIP1Q+DOgLkB27n0u8EsJ/XB1Ow771wPV
	QX1S/aG/iZCmB4qYXdMy+pUPIJ99ExxZ31CidUwC1Xoeo+5kp9RLtfFR2Eqe0fPkNkokLCiYvn7Tt
	4+HQ5k1OpP6T9kFfZQnej3hW5nZ0lp2tX7GLs/h5qq4C2tLgtkJnohEPq3BZVWvHj9vXOe6bkGqX/
	OPSedSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIwM-0000000841J-2xvJ;
	Wed, 12 Mar 2025 10:03:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIpg-000000083Av-0hzD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 09:57:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1957152B;
	Wed, 12 Mar 2025 02:57:09 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B443A3F5A1;
	Wed, 12 Mar 2025 02:56:58 -0700 (PDT)
Date: Wed, 12 Mar 2025 09:56:57 +0000
From: Leo Yan <leo.yan@arm.com>
To: Yujie Liu <yujie.liu@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Graham Woodward <graham.woodward@arm.com>, Paschalis.Mpeis@arm.com
Subject: Re: [PATCH] perf script: Fix typo in branch event mask
Message-ID: <20250312095657.GM9682@e132581.arm.com>
References: <20250312075636.429127-1-yujie.liu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312075636.429127-1-yujie.liu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_025700_253727_ABB74038 
X-CRM114-Status: GOOD (  16.13  )
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

On Wed, Mar 12, 2025 at 03:56:36PM +0800, Yujie Liu wrote:
> BRACH -> BRANCH
> 
> Fixes: 88b1473135e4 ("perf script: Separate events from branch types")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/perf/util/event.h                 | 2 +-
>  tools/perf/util/trace-event-scripting.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> index c7f4b4b841ca..664bf39567ce 100644
> --- a/tools/perf/util/event.h
> +++ b/tools/perf/util/event.h
> @@ -91,7 +91,7 @@ enum {
>  	PERF_IP_FLAG_VMENTRY		|\
>  	PERF_IP_FLAG_VMEXIT)
>  
> -#define PERF_IP_FLAG_BRACH_EVENT_MASK	\
> +#define PERF_IP_FLAG_BRANCH_EVENT_MASK	\
>  	(PERF_IP_FLAG_BRANCH_MISS |	\
>  	 PERF_IP_FLAG_NOT_TAKEN)
>  
> diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
> index 29cc467be14a..72abb28b7b5a 100644
> --- a/tools/perf/util/trace-event-scripting.c
> +++ b/tools/perf/util/trace-event-scripting.c
> @@ -347,7 +347,7 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
>  
>  	flags &= ~(PERF_IP_FLAG_TRACE_BEGIN | PERF_IP_FLAG_TRACE_END);
>  
> -	types = flags & ~PERF_IP_FLAG_BRACH_EVENT_MASK;
> +	types = flags & ~PERF_IP_FLAG_BRANCH_EVENT_MASK;
>  	for (i = 0; sample_flags[i].name; i++) {
>  		if (sample_flags[i].flags != types)
>  			continue;
> @@ -359,7 +359,7 @@ static int sample_flags_to_name(u32 flags, char *str, size_t size)
>  		break;
>  	}
>  
> -	events = flags & PERF_IP_FLAG_BRACH_EVENT_MASK;
> +	events = flags & PERF_IP_FLAG_BRANCH_EVENT_MASK;
>  	for (i = 0; branch_events[i].name; i++) {
>  		if (!(branch_events[i].flags & events))
>  			continue;
> 
> base-commit: b10f74308e1305275e69ddde711ec817cc69e306
> -- 
> 2.34.1
> 

