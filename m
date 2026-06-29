Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72880C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh9Erbi+bZmp6+xvHLZpEsSjlR79AfniAhrrqIy5qZw=; b=jb9yebYKWy5Um0pdBtU3QcS+UW
	8SkyuhOs//BWwhzvyMeCnc0R4IDvTSK8Qgitb0OJZEVcAioii9c7B3zRTjV6FQ13PBpAiQd13DLXm
	D5NrHbBdHlTw07UJ43H4t8ovo2sHUu8ImbsrQTggkw33GrHZfCc4kwQpOGgzooWHtGGspt9IJsjlI
	9N4tLkO56uL4RILwczyb05wdu4kiQpoT1/n0DXmT9cyCD1lAm2Ew3ShnHDXYbqk2ZXmZnAnyHvcOk
	0Ca1nF45ps07KBqiwD52ODEEAH8w1gF050QZkVO7MsAT0F2Hk0a2k2nfrhiEyQWq/756hrN6KkISi
	qMxLsw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9Td-0000000EMRH-0yQJ;
	Mon, 29 Jun 2026 10:44:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9TR-0000000EMOp-31q8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:44:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6EC3176C;
	Mon, 29 Jun 2026 03:44:13 -0700 (PDT)
Received: from [10.1.37.47] (Suzukis-MBP.cambridge.arm.com [10.1.37.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A29F3F836;
	Mon, 29 Jun 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782729858; bh=UrkKKcK7pnTq/Fb/9UsUrAYXCMMsm0da+M9gKv9FKR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JKpSgQhgh4ePCnA2/5BaQm4UuepM7qZpdL6L59co1VlGySQGcwtqbiR6eamAS1Caa
	 nJz5RT8Te5qAKaE6MweNw1jjqJldcxWOEXrrZ8b22H5DwYNtaO7i+KPl/rVuhkyOgW
	 IlSPL/bZJHpFP6qr96Kte3VmZkW3WPME1GY7/dAY=
Message-ID: <ce9a2121-8f7e-4ac2-8795-5ee602966e74@arm.com>
Date: Mon, 29 Jun 2026 11:44:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
Content-Language: en-GB
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
 mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, devicetree@vger.kernel.org
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
 <2026062959-distaste-launder-e253@gregkh>
 <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <c09d70e1-edd6-41a8-8ab3-db353bb6f8eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_034421_852540_A8EBEED8 
X-CRM114-Status: GOOD (  22.83  )
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

Hello,

On 29/06/2026 11:17, Songwei.Chai wrote:
> 
> On 6/29/2026 12:22 PM, Greg KH wrote:
>> On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
>>> Hi Greg & Alexander,
>>>
>>> Apologies for interrupting again.
>>>
>>> As the TGU hardware plays an important role in Qualcomm tracing 
>>> design, I
>>> would greatly appreciate it if you could kindly take some time to review
>>> this at your earliest convenience.
>> The merge window _just_ closed, please give us a chance to catch up.
>>
>> Also, why us?  Surely you have other reviewers for this code, right?
> 
> Hi Greg,
> 
> Understood, thanks for letting us know.
> 
> Regarding your question: since this introduces a new drivers/hwtracing/ 
> qcom directory, there is no existing maintainer for it.
> Given your scope (and Alexander's), we believe you are the most relevant 
> reviewers.
> 
> The reason for creating the qcom directory is as follows:
> 
> /We previously tried to upstream this driver under drivers/hwtracing/ 
> coresight,/
> /but it was not accepted as it is considered Qualcomm-specific and not 
> tightly/
> /coupled with the CoreSight subsystem. Based on this feedback, we are 

Some clarification here: This device is not CoreSight  so we denied
keeping this under drivers/hwtracing/coresight/ - Not because it is 
Qualcomm specific. We have TPDM, TPDA, TnoC devices under the coresight
subsystem, which are all Qualcomm specific for e.g.

That said, there are other drivers in drivers/hwtracing/ which I usually
merge and push to Greg, after some reviews/acks from the respective
people (e.g., PTT HiSilicon PCIe Tune and Trace).

But, your proposal was that there were other maintainers for your new 
subtree and you were going to push this via ,linux-arm-msm ? to which I
didn't have any objections.

That said, I am fine with pushing this to Greg via the CoreSight pull
requests (similar to Hisilicon PTT driver), but would need someone to
Maintain/Review the driver (with entries in MAINTAINERS, similar to
PTT).


Thoughts ?

Kind regards
Suzuki



> exploring/
> /a dedicated drivers/hwtracing/qcom directory, similar to intel_th, to 
> better/
> /support this and future Qualcomm hwtracing drivers./
> 
> More details can be found in “[PATCH v14 0/7] -- Why we are proposing 
> this”.
> 
> Thanks,
> Songwei
> 
>>
>> thanks,
>>
>> greg k-h


