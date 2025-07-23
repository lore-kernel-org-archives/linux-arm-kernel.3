Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2218C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRH8oNfPZ5OnJnz8vBn+Vg+rTgdhMNxP+xdZzhjfUlM=; b=UTj7lFt3MLtkHoFe7lHYwqixdN
	tYavmFUkKOFgiMtgbu/MkEEMIkLck3O41X8rdXG316i1qfnq6Naj0041F5ubvmuud+R5OaJjrNg4n
	OSrnc4DZGhhO2rDIHYroMfbpsRnXmjcCNgDErYL7nXQgpnEQtk2hOJVwb7kk4gbVf0eNyPXEmMcV4
	7H0Bka1S5TiLZptj6UOiFOynwvS8Znm9srfDXkxAQG94wdIE7as5kVnCpmy4RxxAQWJRqF7kfjLsT
	4ralnt4rEnGdf9bQ6WQ1kmQ0N3PYDkoVOcgWiNj1NfsG+bynKNEvllBfGuJVQe0dVpcIzEA4KjtN9
	o8TIkK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueeKq-00000005lM8-2jsf;
	Wed, 23 Jul 2025 18:37:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueeIO-00000005l2J-2bpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 18:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF5561A32;
	Wed, 23 Jul 2025 11:34:21 -0700 (PDT)
Received: from [192.168.20.57] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4A1E3F6A8;
	Wed, 23 Jul 2025 11:34:26 -0700 (PDT)
Message-ID: <f4b57ba9-826f-48c6-af80-14fa9ab22544@arm.com>
Date: Wed, 23 Jul 2025 13:34:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] arm64: probes: Add GCS support to bl/blr/ret
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 thiago.bauermann@linaro.org, broonie@kernel.org, yury.khrustalev@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-6-jeremy.linton@arm.com> <aICywZ55EKfSYSIY@arm.com>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <aICywZ55EKfSYSIY@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_113428_740739_3CB21967 
X-CRM114-Status: GOOD (  20.30  )
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

Hi,


Thanks for catching a bug!

On 7/23/25 5:00 AM, Catalin Marinas wrote:
> On Fri, Jul 18, 2025 at 11:37:37PM -0500, Jeremy Linton wrote:
>> diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
>> index 09a0b36122d0..c75dce7bbe13 100644
>> --- a/arch/arm64/kernel/probes/simulate-insn.c
>> +++ b/arch/arm64/kernel/probes/simulate-insn.c
>> @@ -13,6 +13,7 @@
>>   #include <asm/traps.h>
>>   
>>   #include "simulate-insn.h"
>> +#include "asm/gcs.h"
>>   
>>   #define bbl_displacement(insn)		\
>>   	sign_extend32(((insn) & 0x3ffffff) << 2, 27)
>> @@ -49,6 +50,20 @@ static inline u32 get_w_reg(struct pt_regs *regs, int reg)
>>   	return lower_32_bits(pt_regs_read_reg(regs, reg));
>>   }
>>   
>> +static inline void update_lr(struct pt_regs *regs, long addr)
>> +{
>> +	int err = 0;
>> +
>> +	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
>> +		push_user_gcs(addr + 4,	 &err);
>> +		if (err) {
>> +			force_sig(SIGSEGV);
>> +			return;
>> +		}
>> +	}
>> +	procedure_link_pointer_set(regs, addr + 4);
>> +}
>> +
>>   static bool __kprobes check_cbz(u32 opcode, struct pt_regs *regs)
>>   {
>>   	int xn = opcode & 0x1f;
>> @@ -107,9 +122,8 @@ simulate_b_bl(u32 opcode, long addr, struct pt_regs *regs)
>>   {
>>   	int disp = bbl_displacement(opcode);
>>   
>> -	/* Link register is x30 */
>>   	if (opcode & (1 << 31))
>> -		set_x_reg(regs, 30, addr + 4);
>> +		update_lr(regs, addr);
> 
> Why not pass (addr + 4) here and skip the addition in update_lr()?

Seemed to make more sense to do the adds in the function using the 
offset values.
> 
>>   
>>   	instruction_pointer_set(regs, addr + disp);
>>   }
>> @@ -133,17 +147,26 @@ simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
>>   	/* update pc first in case we're doing a "blr lr" */
>>   	instruction_pointer_set(regs, get_x_reg(regs, xn));
>>   
>> -	/* Link register is x30 */
>>   	if (((opcode >> 21) & 0x3) == 1)
>> -		set_x_reg(regs, 30, addr + 4);
>> +		update_lr(regs, addr);
>>   }
> 
> I can see why this function was originally updating PC (in case of a blr
> lr) but updating the LR was not supposed to fail. With GCS, I think we
> should follow similar logic to simulate_b_bl() and skip updating PC/LR
> if the write to the GCS failed (assuming that's what the hardware does,
> I haven't checked the spec).

Yes I 'fixed' this in simulate ret below, which is probably when I 
dropped the xn because I was just testing it with compiled code that was 
always using lr.


> 
>>   void __kprobes
>>   simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
>>   {
>> -	int xn = (opcode >> 5) & 0x1f;
>> +	u64 ret_addr;
>> +	int err = 0;
>> +	unsigned long lr = procedure_link_pointer(regs);
>>   
>> -	instruction_pointer_set(regs, get_x_reg(regs, xn));
>> +	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
>> +		ret_addr = pop_user_gcs(&err);
>> +		if (err || ret_addr != lr) {
>> +			force_sig(SIGSEGV);
>> +			return;
>> +		}
>> +	}
>> +
>> +	instruction_pointer_set(regs, lr);
>>   }
> 
> What happened to the RET Xn case?
> 

I broke it because my testing code/app never generated it.




