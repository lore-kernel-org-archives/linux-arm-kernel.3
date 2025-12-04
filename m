Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A2FD1F9D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4OSnOKzbu5cbxbklT751VmZfbralVfKLxKt4n1nav0=; b=JUdMosb9ddiwhS7D9Q4k4AGYlX
	PM4fXHnlRDnNedulctDj6h6aF/9CExd8UgMxCBPcZMI+f0uP8xxLQfl3A1mzKN3fkyq1zkb8n6v7l
	q8K4rM5H/cIe1zEIY056BWznBtfm4CUXJm98K8yKvnEJjTtObc7ZqJIHKLH/5h6BNM39fke5ZIKTS
	p706pBk7PAEchtL8GUsW99km/wgiix+nKao+wkSh6H3lFA7bVx5tyVm+9xvLjNOJGEQwq/DavnpTm
	9xbN3GH+6J5Z/xl3OCsG1R/j4UhOePJyC8PWFySOsGfK2bnP/m+RC+1mlSKn94/3eXEuFDJ4atzkN
	CvwY4bSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8OZ-00000007ygb-3hiT;
	Thu, 04 Dec 2025 12:25:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8OX-00000007ygE-4262
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:25:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B108339;
	Thu,  4 Dec 2025 04:25:05 -0800 (PST)
Received: from [10.163.49.196] (unknown [10.163.49.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FD283F73B;
	Thu,  4 Dec 2025 04:25:06 -0800 (PST)
Message-ID: <26841df4-04d5-45d6-b589-e6061db2ad33@arm.com>
Date: Thu, 4 Dec 2025 17:55:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] coresight: trbe: Remove redundant disable operation
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
 <20251201-trbe_buffer_refactor_v1-1-v1-2-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-2-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_042514_146418_CE27BA68 
X-CRM114-Status: GOOD (  21.41  )
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
> The trace unit is already disabled when trbe_stop_and_truncate_event()
> is called, so draining and stopping the buffer in the function is
> redundant.
> 
> Remove the unnecessary disable operation and rename the function to
> trbe_truncate_event() to better reflect its purpose.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 0ddb3db0213cf0014e29decfb79da68b0a351b31..2f44e4a65e0ee2b2c8fdd06a51ab01fc57f44a4e 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -284,18 +284,10 @@ static void trbe_report_wrap_event(struct perf_output_handle *handle)
>  	perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
>  }
>  
> -static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
> +static void trbe_truncate_event(struct perf_output_handle *handle)
>  {
>  	struct trbe_buf *buf = etm_perf_sink_config(handle);
>  
> -	/*
> -	 * We cannot proceed with the buffer collection and we
> -	 * do not have any data for the current session. The
> -	 * etm_perf driver expects to close out the aux_buffer
> -	 * at event_stop(). So disable the TRBE here and leave
> -	 * the update_buffer() to return a 0 size.
> -	 */
> -	trbe_drain_and_disable_local(buf->cpudata);
>  	perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
>  	perf_aux_output_end(handle, 0);
>  	*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
> @@ -1008,7 +1000,7 @@ static int __arm_trbe_enable(struct trbe_buf *buf,
>  	trbe_enable_hw(buf);
>  	return 0;
>  err:
> -	trbe_stop_and_truncate_event(handle);
> +	trbe_truncate_event(handle);
>  	return ret;
>  }
>  
> @@ -1169,7 +1161,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>  		trbe_handle_spurious(handle);
>  		break;
>  	case TRBE_FAULT_ACT_FATAL:
> -		trbe_stop_and_truncate_event(handle);
> +		trbe_truncate_event(handle);
>  		truncated = true;
>  		break;
>  	}
> 

In arm_trbe_irq_handler() function trbe_drain_and_disable_local() is
called early on before TRBE_FAULT_ACT_FATAL gets handled but for the
other case __arm_trbe_enable() - do all the code paths leading upto
present trbe_stop_and_truncate_event() would have definitely called
trbe_drain_and_disable_local() as well ? If yes, please do call out
those code paths clearly in the commit message.

Besides it might be worth adding an WARN_ON() in trbe_truncate_event()
if the TRBE has not been disabled as now being expected there.

