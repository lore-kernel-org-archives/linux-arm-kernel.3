Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62641CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpBxLOl3K1V2UqgAxO542Mcr3FXtWWLxWHart3vUb4A=; b=bojsRdM0YeAD6chZog/o6iERU9
	4sgfMh+xniNcB0CB80jJQYp359wT1PV8VNRnNI8P7C6+r4XISGs9Pd/DGO9geNIzFo8pEbdJazfnu
	ICAm5S+fFLNv362cBGN6mZyRDuZ3c204eJlEkGKoERAi3Exo6STLPGuUF6bpTxihH+Iavvh6onvDh
	n8BzBV37d9tI/iQH41MJDglK0PjJaPkD/D9IwosHrJWr2bvmPKqjQHgva4o1VfeHyGRtNyRr1Q+gs
	IZxcKrH1EYfoufglkHcXpUBPEwGGkgidD/HuocKXgpxIJJLkzhhwYdnNrGuDNWWzVXCvClY7CqZvt
	n4orr8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacT-0000000GrdN-15T5;
	Mon, 08 Sep 2025 12:05:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZW9-0000000GURO-0bXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:54:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CD781692;
	Mon,  8 Sep 2025 03:54:26 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44D6F3F63F;
	Mon,  8 Sep 2025 03:54:29 -0700 (PDT)
Message-ID: <19ca6019-de69-4c5d-bf06-2e04a254f286@arm.com>
Date: Mon, 8 Sep 2025 11:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
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
 <c129a5ca-066b-4a78-a1fe-be474b592022@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <c129a5ca-066b-4a78-a1fe-be474b592022@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035437_282508_E8FFC043 
X-CRM114-Status: GOOD (  31.60  )
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

Hi James,

On 9/5/25 19:48, James Morse wrote:
> Hi Ben,
> 
> On 27/08/2025 14:03, Ben Horgan wrote:
>> On 8/22/25 16:29, James Morse wrote:
>>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
>>> only be accessible from those CPUs, and they may not be online.
>>> Touching the hardware early is pointless as MPAM can't be used until
>>> the system-wide common values for num_partid and num_pmg have been
>>> discovered.
>>>
>>> Start with driver probe/remove and mapping the MSC.
> 
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> new file mode 100644
>>> index 000000000000..a0d9a699a6e7
>>> --- /dev/null
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -0,0 +1,336 @@
> 
>>> +static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>> +				  u32 ris_idx)
>>> +{
>>> +	int err = 0;
>>> +	u32 level = 0;
>>> +	unsigned long cache_id;
>>> +	struct device_node *cache;
>>> +
>>> +	do {
>>> +		if (of_device_is_compatible(np, "arm,mpam-cache")) {
>>> +			cache = of_parse_phandle(np, "arm,mpam-device", 0);
>>> +			if (!cache) {
>>> +				pr_err("Failed to read phandle\n");
>>> +				break;
>>> +			}
>> This looks like this allows "arm,mpam-cache" and "arm,mpam-device" to be
>> used on an msc node when there are no ris children. This usage could be
>> reasonable but doesn't match the schema in the previous patch. Should
>> this usage be rejected or the schema extended?
> 
> The DT/ACPI stuff is only going to describe the things that make sense at a high level,
> e.g. the controls for the L3. There may be other controls for stuff that doesn't make
> sense in the hardware - these get discovered, grouped as 'unknown' and left alone.
> 
> Another angle on this is where there is an MSC that the OS will never make use of, but
> needs to know about to find the system wide minimum value. (there is a comment about
> this in the ACPI spec...)
> 
> I don't think its a problem if the magic dt-binding machinery is overly restrictive, that
> is about validating DTB files...

I agree with your points. However, I was rather thinking that the code
allows more ways to describe the same thing than the schema does. In
that, you could write something like:


msc@80000 {
        compatible = "foo,a-standalone-msc";
        reg = <0x80000 0x1000>;

	...
        msc@10000 {
            compatible = "arm,mpam-msc arm,mpam-cache";
            arm,mpam-device = <&mem>;
            ...
         }
}

Although, now I've written this out, it doesn't seem sensible to worry
about this. Using ris compatibles on an msc, as in my example, is
clearly an error.

> 
>
[snip]
>>> +		} else if (msc->iface == MPAM_IFACE_PCC) {
>>> +			msc->pcc_cl.dev = &pdev->dev;
>>> +			msc->pcc_cl.rx_callback = mpam_pcc_rx_callback;
>>> +			msc->pcc_cl.tx_block = false;
>>> +			msc->pcc_cl.tx_tout = 1000; /* 1s */
>>> +			msc->pcc_cl.knows_txdone = false;
>>> +
>>> +			msc->pcc_chan = pcc_mbox_request_channel(&msc->pcc_cl,
>>> +								 msc->pcc_subspace_id);
>>> +			if (IS_ERR(msc->pcc_chan)) {
>>> +				pr_err("Failed to request MSC PCC channel\n");
>>> +				err = PTR_ERR(msc->pcc_chan);
>>> +				break;
>>> +			}
>> I don't see pcc support added in this series. Should we fail the probe
>> if this interface is specified?
> 
> I've got patches from Andre P to support it on DT - but the platforms that need it keeping
> popping in and out of existence. I'll pull these bits out - they were intended to check
> the ACPI table wasn't totally rotten...
> 
> 
>> (If keeping, there is a missing pcc_mbox_free_channel() on the error path.)
> 
> When pcc_mbox_request_channel() fails? It already called mbox_free_channel() itself.
Apologies, this was relating to if the *_parse_resources() call below
failed.

> 
> 
>>> +		}
>>> +
>>> +		list_add_rcu(&msc->glbl_list, &mpam_all_msc);
>>> +		platform_set_drvdata(pdev, msc);
>>> +	} while (0);
>>> +	mutex_unlock(&mpam_list_lock);
>>> +
>>> +	if (!err) {
>>> +		/* Create RIS entries described by firmware */
>>> +		if (!acpi_disabled)
>>> +			err = acpi_mpam_parse_resources(msc, plat_data);
>>> +		else
>>> +			err = mpam_dt_parse_resources(msc, plat_data);
>>> +	}
>>> +
>>> +	if (!err && fw_num_msc == mpam_num_msc)
>>> +		mpam_discovery_complete();
>>> +
>>> +	if (err && msc)
>>> +		mpam_msc_drv_remove(pdev);
>>> +
>>> +	return err;
>>> +}
[snip]>
> Thanks,
> 
> James
Thanks,

Ben


