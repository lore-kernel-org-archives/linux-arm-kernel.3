Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1DEE81A2B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rN0LD0+Jc2ZRk7rh29C65kVWzS+Z7v/lYQfW13+vSlI=; b=K1wHqhiKH3WXnsyq450JE8A+I8
	zdU8OvXQ4yv+lbRM4QyIwCfTYF3GDjj7xEguDHxJZgScS5poZ2Llhqfdj7Q/GVJlrj6f4UmMydHPY
	muoGWngQJlYJVT5tRxWJJJOdPMjXPtlV6T8s37cutFpOiHVgwzY9CRCB1PxtHkalYjWuclnU4wrmR
	7E/GzOnOomX+RggDCXWKaguW/Aq6vEAe46FFEOsKWflGTimbMqLHeuECU93wsGnHyW0eXPRj/+6Vw
	L8vARe2glbz3nhnyGp8Mc/iZyZ/RdFeDTCBeXd+Tg3+ZnEqnTEhGBR6XMuGIM90tg1REP0VpA/5YL
	2oQOvbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzZB-00000006mz5-10Vu;
	Mon, 16 Feb 2026 14:27:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzZ8-00000006myj-23J9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 14:27:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61A841570;
	Mon, 16 Feb 2026 06:27:02 -0800 (PST)
Received: from [10.57.56.155] (unknown [10.57.56.155])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC51A3F6A8;
	Mon, 16 Feb 2026 06:27:04 -0800 (PST)
Message-ID: <9140efaa-dc54-4a1b-8936-3ef876ca9121@arm.com>
Date: Mon, 16 Feb 2026 14:27:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/46] arm64: Support for Arm CCA in KVM
From: Steven Price <steven.price@arm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <aY4Sf4lMlWd9LyTo@p14s> <55fc4877-666c-4d5f-a167-5692f7cfbd0b@arm.com>
Content-Language: en-GB
In-Reply-To: <55fc4877-666c-4d5f-a167-5692f7cfbd0b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_062710_644834_97279816 
X-CRM114-Status: GOOD (  34.80  )
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

On 16/02/2026 12:33, Steven Price wrote:
> On 12/02/2026 17:48, Mathieu Poirier wrote:
>> Hi Steven,
>>
>> On Wed, Dec 17, 2025 at 10:10:37AM +0000, Steven Price wrote:
>>> This series adds support for running protected VMs using KVM under the
>>> Arm Confidential Compute Architecture (CCA). I've changed the uAPI
>>> following feedback from Marc.
>>>
>>> The main change is that rather than providing a multiplex CAP and
>>> expecting the VMM to drive the different stages of realm construction,
>>> there's now just a minimal interface and KVM performs the necessary
>>> operations when needed.
>>>
>>> This series is lightly tested and is meant as a demonstration of the new
>>> uAPI. There are a number of (known) rough corners in the implementation
>>> that I haven't dealt with properly.
>>>
>>> In particular please note that this series is still targetting RMM v1.0.
>>> There is an alpha quality version of RMM v2.0 available[1]. Feedback was
>>> that there are a number of blockers for merging with RMM v1.0 and so I
>>> expect to rework this series to support RMM v2.0 before it is merged.
>>> That will necessarily involve reworking the implementation.
>>>
>>> Specifically I'm expecting improvements in:
>>>
>>>  * GIC handling - passing state in registers, and allowing the host to
>>>    fully emulate the GIC by allowing trap bits to be set.
>>>
>>>  * PMU handling - again providing flexibility to the host's emulation.
>>>
>>>  * Page size/granule size mismatch. RMM v1.0 defines the granule as 4k,
>>>    RMM v2.0 provide the option for the host to change the granule size.
>>>    The intention is that Linux would simply set the granule size equal
>>>    to its page size which will significantly simplify the management of
>>>    granules.
>>>
>>>  * Some performance improvement from the use of range-based map/unmap
>>>    RMI calls.
>>>
>>> This series is based on v6.19-rc1. It is also available as a git
>>> repository:
>>>
>>> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v12
>>>
>>> Work in progress changes for kvmtool are available from the git
>>> repository below:
>>>
>>> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v10
>>
>> The first thing to note is that branch cca/v10 does not compile due to function
>> realm_configure_parameters() not being called anywhere.  Marking the function as
>> [[maybe_unused]] solved the problem on my side.
> 
> This is in the kvmtool code - and yes I agree "work in progress" is a
> bit generous for the current state of that code, "horrid ugly hacks to
> get things working" is probably more accurate ;)
> 
> The issue here is that the two things that realm_configure_parameters()
> set up (hash algorithm and RPV) are currently unsupported with the Linux
> changes, but will need to be reintroduced in the future. So the contents
> of the functions which set this up (using the old uAPI) are just #if 0'd
> out.
> 
> Depending on the compile flags the code will compile with a warning, but
> using __attribute__((unused)) would at least make this clear. I'd want
> to avoid the "[[maybe_unused]]" as it's not used elsewhere in the code
> base and limits compatibility.
> 
>> Using the FVP emulator, booting a Realm that includes EDK2 in its boot stack
>> worked.  If EDK2 is not part of the boot stack and a kernel is booted directly
>> from lkvm, mounting the initrd fails.  Looking into this issue further, I see
>> that from a Realm kernel's perspective, the content of the initrd is either
>> encrypted or has been trampled on.  
> 
> I can reproduce that, a quick fix is to change INITRD_ALIGN:
> 
> #define INITRD_ALIGN	SZ_64K
> 
> But the code was meant to be able to deal with an unaligned initrd -
> I'll see if I can figure out what's going wrong.

Looks like a simple bug in kvm_arm_realm_populate_ram() - it wasn't
updating the source address when it had to align the start of the
region. Simple fix below:

---8<---
diff --git a/arm/aarch64/realm.c b/arm/aarch64/realm.c
--- a/arm/aarch64/realm.c
+++ b/arm/aarch64/realm.c
@@ -104,7 +104,7 @@ void kvm_arm_realm_populate_ram(struct kvm *kvm,
unsigned long start,

        new_region->start = ALIGN_DOWN(start, SZ_64K);
        new_region->file_end = ALIGN(start + size, SZ_64K);
-       new_region->source = source;
+       new_region->source = source - (start - new_region->start);

        list_add_tail(&new_region->list, &realm_ram_regions);
 }
---8<---

Thanks for the pointer, and I'll try to remember to include initrd
testing in future.

Steve


