Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0838CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/03FEViZ+dCATXiHpd4E09yY7koMrk67ksNPQ1HnvGg=; b=2T/6JgWMcb4Hfr0RYAgZ3bFlaT
	H1mY1VhvrrDAGuI6K7Uu+egUYuWqjDCP57Uf7y5CuF7O8shDGeCyHRbM8+5zrO4TNUz/DuH7V1qi9
	OeLzJorgQXxwJ+izGePbGl3+gz1XeeTS2NfvPJvWmD83TdMhBzpRZ/o75j8fJLcfeknYt0SlkKpwq
	CbMX9Ix6/u+ZJXVW5hwVkGY/yKabd4nUdPWuBkwYR7Oz/gtII0793pIdSfNO1qKZciKQMTlwJGlTU
	56cqtKl7M3LIj6F3jdMc5507sXSrPVpl7Rr9JmhMj2MJTssSBUAIGTHQl94PzFxRLlyf13+Gw6cJv
	6JBRDANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pYa-00000008idQ-32Xu;
	Fri, 17 Oct 2025 18:52:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pYP-00000008iW5-05zo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:51:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985FF1515;
	Fri, 17 Oct 2025 11:51:44 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD31D3F66E;
	Fri, 17 Oct 2025 11:51:36 -0700 (PDT)
Message-ID: <f2c77f14-c10a-4074-9cdb-5d725f140983@arm.com>
Date: Fri, 17 Oct 2025 19:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/29] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: Gavin Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-8-james.morse@arm.com>
 <29886bb9-bca3-4f26-ae31-a339b8d001f1@redhat.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <29886bb9-bca3-4f26-ae31-a339b8d001f1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115153_163775_7F7C18BA 
X-CRM114-Status: GOOD (  24.29  )
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

Hi Gavin,

On 03/10/2025 04:53, Gavin Shan wrote:
> Hi James,
> 
> On 9/11/25 6:42 AM, James Morse wrote:
>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
>> only be accessible from those CPUs, and they may not be online.
>> Touching the hardware early is pointless as MPAM can't be used until
>> the system-wide common values for num_partid and num_pmg have been
>> discovered.
>>
>> Start with driver probe/remove and mapping the MSC.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> new file mode 100644
>> index 000000000000..efc4738e3b4d
>> --- /dev/null
>> +++ b/drivers/resctrl/mpam_devices.c

>> +/*
>> + * An MSC can control traffic from a set of CPUs, but may only be accessible
>> + * from a (hopefully wider) set of CPUs. The common reason for this is power
>> + * management. If all the CPUs in a cluster are in PSCI:CPU_SUSPEND, the
>> + * corresponding cache may also be powered off. By making accesses from
>> + * one of those CPUs, we ensure this isn't the case.
>> + */
>> +static int update_msc_accessibility(struct mpam_msc *msc)
>> +{
>> +    u32 affinity_id;
>> +    int err;
>> +
>> +    err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
>> +                       &affinity_id);
>> +    if (err)
>> +        cpumask_copy(&msc->accessibility, cpu_possible_mask);
>> +    else
>> +        acpi_pptt_get_cpus_from_container(affinity_id,
>> +                          &msc->accessibility);
>> +
>> +    return 0;
>> +
>> +    return err;
>> +}
>> +
> 
> Double return here and different values have been returned. I think here we
> need "return err". In this case, we needn't copy @cpu_possible_mask on error
> because the caller mpam_msc_drv_probe() will release the MSC instance.

This was the botched removal of the DT support. I'm surprised the compiler is so
forgiving. (already pointed out and already fixed)


>> +static int mpam_msc_drv_probe(struct platform_device *pdev)
>> +{
>> +    int err;
>> +    struct mpam_msc *msc;
>> +    struct resource *msc_res;
>> +    struct device *dev = &pdev->dev;
>> +    void *plat_data = pdev->dev.platform_data;
>> +
>> +    mutex_lock(&mpam_list_lock);
>> +    do {
>> +        msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
>> +        if (!msc) {
>> +            err = -ENOMEM;
>> +            break;
>> +        }
>> +
>> +        mutex_init(&msc->probe_lock);
>> +        mutex_init(&msc->part_sel_lock);
>> +        mutex_init(&msc->outer_mon_sel_lock);
>> +        raw_spin_lock_init(&msc->inner_mon_sel_lock);
>> +        msc->id = pdev->id;
>> +        msc->pdev = pdev;
>> +        INIT_LIST_HEAD_RCU(&msc->all_msc_list);
>> +        INIT_LIST_HEAD_RCU(&msc->ris);
>> +
>> +        err = update_msc_accessibility(msc);
>> +        if (err)
>> +            break;
>> +        if (cpumask_empty(&msc->accessibility)) {
>> +            dev_err_once(dev, "MSC is not accessible from any CPU!");
>> +            err = -EINVAL;
>> +            break;
>> +        }
>> +
> 
> This check (cpumask_empty()) would be part of update_msc_accessibility() since
> msc->accessibility is sorted out in that function where it should be validated.


Could be - but isn't. This is because with the DT support in update_msc_accessibility()
that function is more complex, and its simpler to get the caller to check things like
this.

Even if no-one ever gets DT support upstream, I don't think this matters.


>> +        if (device_property_read_u32(&pdev->dev, "pcc-channel",
>> +                         &msc->pcc_subspace_id))
>> +            msc->iface = MPAM_IFACE_MMIO;
>> +        else
>> +            msc->iface = MPAM_IFACE_PCC;
>> +
>> +        if (msc->iface == MPAM_IFACE_MMIO) {
>> +            void __iomem *io;
>> +
>> +            io = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +                                    &msc_res);
>> +            if (IS_ERR(io)) {
>> +                dev_err_once(dev, "Failed to map MSC base address\n");
>> +                err = PTR_ERR(io);
>> +                break;
>> +            }
>> +            msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>> +            msc->mapped_hwpage = io;
>> +        }
>> +
>> +        list_add_rcu(&msc->all_msc_list, &mpam_all_msc);
>> +        platform_set_drvdata(pdev, msc);
>> +    } while (0);
>> +    mutex_unlock(&mpam_list_lock);
>> +
>> +    if (!err) {
>> +        /* Create RIS entries described by firmware */
>> +        err = acpi_mpam_parse_resources(msc, plat_data);
>> +    }
>> +
>> +    if (err && msc)
>> +        mpam_msc_drv_remove(pdev);
>> +
>> +    if (!err && atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
>> +        pr_info("Discovered all MSC\n");
>> +
>> +    return err;
>> +}


Thanks,

James

