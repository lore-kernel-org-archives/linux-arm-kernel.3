Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2953C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjbOp+3BOLKxxlxRPqy5brTID/c9//fiELRgyX/WBWQ=; b=wP5bayu7UcaMtck+ZZq11fjMQ4
	NCqgQu4DewJTjQRcWFQjFrkekmHvKiZQrzqhCEqmYn/v+63SpJXVaMYGs+NrKWCaU6rj8R6c2Y++g
	dngEK15CZCvSukPZLr9TQOQ8J8OP0VJTCZcKioC9BjJfSrVUAm/laGU1KQ+BqUSrwo2Q8EKRUtVLG
	J+VXGKZuMZAxshn4j4WS7FNmwiTf7LMEozWqN+s02mijFXgeBIjA81x6D0EWNJSNV/YjlVqe58lvD
	k5bOXJXJoptLeacxeQ5ZMUPPoPCxZkSFPhbAuH81hRDjyRZaUH7D4MABXomeIrSjlHkhA3NA+3J+G
	7vM7LxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolEm-00000005u56-0aXq;
	Tue, 28 Jul 2026 17:05:04 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolEl-00000005u4s-0aQg;
	Tue, 28 Jul 2026 17:05:03 +0000
Message-ID: <2daec1bc-e495-480b-80c1-f3cac78a8729@infradead.org>
Date: Tue, 28 Jul 2026 10:04:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] coresight: coresight.h: add '*' to kernel-doc lines
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org
Cc: James Clark <james.clark@arm.com>, Tao Zhang <quic_taozha@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Danilo Krummrich <dakr@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20260719222456.2831456-1-rdunlap@infradead.org>
 <15b45589-b93a-4814-ae27-76480254a4e8@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <15b45589-b93a-4814-ae27-76480254a4e8@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 7/27/26 10:31 PM, Anshuman Khandual wrote:
> 
> 
> On 20/07/26 3:54 AM, Randy Dunlap wrote:
>> kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
>> a beginning '*' in them, so fix these lines.
>>
>> Also convert struct coresight_trace_id_map to kernel-doc format to
>> remove another warning.
>>
>> Warning: include/linux/coresight.h:173 bad line:
>>   connected to @src_port. NULL until the device is created
>> Warning: include/linux/coresight.h:177 bad line:
>>   needs to be filtered.
>> Warning: include/linux/coresight.h:236 This comment starts with '/**',
>>   but isn't a kernel-doc comment.
>>
>> Fixes: ec9903d6cc34 ("coresight: Add support for trace filtering by source")
>> Fixes: d49c9cf15f89 ("coresight: Rename connection members to make the direction explicit")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> v2: rebase & resend
>> v3: rebase & resend
>>
>> Cc: James Clark <james.clark@arm.com>
>> Cc: Tao Zhang <quic_taozha@quicinc.com>
>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Cc: coresight@lists.linaro.org
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Mike Leach <mike.leach@arm.com>
>> Cc: Leo Yan <leo.yan@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>  include/linux/coresight.h |    6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> --- linux-next-20260717.orig/include/linux/coresight.h
>> +++ linux-next-20260717/include/linux/coresight.h
>> @@ -177,11 +177,11 @@ struct coresight_desc {
>>   * @dest_port:	destination's input port number @src_port is connected to.
>>   * @dest_fwnode: destination component's fwnode handle.
>>   * @dest_dev:	a @coresight_device representation of the component
>> -		connected to @src_port. NULL until the device is created
>> + *		connected to @src_port. NULL until the device is created
>>   * @link: Representation of the connection as a sysfs link.
>>   * @filter_src_fwnode: filter source component's fwnode handle.
>>   * @filter_src_dev: a @coresight_device representation of the component that
>> -		needs to be filtered.
>> + *		needs to be filtered.
>>   *
>>   * The full connection structure looks like this, where in_conns store
>>   * references to same connection as the source device's out_conns.
>> @@ -234,7 +234,7 @@ struct coresight_sysfs_link {
>>  #define CORESIGHT_TRACE_IDS_MAX 128
>>  
>>  /**
>> - * Trace ID map.
>> + * struct coresight_trace_id_map - Trace ID map.
>>   *
>>   * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
>>   *		Initialised so that the reserved IDs are permanently marked as
>>
> 
> But still there are more warnings left in the documentation file
> even after the patch applied. Should they be fixed as well ?

Yes, I know that. Hopefully someone with expertise in this area can add a few
comments there.

> ./scripts/kernel-doc -none include/linux/coresight.h
> Warning: include/linux/coresight.h:216 struct member 'src_dev' not described in 'coresight_connection'
> Warning: include/linux/coresight.h:216 struct member 'src_refcnt' not described in 'coresight_connection'
> Warning: include/linux/coresight.h:216 struct member 'dest_refcnt' not described in 'coresight_connection'
> Warning: include/linux/coresight.h:248 struct member 'cpu_map' not described in 'coresight_trace_id_map'
> Warning: include/linux/coresight.h:248 struct member 'lock' not described in 'coresight_trace_id_map'
> Warning: include/linux/coresight.h:312 struct member 'perf_sink_id_map' not described in 'coresight_device'

Note that half of these are just duplicates of the lines above.

> Warning: include/linux/coresight.h:216 struct member 'src_dev' not described in 'coresight_connection'
> Warning: include/linux/coresight.h:216 struct member 'src_refcnt' not described in 'coresight_connection'
> Warning: include/linux/coresight.h:216 struct member 'dest_refcnt' not described in 'coresight_connection'
> Warning: include/linux/coresight.h:248 struct member 'cpu_map' not described in 'coresight_trace_id_map'
> Warning: include/linux/coresight.h:248 struct member 'lock' not described in 'coresight_trace_id_map'
> Warning: include/linux/coresight.h:312 struct member 'perf_sink_id_map' not described in 'coresight_device'

thanks.
-- 
~Randy


