Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2B0C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4KizUfNPZgrJRlUtGPohC9jDO8etBfPGl/ghgmiGy4=; b=V6Vwe7TC8ck/SInZxTWePZuXS6
	yfs1MrhL0+xJ78mwXv5uUy1w2+wxcjo2Kv1t7643ZMOq7NBMMDSCUV9wZBBJrAQgkO9wWabmTQ/rn
	yDLzNKgDyFPJKakJscKpBwWuZdcGIUU0o7thYMqioJ7QSX4Cio6EmY8JKOFs7qxPh3HlxiBCjU7aV
	SCu6iSmGhda8lNYCgDZ3MxdyWrG8kAPkn4p4GqKGbOXamX5J8rTqvUJmxbaY1n5bcW6b2o6Ryq7hM
	W9QH+HCFs8aBKnispm6qZJ8lFBKPAJJTPCm5QBPWdc1n0XfEV2SY5J66QH4wE/oEst+KkRz9/Hi0u
	o8ELan1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbGi-0000000Ezon-3IGk;
	Wed, 07 May 2025 09:40:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaVa-0000000EpA0-0R9w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:52:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 478962B;
	Wed,  7 May 2025 01:51:55 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A89853F673;
	Wed,  7 May 2025 01:52:03 -0700 (PDT)
Message-ID: <069e920c-7023-4a6d-b1c6-dc87ac9d2360@arm.com>
Date: Wed, 7 May 2025 09:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
 <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
 <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
 <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
 <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4a6a8bad-e5d9-4613-a839-5a21491ef7c4@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_015206_240687_887DA64D 
X-CRM114-Status: GOOD (  14.73  )
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

On 07/05/2025 05:26, Yuanfang Zhang wrote:
> 
> 
> On 5/6/2025 7:20 PM, Suzuki K Poulose wrote:
>> On 14/04/2025 10:16, Yuanfang Zhang wrote:
>>>
>>>
>>> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>>>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>>>> which is an integration hierarchy integrating functionalities of TPDA
>>>>> and funnels. It aggregates the trace and transports to coresight trace
>>>>> bus.
>>>>>
>>>>> Compared to current configuration, it has the following advantages:
>>>>> 1. Reduce wires between subsystems.
>>>>> 2. Continue cleaning the infrastructure.
>>>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>>>
>>>>>      +------------------------+                +-------------------------+
>>>>>      | Video Subsystem        |                |Video Subsystem          |
>>>>>      |       +-------------+  |                |       +------------+    |
>>>>>      |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>>>      |       +-------------+  |                |       +------------+    |
>>>>>      |            |           |                |              |          |
>>>>>      |            v           |                |              v          |
>>>>>      |   +---------------+    |                |        +-----------+    |
>>>>>      |   | Video funnel  |    |                |        |Video TNOC |    |
>>>>>      |   +---------------+    |                |        +-----------+    |
>>>>>      +------------|-----------+                +------------|------------+
>>>>>                   |                                         |
>>>>>                   v-----+                                   |
>>>>> +--------------------|---------+                         |
>>>>> |  Multimedia        v         |                         |
>>>>> |  Subsystem   +--------+      |                         |
>>>>> |              |  TPDA  |      |                         v
>>>>> |              +----|---+      |              +---------------------+
>>>>> |                   |          |              |    Aggregator TNOC  |
>>>>> |                   |          |              +----------|----------+
>>>>> |                   +--        |                         |
>>>>> |                     |        |                         |
>>>>> |                     |        |                         |
>>>>> |              +------v-----+  |                         |
>>>>> |              |  Funnel    |  |                         |
>>>>> |              +------------+  |                         |
>>>>> +----------------|-------------+                         |
>>>>>                     |                                       |
>>>>>                     v                                       v
>>>>>          +--------------------+                    +------------------+
>>>>>          |   Coresight Sink   |                    |  Coresight Sink  |
>>>>>          +--------------------+                    +------------------+
>>>>
>>>> If each NOC has TraceID, how do you reliably decode the trace ?
>>>> Is there a single NOC/TPDA in the path from Source to sink ?
>>>
>>> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
>>> from Source to sink. In the example, only the aggregator TNOC has traceID.
>>> Decode trace relying on TraceID + Inport number.
>>> It can has mutiple TNOC/TPDA in one path.
>>
>> So do we only describe the TNOCs that need traceId in the DT ? (e.g., Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
>> trace id for it by default, when it is described ?
>>
>> Suzuki
>>
> yes, now only describe the TNOCs which need traceID, Video TNOC is another type, it is interconnect TNOC which collects trace from subsystems
> and transfers Aggr TNOC, it doesn't have ATID. Its driver is different from this patch, I want to describe it when upstream its driver.

Thanks! Please could you make sure to describe all of this when sending
out a patch in the cover letter ?

Cheers
Suzuki


> 
> Yuanfang
> 
> 
> 
> 
> 
> 


