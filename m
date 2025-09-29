Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AC6CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 17:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5hVd2xneFLHKLgqmKlfgGcJL9pR5lHfmpJjOwfLGvw=; b=wR8Vx89rguOoxJuKw7WxKYN2Dh
	6kQxLXz6J/ileNa+sc+ysBBMPaOwSRvPBDP23A+9CKyPB2GbbdtBLBxJ9mNNoEtBYIJSt8jej9QuQ
	r8CUDaAmFY6CzIbRvaMtkTib1u1TBfhPKLD7eakuUs43dYx5CogWzWQoBdQK58H8eUQujUwI4Uqcb
	uQ1PZoC9krUD8hWbVGKHywClta6yNlMrtuYI8vRybNoxcDdDgoRavHqQswneF9gDW2e+nfjL8OqFZ
	lI2kfYv1XkEv7JyQaeOiH89zAshzKGoRavHNee8dg/d9K/AxCixZ1WvGFpCSaNY5M4L/Y8zbkS0dC
	/bYdtySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Hvq-00000003A0f-0DoQ;
	Mon, 29 Sep 2025 17:45:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3HvW-000000039pg-2VF7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 17:44:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F47C150C;
	Mon, 29 Sep 2025 10:44:34 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1C543F59E;
	Mon, 29 Sep 2025 10:44:36 -0700 (PDT)
Message-ID: <628b42e2-6605-4f19-8ee8-e1c8707a6f96@arm.com>
Date: Mon, 29 Sep 2025 18:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/29] arm_mpam: Probe hardware to find the supported
 partid/pmg values
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-12-james.morse@arm.com>
 <20250911161850.00005667@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250911161850.00005667@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_104442_725556_C4F18D81 
X-CRM114-Status: GOOD (  26.38  )
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

On 11/09/2025 16:18, Jonathan Cameron wrote:
> On Wed, 10 Sep 2025 20:42:51 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> CPUs can generate traffic with a range of PARTID and PMG values,
>> but each MSC may also have its own maximum size for these fields.
>> Before MPAM can be used, the driver needs to probe each RIS on
>> each MSC, to find the system-wide smallest value that can be used.
>> The limits from requestors (e.g. CPUs) also need taking into account.
>>
>> While doing this, RIS entries that firmware didn't describe are created
>> under MPAM_CLASS_UNKNOWN.
>>
>> While we're here, implement the mpam_register_requestor() call
>> for the arch code to register the CPU limits. Future callers of this
>> will tell us about the SMMU and ITS.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>

> Trivial stuff inline.
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks!


>>  drivers/resctrl/mpam_devices.c  | 150 +++++++++++++++++++++++++++++++-
>>  drivers/resctrl/mpam_internal.h |   6 ++
>>  include/linux/arm_mpam.h        |  14 +++
>>  3 files changed, 169 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index c265376d936b..24dc81c15ec8 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
> 
> 
>> +int mpam_register_requestor(u16 partid_max, u8 pmg_max)
>> +{
>> +	int err = 0;
>> +
>> +	spin_lock(&partid_max_lock);

> guard() perhaps so you can return early in the error pat and avoid
> need for local variable err.

Negh ... okay. I dislike the guard thing as its never clear when the lock is unlocked.
I'm not a fan of spooky action at a distance!


>> +	if (!partid_max_init) {
>> +		mpam_partid_max = partid_max;
>> +		mpam_pmg_max = pmg_max;
>> +		partid_max_init = true;
>> +	} else if (!partid_max_published) {
>> +		mpam_partid_max = min(mpam_partid_max, partid_max);
>> +		mpam_pmg_max = min(mpam_pmg_max, pmg_max);
>> +	} else {
>> +		/* New requestors can't lower the values */
>> +		if (partid_max < mpam_partid_max || pmg_max < mpam_pmg_max)
>> +			err = -EBUSY;
>> +	}
>> +	spin_unlock(&partid_max_lock);
>> +
>> +	return err;
>> +}
>> +EXPORT_SYMBOL(mpam_register_requestor);
> 
>> @@ -470,9 +547,37 @@ int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +static struct mpam_msc_ris *mpam_get_or_create_ris(struct mpam_msc *msc,
>> +						   u8 ris_idx)
>> +{
>> +	int err;
>> +	struct mpam_msc_ris *ris, *found = ERR_PTR(-ENOENT);
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	if (!test_bit(ris_idx, &msc->ris_idxs)) {
>> +		err = mpam_ris_create_locked(msc, ris_idx, MPAM_CLASS_UNKNOWN,
>> +					     0, 0);
>> +		if (err)
>> +			return ERR_PTR(err);
>> +	}
>> +
>> +	list_for_each_entry(ris, &msc->ris, msc_list) {
>> +		if (ris->ris_idx == ris_idx) {
>> +			found = ris;
> I'd return ris;
> 
> Then can do return ERR_PTR(-ENOENT) below and not bother with found.
> 
> Ignore if this gets more complex later.

Thank - this is another relic of more complex locking...
Fixed as you suggested.


>> +			break;
>> +		}
>> +	}
>> +
>> +	return found;
>> +}
> 
>> @@ -675,9 +813,18 @@ static struct platform_driver mpam_msc_driver = {
>>  
>>  static void mpam_enable_once(void)
>>  {
>> +	/*
>> +	 * Once the cpuhp callbacks have been changed, mpam_partid_max can no
>> +	 * longer change.
>> +	 */
>> +	spin_lock(&partid_max_lock);
>> +	partid_max_published = true;
>> +	spin_unlock(&partid_max_lock);
>> +
>>  	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
>>  
>> -	pr_info("MPAM enabled\n");
>> +	printk(KERN_INFO "MPAM enabled with %u PARTIDs and %u PMGs\n",
>> +	       mpam_partid_max + 1, mpam_pmg_max + 1);

> Not sure why pr_info before and printk now.  

That looks like a conflict gone wrong!
Fixed.


Thanks,

James


