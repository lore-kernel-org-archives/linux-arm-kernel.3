Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92484CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZrglM0feZRMpVVMsK8QY3tN6/k1/wvtgT7x8DYEV1U=; b=mCPWDSiWOeLJLC8lCuUcKY57Uh
	2TdgDn5bFjD2/6eKVwoVAXOiMj3s811iywvTXzOnU3zLnGjMLx5BAd6k4A2RE6dLu+5I34pFICL/j
	ocskYi6Gx9P4yBv4RQcwuylXB2jsEhsIS/jky+JZopoxcvz4RfSRCKy6OsriLT59ESk+gHrukscvW
	3J3cNGRPVv5qjxQP33MzUCvAZ+J8fRiHwFJhX5rDZ/wVV9bnQWJq/SeZbS1QoSPAkP1O/0UJF20PQ
	gAxcbciqAd+DWb3D26R2hGAl7LHcwEDe6u1uOsSazg6VgZlNa8CVsqVdscowO5cyM9+4roeWquJSk
	QziGMQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJYE-0000000DWyJ-486z;
	Mon, 27 Oct 2025 09:30:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJYB-0000000DWxp-2MUB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 09:30:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0D7C1764;
	Mon, 27 Oct 2025 02:29:54 -0700 (PDT)
Received: from [10.57.67.85] (unknown [10.57.67.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D50373F673;
	Mon, 27 Oct 2025 02:30:00 -0700 (PDT)
Message-ID: <d71e09ff-c063-46d9-8d02-f69c18b6efe5@arm.com>
Date: Mon, 27 Oct 2025 09:29:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
 <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <b5762a05-8b63-4354-925e-fa3c8296e19f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_023003_647857_96CEE836 
X-CRM114-Status: GOOD (  13.90  )
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

On 27/10/2025 01:14, Jie Gan wrote:
> 
> 
> On 8/27/2025 6:55 PM, Jie Gan wrote:
>> Patchset 1 introduces configuration of the cross-trigger registers with
>> appropriate values to enable proper generation of cross-trigger packets.
>>
>> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
>> which determines the frequency of ASYNC packet generation. These packets
>> assist userspace tools in accurately identifying each valid packet.
>>
>> Patchset 3 introduces a sysfs node to initiate a flush request for the
>> specific port, forcing the data to synchronize and be transmitted to the
>> sink device.
>>
> 
> Gentle reminder.

Please could you fix the dates and version to v6.19 ?

Suzuki

> 
> Thanks,
> Jie
> 
>> Changes in V3:
>> 1. Optimizing codes according to James's comment.
>> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Changes in V2:
>> 1. Refactoring the code based on James's comment for optimization.
>> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1- 
>> jie.gan@oss.qualcomm.com/
>>
>> Tao Zhang (3):
>>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>>    coresight: tpda: add logic to configure TPDA_SYNCR register
>>    coresight: tpda: add sysfs node to flush specific port
>>
>>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>>   3 files changed, 360 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight- 
>> devices-tpda
>>
> 


