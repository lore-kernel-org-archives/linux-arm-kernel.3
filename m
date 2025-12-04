Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CD1D1F9D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaqOk1Elaki/Q+AoDDTW41NnBNg5d05Fm+RXSWNeEtw=; b=FTYx60TPPKBvNnXqmJetfMtdwo
	RBfm/6ZQq0nJ2OObk66OdhLIESsUTDtsMo2pR04yX3f5xj2jbeKnunwjNTadgah4HS4Tcqnk6egpH
	gbQZt2biTMacMNIbCxNVZkfRsu0K9X93c2sCBTi3q9hm49etMRChir2S74VOqTAPzijkHy/qoqY6E
	nkVf0Z894V01FIw6SUiSHCjtZSwl6mkzpi3x/xSeybTlPxdvLZ8rAKzhbHTlT6JOF1h7uwmXWghA2
	1oDuSYjddTuTIGlcX1MN01YPnmHic7rxsFpBz+Cbsr1SNTMQKosTXYaXqttrVcO2i3ps+r/BPSqOM
	0SIhGV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8gr-000000080I7-16yn;
	Thu, 04 Dec 2025 12:44:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8go-000000080Hl-2wEe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:44:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F02F339;
	Thu,  4 Dec 2025 04:43:58 -0800 (PST)
Received: from [10.163.49.196] (unknown [10.163.49.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A4C3F73B;
	Thu,  4 Dec 2025 04:43:59 -0800 (PST)
Message-ID: <789573eb-c12b-419f-80bc-3de65367583e@arm.com>
Date: Thu, 4 Dec 2025 18:13:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] coresight: trbe: Remove set_trbe_disabled() from
 the enable flow
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
 <20251201-trbe_buffer_refactor_v1-1-v1-4-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-4-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_044406_795582_E16B971B 
X-CRM114-Status: GOOD (  13.61  )
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
> set_trbe_disabled() should never appear in the enable flow, otherwise,
> it may potentially hide bugs in the disable flow.
> 
> Remove set_trbe_disabled() from the enable path.

IIRC without first disabling TRBLIMITR_EL1_E - TRBE registers or their
fields should not be fetched or interpreted. Without that none of the
subsequent HW operations should be performed inside trbe_enable_hw()
leading upto enabling it.

> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index f5597bd9b5fba9a8f5053d5823b03380fd468b5c..e426991e2c2c398a9d3982e9d0f7f542e404cbab 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -629,7 +629,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
>  	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
>  	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
>  	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> -	set_trbe_disabled(buf->cpudata);
>  	clr_trbe_status();
>  	set_trbe_base_pointer(buf->trbe_hw_base);
>  	set_trbe_write_pointer(buf->trbe_write);
> 


