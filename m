Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E851CE6748E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 23:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Igl9G1C4hOVKzBEFno2MrS2ZBovfo3EzzSumDWDVDac=; b=MEJy0CD7gV6JO1veRBHnPCggoO
	muDXJ1xvHnNzUkyjPdq09/ys8T4nBvpQenKb3ljZ4ZSty7icNXE4fez2yV+zxOMF0wPs+Jl9W4CEV
	ii6Mi/vio3lUKVigchClGgOlqZ52q+j1oQwzE9xTTdemttUmeeEFudUENcpzrN8FS9Szw+oM5Xfo2
	u5pZnn7JjFHDMTERXHaXajyZnsXMy6pjfRTkQ8/qvzEW8c/RtBuQOpL1pTSFN7D4D7/Fizy7AFqWt
	WFiQ93P6lOjlW+SWbpmp2AFWKOlQa02aEujWeK3BOalA9HXqMJY4/lKfingXSB93rNyw+lWOckAl9
	OapjuRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6eA1-000000057W9-0uUO;
	Thu, 31 Oct 2024 23:01:01 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6e8K-0000000578M-2rZb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 22:59:18 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0DC1F20C08A6;
	Thu, 31 Oct 2024 15:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0DC1F20C08A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1730415555;
	bh=Igl9G1C4hOVKzBEFno2MrS2ZBovfo3EzzSumDWDVDac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CA42Pkd8gk+aW8coxUfcz9FnbFPOm4DNzDPCYaaqMeDNXZyjHbYFoVBqFM2ra2QA0
	 gQ3Ywty+9jx/fcSph8pm89kL2on5UwnczZAJca3EIIJcEGpMxIV/b5GDAGfOiBWB5W
	 0uF5JXHULaaK+8SPYeqwgllQxC7n/jWbNL2sYcio=
Message-ID: <aecdc98c-1f12-4f17-b145-9f02aebc01c2@linux.microsoft.com>
Date: Thu, 31 Oct 2024 15:59:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add new headers for Hyper-V Dom0
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 luto@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 tyhicks@linux.microsoft.com
References: <1727985064-18362-1-git-send-email-nunodasneves@linux.microsoft.com>
 <fc47d535-ed52-4ca5-80cc-30003efdd464@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <fc47d535-ed52-4ca5-80cc-30003efdd464@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_155916_813722_8ABC9218 
X-CRM114-Status: GOOD (  24.42  )
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

On 10/31/2024 12:05 PM, Easwar Hariharan wrote:
> On 10/3/2024 12:50 PM, Nuno Das Neves wrote:
>> To support Hyper-V Dom0 (aka Linux as root partition), many new
>> definitions are required.
>>
>> The plan going forward is to directly import headers from
>> Hyper-V. This is a more maintainable way to import definitions
>> rather than via the TLFS doc. This patch series introduces
>> new headers (hvhdk.h, hvgdk.h, etc, see patch #3) directly
>> derived from Hyper-V code.
>>
>> This patch series replaces hyperv-tlfs.h with hvhdk.h, but only
>> in Microsoft-maintained Hyper-V code where they are needed. This
>> leaves the existing hyperv-tlfs.h in use elsewhere - notably for
>> Hyper-V enlightenments on KVM guests.
>>
>> An intermediary header "hv_defs.h" is introduced to conditionally
>> include either hyperv-tlfs.h or hvhdk.h. This is required because
>> several headers which today include hyperv-tlfs.h, are shared
>> between Hyper-V and KVM code (e.g. mshyperv.h).
>>
>> Summary:
>> Patch 1-2: Cleanup patches
>> Patch 3: Add the new headers (hvhdk.h, etc..) in include/hyperv/
>> Patch 4: Add hv_defs.h and use it in mshyperv.h, svm.h,
>>          hyperv_timer.h
>> Patch 5: Switch to the new headers, only in Hyper-V code
>>
>> Nuno Das Neves (5):
>>   hyperv: Move hv_connection_id to hyperv-tlfs.h
>>   hyperv: Remove unnecessary #includes
>>   hyperv: Add new Hyper-V headers
>>   hyperv: Add hv_defs.h to conditionally include hyperv-tlfs.h or
>>     hvhdk.h
>>   hyperv: Use hvhdk.h instead of hyperv-tlfs.h in Hyper-V code
>>

Hi Easwar, thanks for the questions. I will attempt to clarify.
> 
> What is the model for Hyper-V code that has both guest and host roles
> where the corresponding hypercalls are available for both? As I
> understand it, those are supposed to be in hvgdk*.h.
>

It's true that the naming of the files implies hvgdk*.h is for guests,
and hvhdk*.h (which includes hvgdk*.h), is for hosts/dom0. But I would
only take that as a rough guide.

The real reason for keeping these names is to make it a easier to copy
and maintain the definitions from the Windows code into Linux, by
keeping the provenance of exactly where they came from.

> For a specific example, IOMMU hypercalls can operate on stage 2 or stage
> 1 translations depending on the role of the (hyper) caller and the input
> values provided. Should a driver using these hypercalls import both
> hvhdk* and hvgdk*? What about hyperv-tlfs?
>

I'd recommend importing hvhdk.h since it contains everything you need
(including hvgdk*.h).

The goal of this patchset is to move away from hyperv-tlfs.h, because by
definition it should only contain definitions from the TLFS document.

> Patches 4 and 5 seem to draw a bright line between host and guest roles
> while the reality is more gray. Please do correct me if I'm wrong here,
> perhaps the picture would be clearer if Stas' suggestion of a new header
> file is implemented.
> 

Patches 4 and 5 introduce the new headers in a way that avoids any
potential impact on KVM and other non-Microsoft-maintained code.

The 'line' is not between guest and host, but between Microsoft-maintained
and non-Microsoft-maintained code.

Thanks,
Nuno

> Thanks,
> Easwar


