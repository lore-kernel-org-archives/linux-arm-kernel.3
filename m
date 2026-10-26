Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B45606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQcfiWtK;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p7nArzjB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WY39dyeqsgK86vcC/6EADKb5rGDw+mM3bQAPuS8Ym0k=; b=FQcfiWtKSgGV5X
	WCYWdPwpKoi18w/FRzVqHV1akp9v2iDn675ThAK2KjFnNE74/6eQnutMU0toA/wDctCSljhegNLDS
	THvGXVT5QLvUiNdR/Kppbr2lSclkdJMTOKIHId9yysd5PxFo+ekXLotwUc64gSpkguq9kUs0yTzXS
	U/2nOzllPqhKQwfP5TPB5Yo3YF/A4ZCNJ4IQrvHbiLrCjHfOVAlgaC+dsgXuOB+HmqOKeslsB5vgQ
	jpU+BF+pGmAWN4aFshnSnoFWq4mNXRpyovswo2ua89/GawD7Fww4/jGh+7d1pplb3wCu1cbgcyaPP
	Iw83dcBW27pb+g02Us+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHM9-0000000284d-343Q;
	Mon, 26 Oct 2026 09:51:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHM7-0000000283z-1mlb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:51:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48e46e449e8so802378f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008261; x=1793613061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WY39dyeqsgK86vcC/6EADKb5rGDw+mM3bQAPuS8Ym0k=;
        b=p7nArzjBXt8+QB8D3XZLYSn7Dk5pNP0xcZqlRX+tHNII1kCMFjo38NliYz80dnTeJn
         dUhoNyieqT0Fnx4aGmF24o60gP/XzwA5puoE63te8GYBKtiZS60Ctrj457QxuHkjZwBP
         dCLCMDd7gZAvdOyksLNwBB/RllvTDbmzM1F/I7XINtDIj9a6nFveiAxsnxRNzNU/5Zl3
         kYpx1Uzm4ceykucJbhBe+HaHMrLqqPigFTpQ/JPhFSaHBYuHsdtdTIxxIhswsz2rCxbv
         Lvb+9fEx0Ybn+nU+LrRPddPiVwU/HsmNjHGVkUTm1WSfngv0SrAeXMRZlFRfeqZKNuSw
         SxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008261; x=1793613061;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WY39dyeqsgK86vcC/6EADKb5rGDw+mM3bQAPuS8Ym0k=;
        b=BjUadk9PQ2WQtuON9tM3B4r0tO6n3Q+W47PkTycrk1in4dJBQAoZZDiETrtDCLFkfx
         f2q1LKcsAJHXX6RqVrbKjj+i2WIqB79rVT4DnC23H2bsVDu7OkpYnt6bGl1b0fGCiWCe
         jixAsDn87NR1Ey1mxnOc83992RdBrIPz3BXuWvRx5YgriTPLA4gCxRTrugK0pwQpddg8
         4x0a7ufqEjz+uTtFyi0oZsff/Dh4dgW9MGlzMwKGBjIg5MTfGV62x3JRL7bSk1r3D7uJ
         xgbRx1PlnuDhyXAGz41fCJ1aLCYiCTYEri5urGBDXorECRL6H89o4TUUsDqLRdpgtQIv
         9Rcg==
X-Forwarded-Encrypted: i=1; AKwUvBxVQCbWXvivKzf/V0HDFN4vvVosE2S1bYSSrCnRRWHupIH7goymcTmKYgpvPqva2t7y3Djqm5akoJDswL1Ugl9H@lists.infradead.org
X-Gm-Message-State: AFq9FYK1mBDo1c5kyQ3rJToqpVxj8+5S7opert+hT/e45F58h6ckgwia
	aomJ7oXx8zqwHclTz+LkaAZMo1sAi/H4qyA5ZYZ3K0kusl/duzuxEdsHctA1fa0FKBo=
X-Gm-Gg: AYBFou3dn/7qnbupiY8kJFkvZzWVn5f3bSg3MxVjpMqJtyuY5kWXLbZmeNdyofa7Fm8
	BTrnzVh3UqXTN1m0DH6AWO56nF8bswkfKtePi9bhrSi3P3kxWYqJPSCKg+fFPjcmboNh5TbVrSv
	fJ8dkFVdhhwcCVUp5ZsyahvOOmN3MutBFPXZhsepE8+IMtrRSeaDR78iy3U2SBvcq1eat9Z/tdd
	Ri460v/c5BzJFRkWE2s+ElZ5OSTVnppHux+JuLXu1AbPGuoNdlmicUknkEk0nPJEUUg9itHIR/b
	kFWt6QO6J8xOiLesxShYQzZdhx/t4C0p5m/FRUUQd41AbwORZMH090JMqtM0E4J6ZeDLwpHakjC
	AgYQqO6Ax6WxtxnpFNpleFaOkSn+Ip3NvtrG4uYlovw0f05bGEC7vx564xtTFVmNvCHslLt6XCH
	9QVzLXhRMqlmM6hIgnlHSiRzCYNzAifQ2Yco0Aa62iNe8djOyckcxRa/B6P6SGJHrzlYOcnH/b3
	chVZwIBtTGAT8scSl5ehoUAFYww5/OUd51vevXSyMdIwUKLDeyxgvBL+P+YujjaaoWzIsJWFaQl
	L+MEPA==
X-Received: by 2002:adf:ec50:0:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-48e3eb9c57amr8289007f8f.56.1793008261337;
        Mon, 26 Oct 2026 02:51:01 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm14021561f8f.22.2026.10.26.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:51:00 -0700 (PDT)
Message-ID: <aaaaa762-e0cc-4894-aed9-b160a70e0ddc@linaro.org>
Date: Mon, 26 Oct 2026 09:50:59 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Daniel Pereira <danielmaraboo@gmail.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <cover.1792907332.git.aaupov@fb.com>
 <cover.1792989860.git.aaupov@fb.com>
 <02268c4958153f6d2e549e4bd7b93f11ed79fa90.1792989860.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <02268c4958153f6d2e549e4bd7b93f11ed79fa90.1792989860.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025103_511019_C3A78597 
X-CRM114-Status: GOOD (  29.18  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 26/10/2026 05:48, Amir Ayupov wrote:
> Add ETMv4 configuration 'pmu_pulse' with 'extout_pulse' feature which
> requires an ETE whose PMU counts its external outputs
> (CS_CFG_MATCH_CAP_TRCEXTOUT): event 1 selects the always-true
> resource and drives TRCEXTOUT1 PMU event which pulses on every cycle
> while the trace unit is enabled.
> 
> Assisted-by: Devmate:Opus-5.5
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>   .../trace/coresight/coresight-config.rst      |  5 ++
>   .../trace/coresight/coresight-perf.rst        | 15 +++++
>   drivers/hwtracing/coresight/Makefile          |  1 +
>   .../coresight/coresight-cfg-pmu-pulse.c       | 55 +++++++++++++++++++
>   .../coresight/coresight-cfg-preload.c         |  2 +
>   .../coresight/coresight-cfg-preload.h         |  2 +
>   6 files changed, 80 insertions(+)
>   create mode 100644 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
> 
> diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
> index 6d5ffa6f73471..3eed728bf0de1 100644
> --- a/Documentation/trace/coresight/coresight-config.rst
> +++ b/Documentation/trace/coresight/coresight-config.rst
> @@ -129,6 +129,11 @@ The following steps take place in the operation of a configuration.
>   
>   5) At the end of the perf session, the configuration will be disabled.
>   
> +The built-in 'pmu_pulse' configuration pulses ETM external output 1 for a PMU
> +event to count. It only pulses while the ETM is enabled, so combined with AUX
> +pause and resume the PMU event can time each trace window (see
> +coresight-perf.rst).
> +
>   
>   Viewing Configurations and Features
>   ===================================
> diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
> index 0a77741a431ef..6770a455c6b59 100644
> --- a/Documentation/trace/coresight/coresight-perf.rst
> +++ b/Documentation/trace/coresight/coresight-perf.rst
> @@ -109,6 +109,21 @@ Example for triggering AUX pause and resume with PMU event::
>           -e cycles/aux-action=pause,period=10000000/ \
>           -e cycles/aux-action=resume,period=1050000/ -- sleep 1
>   
> +ETM-timed pause events
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +The built-in ``pmu_pulse`` configuration pulses ETM external output 1 on every
> +cycle of allowed trace, and a PMU event counting that output pauses trace after
> +``N`` pulses, here 1000 cycles::
> +
> +  perf record -a -e cs_etm/pmu_pulse,aux-action=start-paused/u \
> +    -e cycles/aux-action=resume,period=10000000/u \
> +    -e trcextout1/aux-action=pause,period=1000/u \
> +    -- sleep 1
> +
> +Each window is about ``N`` traced cycles plus the pause interrupt latency.
> +The configuration only loads on an ETE whose PMU counts its external outputs.
> +
>   Perf test - Verify kernel and userspace perf CoreSight work
>   -----------------------------------------------------------
>   
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index ab16d06783a57..568e797ac5a17 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CORESIGHT) += coresight.o
>   coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
>   		coresight-sysfs.o coresight-syscfg.o coresight-config.o \
>   		coresight-cfg-preload.o coresight-cfg-afdo.o coresight-cfg-pstop.o \
> +		coresight-cfg-pmu-pulse.o \
>   		coresight-syscfg-configfs.o coresight-trace-id.o
>   obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
>   coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
> new file mode 100644
> index 0000000000000..61472154dd02a
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Pulse ETM external output 1 on every traced cycle for a PMU event to count.
> + * Based on coresight-cfg-afdo.c
> + */
> +
> +#include "coresight-config.h"
> +
> +/* ETMv4 includes and features */
> +#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
> +#include "coresight-etm4x-cfg.h"
> +
> +/*
> + * extout_pulse feature: event 1 selects the always-true resource, so ETM
> + * external output 1 pulses on every cycle while the trace unit is enabled. A
> + * PMU event counting that output (TRCEXTOUT1), for example with
> + * aux-action=pause, then fires after as many traced cycles as its sample
> + * period. Event 0 is avoided because it is the trace unit trigger, and the
> + * TRBE driver treats a detected trigger as fatal.
> + */
> +static struct cscfg_regval_desc extout_pulse_regs[] = {
> +	/* event 1: resource selector 1 (always true), drives external output 1 */
> +	{
> +		.type = CS_CFG_REG_TYPE_STD | CS_CFG_REG_TYPE_VAL_MASK,
> +		.offset = TRCEVENTCTL0R,
> +		.val32 = 0x0100,
> +		.mask32 = 0xff00,
> +	},
> +	/* end of regs */
> +};
> +
> +struct cscfg_feature_desc extout_pulse_etm4x = {
> +	.name = "extout_pulse",
> +	.description = "Pulse external output 1 on every traced cycle.\n",
> +	.match_flags = CS_CFG_MATCH_CLASS_SRC_ETM4 | CS_CFG_MATCH_CAP_TRCEXTOUT,
> +	.nr_regs = ARRAY_SIZE(extout_pulse_regs),
> +	.regs_desc = extout_pulse_regs,
> +};
> +
> +/* create a pmu_pulse configuration */
> +
> +static const char *pmu_pulse_ref_names[] = {
> +	"extout_pulse",
> +};
> +
> +struct cscfg_config_desc pmu_pulse_etm4x = {
> +	.name = "pmu_pulse",
> +	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
> +	"to count as TRCEXTOUT1\n",
> +	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
> +	.feat_ref_names = pmu_pulse_ref_names,
> +};
> +
> +/* end of ETM4x configurations */
> +#endif	/* IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) */
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.c b/drivers/hwtracing/coresight/coresight-cfg-preload.c
> index 4980e68483c5b..a9a60a1c40845 100644
> --- a/drivers/hwtracing/coresight/coresight-cfg-preload.c
> +++ b/drivers/hwtracing/coresight/coresight-cfg-preload.c
> @@ -14,6 +14,7 @@ static struct cscfg_feature_desc *preload_feats[] = {
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>   	&strobe_etm4x,
>   	&gen_etrig_etm4x,
> +	&extout_pulse_etm4x,
>   #endif
>   	NULL
>   };
> @@ -22,6 +23,7 @@ static struct cscfg_config_desc *preload_cfgs[] = {
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
>   	&afdo_etm4x,
>   	&pstop_etm4x,
> +	&pmu_pulse_etm4x,
>   #endif
>   	NULL
>   };
> diff --git a/drivers/hwtracing/coresight/coresight-cfg-preload.h b/drivers/hwtracing/coresight/coresight-cfg-preload.h
> index 291ba530a6a52..0058627f65ae5 100644
> --- a/drivers/hwtracing/coresight/coresight-cfg-preload.h
> +++ b/drivers/hwtracing/coresight/coresight-cfg-preload.h
> @@ -12,4 +12,6 @@ extern struct cscfg_feature_desc strobe_etm4x;
>   extern struct cscfg_config_desc afdo_etm4x;
>   extern struct cscfg_feature_desc gen_etrig_etm4x;
>   extern struct cscfg_config_desc pstop_etm4x;
> +extern struct cscfg_feature_desc extout_pulse_etm4x;
> +extern struct cscfg_config_desc pmu_pulse_etm4x;
>   #endif

Reviewed-by: James Clark <james.clark@linaro.org>


