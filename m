Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC6DFCC9B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kje1eZfcLfoGw4eodwbTMTi2f+I7QIR9DyQQLzPnscU=; b=g5KBiFwLTGBukcN43eQVrHjaIL
	FT5iXvQ0nRM6TQYz2YJMcNK1s350Z8ZCNhXVhz6BO3329GstbHIELLcVMi3+9BNw/zUUEJJb4hsLh
	QWhkyoWeDebjHh+I8ppWs66aNyuobdZdwtlEEvJ5u+sEL0WUlbIZS/qGJPIWTpVgOYu0ucBqPcYm5
	BZWXwLKV2QnwjGiGO2eAQic8sfDOCh5wxKUNDdtON4XWFP4PaSNcbkgBYYsxEIgWGYbqlCLYT6hUu
	IJKCR1NHV7tzCSOdAjamjpwfLlJns9ZtIehDDg5pzuhMOvZ32nJ9tx+sr2m50gklAy9rQBSxVAwFW
	4A46mFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznmv-00000008f91-1GnV;
	Tue, 10 Mar 2026 03:29:41 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznmr-00000008f8c-3qIq;
	Tue, 10 Mar 2026 03:29:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=kje1eZfcLfoGw4eodwbTMTi2f+I7QIR9DyQQLzPnscU=;
	b=ctT3+zfMVigcgSx5Oi4o6AihKaQOVTpaMZTp63q2EF9GF44LlRmhxb4YLp/SvjVhjFtpnf1Di
	JTCz65Qg8Z4VpwtnjHOQnOSbz34LCF1Us5hAau6WuZ2nq8Hyf/XMotZI4fK0MMXheTgc+kQlEPt
	4qSa2/YMHyeRJq5bX6GNWRc=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fVK3f4FPQz12LCw;
	Tue, 10 Mar 2026 11:23:58 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
	by mail.maildlp.com (Postfix) with ESMTPS id BC53E404AD;
	Tue, 10 Mar 2026 11:29:34 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Mar 2026 11:29:33 +0800
Message-ID: <9d0d4685-fe6b-4ffd-b9bd-6a560c0d7c9f@huawei.com>
Date: Tue, 10 Mar 2026 11:29:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ACPI: Rename get_acpi_id_for_cpu() to
 acpi_get_cpu_acpi_id() on non-x86
To: Huacai Chen <chenhuacai@kernel.org>
CC: <linux-pci@vger.kernel.org>, <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, Mark Rutland
	<mark.rutland@arm.com>, <linux-acpi@vger.kernel.org>, <wei.huang2@amd.com>,
	<Eric.VanTassell@amd.com>, <jonathan.cameron@huawei.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <stable@vger.kernel.org>, <jeremy.linton@arm.com>,
	<sunilvl@oss.qualcomm.com>, <chenhuacai@loongson.cn>,
	<wangliupu@loongson.cn>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
References: <20260303003625.39035-1-fengchengwen@huawei.com>
 <20260309041659.18815-1-fengchengwen@huawei.com>
 <20260309041659.18815-2-fengchengwen@huawei.com>
 <CAAhV-H7Cy1OuReaoGotZvdvHWLic_ECESFVZgbvNpk2HVjPjuw@mail.gmail.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <CAAhV-H7Cy1OuReaoGotZvdvHWLic_ECESFVZgbvNpk2HVjPjuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202938_302134_134C235B 
X-CRM114-Status: GOOD (  17.40  )
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

Hi Huacai,

On 3/9/2026 9:29 PM, Huacai Chen wrote:
> Hi, Chengwen,
> 
> On Mon, Mar 9, 2026 at 12:17 PM Chengwen Feng <fengchengwen@huawei.com> wrote:
>>
>> To unify the CPU ACPI ID retrieval interface across architectures,
>> rename the existing get_acpi_id_for_cpu() function to
>> acpi_get_cpu_acpi_id() on arm64/riscv/loongarch platforms.
> Can we also rename cpu_acpi_id() to acpi_get_cpu_acpi_id() for x86?

Remove cpu_acpi_id() would make it look more concise, this was done in v5, thanks.

> 
> Huacai
> 
>>
>> This is a pure rename with no functional change, preparing for a
>> consistent ACPI Processor UID retrieval interface across all ACPI-enabled
>> platforms.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Chengwen Feng <fengchengwen@huawei.com>
>> ---
>>  arch/arm64/include/asm/acpi.h      |  4 ++--
>>  arch/loongarch/include/asm/acpi.h  |  2 +-
>>  arch/riscv/include/asm/acpi.h      |  2 +-
>>  arch/riscv/kernel/acpi_numa.c      |  2 +-
>>  drivers/acpi/pptt.c                | 16 ++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  2 +-
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  2 +-
>>  7 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/acpi.h b/arch/arm64/include/asm/acpi.h
>> index c07a58b96329..202107aeb05b 100644
>> --- a/arch/arm64/include/asm/acpi.h
>> +++ b/arch/arm64/include/asm/acpi.h
>> @@ -114,7 +114,7 @@ static inline bool acpi_has_cpu_in_madt(void)
>>  }
>>
>>  struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu);
>> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>> +static inline u32 acpi_get_cpu_acpi_id(unsigned int cpu)
>>  {
>>         return  acpi_cpu_get_madt_gicc(cpu)->uid;
>>  }
>> @@ -125,7 +125,7 @@ static inline int get_cpu_for_acpi_id(u32 uid)
>>
>>         for (cpu = 0; cpu < nr_cpu_ids; cpu++)
>>                 if (acpi_cpu_get_madt_gicc(cpu) &&
>> -                   uid == get_acpi_id_for_cpu(cpu))
>> +                   uid == acpi_get_cpu_acpi_id(cpu))
>>                         return cpu;
>>
>>         return -EINVAL;
>> diff --git a/arch/loongarch/include/asm/acpi.h b/arch/loongarch/include/asm/acpi.h
>> index 7376840fa9f7..89c6c8f52cc3 100644
>> --- a/arch/loongarch/include/asm/acpi.h
>> +++ b/arch/loongarch/include/asm/acpi.h
>> @@ -40,7 +40,7 @@ extern struct acpi_madt_core_pic acpi_core_pic[MAX_CORE_PIC];
>>
>>  extern int __init parse_acpi_topology(void);
>>
>> -static inline u32 get_acpi_id_for_cpu(unsigned int cpu)
>> +static inline u32 acpi_get_cpu_acpi_id(unsigned int cpu)
>>  {
>>         return acpi_core_pic[cpu_logical_map(cpu)].processor_id;
>>  }
>> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
>> index 6e13695120bc..1d23681b61b5 100644
>> --- a/arch/riscv/include/asm/acpi.h
>> +++ b/arch/riscv/include/asm/acpi.h
>> @@ -61,7 +61,7 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>>
>>  void acpi_init_rintc_map(void);
>>  struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
>> -static inline u32 get_acpi_id_for_cpu(int cpu)
>> +static inline u32 acpi_get_cpu_acpi_id(int cpu)
>>  {
>>         return acpi_cpu_get_madt_rintc(cpu)->uid;
>>  }
>> diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
>> index 130769e3a99c..c2eb4824d0f7 100644
>> --- a/arch/riscv/kernel/acpi_numa.c
>> +++ b/arch/riscv/kernel/acpi_numa.c
>> @@ -40,7 +40,7 @@ static inline int get_cpu_for_acpi_id(u32 uid)
>>         int cpu;
>>
>>         for (cpu = 0; cpu < nr_cpu_ids; cpu++)
>> -               if (uid == get_acpi_id_for_cpu(cpu))
>> +               if (uid == acpi_get_cpu_acpi_id(cpu))
>>                         return cpu;
>>
>>         return -EINVAL;
>> diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
>> index de5f8c018333..c1a8fba4c2b2 100644
>> --- a/drivers/acpi/pptt.c
>> +++ b/drivers/acpi/pptt.c
>> @@ -459,7 +459,7 @@ static void cache_setup_acpi_cpu(struct acpi_table_header *table,
>>  {
>>         struct acpi_pptt_cache *found_cache;
>>         struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>> -       u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +       u32 acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>         struct cacheinfo *this_leaf;
>>         unsigned int index = 0;
>>         struct acpi_pptt_processor *cpu_node = NULL;
>> @@ -546,7 +546,7 @@ static int topology_get_acpi_cpu_tag(struct acpi_table_header *table,
>>                                      unsigned int cpu, int level, int flag)
>>  {
>>         struct acpi_pptt_processor *cpu_node;
>> -       u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +       u32 acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>
>>         cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>>         if (cpu_node) {
>> @@ -622,7 +622,7 @@ static int find_acpi_cpu_topology_tag(unsigned int cpu, int level, int flag)
>>  static int check_acpi_cpu_flag(unsigned int cpu, int rev, u32 flag)
>>  {
>>         struct acpi_table_header *table;
>> -       u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +       u32 acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>         struct acpi_pptt_processor *cpu_node = NULL;
>>         int ret = -ENOENT;
>>
>> @@ -671,7 +671,7 @@ int acpi_get_cache_info(unsigned int cpu, unsigned int *levels,
>>
>>         pr_debug("Cache Setup: find cache levels for CPU=%d\n", cpu);
>>
>> -       acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +       acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>         cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>>         if (!cpu_node)
>>                 return -ENOENT;
>> @@ -797,7 +797,7 @@ int find_acpi_cpu_topology_cluster(unsigned int cpu)
>>         if (!table)
>>                 return -ENOENT;
>>
>> -       acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +       acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>         cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
>>         if (!cpu_node || !cpu_node->parent)
>>                 return -ENOENT;
>> @@ -872,7 +872,7 @@ static void acpi_pptt_get_child_cpus(struct acpi_table_header *table_hdr,
>>         cpumask_clear(cpus);
>>
>>         for_each_possible_cpu(cpu) {
>> -               acpi_id = get_acpi_id_for_cpu(cpu);
>> +               acpi_id = acpi_get_cpu_acpi_id(cpu);
>>                 cpu_node = acpi_find_processor_node(table_hdr, acpi_id);
>>
>>                 while (cpu_node) {
>> @@ -966,7 +966,7 @@ int find_acpi_cache_level_from_id(u32 cache_id)
>>         for_each_possible_cpu(cpu) {
>>                 bool empty;
>>                 int level = 1;
>> -               u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +               u32 acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>                 struct acpi_pptt_cache *cache;
>>                 struct acpi_pptt_processor *cpu_node;
>>
>> @@ -1030,7 +1030,7 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
>>         for_each_possible_cpu(cpu) {
>>                 bool empty;
>>                 int level = 1;
>> -               u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +               u32 acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>                 struct acpi_pptt_cache *cache;
>>                 struct acpi_pptt_processor *cpu_node;
>>
>> diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
>> index caa2c16e1697..c15ce8c13136 100644
>> --- a/drivers/acpi/riscv/rhct.c
>> +++ b/drivers/acpi/riscv/rhct.c
>> @@ -44,7 +44,7 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
>>         struct acpi_rhct_isa_string *isa_node;
>>         struct acpi_table_rhct *rhct;
>>         u32 *hart_info_node_offset;
>> -       u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
>> +       u32 acpi_cpu_id = acpi_get_cpu_acpi_id(cpu);
>>
>>         BUG_ON(acpi_disabled);
>>
>> diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
>> index 34430b68f602..506b661c60fd 100644
>> --- a/drivers/perf/arm_cspmu/arm_cspmu.c
>> +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
>> @@ -1115,7 +1115,7 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
>>         if (affinity_flag == ACPI_APMT_FLAGS_AFFINITY_PROC) {
>>                 for_each_possible_cpu(cpu) {
>>                         if (apmt_node->proc_affinity ==
>> -                           get_acpi_id_for_cpu(cpu)) {
>> +                           acpi_get_cpu_acpi_id(cpu)) {
>>                                 cpumask_set_cpu(cpu, &cspmu->associated_cpus);
>>                                 break;
>>                         }
>> --
>> 2.17.1
>>
> 


