Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F362BFED2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Le43Oaq0SOwBUJc/07CArE8IrYsLIDJZjBoZH9RqaP4=; b=YYYatmTwvPsrY8di3ZshB8sP40
	zf1K6/sLSjGau4+X/B6oU1x2A7UfAB8opdGPF70UzU5M6lv+FUoDfhwg9Obnt9XOuRxZS8qO7iCH2
	xYyt8DKnCkkylDiPuXy2VeY3gzEV+sCT8zc45iSxTrLBRI0hq+F7NcVuSeN2R43vD3szeCqQa7Hdr
	SKeF8KO4DN6zYadVZNyOKftmmWid4C//fTl+cUvUZrkwnQlulGjDLBURHiCNXPzOgZghEUt0oiowN
	tsYyxNJ7zPzkxa5OMpZYNVlLwLvcPA5LflVHvT3rFLEvugMqXAbtucA1oYpXsFubbIjVPeRRl7xc9
	UNxcRkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cLD-0000000Disw-1miK;
	Thu, 12 Mar 2026 09:28:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cLA-0000000Dis2-41Tu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 09:28:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66510165C;
	Thu, 12 Mar 2026 02:28:14 -0700 (PDT)
Received: from [10.57.18.49] (unknown [10.57.18.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CABE63F694;
	Thu, 12 Mar 2026 02:28:17 -0700 (PDT)
Message-ID: <dd6f4715-e8be-41d1-af60-00f068e9d730@arm.com>
Date: Thu, 12 Mar 2026 09:28:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/46] arm64: RMI: Define the user ABI
To: Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
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
 <20251217101125.91098-7-steven.price@arm.com> <86tsuy8g0u.wl-maz@kernel.org>
 <33053e22-6cc6-4d55-bc7f-01f873a15d28@arm.com> <87v7f2chde.wl-maz@kernel.org>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <87v7f2chde.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_022825_051599_3D3AA5D1 
X-CRM114-Status: GOOD (  13.85  )
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

On 11/03/2026 19:10, Marc Zyngier wrote:
> On Mon, 02 Mar 2026 15:23:44 +0000,
> Steven Price <steven.price@arm.com> wrote:
>>
>>>> +  struct kvm_arm_rmi_populate {
>>>> +	__u64 base;
>>>> +	__u64 size;
>>>> +	__u64 source_uaddr;
>>>> +	__u32 flags;
>>>> +	__u32 reserved;
>>>> +  };
>>>> +
>>>> +Populate a region of protected address space by copying the data from the user
>>>> +space pointer provided. This is only valid before any VCPUs have been run.
>>>> +The ioctl might not populate the entire region and user space may have to
>>>> +repeatedly call it (with updated pointers) to populate the entire region.
>>>
>>> size as a __u64 is odd, as the return value from the ioctl is a signed
>>> int. This implies that you can't really report how many bytes you have
>>> copied.  Some form of consistency wouldn't hurt.
>>
>> Good spot. In practice this works because >2GB in one operation is
>> highly unlikely to be processed in one go. But I guess I'll change this
>> to have an output size argument. I guess I could make the kernel update
>> all of base,size,source_uaddr which would simplify user space.
> 
> In a conversation with Suzuki, I suggested that splice(2) could be a
> nicer way to express this, and allow asynchronous use with io-uring.
> 
> After all, having a guestmem backend for CCA is not exactly
> outlandish, and having a splice implementation realistic enough.
> 
> Thoughts?

One issue that I realised, is about the "flags" for the populate.
Data can be loaded as measured vs unmeasured in CCA (and in TDX
and SNP). I don't see a way to convey this with splice.

Suzuki

> 
> 	M.
> 


