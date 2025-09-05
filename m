Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EE7CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0neehA6rWnJrcx6MkH4VfamD3BiVxY7Hu6WTFKx4mII=; b=0WEBDJsu7RZgzqKjPCAKAVchE2
	IhQ1y3DOma/m50p1kYfPO81t99AA11Xg6jkEbVt82xKRCoGXLhRteRJu7067qKMPlDPHHjoVfFWQ8
	oVBmNs1X6ywvXGlXPJ7vxRYRiwz0Ff/PjfRmN2vLj1q3Hjw5dNB2Y9c785q0whvLM/4CFQjwWKHae
	QuJu5uGIwXIn5qhVel4YzeS8dDWBfGY9lTVAhekrd1tfR5H1M/YO3YG2coTBITe6P4hkSZ+uV7QoE
	5roj4SnP5t4TEFsHo0vsUxLw/ktHxN+dba5J6jybdmAZPlosXsWbedP4Sm/MYyI4qqIm14lc3UCld
	Lbs9DIWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugX3-00000005Ua0-3bjH;
	Sat, 06 Sep 2025 00:11:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubUI-00000003uSZ-0ITQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 18:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17137152B;
	Fri,  5 Sep 2025 11:48:31 -0700 (PDT)
Received: from [10.1.197.69] (unknown [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C6113F63F;
	Fri,  5 Sep 2025 11:48:33 -0700 (PDT)
Message-ID: <c129a5ca-066b-4a78-a1fe-be474b592022@arm.com>
Date: Fri, 5 Sep 2025 19:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-11-james.morse@arm.com>
 <120b4049-a28d-40ad-9def-c901e12c7a68@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <120b4049-a28d-40ad-9def-c901e12c7a68@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_114842_205194_FD114C32 
X-CRM114-Status: GOOD (  30.07  )
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

Hi Ben,

On 27/08/2025 14:03, Ben Horgan wrote:
> On 8/22/25 16:29, James Morse wrote:
>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
>> only be accessible from those CPUs, and they may not be online.
>> Touching the hardware early is pointless as MPAM can't be used until
>> the system-wide common values for num_partid and num_pmg have been
>> discovered.
>>
>> Start with driver probe/remove and mapping the MSC.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> new file mode 100644
>> index 000000000000..a0d9a699a6e7
>> --- /dev/null
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -0,0 +1,336 @@

>> +static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>> +				  u32 ris_idx)
>> +{
>> +	int err = 0;
>> +	u32 level = 0;
>> +	unsigned long cache_id;
>> +	struct device_node *cache;
>> +
>> +	do {
>> +		if (of_device_is_compatible(np, "arm,mpam-cache")) {
>> +			cache = of_parse_phandle(np, "arm,mpam-device", 0);
>> +			if (!cache) {
>> +				pr_err("Failed to read phandle\n");
>> +				break;
>> +			}
> This looks like this allows "arm,mpam-cache" and "arm,mpam-device" to be
> used on an msc node when there are no ris children. This usage could be
> reasonable but doesn't match the schema in the previous patch. Should
> this usage be rejected or the schema extended?

The DT/ACPI stuff is only going to describe the things that make sense at a high level,
e.g. the controls for the L3. There may be other controls for stuff that doesn't make
sense in the hardware - these get discovered, grouped as 'unknown' and left alone.

Another angle on this is where there is an MSC that the OS will never make use of, but
needs to know about to find the system wide minimum value. (there is a comment about
this in the ACPI spec...)

I don't think its a problem if the magic dt-binding machinery is overly restrictive, that
is about validating DTB files...


>> +		} else if (of_device_is_compatible(np->parent, "cache")) {
>> +			cache = of_node_get(np->parent);
>> +		} else {
>> +			/* For now, only caches are supported */
>> +			cache = NULL;
>> +			break;
>> +		}
>> +
>> +		err = of_property_read_u32(cache, "cache-level", &level);
>> +		if (err) {
>> +			pr_err("Failed to read cache-level\n");
>> +			break;
>> +		}
>> +
>> +		cache_id = cache_of_calculate_id(cache);
>> +		if (cache_id == ~0UL) {
>> +			err = -ENOENT;
>> +			break;
>> +		}
>> +
>> +		err = mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level,
>> +				      cache_id);
>> +	} while (0);
>> +	of_node_put(cache);
>> +
>> +	return err;
>> +}

>> +static int mpam_msc_drv_probe(struct platform_device *pdev)
>> +{
>> +	int err;
>> +	struct mpam_msc *msc;
>> +	struct resource *msc_res;
>> +	void *plat_data = pdev->dev.platform_data;
>> +
>> +	mutex_lock(&mpam_list_lock);
>> +	do {
>> +		msc = devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
>> +		if (!msc) {
>> +			err = -ENOMEM;
>> +			break;
>> +		}
>> +
>> +		mutex_init(&msc->probe_lock);
>> +		mutex_init(&msc->part_sel_lock);
>> +		mutex_init(&msc->outer_mon_sel_lock);
>> +		raw_spin_lock_init(&msc->inner_mon_sel_lock);
>> +		msc->id = mpam_num_msc++;
>> +		msc->pdev = pdev;
>> +		INIT_LIST_HEAD_RCU(&msc->glbl_list);
>> +		INIT_LIST_HEAD_RCU(&msc->ris);
>> +
>> +		err = update_msc_accessibility(msc);
>> +		if (err)
>> +			break;
>> +		if (cpumask_empty(&msc->accessibility)) {
>> +			pr_err_once("msc:%u is not accessible from any CPU!",
>> +				    msc->id);
>> +			err = -EINVAL;
>> +			break;
>> +		}
>> +
>> +		if (device_property_read_u32(&pdev->dev, "pcc-channel",
>> +					     &msc->pcc_subspace_id))
>> +			msc->iface = MPAM_IFACE_MMIO;
>> +		else
>> +			msc->iface = MPAM_IFACE_PCC;
>> +
>> +		if (msc->iface == MPAM_IFACE_MMIO) {
>> +			void __iomem *io;
>> +
>> +			io = devm_platform_get_and_ioremap_resource(pdev, 0,
>> +								    &msc_res);
>> +			if (IS_ERR(io)) {
>> +				pr_err("Failed to map MSC base address\n");
>> +				err = PTR_ERR(io);
>> +				break;
>> +			}
>> +			msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>> +			msc->mapped_hwpage = io;
>> +		} else if (msc->iface == MPAM_IFACE_PCC) {
>> +			msc->pcc_cl.dev = &pdev->dev;
>> +			msc->pcc_cl.rx_callback = mpam_pcc_rx_callback;
>> +			msc->pcc_cl.tx_block = false;
>> +			msc->pcc_cl.tx_tout = 1000; /* 1s */
>> +			msc->pcc_cl.knows_txdone = false;
>> +
>> +			msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
>> +								 msc->pcc_subspace_id);
>> +			if (IS_ERR(msc->pcc_chan)) {
>> +				pr_err("Failed to request MSC PCC channel\n");
>> +				err = PTR_ERR(msc->pcc_chan);
>> +				break;
>> +			}
> I don't see pcc support added in this series. Should we fail the probe
> if this interface is specified?

I've got patches from Andre P to support it on DT - but the platforms that need it keeping
popping in and out of existence. I'll pull these bits out - they were intended to check
the ACPI table wasn't totally rotten...


> (If keeping, there is a missing pcc_mbox_free_channel() on the error path.)

When pcc_mbox_request_channel() fails? It already called mbox_free_channel() itself.


>> +		}
>> +
>> +		list_add_rcu(&msc->glbl_list, &mpam_all_msc);
>> +		platform_set_drvdata(pdev, msc);
>> +	} while (0);
>> +	mutex_unlock(&mpam_list_lock);
>> +
>> +	if (!err) {
>> +		/* Create RIS entries described by firmware */
>> +		if (!acpi_disabled)
>> +			err = acpi_mpam_parse_resources(msc, plat_data);
>> +		else
>> +			err = mpam_dt_parse_resources(msc, plat_data);
>> +	}
>> +
>> +	if (!err && fw_num_msc == mpam_num_msc)
>> +		mpam_discovery_complete();
>> +
>> +	if (err && msc)
>> +		mpam_msc_drv_remove(pdev);
>> +
>> +	return err;
>> +}

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> new file mode 100644
>> index 000000000000..07e0f240eaca
>> --- /dev/null
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -0,0 +1,62 @@

>> +struct mpam_msc {
>> +	/* member of mpam_all_msc */
>> +	struct list_head        glbl_list;
>> +
>> +	int			id;
>> +	struct platform_device *pdev;
>> +
>> +	/* Not modified after mpam_is_enabled() becomes true */
>> +	enum mpam_msc_iface	iface;
>> +	u32			pcc_subspace_id;
>> +	struct mbox_client	pcc_cl;
>> +	struct pcc_mbox_chan	*pcc_chan;
>> +	u32			nrdy_usec;
>> +	cpumask_t		accessibility;
>> +
>> +	/*
>> +	 * probe_lock is only take during discovery. After discovery these
> nit: s/take/taken/

Fixed,

>> +	 * properties become read-only and the lists are protected by SRCU.
>> +	 */
>> +	struct mutex		probe_lock;
>> +	unsigned long		ris_idxs[128 / BITS_PER_LONG];
>> +	u32			ris_max;
>> +
>> +	/* mpam_msc_ris of this component */
>> +	struct list_head	ris;
>> +
>> +	/*
>> +	 * part_sel_lock protects access to the MSC hardware registers that are
>> +	 * affected by MPAMCFG_PART_SEL. (including the ID registers that vary
>> +	 * by RIS).
>> +	 * If needed, take msc->lock first.
>> +	 */
>> +	struct mutex		part_sel_lock;
>> +
>> +	/*
>> +	 * mon_sel_lock protects access to the MSC hardware registers that are
>> +	 * affeted by MPAMCFG_MON_SEL.
> nit: s/affeted/affected/
Fixed,


>> +	 * If needed, take msc->lock first.
>> +	 */
>> +	struct mutex		outer_mon_sel_lock;
>> +	raw_spinlock_t		inner_mon_sel_lock;
>> +	unsigned long		inner_mon_sel_flags;
>> +
>> +	void __iomem		*mapped_hwpage;
>> +	size_t			mapped_hwpage_sz;
>> +};
>> +
>> +#endif /* MPAM_INTERNAL_H */

Thanks,

James

