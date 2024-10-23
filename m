Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07634CFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HkthJYuKJvvSJaIdFPFlD6cXoMsMOtX+9PNtSMmfJk=; b=g+Cgv1/1Y8B6G6SkFW66gUixbY
	Y2g223HoocCIy1XdCWBX9iBfu8mGbjBkvpCmF0WdcirEmcHZF9fEmU2zArNB0NFulbeMCzpVOUt6K
	ygNRRaaqV14vqhIsxGPxoGesVFuZBiQQEkpfJyV/TNGBHxk1akDMLEBsMY6EjifJULF2VR3qId3/C
	ujaCWRFDiXILE1mk9HQAp/WodADoIlpxdjCQDbxIXWEMU9czMrbUS7xxA8wAC9EqqOJ82AJfylY2C
	Y3cbOKeKe2031DT8z55PFGa+qTprhXBgCQaluFtSi2HiJfCaOEpjAcJdo8TubRKXQFEN4YgknHcsh
	TaEVzyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eGe-0000000FB75-055H;
	Wed, 23 Oct 2024 16:31:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dWO-0000000F0ZE-1VL4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84DA9339;
	Wed, 23 Oct 2024 08:44:06 -0700 (PDT)
Received: from [10.57.79.135] (unknown [10.57.79.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C592E3F528;
	Wed, 23 Oct 2024 08:43:31 -0700 (PDT)
Message-ID: <eb7ec4c3-5995-4040-8992-bb95f4b9f923@arm.com>
Date: Wed, 23 Oct 2024 17:43:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, dietmar.eggemann@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com
References: <20241015021841.35713-1-yangyicong@huawei.com>
 <20241015021841.35713-3-yangyicong@huawei.com>
Content-Language: en-US
From: Pierre Gondois <pierre.gondois@arm.com>
In-Reply-To: <20241015021841.35713-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_084340_534816_6138CCAA 
X-CRM114-Status: GOOD (  25.07  )
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

Hello Yicong,

On 10/15/24 04:18, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already
> gotten the SMT thread number of each core. Update the largest
> SMT thread number and enable the SMT control by the end of
> topology parsing.
> 
> The core's SMT control provides two interface to the users [1]:
> 1) enable/disable SMT by writing on/off
> 2) enable/disable SMT by writing thread number 1/max_thread_number
> 
> If a system have more than one SMT thread number the 2) may
> not handle it well, since there're multiple thread numbers in the
> system and 2) only accept 1/max_thread_number. So issue a warning
> to notify the users if such system detected.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   drivers/base/arch_topology.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 75fcb75d5515..5eed864df5e6 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -11,6 +11,7 @@
>   #include <linux/cleanup.h>
>   #include <linux/cpu.h>
>   #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>   #include <linux/device.h>
>   #include <linux/of.h>
>   #include <linux/slab.h>
> @@ -28,6 +29,7 @@
>   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
>   static struct cpumask scale_freq_counters_mask;
>   static bool scale_freq_invariant;
> +static unsigned int max_smt_thread_num;
>   DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 1;
>   EXPORT_PER_CPU_SYMBOL_GPL(capacity_freq_ref);
>   
> @@ -561,6 +563,17 @@ static int __init parse_core(struct device_node *core, int package_id,
>   		i++;
>   	} while (1);
>   
> +	if (max_smt_thread_num < i)
> +		max_smt_thread_num = i;

Shouldn't the conditions above/below be inverted ?
I.e. (max_smt_thread_num != i) should never be true if there is
   max_smt_thread_num = i;
just before

> +
> +	/*
> +	 * If max_smt_thread_num has been initialized and doesn't match
> +	 * the thread number of this entry, then the system has
> +	 * heterogeneous SMT topology.
> +	 */
> +	if (max_smt_thread_num && max_smt_thread_num != i)
> +		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
>   	cpu = get_cpu_for_node(core);
>   	if (cpu >= 0) {
>   		if (!leaf) {
> @@ -673,6 +686,14 @@ static int __init parse_socket(struct device_node *socket)
>   	if (!has_socket)
>   		ret = parse_cluster(socket, 0, -1, 0);
>   
> +	/*
> +	 * Notify the CPU framework of the SMT support. A thread number of 1
> +	 * can be handled by the framework so we don't need to check
> +	 * max_smt_thread_num to see we support SMT or not.
> +	 */
> +	if (max_smt_thread_num)
> +		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +
>   	return ret;
>   }
>   

