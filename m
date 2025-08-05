Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B578C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 17:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pk5VRAthHJ+QLTUMdOL3iQl2VxKSn0PZW57LZLWPAk=; b=gKBxgNyH1uahUW1BZHCwW+p7GT
	9dNLswqzfXXZ+AJmW4Qd9bMaNYRFC9Q3cDrW7kNqFmJcupj9Qs7PfxxdUG9H3H5YbTsdvbUT2vJnu
	zkmGVdcgkB650b3FI6h7e5QV26t7pnEKG/pWtYjAL1wVR4+jNxbKtx/zl3MwUD4laUO86kfo1BchX
	mzXStSPfSsfe6mOg2UPdfX4zl0QXcjCt39VLFllNffiFk4Pwg8/BiR6ga0UYrjp0bzbXx6qrZdJ0R
	uCSgKH+a30YWQ4e9chNt3iZcAf8i0DTRrKJWgHv7WSSr/q9r0Ixfw/2i/kfssUBRUOAadye2JwyLh
	Ucw1OAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujLWH-0000000DRNq-3V1H;
	Tue, 05 Aug 2025 17:32:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujL8Z-0000000DNg3-3pPw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 17:07:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EA24150C;
	Tue,  5 Aug 2025 10:07:35 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 357F23F673;
	Tue,  5 Aug 2025 10:07:37 -0700 (PDT)
Message-ID: <66370898-a187-4fcf-a38f-64418ba222ce@arm.com>
Date: Tue, 5 Aug 2025 18:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] ACPI / MPAM: Parse the MPAM table
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-11-james.morse@arm.com>
 <20250716180725.0000452d@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250716180725.0000452d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_100744_041616_C23B02DB 
X-CRM114-Status: GOOD (  50.66  )
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

Hi Jonathan,

On 16/07/2025 18:07, Jonathan Cameron wrote:
> On Fri, 11 Jul 2025 18:36:22 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> Add code to parse the arm64 specific MPAM table, looking up the cache
>> level from the PPTT and feeding the end result into the MPAM driver.

> Throw in a link to the spec perhaps?  Particularly useful to know which
> version this was written against when reviewing it.

Will do. Ben has already pointed out it wasn't written against the latest version...


>> diff --git a/drivers/acpi/arm64/Makefile b/drivers/acpi/arm64/Makefile
>> index 05ecde9eaabe..27b872249baa 100644
>> --- a/drivers/acpi/arm64/Makefile
>> +++ b/drivers/acpi/arm64/Makefile
>> @@ -6,5 +6,6 @@ obj-$(CONFIG_ACPI_GTDT) 	+= gtdt.o
>>  obj-$(CONFIG_ACPI_IORT) 	+= iort.o
>>  obj-$(CONFIG_ACPI_PROCESSOR_IDLE) += cpuidle.o
>>  obj-$(CONFIG_ARM_AMBA)		+= amba.o
>> +obj-$(CONFIG_ACPI_MPAM) 	+= mpam.o
> 
> Keep it with the ACPI ones? 

Sure,


> There doesn't seem to be a lot of order in here
> though so I guess maybe there is logic behind putting it here I'm missing.

merge conflicts over many years always put it at the bottom of the file.
I at least kept the conditional ones together.

Moving it up lets the table 'drivers' appear together in alphabetical order.


>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>> new file mode 100644
>> index 000000000000..f4791bac9a2a
>> --- /dev/null
>> +++ b/drivers/acpi/arm64/mpam.c
>> @@ -0,0 +1,365 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (C) 2025 Arm Ltd.
>> +
>> +/* Parse the MPAM ACPI table feeding the discovered nodes into the driver */
>> +
>> +#define pr_fmt(fmt) "ACPI MPAM: " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/arm_mpam.h>
>> +#include <linux/cpu.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include <acpi/processor.h>
>> +
>> +/* Flags for acpi_table_mpam_msc.*_interrupt_flags */

> References.. I'm looking at 3.0-alpha table 5 to check this.
> I can see why you might be reluctant to point at an alpha if that
> is what you are using ;)

I did this against the released(?) version 2.0. (aka table revision 1).
I'll add references based on the v3 beta ... it looks like that defines the
mmio-size=0 behaviour and the pcc stuff. The mmio-size is harmless - we'd
need to handle that as an error anyay. I don't want to touch the pcc thing
until there is a real platform that needs it, and the spec is finished...

e.g.
| * See 2.1.1 Interrupt Flags, Table 5, of DEN0065B_MPAM_ACPI_3.0-bet.


>> +#define ACPI_MPAM_MSC_IRQ_MODE_EDGE                    1
>> +#define ACPI_MPAM_MSC_IRQ_TYPE_MASK                    (3 << 1)

> GENMASK(3, 2) would be my preference for how to do masks in new code.

GENMASK(2, 1), but yes.


>> +#define ACPI_MPAM_MSC_IRQ_TYPE_WIRED                   0
>> +#define ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER BIT(3)
>> +#define ACPI_MPAM_MSC_IRQ_AFFINITY_VALID               BIT(4)
>> +
>> +static bool frob_irq(struct platform_device *pdev, int intid, u32 flags,
>> +		     int *irq, u32 processor_container_uid)
>> +{
>> +	int sense;
>> +
>> +	if (!intid)
>> +		return false;
>> +
>> +	/* 0 in this field indicates a wired interrupt */
>> +	if (flags & ACPI_MPAM_MSC_IRQ_TYPE_MASK)

> I'd prefer more explicit code (and probably no comment)
> 
> 	if (FIELD_GET(flags, ACPI_MPAM_MSC_IRQ_TYPE_MASK) !=
> 	    ACPI_MPAM_MSC_IRQ_TYPE_WIRED)
> 		return false;

Sure,


>> +		return false;
>> +
>> +	if (flags & ACPI_MPAM_MSC_IRQ_MODE_EDGE)
>> +		sense = ACPI_EDGE_SENSITIVE;
>> +	else
>> +		sense = ACPI_LEVEL_SENSITIVE;
> 
> If the spec is supposed to be using standard ACPI_* types for this field
> (I don't think the connection is explicitly documented though) then

Sent as feedback on the spec. (I didn't realise those were standard!)


> 	sense = FIELD_GET(flags, ACPI_MPAM_MSC_IRQ_MODE_MASK); 
> Assuming a change to define the mask and rely on the ACPI defs for the values
> 
> This one is entirely up to you.

>> +
>> +	/*
>> +	 * If the GSI is in the GIC's PPI range, try and create a partitioned
>> +	 * percpu interrupt.
>> +	 */
>> +	if (16 <= intid && intid < 32 && processor_container_uid != ~0) {
>> +		pr_err_once("Partitioned interrupts not supported\n");
>> +		return false;
>> +	}
>> +
>> +	*irq = acpi_register_gsi(&pdev->dev, intid, sense, ACPI_ACTIVE_HIGH);
>> +	if (*irq <= 0) {
>> +		pr_err_once("Failed to register interrupt 0x%x with ACPI\n",
>> +			    intid);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +static void acpi_mpam_parse_irqs(struct platform_device *pdev,
>> +				 struct acpi_mpam_msc_node *tbl_msc,
>> +				 struct resource *res, int *res_idx)
>> +{
>> +	u32 flags, aff = ~0;
>> +	int irq;
>> +
>> +	flags = tbl_msc->overflow_interrupt_flags;
>> +	if (flags & ACPI_MPAM_MSC_IRQ_AFFINITY_VALID &&
>> +	    flags & ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER)
>> +		aff = tbl_msc->overflow_interrupt_affinity;

> Just to make the two cases look the same I'd do
> 
> 	else
> 		aff = ~0;
> 
> here as well and not initialize above.  It's not quite worth using
> a helper function for these two identical blocks but it's close.
> 
>> +	if (frob_irq(pdev, tbl_msc->overflow_interrupt, flags, &irq, aff)) {
>> +		res[*res_idx].start = irq;
>> +		res[*res_idx].end = irq;
>> +		res[*res_idx].flags = IORESOURCE_IRQ;
>> +		res[*res_idx].name = "overflow";
> 
> 		res[*res_idx] = DEFINE_RES_IRQ_NAMED(irq, 1, "overflow");

Handy, not seen that before.

>> +
>> +		(*res_idx)++;

> Can roll this in as well.

>> +	}
>> +
>> +	flags = tbl_msc->error_interrupt_flags;
>> +	if (flags & ACPI_MPAM_MSC_IRQ_AFFINITY_VALID &&
>> +	    flags & ACPI_MPAM_MSC_IRQ_AFFINITY_PROCESSOR_CONTAINER)
>> +		aff = tbl_msc->error_interrupt_affinity;
>> +	else
>> +		aff = ~0;
>> +	if (frob_irq(pdev, tbl_msc->error_interrupt, flags, &irq, aff)) {
>> +		res[*res_idx].start = irq;
>> +		res[*res_idx].end = irq;
>> +		res[*res_idx].flags = IORESOURCE_IRQ;
>> +		res[*res_idx].name = "error";
> 
> Similar to above.

Yup,


>> +
>> +		(*res_idx)++;
>> +	}
>> +}
>> +
> 
> 
>> +static bool __init parse_msc_pm_link(struct acpi_mpam_msc_node *tbl_msc,
>> +				     struct platform_device *pdev,
>> +				     u32 *acpi_id)
>> +{
>> +	bool acpi_id_valid = false;
>> +	struct acpi_device *buddy;
>> +	char hid[16], uid[16];
>> +	int err;
>> +
>> +	memset(&hid, 0, sizeof(hid));
>> +	memcpy(hid, &tbl_msc->hardware_id_linked_device,
>> +	       sizeof(tbl_msc->hardware_id_linked_device));
>> +
>> +	if (!strcmp(hid, ACPI_PROCESSOR_CONTAINER_HID)) {
>> +		*acpi_id = tbl_msc->instance_id_linked_device;
>> +		acpi_id_valid = true;
>> +	}
>> +
>> +	err = snprintf(uid, sizeof(uid), "%u",
>> +		       tbl_msc->instance_id_linked_device);
>> +	if (err < 0 || err >= sizeof(uid))

> Does snprintf() ever return < 0 ?  It's documented as returning
> number of chars printed (without the NULL) so that can only be 0 or
> greater.

That looks like paranoia around string parsing in C, and snprintf() returning an int.
I've removed the first half,


> Can it return >= sizeof(uid) ? Looks odd. 

More paranoia, it should be impossible given the arguments, but the documentation has:
| If the return is greater than or equal to @size, the resulting string is truncated.

If the string is truncated, there is no reason to feed it into acpi_dev_get_first_match_dev().


> +		return acpi_id_valid;
>> +
>> +	buddy = acpi_dev_get_first_match_dev(hid, uid, -1);
>> +	if (buddy)
>> +		device_link_add(&pdev->dev, &buddy->dev, DL_FLAG_STATELESS);
>> +
>> +	return acpi_id_valid;
>> +}
> 
>> +static int __init _parse_table(struct acpi_table_header *table)
>> +{
>> +	char *table_end, *table_offset = (char *)(table + 1);
>> +	struct property_entry props[4]; /* needs a sentinel */
>> +	struct acpi_mpam_msc_node *tbl_msc;
>> +	int next_res, next_prop, err = 0;
>> +	struct acpi_device *companion;
>> +	struct platform_device *pdev;
>> +	enum mpam_msc_iface iface;
>> +	struct resource res[3];
>> +	char uid[16];
>> +	u32 acpi_id;
>> +
>> +	table_end = (char *)table + table->length;
>> +
>> +	while (table_offset < table_end) {
>> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
>> +		table_offset += tbl_msc->length;
>> +
>> +		/*
>> +		 * If any of the reserved fields are set, make no attempt to
>> +		 * parse the msc structure. This will prevent the driver from
>> +		 * probing all the MSC, meaning it can't discover the system
>> +		 * wide supported partid and pmg ranges. This avoids whatever
>> +		 * this MSC is truncating the partids and creating a screaming
>> +		 * error interrupt.
>> +		 */
>> +		if (tbl_msc->reserved || tbl_msc->reserved1 || tbl_msc->reserved2)
>> +			continue;
>> +
>> +		if (decode_interface_type(tbl_msc, &iface))
>> +			continue;
>> +
>> +		next_res = 0;
>> +		next_prop = 0;
>> +		memset(res, 0, sizeof(res));
>> +		memset(props, 0, sizeof(props));
>> +
>> +		pdev = platform_device_alloc("mpam_msc", tbl_msc->identifier);
>> +		if (IS_ERR(pdev)) {

> returns NULL in at least some error cases (probably all, I'm just to lazy to check)

So it does ... Fixed.


>> +			err = PTR_ERR(pdev);
>> +			break;
>> +		}
>> +
>> +		if (tbl_msc->length < sizeof(*tbl_msc)) {
>> +			err = -EINVAL;
>> +			break;
>> +		}
>> +
>> +		/* Some power management is described in the namespace: */
>> +		err = snprintf(uid, sizeof(uid), "%u", tbl_msc->identifier);
>> +		if (err > 0 && err < sizeof(uid)) {
>> +			companion = acpi_dev_get_first_match_dev("ARMHAA5C", uid, -1);
>> +			if (companion)
>> +				ACPI_COMPANION_SET(&pdev->dev, companion);
>> +		}
>> +
>> +		if (iface == MPAM_IFACE_MMIO) {
>> +			res[next_res].name = "MPAM:MSC";
>> +			res[next_res].start = tbl_msc->base_address;
>> +			res[next_res].end = tbl_msc->base_address + tbl_msc->mmio_size - 1;
>> +			res[next_res].flags = IORESOURCE_MEM;
>> +			next_res++;

> DEFINE_RES_MEM_NAMED()?

Done,


>> +		} else if (iface == MPAM_IFACE_PCC) {
>> +			props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>> +								tbl_msc->base_address);
>> +			next_prop++;
>> +		}
>> +
>> +		acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
>> +		err = platform_device_add_resources(pdev, res, next_res);
>> +		if (err)
>> +			break;
>> +
>> +		props[next_prop++] = PROPERTY_ENTRY_U32("arm,not-ready-us",
>> +							tbl_msc->max_nrdy_usec);
>> +
>> +		/*
>> +		 * The MSC's CPU affinity is described via its linked power
>> +		 * management device, but only if it points at a Processor or
>> +		 * Processor Container.
>> +		 */
>> +		if (parse_msc_pm_link(tbl_msc, pdev, &acpi_id)) {
>> +			props[next_prop++] = PROPERTY_ENTRY_U32("cpu_affinity",
>> +								acpi_id);
>> +		}
>> +
>> +		err = device_create_managed_software_node(&pdev->dev, props,
>> +							  NULL);
>> +		if (err)
>> +			break;
>> +
>> +		/* Come back later if you want the RIS too */
>> +		err = platform_device_add_data(pdev, tbl_msc, tbl_msc->length);
>> +		if (err)
>> +			break;
>> +
>> +		platform_device_add(pdev);

> Can fail.

Fixed,


>> +	}
>> +
>> +	if (err)
>> +		platform_device_put(pdev);
>> +
>> +	return err;
>> +}

>> +static int _count_msc(struct acpi_table_header *table)
>> +{
>> +	char *table_end, *table_offset = (char *)(table + 1);
>> +	struct acpi_mpam_msc_node *tbl_msc;
>> +	int ret = 0;

> Call it count as it only ever contains the count?

Sure,


>> +
>> +	tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
>> +	table_end = (char *)table + table->length;
>> +
>> +	while (table_offset < table_end) {
>> +		if (tbl_msc->length < sizeof(*tbl_msc))
>> +			return -EINVAL;
>> +
>> +		ret++;
> 
> count++ would feel more natural here.
> 
>> +
>> +		table_offset += tbl_msc->length;
>> +		tbl_msc = (struct acpi_mpam_msc_node *)table_offset;
>> +	}
>> +
>> +	return ret;
>> +}

> That's all I have time for today. Will get to the rest of the series soonish.

Thanks for taking a look!


James


