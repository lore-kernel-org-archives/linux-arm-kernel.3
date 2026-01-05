Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CD8C2A072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7D+DpBQQtzNoK+sZqLLvdqEmAcXBK/tZuJsT5yOLvcc=; b=MRSWGMyDdVxe2nZouBR72JU9s+
	a+/hCuGux/Bs8NmuD2ycNiH9FM4kvXbcJN0govyXoYF4s3l6TAyODDTakT0T4wLz5ohGPFsio1ZcN
	bMGTrqD70XiLCYD2/ueDo739yYloaNoiCCWR8AX3yZ8rKfjEkmzX4uSDNX9K7663e7AKLnjnnA6a5
	UXDWK//Kaxwj6bsVEI+sCtG53Lts2U/tOYh7ec2EFVQeBVIx7iGPT27QyDAyqPSFpsQKhBUWsC2MU
	Dck9mNCCJgZ+ByHF+YkU7JnBENjgyHcQuAyn/aL/mu/ehNMJBQm9b0nYfFi9ZVsMv7heOtRSmjnAu
	/SULJkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgdq-0000000B35H-0EUr;
	Mon, 05 Jan 2026 09:12:46 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgdl-0000000B34d-0HhI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 09:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767604349; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7D+DpBQQtzNoK+sZqLLvdqEmAcXBK/tZuJsT5yOLvcc=;
	b=qoS7/xhCFWw2NIpf8IgLP0HaylDbTf+5v4c/dqOQACZBBHSiBpxhOFH8gmvyAdoolyxAyqyIBCWz5tJsBvL/UUu+W1oQsJtyqRRBVRb+BTGmNq6TkaUlQ5IxvcFz4aLLt/OWtGcDqgetn6izHdk0irubvFmfqCBQ1YMhE/QlFH8=
Received: from 30.221.133.192(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WwM6sCt_1767604345 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 05 Jan 2026 17:12:26 +0800
Message-ID: <0038141b-713f-4024-9f8b-e5f748f5a6a9@linux.alibaba.com>
Date: Mon, 5 Jan 2026 17:12:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] ARM Error Source Table V2 Support
To: Borislav Petkov <bp@alien8.de>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
 guohanjun@huawei.com, sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rafael@kernel.org, lenb@kernel.org,
 tony.luck@intel.com, yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com,
 fengwei_yin@linux.alibaba.com
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
 <20251230202211.GAaVQ0cx8o-CqzGU2O@fat_crate.local>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <20251230202211.GAaVQ0cx8o-CqzGU2O@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_011241_913048_37CD7FC5 
X-CRM114-Status: GOOD (  26.89  )
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

Thanks for the review and the comments.

在 2025/12/31 04:22, Borislav Petkov 写道:
> Some high-level notes first:
> 
> On Tue, Dec 30, 2025 at 05:09:28PM +0800, Ruidong Tian wrote:
>> This series introduces support for the ARM Error Source Table (AEST), aligning
>> with version 2.0 of ACPI for Armv8 RAS Extensions [0].
> 
> I'd like to hear from ARM folks what the strategy for this thing is...
That's a good point. I've CC'ed the ARM maintainers for their input.
> 
>> AEST provides a critical mechanism for hardware to directly notify the
>> operating system kernel about RAS errors via interrupts, a concept known as
>> Kernel-first error handling. Compared to firmware-first error handling
>> (e.g., GHES), AEST offers a more lightweight approach. This efficiency allows
>> the OS to potentially report every Corrected Error (CE), enabling upper-layer
>> applications to leverage CE information for error prediction[1][2].
>>
>> This series is based on Tyler Baicar's preliminary patches [3], which have not
>> yet been sent to the mailing list as v2.
> 
> I guess I'll wait for those first.
I tried to follow up with Tyler about his patches back in 2022[0] but 
got no reply. Since he no longer seems active on the Linux mailing list, 
I decided to pick this up and post this series myself to avoid this work 
being stalled.

[0]: 
https://lore.kernel.org/all/b365db02-b28c-1b22-2e87-c011cef848e2@linux.alibaba.com/
> 
>> AEST Driver Architecture
>> ========================
>>
>> The AEST driver is structured into three primary components:
>>    - AEST device: Responsible for handling interrupts, managing the lifecycle
>>                   of AEST nodes, and processing error records.
>>    - AEST node: Corresponds directly to a RAS node in the hardware
> 
> What is a "RAS node"?
A RAS node is the hardware interface for error reporting and control, 
consisting of one or more register sets (a collection of RAS records). 
It is responsible for error logging and interrupt signaling[0].

A single hardware component can feature multiple RAS nodes. For example, 
a memory controller is treated as a "RAS device", where each memory 
channel has its own RAS node. Interrupts generated by these nodes are 
typically aggregated into a single interrupt line managed at the RAS 
device level.

Comparison with x86 MCA:

RAS record ≈ MCA bank.
RAS node ≈ A set of MCA banks + CMCI on a core.

The key difference lies in uncore handling: x86 typically maps uncore 
errors (like those from a memory controller) into core-based MCA banks. 
In contrast, ARM requires uncore components to provide their own 
standalone RAS nodes. When a component requires multiple such nodes, 
they are grouped and managed as a "RAS device" in AEST driver.

[0]: https://developer.arm.com/documentation/ihi0100/latest
> 
>>    - AEST record: Represents a set of RAS registers associated with a specific
>>                   error source.
> 
> ...
> 
>> Address Translation
>> ===================
>>
>> As described in section 2.2 [0], error addresses reported by AEST records
>> may be "node-specific Logical Addresses" rather than the "System Physical
>> Addresses" (SPA) used by the kernel. Therefore, the driver needs to translate
>> these Logical Addresses (LA) to SPA. This translation mechanism is conceptually
>> similar to AMD's Address Translation Logic (ATL) [4], leading patch 0014 to
>> introduce a common translation function for both AMD and ARM architectures.
> 
> Say what now?
> 
> The ATL is very AMD-specific. What does "conceptually similar" mean exactly?
By "conceptually similar," I mean that both ARM and AMD share the same 
functional requirement: translating between a System Physical Address 
(SPA) and a device-specific address (like a DRAM address) for RAS purposes.

The goal here is not to share the hardware-specific translation logic, 
but to provide a unified interface (an abstraction layer). The actual 
implementation of the translation remains entirely architecture-specific.
> What happens if we have to change the ATL and break your use case in the
> process?
Since the implementations are decoupled, changes to the internals of 
AMD's ATL will not break the ARM use case. ARM would have its own 
backend implementation. They only share a common top-level API or 
wrapper to allow generic RAS/EDAC code to invoke the translation.
> 
> What exact functionality from the ATL do you really need here?
> 
> Thx.
> 


