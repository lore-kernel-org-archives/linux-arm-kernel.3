Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1F1C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyJT1bsOJJb3erNdDexZnUT48V3qkT1w0Ls5m8q01as=; b=FoKHPfLgCB9NR3F0LCpD3Lz6qC
	T0mEq6LgW31QCjUtZpBhhn9MT8SeEk2dqjAG3BPAnPqgTaIrT3DUjCPUZz2ce29vfLm0PB0Y9q2op
	NTVUpKWfWbYfNGD5c4FKJxApBZxoJ2WcIO0ORZtC1OS3xWoczQWbT7um+DLl8CnC9qxKQJuv3Jcxq
	9yx54KYIPVTSMhahtSDA7kVyN+gK42BwykqqgPKtZ3QONGcBrKwJ4oSGp12Pa2RSsGEt0zccChK8B
	F/gs+Z76e9TZqwrAl0rNhq1ykpnAeaSHhWC/48/XZj0S9P0Grzy/FX8Ma2xygsvojnjqXTGi4lpFQ
	tixe6Otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIfr-0000000CCRQ-11Id;
	Tue, 06 May 2025 13:49:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGLv-0000000BiJ2-2VDR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:20:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94A9113E;
	Tue,  6 May 2025 04:20:36 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00BD13F58B;
	Tue,  6 May 2025 04:20:44 -0700 (PDT)
Message-ID: <9b75b9d1-a9ed-46c9-9dba-8e3eb261dcc0@arm.com>
Date: Tue, 6 May 2025 12:20:42 +0100
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
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_042047_723649_58352CA8 
X-CRM114-Status: GOOD (  12.10  )
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

On 14/04/2025 10:16, Yuanfang Zhang wrote:
> 
> 
> On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
>> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>>> which is an integration hierarchy integrating functionalities of TPDA
>>> and funnels. It aggregates the trace and transports to coresight trace
>>> bus.
>>>
>>> Compared to current configuration, it has the following advantages:
>>> 1. Reduce wires between subsystems.
>>> 2. Continue cleaning the infrastructure.
>>> 3. Reduce Data overhead by transporting raw data from source to target.
>>>
>>>     +------------------------+                +-------------------------+
>>>     | Video Subsystem        |                |Video Subsystem          |
>>>     |       +-------------+  |                |       +------------+    |
>>>     |       | Video TPDM  |  |                |       | Video TPDM |    |
>>>     |       +-------------+  |                |       +------------+    |
>>>     |            |           |                |              |          |
>>>     |            v           |                |              v          |
>>>     |   +---------------+    |                |        +-----------+    |
>>>     |   | Video funnel  |    |                |        |Video TNOC |    |
>>>     |   +---------------+    |                |        +-----------+    |
>>>     +------------|-----------+                +------------|------------+
>>>                  |                                         |
>>>                  v-----+                                   |
>>> +--------------------|---------+                         |
>>> |  Multimedia        v         |                         |
>>> |  Subsystem   +--------+      |                         |
>>> |              |  TPDA  |      |                         v
>>> |              +----|---+      |              +---------------------+
>>> |                   |          |              |    Aggregator TNOC  |
>>> |                   |          |              +----------|----------+
>>> |                   +--        |                         |
>>> |                     |        |                         |
>>> |                     |        |                         |
>>> |              +------v-----+  |                         |
>>> |              |  Funnel    |  |                         |
>>> |              +------------+  |                         |
>>> +----------------|-------------+                         |
>>>                    |                                       |
>>>                    v                                       v
>>>         +--------------------+                    +------------------+
>>>         |   Coresight Sink   |                    |  Coresight Sink  |
>>>         +--------------------+                    +------------------+
>>
>> If each NOC has TraceID, how do you reliably decode the trace ?
>> Is there a single NOC/TPDA in the path from Source to sink ?
> 
> Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
> from Source to sink. In the example, only the aggregator TNOC has traceID.
> Decode trace relying on TraceID + Inport number.
> It can has mutiple TNOC/TPDA in one path.

So do we only describe the TNOCs that need traceId in the DT ? (e.g., 
Aggregator TNOC above ?) How about Video TNOC ? Don't we allocate a
trace id for it by default, when it is described ?

Suzuki


