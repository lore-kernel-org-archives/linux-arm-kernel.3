Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42BBC36018
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no4O0kKJiLiCXe6guFO84ZJNkYiU42xRYt18pHnS044=; b=ZVAEYfDBMO56gRuAj6u+E9HCqC
	nXImMbO1F5HrV3qHwV3GzD7Tso4Eb514CE591xkhBJctBl9oHKoCrtzbkPX/TjVtriHLHmbtRwbV7
	nLd3qxZs64MliyK1geo6Ot7IQ9UFZLaXkuo1I54fapJgu6IarJ2wvmI995PTcR1u3BvO6fke6PTSQ
	E0FP64QkCL8G+CovFsROWj2b1TMN8Mamrp1ILofbrAqV9ObMTwr3WY7RM6gA1TLqWDDpuz93RN85P
	RgdEimlYaHL1pk1Rlhpg+9tHBsKRzC8BdZDefRwEvVqKtinyesWKNVNqC88uXW0S3yqlxKVMy3vnl
	N7dhQgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYG-00000001chk-3ggJ;
	Mon, 07 Apr 2025 18:50:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pQs-00000001EFM-2jMn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 16:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=no4O0kKJiLiCXe6guFO84ZJNkYiU42xRYt18pHnS044=; b=m95I+4H9TAtemH7QGE57F0gnNZ
	IlZJGahIge9R6g05m5gg9ejr3TRrBKc1ubcpWQJgyAu99MhzD/WA2bLJk6KIAjowV95+YNpOODIhU
	Ve9Bw/dvIQ0Z/vET2x/+5o+B2agG7xve2wClvjQ1Wu+FOPG4Qk4HvAWytr1N4zyHld9pfnZlAzPOx
	GoLiy3PWVBk9lZHVOWpHTLy432uA2J/63JyM2zt5/bTMCgVai8vEp/hfeQfUwdTYwsMDUk5qVW8BK
	SgUBGWyKScif3KNaqyvdalTxfCZlRYkedwTUpmooura2CGfTRfTCfkG/4/GP6AoSzy6a4yOZvx7Xi
	MOKEz75Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pQp-000000083wV-1SQM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:34:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84324106F;
	Mon,  7 Apr 2025 09:34:41 -0700 (PDT)
Received: from [10.57.17.31] (unknown [10.57.17.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCBFB3F694;
	Mon,  7 Apr 2025 09:34:35 -0700 (PDT)
Message-ID: <54f1fbb1-4fa1-4b09-bbac-3afcbb7ec478@arm.com>
Date: Mon, 7 Apr 2025 17:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 28/45] arm64: rme: support RSI_HOST_CALL
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-29-steven.price@arm.com>
 <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_173443_727499_943EE390 
X-CRM114-Status: GOOD (  21.90  )
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

On 04/03/2025 06:01, Gavin Shan wrote:
> On 2/14/25 2:14 AM, Steven Price wrote:
>> From: Joey Gouly <joey.gouly@arm.com>
>>
>> Forward RSI_HOST_CALLS to KVM's HVC handler.
>>
>> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v4:
>>   * Setting GPRS is now done by kvm_rec_enter() rather than
>>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>>     enter/exit). This fixes a bug where the registers set by user space
>>     were being ignored.
>> ---
>>   arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
>> index c785005f821f..4f7602aa3c6c 100644
>> --- a/arch/arm64/kvm/rme-exit.c
>> +++ b/arch/arm64/kvm/rme-exit.c
>> @@ -107,6 +107,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu
>> *vcpu)
>>       return -EFAULT;
>>   }
>>   +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
>> +{
>> +    int ret, i;
>> +    struct realm_rec *rec = &vcpu->arch.rec;
>> +
>> +    vcpu->stat.hvc_exit_stat++;
>> +
>> +    for (i = 0; i < REC_RUN_GPRS; i++)
>> +        vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
>> +
>> +    ret = kvm_smccc_call_handler(vcpu);
>> +
>> +    if (ret < 0) {
>> +        vcpu_set_reg(vcpu, 0, ~0UL);
>> +        ret = 1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
> 
> I don't understand how a negative error can be returned from
> kvm_smccc_call_handler().

I don't believe it really can. However kvm_smccc_call_handler() calls
kvm_psci_call() and that has a documentation block which states:

 * This function returns: > 0 (success), 0 (success but exit to user
 * space), and < 0 (errors)
 *
 * Errors:
 * -EINVAL: Unrecognized PSCI function

But I can't actually see code which returns the negative value...

> Besides, SMCCC_RET_NOT_SUPPORTED has been set to GPR[0 - 3] if the
> request can't be
> supported. Why we need to set GPR[0] to ~0UL, which corresponds to
> SMCCC_RET_NOT_SUPPORTED
> if I'm correct. I guess change log or a comment to explain the questions
> would be
> nice.

I'll add a comment explaining we don't expect negative codes. And I'll
expand ~0UL to SMCCC_RET_NOT_SUPPORTED which is what it should be.

Thanks,
Steve

>>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>>   {
>>       struct realm_rec *rec = &vcpu->arch.rec;
>> @@ -168,6 +188,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int
>> rec_run_ret)
>>           return rec_exit_psci(vcpu);
>>       case RMI_EXIT_RIPAS_CHANGE:
>>           return rec_exit_ripas_change(vcpu);
>> +    case RMI_EXIT_HOST_CALL:
>> +        return rec_exit_host_call(vcpu);
>>       }
>>         kvm_pr_unimpl("Unsupported exit reason: %u\n",
> 
> Thanks,
> Gavin
> 


