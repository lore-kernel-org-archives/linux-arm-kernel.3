Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03464C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/0/a/7t6bOsa9a1UVGs3ae2LMUhWptr0bcCUjFZYyY=; b=vpUNVLr7PvaNeiuSaXNXLGWo0H
	BQ4t6QSPKTs+1+ohGNg40SIcVgWNMmtucUcWV/IhfPr27ZCstdmJhu/rRpCK2YS/v2ToJ+6ccR2J/
	5GJq5pr01aZFF4xvieaDO2PHk4kTIB9ev68BH/bWnTi8PtfNglXtwCnXmdpUtY65gyRR61Tk0pHjS
	FkU8cm8WmOk/D6yByLQqY1aJ1Ks06mII6xLnkneSsJMY65GZPb4r/Bc9vDU9Dj9/6yv5VqQUVDdtX
	7QCOnW4lQFYKqUk0OcOjEDRQIp9GahGai7o57HmsCLk4bFS+NS9XIx+iNGwiyxSTHhB1QZm9ohvZ/
	JjJUZxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKy7A-00000000Rff-43iz;
	Fri, 30 May 2025 11:41:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxyP-00000000QeT-1fIT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:32:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 342DC16F2;
	Fri, 30 May 2025 04:32:10 -0700 (PDT)
Received: from [10.57.48.160] (unknown [10.57.48.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E1363F5A1;
	Fri, 30 May 2025 04:32:24 -0700 (PDT)
Message-ID: <17abf8b5-8a2e-4573-a870-e2f98ad866a6@arm.com>
Date: Fri, 30 May 2025 12:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <3a19197d-b534-458c-b4d7-51fd9d2c954d@arm.com>
 <40599afc-4342-467c-87d8-3f53cbcfd242@quicinc.com>
 <20250523085655.GD2566836@e132581.arm.com>
 <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
 <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <62d1e4cb-cc13-4333-a160-66a280dca5f6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_043229_525101_1F046CC7 
X-CRM114-Status: GOOD (  25.67  )
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

On 30/05/2025 11:28, Yuanfang Zhang wrote:
> 
> 
> On 5/27/2025 6:19 PM, Suzuki K Poulose wrote:
>> On 23/05/2025 09:56, Leo Yan wrote:
>>> On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:
>>>
>>> [...]
>>>
>>>>>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>>>>>> +{
>>>>>> +    int atid;
>>>>>> +
>>>>>> +    atid = coresight_trace_id_get_system_id();
>>>>>> +    if (atid < 0)
>>>>>> +        return atid;
>>>>>> +
>>>>>> +    drvdata->atid = atid;
>>>>>
>>>>> Do you need to expose this via sysfs ? Otherwise, how can you map
>>>>> a trace to a TNOC at decoding ?
>>>>
>>>> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
>>>> this TNOC. so dont expose it on this driver.
>>
>> But why ? How does that work ? The packets that come via TNOC (irrespective of the source(s)) will have the same ATID as that of the TNOC. So :
>>
>> 1) How does it help if the source exports the ID that was allocated in the TNOC driver ?
>>
> The sources connecting to TNOC will have the same ATID which allocate in TNOC.
> This is convenient as users do not need to know which source is connected to this TNOC,
> to get ID can through reading the trace_id sysfs node in the source directory.
> 
>> 2) How does the source driver know the TraceID for exposing via sysfs ?
>> Does it expose its own traceid ?
> No, sources connecting to TNOC don't have their own traceid, it expose the ATID which allocated in TNOC.
> TNOC will maintain the ID in coresight_path:: trace_id, when enable source, the source can get it from path.
> 
> Here is the patch to expose id in source:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250530-showtraceid-v1-1-2761352cf7b4@quicinc.com/

Please don't do that. We don't have to fake a traceid for all sources.
It is only of use to the decoder, with manual input from the user. So,
someone using the TNOC based system must be aware of how to collect the
traceid and as such expose it from the TNOC and not all the other
sources connected to it.

Simply expose it on the TNOC device node


Suzuki


>>
>>>
>>> If so, why the ID is not maintained in coresight_path::trace_id?
>>>
>>> A source device allocates ID and maintains in coresight path, then
>>> this ID is passed (when enabling the link) to TNOC driver to consume it.
>>
> This is because there can be multiple sources connected to one TNOC, and these sources share one Trace ID, so the ID is allocated in TNOC.
> 
>> Good question, since we have the "path" maintaining the TraceID, we
>> should use that here for the TNOC. But the other question is, can there be multiple sources connected to a single TNOC ? (I am guessing, yes!. And thus it may not work with what you are proposing.
>>
>   
> yes, there can be multiple sources connected to one TNOC, and these sources share one Trace ID which allocate in TNOC.
> To decode the scenario relay on TraceID + Inport number, TraceID identifies the TNOC, the decoder maintains a table that maps each TNOC inport to its corresponding source.
> 
>> Cheers
>> Suzuki
>>
>>
>>>
>>> Thanks,
>>> Leo
>>
>>
>>
> 


