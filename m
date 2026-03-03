Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DB3EDA697
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9a9MHHDvAS4GuJXkWSu8F0H8VmKDgo/AZP3thGDlWj4=; b=fpNDqzortauO4a21vlSunVuQi6
	m/9Ok/Ux7pg53YyaSeCaxw1ENwunPUBr3qj2ZswsxYM70vMJvddzSKVTmdcPkwf+w2E9pckl7t4ct
	tnBFcyI0Zc71TWk2+f0AHzLeWfFLNLfbQ4mXRdXrzEnrUAFcWE8vZP2tsbNvilziJO+WC6Azs3Ilt
	lwJZqcSN2vb2atSFKpwh61lCXwhnzKtCdYE5Fag5SYDz7QmxiimaqUwXpimcOPwFOGbbIN/0L7gst
	KA+UeTEZvuaEGcYA/m3mXFC2BVRP2OSV8tPulBS1eDo2V5aWVOdKxSA3NCxVH+cwwchhMc9ADtguo
	a8aQh9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSDA-0000000FVPC-0X7Y;
	Tue, 03 Mar 2026 16:03:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSD7-0000000FVOR-2Ed2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:03:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C1FF339;
	Tue,  3 Mar 2026 08:02:52 -0800 (PST)
Received: from [10.57.66.27] (unknown [10.57.66.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67C6E3F694;
	Tue,  3 Mar 2026 08:02:55 -0800 (PST)
Message-ID: <37b79d98-10e5-4beb-b95c-783d41050eae@arm.com>
Date: Tue, 3 Mar 2026 16:02:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/46] arm64: RMI: Define the user ABI
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-7-steven.price@arm.com> <86tsuy8g0u.wl-maz@kernel.org>
 <33053e22-6cc6-4d55-bc7f-01f873a15d28@arm.com>
 <9d702666-72a8-43e4-8ab3-548d8154a529@arm.com> <86fr6h838s.wl-maz@kernel.org>
 <d87ee902-3b5e-4cf9-8b97-d83f8da02a5a@arm.com> <86ecm17zeb.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86ecm17zeb.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_080301_974200_9E0406AE 
X-CRM114-Status: GOOD (  21.26  )
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

On 03/03/2026 14:37, Marc Zyngier wrote:
> On Tue, 03 Mar 2026 14:23:08 +0000,
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>> On 03/03/2026 13:13, Marc Zyngier wrote:
>>> On Mon, 02 Mar 2026 17:13:41 +0000,
>>> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>>>
>>>> More importantly, we have to make sure that the "RMI_PSCI_COMPLETE" is
>>>> invoked before both of the following:
>>>>     1. The "source" vCPU is run again
>>>>     2. More importantly the "target" vCPU is run.
>>>
>>> I don't understand why (1) is required. Once the VMM gets the request,
>>
>> The underlying issue is, the RMM doesn't have the VCPU object for the
>> "target" VCPU, to make the book keeping. Also, please note that for  a
>> Realm, PSCI is emulated by the "RMM". Host is obviously notified of the
>> "PSCI" changes via EXIT_PSCI (note, it is not SMCCC exit)
>>   so that it can be in sync with the real state. And does have a say in
>>   CPU_ON. So, before we return to running the "source" CPU,
>> Host must provide the target VCPU object and its consent (via
>> psci_status) to the RMM. This allows the RMM to emulate the PSCI
>> request correctly and also at the same time keep its book keeping
>> in tact (i.e., marking the Target VCPU as runnable or not).
>>
>> When a "source" VCPU exits to the host with a PSCI_EXIT, the RMM
>> marks the source VCPU has a pending PSCI operation, and
>> RMI_PSCI_COMPLETE request ticks that off, making it runnable again.
> 
> Sure. What I don't get is what this has to happen on the source vcpu
> thread. The RMM has absolutely no clue about that, and there should be
> no impediment to letting the target vcpu do it as it starts.

Because, the RMM wants to make that the state is consistent. i.e,
Host cannot lie to the "source" VCPU and RMM (e.g., CPU_ON denied) and
then run the "target" VCPU.

In other words, the response to the CPU_ON must be recorded by the RMM
in the target VCPU state, to make sure the target VCPU state is
consistent with the response.

The only way to fix this would be RMM keeping track of "mpidr" to REC
object mapping (VCPU object), which impacts the scalability. With that
in place, RMM can update the target VCPU state from the return of the
REC_ENTER after a PSCI_EXIT.

That said, will explore the options to address this

Thanks
Suzuki

> 
> Even better, you should be able to do that on the first thread that
> reenters the guest, completely removing any RMM knowledge from the
> PSCI handling in userspace.
> 
> If you can't do that, then please consider fixing the RMM to allow it.
> 
> Thanks,
> 
> 	M.
> 




