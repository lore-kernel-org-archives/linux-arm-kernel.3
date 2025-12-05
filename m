Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E85ED2CE1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 04:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dm4fzTrQHFVdZN9ZO6YzE0ufV7xQzNB90mJ8j47bUTw=; b=a5ydW2+6ZMXas7KOEeRG7UPIu+
	eAGvFVv52WjlV9HTHc+3bWRRWdFaypZbLlQ2dL1ZuO3ZmxGm7iTGApMakHh/lQv5wPnGxAXlvODcB
	lbZQZsfICdyyhaiMMWk4aqkFJYN92K1dKZnNw2S3/+h9j5qfO1hQbwIVwUhk6l8996iTm8H+YaydO
	rRvB6oG7+23YSUGVC5l8zH6aPvj37+KE/yMa4/kT1wNj+ZTHdmiX6G81N3VEdAnEqjqMjs5V4BF9f
	9pXXmWOGaKzA8yAnygTcmOqkdpZO4Ua8vlMVCM+rM1saObxkARuiwnpZqDRKh0d725AGyMIZ2wC0F
	KYjnmYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRNpY-000000092JG-2zCF;
	Fri, 05 Dec 2025 04:54:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRNpV-000000092Is-2WrU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 04:54:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F012339;
	Thu,  4 Dec 2025 20:53:56 -0800 (PST)
Received: from [10.163.52.42] (unknown [10.163.52.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD9C3F59E;
	Thu,  4 Dec 2025 20:53:57 -0800 (PST)
Message-ID: <ae9aacb1-29ae-4e05-ac55-0db555c3e455@arm.com>
Date: Fri, 5 Dec 2025 10:23:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] coresight: trbe: Support trigger and circle buffer
 modes
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_205405_784234_4F09C9FE 
X-CRM114-Status: GOOD (  18.36  )
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

On 01/12/25 4:51 PM, Leo Yan wrote:
> The current TRBE driver operates only in fill mode, where tracing stops
> at the top of buffer and a maintenance interrupt is raised.  Due to
> interrupt latency, tracing is halted while the program continues to run,
> resulting in trace data lose.
> 
> This series enhances the driver for the trigger mode to mitigate trace
> discontinuity.  The circle buffer mode is introduced to avoid any
> maintenance interrupts during the snapshot session.
> 
> It can be divided into three parts for easier review:
> 
>   Patches 01~05: Minor refactoring for disabling operations and
>                  clearing status.

Could these patches be posted first ?

>   Patches 06~12: Refactor fault action and trace size calculation.

Followed by this set which still keeps the existing functionality intact.

>   Patches 13~19: Support trigger and circle modes. To better utilize the
>                  new buffer modes, perf sets the watermark to
> 		 one-quarter of the buffer size.

Then finally all above changes which are newer functions and tests etc.

I guess that will be much easier to review.

> 
> This series is applied on coresight-next branch and has been validated
> on Orion O6 board:
> 
>   1) The trigger count and wrap mode are verified using Ftrace logs.
>   2) A new kunit test module verifies limit and count calculations.
>   3) Basic perf record / script commands and module load/unload have
>      been tested successfully.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Leo Yan (19):
>       coresight: trbe: Use helpers for checking errata
>       coresight: trbe: Remove redundant disable operation
>       coresight: trbe: Remove buffer disabling in trbe_handle_overflow()
>       coresight: trbe: Remove set_trbe_disabled() from the enable flow
>       coresight: trbe: Refactor status clearing
>       coresight: trbe: Refactor syndrome decoding
>       coresight: trbe: Refactor AUX flag setting
>       coresight: trbe: Use PERF_AUX_FLAG_PARTIAL instead of PERF_AUX_FLAG_COLLISION
>       coresight: trbe: Add fault action argument to trbe_handle_overflow()
>       coresight: trbe: Always check fault action when updating buffer
>       coresight: trbe: Apply overwrite erratum for only wrap event
>       coresight: trbe: Calculate size for buffer wrapping
>       coresight: trbe: Remove misleading comment
>       coresight: trbe: Refactor compute_trbe_buffer_limit()
>       coresight: trbe: Add static key for bypassing trigger mode
>       coresight: trbe: Support trigger mode
>       coresight: trbe: Enable circle mode for snapshot
>       coresight: trbe: Add kunit tests
>       perf: cs-etm: Set watermark for AUX trace
> 
>  drivers/hwtracing/coresight/Kconfig                |   9 +
>  drivers/hwtracing/coresight/Makefile               |   1 +
>  .../coresight/coresight-trbe-kunit-tests.c         | 536 +++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-trbe.c       | 440 +++++++++--------
>  drivers/hwtracing/coresight/coresight-trbe.h       | 111 ++++-
>  tools/perf/arch/arm/util/cs-etm.c                  |   7 +
>  6 files changed, 896 insertions(+), 208 deletions(-)
> ---
> base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
> change-id: 20251120-trbe_buffer_refactor_v1-1-8f8023105469
> 
> Best regards,


