Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC75D6ACEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pUeRfF12X20pJLteYenfLRJT9wdgKObIgS/G5jnVVo=; b=XJquqShWVnwey7bFcMU5A1c8au
	nCerFNYXm9ynIoy9ntovYxASRhXOhumI1XZ+wu9rhy07suuBCTtB4adBcLMXO5tYIxHS3Xn0afhm2
	4ObZPLUzo5sA0zh29JfwUBXlxrATivbY7FQPlAFQY0+eGqQ0XRVECCSajoFkLtgaFzC1Sck4QiyHd
	Jeyf89smXE/BCFGDwR+PvKyGBAKCI77FkdUFPTgPRuZQ5QGSLQS6jKNVc0jKVOdr+4bDRyWuSPVZC
	WcSY2fIqJe4MPzy7M7xe1NyUP3PtAzAzhYN8xAjiKo0XXwxdtBsbD8f7286uYywvD7yyyuGQGvjho
	PaJRwcbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJvG-0000000DVHg-285x;
	Wed, 27 Nov 2024 15:25:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJuI-0000000DVDK-47br
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 Nov 2024 15:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7pUeRfF12X20pJLteYenfLRJT9wdgKObIgS/G5jnVVo=; b=nItdjErw2nzwL7mjVOdeqeZePe
	PgDSZCuc/bbtwtj1q3GER5zgQ/LktDJT2418rNYcjcMmlpxic828A7OEuUN3tAI0mT8p8otn5WYJ4
	2MGa7iyyZdzEqM1LUS5TdRGsccw4hWT77vK22LmXrKpnl1UIBBTEf2T23lL0hKw7oG3wSYzuwJSRM
	Gj0jk92K2RiDXV7PYolATHi618PiYqtK1TRbybwGZUXcE2Jxy6AzUJe204gsDEh4xaA/REewPM+c1
	SxKBMrT+RJRXTb2lzqq6hX5YouuiPaM2MvyeElJa2d2+gVlGwT1cy7ob5fKuo5D8INZeX1Rz5OltG
	QdEr+RJw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJuF-00000001QU9-3WFJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 15:24:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F4161477;
	Wed, 27 Nov 2024 07:25:07 -0800 (PST)
Received: from [10.57.69.41] (unknown [10.57.69.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0519E3F58B;
	Wed, 27 Nov 2024 07:24:34 -0800 (PST)
Message-ID: <a7011738-a084-46fa-947f-395d90b37f8b@arm.com>
Date: Wed, 27 Nov 2024 15:24:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Bump KVM_VCPU_MAX_FEATURES
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Will Deacon <will@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241127145644.421352-1-steven.price@arm.com>
 <86a5dkvh9o.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86a5dkvh9o.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_152444_059147_8E8002D9 
X-CRM114-Status: GOOD (  15.45  )
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

On 27/11/2024 15:16, Marc Zyngier wrote:
> On Wed, 27 Nov 2024 14:56:31 +0000,
> Steven Price <steven.price@arm.com> wrote:
>>
>> When the KVM_ARM_VCPU_HAS_EL2 define was added, the value of
>> KVM_VCPU_MAX_FEATURES wasn't incremented, so that feature has never been
>> in the KVM_VCPU_VALID_FEATURES bit mask. This means the HAS_EL2 feature
>> will never be exposed to user space even if the system supports it.
>>
>> Fixes: 89b0e7de3451 ("KVM: arm64: nv: Introduce nested virtualization VCPU feature")
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> I might be missing something, and it's possible that
>> KVM_ARM_VCPU_HAS_EL2 is deliberately not exposed yet.
> 
> This is on purpose. I'm not planning to enable EL2 support until it is
> ready.

I did suspect that's the case - but it might have been better to knobble
it in system_supported_vcpu_features()/kvm_vcpu_init_check_features()
rather than 'hiding' it in the MAX_FEATURES. But hindsight is a
wonderful thing ;)

>> However I'm
>> working on v6 of the host CCA series and as part of that want to add a
>> new feature but and bump KVM_VCPU_MAX_FEATURES up to 9.
> 
> Well, I guess that defines some ordering then! :D

Indeed - I'll try to remember to include note about this "dependency" in
my cover letter. We're likely to need a few more rounds for CCA to be
ready, so hopefully NV will naturally be there in time :D

Thanks,
Steve


