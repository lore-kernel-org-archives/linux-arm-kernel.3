Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC2C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXo1BRun0/q9rVOZHKjEZVFNizTvfHTwhT0h/qJFQRA=; b=ZxopjtJ82MrR3M2QjDWjQP4nsn
	wzkbcBdfun/A32PpI+usha2XN/G/acYrvEuae7XBXaQMa3Fk0VdbJ18FWjs+F2+kiJmfD290QvVh6
	71rcD1rl3kxRVXBP6lKjvX2bqSSlXQ39k/sjGo99Eu98/JCkHfTvdhWIi6F9KXAOyp7lFKoyeyG+k
	AUhX7pBoPaJxjoFGh8Peb+z0V9v541u1+HSNtXMUbEu3pJcmrEktEcbwAX8MzOsCaC8zL9K63XL7u
	x2iFx65eJ1zFBuGO92SPKMFjWkU5NxOVAgU320YA9KU38hALsmdxu4xDWK6TRMdEU6C2LnopBc81/
	D2Bou+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrRE-0000000ASKT-42UY;
	Tue, 27 May 2025 10:21:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrP6-0000000AS3g-2Ff9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4FE114BF;
	Tue, 27 May 2025 03:19:09 -0700 (PDT)
Received: from [10.57.46.233] (unknown [10.57.46.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E2653F5A1;
	Tue, 27 May 2025 03:19:23 -0700 (PDT)
Message-ID: <4d54e620-abb9-4a36-bab0-3970c7e30a5f@arm.com>
Date: Tue, 27 May 2025 11:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250523085655.GD2566836@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_031928_623398_D938AB4B 
X-CRM114-Status: GOOD (  16.62  )
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

On 23/05/2025 09:56, Leo Yan wrote:
> On Fri, May 23, 2025 at 04:08:58PM +0800, Yuanfang Zhang wrote:
> 
> [...]
> 
>>>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>>>> +{
>>>> +    int atid;
>>>> +
>>>> +    atid = coresight_trace_id_get_system_id();
>>>> +    if (atid < 0)
>>>> +        return atid;
>>>> +
>>>> +    drvdata->atid = atid;
>>>
>>> Do you need to expose this via sysfs ? Otherwise, how can you map
>>> a trace to a TNOC at decoding ?
>>
>> yes, need to expose the atid via sysfs, but it better to expose it on source driver which connect with
>> this TNOC. so dont expose it on this driver.

But why ? How does that work ? The packets that come via TNOC 
(irrespective of the source(s)) will have the same ATID as that of the 
TNOC. So :

1) How does it help if the source exports the ID that was allocated in 
the TNOC driver ?

2) How does the source driver know the TraceID for exposing via sysfs ?
Does it expose its own traceid ?

> 
> If so, why the ID is not maintained in coresight_path::trace_id?
> 
> A source device allocates ID and maintains in coresight path, then
> this ID is passed (when enabling the link) to TNOC driver to consume it.

Good question, since we have the "path" maintaining the TraceID, we
should use that here for the TNOC. But the other question is, can there 
be multiple sources connected to a single TNOC ? (I am guessing, yes!. 
And thus it may not work with what you are proposing.

Cheers
Suzuki


> 
> Thanks,
> Leo




