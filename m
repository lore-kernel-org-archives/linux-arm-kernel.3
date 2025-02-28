Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59191C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPbqygpoyBv7L91MX3P42mRY8joCU0uEy0W1GnAU9WA=; b=mtXdXBeczmXjfl3XrPKuRcunoO
	q+iGEXEId+xDC0jPx2tGNKI91Mh4nqWbJU4f8mOhOQOQc/2Q40eaVEQ8LynEt6EK1f/yB+cZqfEwW
	yGKHueaK2vkj+XX4YQp/tBFttdkHCU8F6ZkbwYJ6nUGrN7orXslrdJ3qV49cnqfMfPd6QvHuPpNqO
	jGTMHAtPbqCnlYltiPjdPiQ9Tzsr1c3w1k4x0QX9Z5BwD1iLyIdfbatDqBPT6FNlJ6GYvb9P8y9fp
	ONVnTKBN6fhVqh94Cs/jFDtiuhdDOF9d3t7NC+uTilZBJV4g+X2e3f1vRlw2pfv9Zm3AHoMf2DTPl
	xxIOeabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4YV-0000000C24e-3YMn;
	Fri, 28 Feb 2025 17:53:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to4WJ-0000000C1Xj-2ayY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:51:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB7121515;
	Fri, 28 Feb 2025 09:51:43 -0800 (PST)
Received: from [10.57.38.197] (unknown [10.57.38.197])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DCEC3F6A8;
	Fri, 28 Feb 2025 09:51:22 -0800 (PST)
Message-ID: <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
Date: Fri, 28 Feb 2025 18:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
To: Sudeep Holla <sudeep.holla@arm.com>, Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 morten.rasmussen@arm.com, msuchanek@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
 guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com> <Z8HAkZiHYRjj97M7@bogus>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <Z8HAkZiHYRjj97M7@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_095131_751671_3136C2C3 
X-CRM114-Status: GOOD (  29.84  )
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



On 2/28/25 14:56, Sudeep Holla wrote:
> On Tue, Feb 18, 2025 at 10:10:17PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> For ACPI we'll build the topology from PPTT and we cannot directly
>> get the SMT number of each core. Instead using a temporary xarray
>> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
>> and SMT information of the first core in its heterogeneous CPU cluster
>> when building the topology. Then we can know the largest SMT number
>> in the system. If a homogeneous system's using ACPI 6.2 or later,
>> all the CPUs should be under the root node of PPTT. There'll be
>> only one entry in the xarray and all the CPUs in the system will
>> be assumed identical.
>>
>> The core's SMT control provides two interface to the users [1]:
>> 1) enable/disable SMT by writing on/off
>> 2) enable/disable SMT by writing thread number 1/max_thread_number
>>
>> If a system have more than one SMT thread number the 2) may
>> not handle it well, since there're multiple thread numbers in the
>> system and 2) only accept 1/max_thread_number. So issue a warning
>> to notify the users if such system detected.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
>>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/kernel/topology.c | 66 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
>> index 1a2c72f3e7f8..6eba1ac091ee 100644
>> --- a/arch/arm64/kernel/topology.c
>> +++ b/arch/arm64/kernel/topology.c
>> @@ -15,8 +15,10 @@
>>   #include <linux/arch_topology.h>
>>   #include <linux/cacheinfo.h>
>>   #include <linux/cpufreq.h>
>> +#include <linux/cpu_smt.h>
>>   #include <linux/init.h>
>>   #include <linux/percpu.h>
>> +#include <linux/xarray.h>
>>   
>>   #include <asm/cpu.h>
>>   #include <asm/cputype.h>
>> @@ -37,17 +39,28 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>>   	return !!is_threaded;
>>   }
>>   
>> +struct cpu_smt_info {
>> +	unsigned int thread_num;
>> +	int core_id;
>> +};
>> +
>>   /*
>>    * Propagate the topology information of the processor_topology_node tree to the
>>    * cpu_topology array.
>>    */
>>   int __init parse_acpi_topology(void)
>>   {
>> +	unsigned int max_smt_thread_num = 0;
>> +	struct cpu_smt_info *entry;
>> +	struct xarray hetero_cpu;
>> +	unsigned long hetero_id;
>>   	int cpu, topology_id;
>>   
>>   	if (acpi_disabled)
>>   		return 0;
>>   
>> +	xa_init(&hetero_cpu);
>> +
>>   	for_each_possible_cpu(cpu) {
>>   		topology_id = find_acpi_cpu_topology(cpu, 0);
>>   		if (topology_id < 0)
>> @@ -57,6 +70,34 @@ int __init parse_acpi_topology(void)
>>   			cpu_topology[cpu].thread_id = topology_id;
>>   			topology_id = find_acpi_cpu_topology(cpu, 1);
>>   			cpu_topology[cpu].core_id   = topology_id;
>> +
>> +			/*
>> +			 * In the PPTT, CPUs below a node with the 'identical
>> +			 * implementation' flag have the same number of threads.
>> +			 * Count the number of threads for only one CPU (i.e.
>> +			 * one core_id) among those with the same hetero_id.
>> +			 * See the comment of find_acpi_cpu_topology_hetero_id()
>> +			 * for more details.
>> +			 *
>> +			 * One entry is created for each node having:
>> +			 * - the 'identical implementation' flag
>> +			 * - its parent not having the flag
>> +			 */
>> +			hetero_id = find_acpi_cpu_topology_hetero_id(cpu);
>> +			entry = xa_load(&hetero_cpu, hetero_id);
>> +			if (!entry) {
>> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>> +				WARN_ON_ONCE(!entry);
>> +
>> +				if (entry) {
>> +					entry->core_id = topology_id;
>> +					entry->thread_num = 1;
>> +					xa_store(&hetero_cpu, hetero_id,
>> +						 entry, GFP_KERNEL);
>> +				}
>> +			} else if (entry->core_id == topology_id) {
>> +				entry->thread_num++;
>> +			}
>>   		} else {
>>   			cpu_topology[cpu].thread_id  = -1;
>>   			cpu_topology[cpu].core_id    = topology_id;
>> @@ -67,6 +108,31 @@ int __init parse_acpi_topology(void)
>>   		cpu_topology[cpu].package_id = topology_id;
>>   	}
>>   
>> +	/*
>> +	 * This should be a short loop depending on the number of heterogeneous
>> +	 * CPU clusters. Typically on a homogeneous system there's only one
>> +	 * entry in the XArray.
>> +	 */
>> +	xa_for_each(&hetero_cpu, hetero_id, entry) {
>> +		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
>> +			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> 
> Ditto as previous patch about handling no threaded cores with threaded cores
> in the system. I am not sure if that is required but just raising it here.
> 
>> +
>> +		max_smt_thread_num = max(max_smt_thread_num, entry->thread_num);
>> +		xa_erase(&hetero_cpu, hetero_id);
>> +		kfree(entry);
>> +	}
>> +
>> +	/*
>> +	 * Notify the CPU framework of the SMT support. Initialize the
>> +	 * max_smt_thread_num to 1 if no SMT support detected. A thread
>> +	 * number of 1 can be handled by the framework so we don't need
>> +	 * to check max_smt_thread_num to see we support SMT or not.
>> +	 */
>> +	if (!max_smt_thread_num)
>> +		max_smt_thread_num = 1;
>> +
> 
> Ditto as previous patch, can get rid if it is default 1.
> 

On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
cpu_smt_num_threads uninitialized to UINT_MAX:

smt/active:0
smt/control:-1

If cpu_smt_set_num_threads() is called:
active:0
control:notsupported

So it might be slightly better to still initialize max_smt_thread_num.

Otherwise I tested the patches on arm64 ACPI smt platforms and it worked
well, so for all the patches (if there are no other major modifications):
Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>

Regards,
Pierre

