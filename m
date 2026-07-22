Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DA9C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xkoj3qGlqKO/GkpqKSaOgxYukQoKk4SHDFgo8r+Chvg=; b=iYczwN3Zzv5BGzF2bSndvy8lZm
	WGoqwtzbSmjTIknLf+MIvyl+C1RIb5A6E0EL211YuEXy8ikakfCBG2KMnhFvMjJE19I+vXt1jCpVu
	1yiJhSXpi5fRUvrxNLXEXY8IKAS0++Cp/j/RxTiFWS24nBYDyJCAN2QSUIJ4kcorNyGMF5c0QDA4X
	Ie5J05QzheI+bVztRdKF6XgWd7XesD8gWeCzQXT4WSYskP5bUsoSukv0s0+EMnfHiJgSyKgX5Q59U
	cbWoKIPReiaX60knqN7OC6ZdCB130D/5Lr/jYSx5IoIslqJNiUG7DD1X6DAjdtC7kL/mrtheswhxb
	2D3QNKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZoZ-0000000CLTN-2mN3;
	Wed, 22 Jul 2026 16:28:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZoQ-0000000CLQK-3w0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:28:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C23751595;
	Wed, 22 Jul 2026 09:28:45 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73A0C3F59E;
	Wed, 22 Jul 2026 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784737729; bh=IQGf2xrYim1ry1BxUjl8s/4UAJ8lN+81xRcpvk0myQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sdkP+PETIWvTXqtrKUyMI8SlBl/1FaGU/TO7GLxlj1lc8SO31HcrahkKaWLnfSnr3
	 n+gEVqV9hJeIS93uI9BHIYeABrSuXV0B5GnMPS9xG8NP6YX7Uq9UBErJM+QIb7TkV9
	 WvaQ/5IMrX/f2yg5YTqlsByOChFxZNzEXji+mibc=
Message-ID: <b163a048-152e-4e53-9353-abae0fc65e98@arm.com>
Date: Wed, 22 Jul 2026 18:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/16] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-15-andre.przywara@arm.com>
 <20260710125832.00003be9@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710125832.00003be9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_092851_075781_554207E6 
X-CRM114-Status: GOOD (  37.42  )
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

Hi,

On 7/10/26 21:58, Jonathan Cameron wrote:
> On Fri, 10 Jul 2026 16:45:18 +0200
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
>> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
>> alternative way of accessing the "Memory System Components" (MSC) in an
>> MPAM enabled system.
> 
> Blank line for consistency on paragraph breaks.
> 
>> Normally the MSCs are MMIO mapped, but in some implementations this
> 
> Hmm. Not sure what normal is in this case ;)  Maybe make it something like

Well, so far the MPAM spec demanded MSCs to be memory mapped, that has 
only been somewhat retroactively relaxed with the advent of MPAM-Fb. And 
given the performance penalty I expect MMIO-mapped MSCs to still be the 
"normal" case.

> In systems supported before this patch the MSCs are MMIO mapped,
> 
>> might not be possible (MSC located outside of the local socket, MSC
>> mapped secure-only) or desirable (direct MMIO access too slow or needs
>> to be mediated through a control processor). MPAM-fb standardises a
>> protocol to abstract MSC accesses, building on the SCMI protocol.
>>
>> Add functions that do an MSC read or write access by redirecting the
>> request through a firmware interface. For now this done via an ACPI
>> PCC shared memory and mailbox combination.
>>
>> Since the protocol used is only a small subset of the full SCMI spec,
>> and the SCMI protocol has no full ACPI support anyway, open-code the
>> SCMI message generation and handshake, for just the fields we need.
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Hi Andre,
> 
> Various things inline.
> 
> Thanks,
> 
> Jonathan
> 
> ...
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index ca73029654b6..4d3e642486d4 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
> 
>> @@ -1133,7 +1139,8 @@ static int mpam_msc_read_mbwu_l(struct mpam_msc *msc, u64 *res)
>>   
>>   	mpam_mon_sel_lock_held(msc);
>>   
>> -	WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>> +	if (msc->iface == MPAM_IFACE_MMIO)
>> +		WARN_ON_ONCE((MSMON_MBWU_L + sizeof(u64)) > msc->mapped_hwpage_sz);
>>   	WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(), &msc->accessibility));
>>   
>>   	ret = __mpam_read_reg(msc, MSMON_MBWU_L + 4, &mbwu_l_high2);
>> @@ -1481,9 +1488,15 @@ static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
>>   					 srcu_read_lock_held(&mpam_srcu)) {
>>   			arg->ris = ris;
>>   
>> -			err = smp_call_function_any(&msc->accessibility,
>> -						    __ris_msmon_read, arg,
>> -						    true);
>> +			if (msc->iface == MPAM_IFACE_MMIO) {
>> +				err = smp_call_function_any(&msc->accessibility,
>> +							    __ris_msmon_read,
>> +							    arg, true);
>> +			} else {
>> +				__ris_msmon_read(arg);
>> +				err = 0;
>> +			}
>> +
>>   			if (!err && arg->err)
>>   				err = arg->err;
> FWIW
> The arg->err check here seems pointless
> 
> 			if (!err)
> 				err = arg->err;
> 
> is at most going to set a 0 to 0.
> 
> Maybe lift this into the if else as it should end up simpler in the else.
> 
> 			if (msc->iface == MPAM_IFACE_MMIO) {
> 				err = smp_call_function_any(&msc->accessibility,
> 							    __ris_msmon_read,
> 							    arg, true);
> 				if (!err)
> 					err = arg->err;
> 			} else {
> 				__ris_msmon_read(arg);
> 				err = arg->err;
> 			}
> 
> 			if (err)
> 				any_err = err;

Yeah, that looks better.

> 
>   
> ...
> 
>> diff --git a/drivers/resctrl/mpam_fb.c b/drivers/resctrl/mpam_fb.c
>> new file mode 100644
>> index 000000000000..7d7409910f28
>> --- /dev/null
>> +++ b/drivers/resctrl/mpam_fb.c
>> @@ -0,0 +1,208 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (C) 2024 Arm Ltd.
> 
> Really?  sat on this for 2 years? ;)

Yes, it started quite differently, but with MPAM upstreaming in the 
works only and not much demand for MMIO alternatives this was shelved 
back then.

> Given it's changing during this posting I'd at least include this
> year in the range.

Well, not sure the final year is really important. I think what counts 
more is to make sure that the earliest code pieces are covered, to avoid 
prior-art claims under a different license.

>> +
>> +#include <linux/arm_mpam.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/gfp.h>
>> +#include <linux/list.h>
>> +#include <linux/mailbox_client.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
> 
> Scrub these for things used in this patch.
> Maybe others will be needed after later patches.
> Not seeing any of_ stuff in here for instance.

You got it.

>> +#include <linux/platform_device.h>
>> +#include <linux/printk.h>
>> +#include <linux/processor.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/types.h>
> 
>> +struct mpam_fb_access_payload {mpam_fb_access_payload
>> +	u32 msc_id;
>> +	u32 flags;
>> +	u32 reg_offset;
>> +	u32 value;
>> +} __packed;
> There are only a few of these in spec, and whilst they share the same layout
> for fields they define (not all same length),
> 
> I'd define separate structures for each of the message types.
> Added bonus being that...

Yeah, we just need them for the read and write message, so just added a 
second one.

> 
>> +
>> +#define PCC_CHAN_FLAGS_IRQ	BIT(0)
>> +#define MPAM_VERSION_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS)
>> +#define MPAM_READ_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS + 3 * sizeof(u32))
> 
> These would then become  PCC_TYPE3_MSG_PAYLOAD_OFF + sizeof(mpam_fb_read_request_payload)
> or something self describing along those lines.

Ack.

> 
>> +#define MPAM_WRITE_MSG_SIZE	(PCC_TYPE3_MSG_PAYLOAD_OFS + 4 * sizeof(u32))
>> +
>> +static atomic_t mpam_fb_token = ATOMIC_INIT(0);
>> +
>> +static int mpam_fb_build_version_message(unsigned int token,
>> +					 void __iomem *msg_buf)
>> +{
>> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem = msg_buf;
>> +
>> +	writel_relaxed(0, &pcc_shmem->flags);
>> +	writel_relaxed(MPAM_VERSION_MSG_SIZE, &pcc_shmem->length);
>> +	writel_relaxed(MPAM_PROTOCOL_VERSION |
>> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
>> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
>> +		       &pcc_shmem->command);
>> +
>> +	return MPAM_VERSION_MSG_SIZE;
>> +}
>> +
>> +static int mpam_fb_build_read_message(int msc_id, int reg, unsigned int token,
>> +				      void __iomem *msg_buf)
>> +{
>> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem = msg_buf;
>> +	struct mpam_fb_access_payload *payload = msg_buf + sizeof(*pcc_shmem);
>> +
>> +	writel_relaxed(0, &pcc_shmem->flags);
>> +	writel_relaxed(MPAM_READ_MSG_SIZE, &pcc_shmem->length);
>> +	writel_relaxed(MPAM_MSC_READ_CMD |
>> +		       FIELD_PREP(MPAM_MSC_TOKEN_MASK, token) |
>> +		       FIELD_PREP(MPAM_MSC_PROT_ID_MASK, MPAM_FB_PROTOCOL_ID),
>> +		       &pcc_shmem->command);
>> +
>> +	writel_relaxed(msc_id, &payload->msc_id);
>> +	writel_relaxed(0, &payload->flags);
>> +	writel_relaxed(reg, &payload->reg_offset);
>> +
>> +	return MPAM_READ_MSG_SIZE;
>> +}
> 
>> +
>> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 msc_id,
>> +				u16 reg, u32 *result, int mpam_fb_command)
>> +{
>> +	unsigned int token = atomic_inc_return(&mpam_fb_token);
>> +	struct acpi_pcct_ext_pcc_shared_memory *pcc_shmem;
>> +	struct pcc_mbox_chan *chan;
>> +	void __iomem *payload_ofs;
>> +	u32 status;
>> +	int ret;
>> +
>> +	if (!pcc_chan)
> 
> Is this defense needed?  Feels like the sort of thing that is so fatal
> if you get to call send_request() that you should really have failed a lot
> earlier.  If it's protecting against a tear down race or similar add a comment

Well, it's a simple check, and we potentially call 
mpam_fb_send_request() from any of the MSC access wrappers, of which 
there are many callers, from all over the code. Don't know where to draw 
the line here, really, but that surely prevents a NULL pointer 
dereference in the next statement.

Cheers,
Andre


