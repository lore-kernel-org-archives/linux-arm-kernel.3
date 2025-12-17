Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A0DD65C66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndxQYDcVVIrPoGG8nYoDt78CTyz3iw6UzGGL3OKGEs8=; b=z2Jb2dlpePT/VSqnvEjgHb/FnW
	isXnsDQyMGVzOeue9oJKrnerbcp22B9XOt6uT1fXQC/gjVg/vg21FpCZDwetyFYv4r1at3/NjgdFP
	sdPmRHT40yoBhJker1NHJM9WOSmHGqS3pEfaBbzPZY1XfsyaKLj2yOZuLJMNs2nV/zv+BMWEe7AOm
	ZWVAVwniMMU8qN0LWR6sAHToQ5p5X+zNNcTehH4p0dJeoVc24D0f5tC6FEZj1wOvkk75yilAsCM0A
	lu/IuzIHgCR6i8rGq/tf9eP9Ys77PfuTwMWu2/P78UFGpa7ben0MpMwBM5v4sZl15ud0PPK9++z2n
	8TVoJCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtS0-000000070Qh-3KVv;
	Wed, 17 Dec 2025 15:28:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtRy-000000070Q8-0wha
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:28:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 100A1FEC;
	Wed, 17 Dec 2025 07:28:17 -0800 (PST)
Received: from [10.57.45.201] (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 475983F73F;
	Wed, 17 Dec 2025 07:28:19 -0800 (PST)
Message-ID: <505e2e14-7f02-4a6d-b0fa-d322cf0c8b29@arm.com>
Date: Wed, 17 Dec 2025 15:28:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/46] arm64: Support for Arm CCA in KVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
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
 <86y0n1ma2q.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86y0n1ma2q.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_072826_303817_BAEB78B7 
X-CRM114-Status: GOOD (  14.79  )
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

On 17/12/2025 14:55, Marc Zyngier wrote:
> On Wed, 17 Dec 2025 10:10:37 +0000,
> Steven Price <steven.price@arm.com> wrote:
>>
>> This series adds support for running protected VMs using KVM under the
>> Arm Confidential Compute Architecture (CCA). I've changed the uAPI
>> following feedback from Marc.
>>
>> The main change is that rather than providing a multiplex CAP and
>> expecting the VMM to drive the different stages of realm construction,
>> there's now just a minimal interface and KVM performs the necessary
>> operations when needed.
> 
> What are the relevant patches? I'd rather not look at the non-2.0
> patches at all, given that they are pretty meaningless for KVM.

Sorry, I really should have included that in the cover letter.

Patch 6 defines the uAPI - so I'd welcome feedback on whether that is
now the right shape.

Patch 11 shows how the "first VCPU run" is handled with a hook in
kvm_arch_vcpu_run_pid_change() (similar to pKVM).

Patch 20 is implementation of the new populate ioctl.

Patch 21 handles the INIT_RIPAS by assuming that any memslot with gmem
is private and should be RIPAS_RAM.

Patch 27 handles the PSCI requests which is the other ioctl. No real
change from the previous posting, but it would be good to know if there
are any issues with the uAPI here.

I think other than those there's either very little change from the
previous series, or it's likely to change with RMM v2.0.

Thanks,
Steve


