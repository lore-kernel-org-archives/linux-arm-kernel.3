Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E141C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le0/JaypphbaMpWBy3jzC8HKwJZGsnglhkA+DFRi4cA=; b=nNV4GEtRIZOMNJHWmDf2NBucAs
	qNUa7HcXQrRiVpapqgKFDxZKcP0IgykVOGCQ0QMsL++JLapThcz+SMjOeMLn9dyMHK537mvE+PCjm
	Gz+YZ0fAzO3d/h6Lm1be5ND1w8gj9NRyk+MiYFdkzI6BwxrC7tmtX78NKVltxEIagpu7zMCvrbRrm
	uXwe/x7+Tm7baL5LHGejA4CXp4xDBgLBILKdB0rV4m8fHDXTmM7z/Zb+SHWfLPZNM8j28Owh8bR7A
	8D05ZX4CL6ngh6Im3WqsEgxZ/wcKc1MkEO3u14KhPdOBJ0/+Mb07x8faAaohBFgwm5uX6EopR1/RT
	cbwr+ISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2r3-00000007nOg-2X3u;
	Wed, 29 Jul 2026 11:53:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2qz-00000007nNh-45cw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:53:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C25F21688;
	Wed, 29 Jul 2026 04:53:36 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B41B3F86F;
	Wed, 29 Jul 2026 04:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785326020; bh=/RDp9rxsJQEOfIipnO7msV7vkcBVlVpqDy3nZBDHhvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t+/4zVBVxO/NbyfabjrcVpPdppift/tgVo9jfeQMflVzg4VXrYGEf8DLzclawgYSG
	 81m0m2g+1nJGzeZUD9Hj7gH+l0ku1le3imZBg0VbcuXGZbVGzx96Rf/wa5c+ImNZAM
	 hhB+Ke/O3+Xc2mlHwyfLS01LiIZDDrE1b87Q1X8I=
Message-ID: <0813a57c-85ed-45b7-8cd1-933d99b31d8f@arm.com>
Date: Wed, 29 Jul 2026 13:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-11-andre.przywara@arm.com>
 <4faf0089-4615-4fb1-bc07-e52b4d43f073@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <4faf0089-4615-4fb1-bc07-e52b4d43f073@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_045342_126352_15B0D99F 
X-CRM114-Status: GOOD (  35.90  )
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

Hi Srivathsa,

On 7/27/26 18:27, Srivathsa L Rao wrote:
> 
> 
> On 7/23/2026 9:24 PM, Andre Przywara wrote:
>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>> registers through a firmware interface. This requires a shared memory
>> region to hold the message, and a mailbox to trigger the access.
>> For ACPI this is wrapped as a PCC channel, described using existing
>> ACPI abstractions.
>>
>> Add code to parse those PCC table descriptions associated with an MSC,
>> and store the parsed information in the MSC struct.
>> There can be multiple PCC channels, and each channel can serve multiple
>> MSCs, so we need to keep track of the channel usage, using a list and
>> a refcount.
>> This will be used by the MPAM-Fb access wrapper code.
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/acpi/arm64/mpam.c      |   6 +-
>>   drivers/resctrl/mpam_devices.c | 127 ++++++++++++++++++++++++++++++++-
>>   2 files changed, 129 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>> index 84963a20c3e7..ca9b8754ae5f 100644
>> --- a/drivers/acpi/arm64/mpam.c
>> +++ b/drivers/acpi/arm64/mpam.c
>> @@ -220,8 +220,8 @@ static struct platform_device * __init 
>> acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>       struct platform_device *pdev __free(platform_device_put) =
>>           platform_device_alloc("mpam_msc", tbl_msc->identifier);
>>       int next_res = 0, next_prop = 0, err;
>> -    /* pcc, nrdy, affinity and a sentinel */
>> -    struct property_entry props[4] = { 0 };
>> +    /* pcc, msc-id, nrdy, affinity and a sentinel */
>> +    struct property_entry props[5] = { 0 };
>>       /* mmio, 2xirq, no sentinel. */
>>       struct resource res[3] = { 0 };
>>       struct acpi_device *companion;
>> @@ -256,6 +256,8 @@ static struct platform_device * __init 
>> acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>       } else if (iface == MPAM_IFACE_PCC) {
>>           props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>>                               tbl_msc->base_address);
>> +        props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
>> +                            tbl_msc->identifier);
>>       }
>>       acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index fea3161ffbe9..fc4b5f87fbe9 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -19,14 +19,19 @@
>>   #include <linux/irqdesc.h>
>>   #include <linux/list.h>
>>   #include <linux/lockdep.h>
>> +#include <linux/mailbox_client.h>
>>   #include <linux/mutex.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/printk.h>
>> +#include <linux/property.h>
>>   #include <linux/srcu.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>> +#include <acpi/pcc.h>
>> +#include <acpi/acpi_io.h>
>> +
>>   #include "mpam_internal.h"
>>   /* Values for the T241 errata workaround */
>> @@ -49,6 +54,86 @@ static LIST_HEAD(mpam_all_msc);
>>   struct srcu_struct mpam_srcu;
>> +/* PCC channels might be serving multiple MSCs, so keep a refcounted 
>> list. */
>> +static DEFINE_MUTEX(pcc_chan_list_lock);
>> +static LIST_HEAD(pcc_chan_list);
>> +
>> +static void mpam_pcc_chan_release(struct kref *ref)
>> +{
>> +    struct mpam_pcc_chan *cur = container_of(ref, struct mpam_pcc_chan,
>> +                         refcount);
>> +
>> +    pcc_mbox_free_channel(cur->pcc_chan);
>> +    list_del(&cur->pcc_chans);
>> +    kfree(cur);
>> +}
>> +
>> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
>> +                           int subspace_id)
>> +{
>> +    struct mpam_pcc_chan *cur;
>> +    int ret;
>> +
>> +    guard(mutex)(&pcc_chan_list_lock);
>> +
>> +    list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
>> +        if (cur->subspace_id == subspace_id) {
>> +            kref_get(&cur->refcount);
>> +
>> +            return cur;
>> +        }
>> +    }
>> +
>> +    cur = kzalloc_obj(*cur);
>> +    if (!cur)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    cur->pcc_cl.dev = dev;
>> +    cur->pcc_cl.tx_block = true;
>> +
>> +    cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
>> +    if (IS_ERR(cur->pcc_chan)) {
>> +        long err = PTR_ERR(cur->pcc_chan);
>> +
>> +        kfree(cur);
>> +        return ERR_PTR(err);
>> +    }
>> +
>> +    /* Timeout based on the "nominal latency" from the PCC ACPI 
>> table. */
>> +    cur->pcc_cl.tx_tout = cur->pcc_chan->latency * 5;
>> +
>> +    ret = devm_mutex_init(dev, &cur->pcc_chan_lock);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
> 
> Here, devm_mutex_init() ties the lifetime of pcc_chan_lock to dev, which 
> is &pdev->dev of the first MSC to call mpam_pcc_chan_get(). But
> mpam_pcc_chan is shared across multiple MSCs via kref, so it can
> outlive that first device.

Ah, that's a good point, thanks for catching that. It was too tempting 
to just replace the original mutex_init() with the devm_ version, but 
indeed the lifetime is not the same.

> If a second MSC has incremented the refcount and is still active when
> the first MSC's device is removed, the devm cleanup on the first device
> would call mutex_destroy() on pcc_chan_lock while the second MSC may
> still be inside:
> 
>      guard(mutex)(&pcc_chan->pcc_chan_lock);
> 
> I am not 100% sure this is reachable in practice — it may depend on
> the order in which platform devices are unbound, and whether that can
> happen with MSCs sharing a channel. I also note that devm_mutex_init()
> is a no-op on non-debug kernels, so this would only be observable with
> CONFIG_DEBUG_MUTEXES=y. But it felt worth raising in case
> it is a real path.
> 
> If my understanding is correct, would it make sense to use a plain
> mutex_init() here instead, and move mutex_destroy() into
> mpam_pcc_chan_release() where the kref guarantees no concurrent users
> remain?

Yes, that's a good idea, since we free the data structure in the release 
function anyway, we can surely destroy the mutex there. And thanks for 
the heads up about this being a no-op mostly!

Cheers,
Andre


