Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C559D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gr0bVa9DLwUgPmNUodbBDpwD6SJxzoute/69IuFIVcE=; b=f4AqfkAnycHnH9YUp6T/4VVy1D
	HEBd4k7o2Dsmw/I4RAUyLmPQzTP5R0ua+V2zUqdeM5RbU2wsaGZs20Ck/ndruPFSaITidhLg6M9M7
	sW9jY1HDbpkqfS+V+2T/9y9kl026s10haiWCHYdTh1oiS1vuqgFwV5aEEwBf9oo5R+65iBHNs0ZU1
	pjgetXAMD/Tsz9qfhYjrDFs21L83tyZlxCEcz5e9Ev8lGKh36lzDYcuNpkCKKI0Psm5EYcvNFyKD+
	i1mQcLh6BDKRu/+fSncJ/+xNKZzONSnCxSTpQkHz3gDHug7J9Fw1YBYJGgfoztan2EGYlRVq6K0nN
	jJRSjjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDSm-00000006v6n-2eJl;
	Wed, 13 Nov 2024 13:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDOu-00000006uPv-0Ls3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Nov 2024 13:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gr0bVa9DLwUgPmNUodbBDpwD6SJxzoute/69IuFIVcE=; b=DHD2hD6lu46qqesNDnx/VQGCTV
	YteD0M6B05TJjhuXUrxTXJ4xhBetcO6eKUPgVMc5OJmJnE/U8/5+Nl/CPHFjhzbRNbi0YAgurT93s
	YA1DxlxBDzKTk8LH4fCiGcYLy53U8vuPcmp37d1iF7SGmtlE7BlJGPz3iIb3ybG15SdAnKQFZJvPS
	mowg2iwI29R+EaTNumg0W70vM98mAKUIVtrLZt3TK1EAhUCvOy1XfmdouoAxSVVI5RpHQaGh7bkWo
	QcV5fCPifNhmdX75+ZInz1qBYX4M5aHk9Oextw/ZBv8G0qpEdc8Pn2wyAbdYWwHMtIL18yFtcdzt9
	c3SoT01A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDOq-0000000DHDS-0Cis
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:27:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E1BC1655;
	Wed, 13 Nov 2024 05:27:38 -0800 (PST)
Received: from [10.1.29.78] (Suzukis-MBP.cambridge.arm.com [10.1.29.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAF6B3F66E;
	Wed, 13 Nov 2024 05:27:06 -0800 (PST)
Message-ID: <6424c536-2f2c-4a59-8b6d-f610201dc7a7@arm.com>
Date: Wed, 13 Nov 2024 13:27:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] coresight: Add support to get static id for system
 trace sources
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
 <20241104115604.14522-3-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241104115604.14522-3-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_132712_615998_122D6FF8 
X-CRM114-Status: GOOD (  27.37  )
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

On 04/11/2024 11:56, Mao Jinlong wrote:
> Dynamic trace id was introduced in coresight subsystem, so trace id is
> allocated dynamically. However, some hardware ATB source has static trace
> id and it cannot be changed via software programming. For such source,
> it can call coresight_get_static_trace_id to get the fixed trace id from
> device node and pass id to coresight_trace_id_get_static_system_id to
> reserve the id.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> ---
>   .../hwtracing/coresight/coresight-platform.c  |  6 +++
>   .../hwtracing/coresight/coresight-trace-id.c  | 39 +++++++++++++------
>   .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
>   include/linux/coresight.h                     |  1 +
>   4 files changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 64e171eaad82..633d96b9577a 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -796,6 +796,12 @@ int coresight_get_cpu(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_cpu);
>   
> +int coresight_get_static_trace_id(struct device *dev, u32 *id)
> +{
> +	return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", id);
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
> +
>   struct coresight_platform_data *
>   coresight_get_platform_data(struct device *dev)
>   {
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
> index d98e12cb30ec..df8fe50b413f 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.c
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.c
> @@ -12,6 +12,12 @@
>   
>   #include "coresight-trace-id.h"
>   
> +enum trace_id_flags {
> +	TRACE_ID_ANY = 0x0,
> +	TRACE_ID_PREFER_ODD = 0x1,
> +	TRACE_ID_REQ_STATIC = 0x2,
> +};
> +
>   /* Default trace ID map. Used in sysfs mode and for system sources */
>   static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
>   static struct coresight_trace_id_map id_map_default = {
> @@ -74,16 +80,18 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
>    * Otherwise allocate next available ID.
>    */
>   static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
> -					   int preferred_id, bool prefer_odd_id)
> +					   int preferred_id, unsigned int flags)
>   {
>   	int id = 0;
>   
>   	/* for backwards compatibility, cpu IDs may use preferred value */
> -	if (IS_VALID_CS_TRACE_ID(preferred_id) &&
> -	    !test_bit(preferred_id, id_map->used_ids)) {
> -		id = preferred_id;
> -		goto trace_id_allocated;
> -	} else if (prefer_odd_id) {
> +	if (IS_VALID_CS_TRACE_ID(preferred_id)) {
> +		if (!test_bit(preferred_id, id_map->used_ids)) {
> +			id = preferred_id;
> +			goto trace_id_allocated;
> +		} else if (flags & TRACE_ID_REQ_STATIC)
> +			return -EINVAL;

nit: EBUSY sounds like a better choice here ? Requested ID is not
available.

Additionally, do we need to handle a case where the preferred_id is
not valid ? I think we silently allocate a new trace id in such case ?

Rest looks good to me.

Suzuki




> +	} else if (flags & TRACE_ID_PREFER_ODD) {
>   	/* may use odd ids to avoid preferred legacy cpu IDs */
>   		id = coresight_trace_id_find_odd_id(id_map);
>   		if (id)
> @@ -153,7 +161,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
>   	 */
>   	id = coresight_trace_id_alloc_new_id(id_map,
>   					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
> -					     false);
> +					     TRACE_ID_ANY);
>   	if (!IS_VALID_CS_TRACE_ID(id))
>   		goto get_cpu_id_out_unlock;
>   
> @@ -188,14 +196,14 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
>   	DUMP_ID_MAP(id_map);
>   }
>   
> -static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
> +static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
> +					int preferred_id, unsigned int traceid_flags)
>   {
>   	unsigned long flags;
>   	int id;
>   
>   	spin_lock_irqsave(&id_map->lock, flags);
> -	/* prefer odd IDs for system components to avoid legacy CPU IDS */
> -	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
> +	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
>   	spin_unlock_irqrestore(&id_map->lock, flags);
>   
>   	DUMP_ID(id);
> @@ -255,10 +263,19 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
>   
>   int coresight_trace_id_get_system_id(void)
>   {
> -	return coresight_trace_id_map_get_system_id(&id_map_default);
> +	/* prefer odd IDs for system components to avoid legacy CPU IDS */
> +	return coresight_trace_id_map_get_system_id(&id_map_default, 0,
> +			TRACE_ID_PREFER_ODD);
>   }
>   EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
>   
> +int coresight_trace_id_get_static_system_id(int trace_id)
> +{
> +	return coresight_trace_id_map_get_system_id(&id_map_default,
> +			trace_id, TRACE_ID_REQ_STATIC);
> +}
> +EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
> +
>   void coresight_trace_id_put_system_id(int id)
>   {
>   	coresight_trace_id_map_put_system_id(&id_map_default, id);
> diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
> index 9aae50a553ca..db68e1ec56b6 100644
> --- a/drivers/hwtracing/coresight/coresight-trace-id.h
> +++ b/drivers/hwtracing/coresight/coresight-trace-id.h
> @@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *i
>    */
>   int coresight_trace_id_get_system_id(void);
>   
> +/**
> + * Allocate a CoreSight static trace ID for a system component.
> + *
> + * Used to allocate static IDs for system trace sources such as dummy source.
> + *
> + * return: Trace ID or -EINVAL if allocation is impossible.
> + */
> +int coresight_trace_id_get_static_system_id(int id);
> +
>   /**
>    * Release an allocated system trace ID.
>    *
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index c13342594278..129795873072 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
>   void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
>   
>   extern int coresight_get_cpu(struct device *dev);
> +extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
>   
>   struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
>   struct coresight_connection *


