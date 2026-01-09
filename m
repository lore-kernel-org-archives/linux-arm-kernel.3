Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BB9D167E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey+us22VMFDXf2c0jOtmqKZ6UJAA6C1tHSmGmJ48E/s=; b=mTJyK5ye8bSgA9+EzvzGcyAuZZ
	LLcxb43n6iBUz8HCr6RzvqwZRgHI3Bb8n/TatSF6VwoB1vfesllXD7cMKednZz7GcBx3W5i6zs5qc
	DacXIa9zFNvQOo7EzgryrhSOAEoXVFJrfKHypYc1CeL1H/vNLU+YDvGUXQFJo3fwEs0B+7oG7AADH
	lOcf8za+kyr1WznFCRHOFdmPIJJmh3eSAN31Qci6GwbIy3WctFHQsVtTk0xN3Eo0V883JmIaJiW5w
	l7qXUkqdE7sdmdan8xMAgmEJxLJ+uj95m3SQFIYPQzANkmIZlK1RqOqBh8v49RBtf/W6CIbVqE3VQ
	XkdhSDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8w8-000000022Q6-1hlr;
	Fri, 09 Jan 2026 09:37:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8w6-000000022Pd-1WX8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:37:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F223B497;
	Fri,  9 Jan 2026 01:37:29 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEC643F6A8;
	Fri,  9 Jan 2026 01:37:30 -0800 (PST)
Message-ID: <8929c30b-9220-42f9-9a04-db414919a36f@arm.com>
Date: Fri, 9 Jan 2026 09:37:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/45] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@kernel.org" <david@kernel.org>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "punit.agrawal@oss.qualcomm.com" <punit.agrawal@oss.qualcomm.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
 <20251219181147.3404071-13-ben.horgan@arm.com>
 <OSZPR01MB87982085E0E5B09D0FBB58208B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB87982085E0E5B09D0FBB58208B85A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013738_486322_C308C991 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Shaopeng,

On 1/8/26 10:18, Shaopeng Tan (Fujitsu) wrote:
> Hello  Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> Care must be taken when modifying the PARTID and PMG of a task in any
>> per-task structure as writing these values may race with the task being
>> scheduled in, and reading the modified values.
>>
>> Add helpers to set the task properties, and the CPU default value.  These
>> use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval() to
>> avoid causing torn values.
>>
>> CC: Dave Martin <Dave.Martin@arm.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes since rfc:
>> Keep comment attached to mpam_get_regval()
>> Add internal helper, __mpam_regval() (Jonathan)
>> ---
>>  arch/arm64/include/asm/mpam.h | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
>> index c4cb015e8d8f..a7fd0656bf90 100644
>> --- a/arch/arm64/include/asm/mpam.h
>> +++ b/arch/arm64/include/asm/mpam.h
>> @@ -4,6 +4,7 @@
>>  #ifndef __ASM__MPAM_H
>>  #define __ASM__MPAM_H
>>  
>> +#include <linux/bitfield.h>
>>  #include <linux/jump_label.h>
>>  #include <linux/percpu.h>
>>  #include <linux/sched.h>
>> @@ -22,6 +23,22 @@ DECLARE_PER_CPU(u64, arm64_mpam_current);
>>   */
>>  extern u64 arm64_mpam_global_default;
>>  
>> +static inline u64 __mpam_regval(u16 partid_d, u16 partid_i, u8 pmg_d, u8 pmg_i)
>> +{
>> +       return FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d) |
>> +               FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i) |
>> +               FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d) |
>> +               FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
>> +}
>> +
>> +static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
>> +                                        u8 pmg_d, u8 pmg_i)
>> +{
>> +       u64 default_val = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
>> +
>> +       WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
>> +}
>> +
>>  /*
>>   * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
>>   * which may race with reads in mpam_thread_switch(). Ensure only one of the old
>> @@ -45,6 +62,17 @@ static inline u64 mpam_get_regval(struct task_struct *tsk)
>>  #endif
>>  }
>>  
>> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
>> +                                           u16 partid_d, u16 partid_i,
>> +                                           u8 pmg_d, u8 pmg_i)
>> +{
>> +#ifdef CONFIG_ARM64_MPAM
> 
> Since `mpam_set_task_partid_pmg()` is only called from MPAM, is this necessary?

Yes because mpam_partid_pmg only exists when CONFIG_ARM64_MPAM is enabled.

> 
> Best regards,
> Shaopeng TAN
> 
>> +       u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
>> +
>> +       WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
>> +#endif
>> +}
>> +
>>  static inline void mpam_thread_switch(struct task_struct *tsk)
>>  {
>>          u64 oldregval;
>> --
>> 2.43.0

Thanks,

Ben


