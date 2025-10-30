Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E47CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmrAqntGFsatRHBwAZThVd/YviXlk7V9+33foWAO2UE=; b=2GLrC9OZvKif4x5Q6cUOcpvQvu
	qchn+SW3eFjfA8lqgGZfZqUBfRPVhow6bL/rPfvXN6E78NN5YjPe2FdUq4CQV1kF4Iybe/1lLZqSG
	THaWm1O+uLD+RZbi0rTAuK3IwhbClFQWmd0S05cPdeIrBWbpcSSpSelgwazLatPo0HQrzOrNqLirQ
	af4vGDnCwngN1Zq29EUcCSKvFPWTPhp/YdslmhHIdbJHl4WtmVNteqJQKyWy3if9eM/tsMKg6qx/h
	wFSJRGyPTFg5oUC6CtKmzkHwWi/9FnUcCYY3XM7Ek3Reo7RZhUNQGFPXxjLdrf0JoPcAHo5IRRZ4X
	3AmRxoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEP8Y-00000003sju-0lBd;
	Thu, 30 Oct 2025 09:40:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEP8W-00000003sjZ-06UN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B2101063;
	Thu, 30 Oct 2025 02:39:55 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABE833F673;
	Thu, 30 Oct 2025 02:40:01 -0700 (PDT)
Message-ID: <bec72117-93f1-490e-bc35-0ab247aaed1c@arm.com>
Date: Thu, 30 Oct 2025 09:40:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] KVM: arm64: selftests: Remove
 ARM64_FEATURE_FIELD_BITS and its last user
To: Oliver Upton <oliver.upton@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 shuah@kernel.org
References: <20251014102108.2442391-1-ben.horgan@arm.com>
 <20251014102108.2442391-3-ben.horgan@arm.com> <aQJ8so_oAXfeyxn_@linux.dev>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aQJ8so_oAXfeyxn_@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_024004_130890_4C62569E 
X-CRM114-Status: GOOD (  15.73  )
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

Hi Oliver,

On 10/29/25 20:45, Oliver Upton wrote:
> Hi Ben,
> 
> On Tue, Oct 14, 2025 at 11:21:07AM +0100, Ben Horgan wrote:
>> ARM64_FEATURE_FIELD_BITS is set to 4 but not all ID register fields are 4
>> bits. See for instance ID_AA64SMFR0_EL1. The last user of this define,
>> ARM64_FEATURE_FIELD_BITS, is the set_id_regs selftest. Its logic assumes
>> the fields aren't a single bits; assert that's the case and stop using the
>> define. As there are no more users, ARM64_FEATURE_FIELD_BITS is removed.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  arch/arm64/include/asm/sysreg.h                 | 2 --
>>  tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++++--
>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
>> index 6455db1b54fd..d9aa76d08e13 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -1129,8 +1129,6 @@
>>  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
>>  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
>>  
>> -#define ARM64_FEATURE_FIELD_BITS	4
>> -
>>  #ifdef __ASSEMBLY__
>>  
>>  	.macro	mrs_s, rt, sreg
> 
> You can send this diff as a separate patch. Selftests actually uses the
> definition from tools/arch/arm64/include/asm/sysreg.h, so you'll want to
> drop that definition along with the change to set_id_regs.

Thanks for the pointers. I'll do as you suggest.

> 
> Thanks,
> Oliver
> 

-- 
Thanks,

Ben


