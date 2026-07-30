Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C841C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMymxetkN2mvQMxpZrG+hlmeNjumeifNuESzWja8NxQ=; b=Sz+KmWPvQX6KPif+skJDnuxTrg
	cFwbwpURX+fgjf0vvhsARqKHNZT7JcUE6ME9kxTDqqOhx9+MGRebUrgKmXvjM1I1ydUNJaxebrppX
	D/GmUiEEeFB/iALq56IvSECUhzDGPhI43IRatjiAmb5jNk3tGRNUjWyf5g7DHBz23rgagEL4JevSi
	LZEe4czQJkeE6mMHrI4Ree5Ta2ghkmpzVTX89Qih49B0yDkVH5RP0LDzM1vX//CJkvSROTao3eS01
	R2bdTs3rYV62qOTSoLNe2aCjyHzzO+stt4Oj2aHJhAaz9xrZed+YWuF94nI0il5oCyNLRHMF9wn2q
	c9WfnB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNUm-0000000A7Hi-3t9m;
	Thu, 30 Jul 2026 09:56:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNUa-0000000A7EY-2Jvo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:55:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D0691688;
	Thu, 30 Jul 2026 02:55:49 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67A2D3F763;
	Thu, 30 Jul 2026 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785405353; bh=vCTBotcITo3SQF5Sr8rW7R3UEOtf9XgLUKalenanTIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=khbZkwl+0QztDxDR/9S7aJzvoVypIPHvW+AsOaaijKMZy3Se1vNGbE7dLnmuwOSxx
	 FQNZqSHztuXsNgKnu3AgOWYcQSztTZZQOzamQhCkvOlBObEHl81WKSdB3FQyYTF2QX
	 plBRpYOm5+2bNxJ8REheIIZ2Uj/rQVklErajN2Js=
Message-ID: <89c8a581-05e1-440e-bee3-d36c2e034fcc@arm.com>
Date: Thu, 30 Jul 2026 11:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] arm_mpam: add MPAM-Fb MSC firmware access
 support
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
References: <20260729134124.2506269-1-andre.przywara@arm.com>
 <20260729134124.2506269-9-andre.przywara@arm.com>
 <c74c2a72-a343-45b8-b77b-61e0efafe345@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <c74c2a72-a343-45b8-b77b-61e0efafe345@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_025556_699773_D33C80A6 
X-CRM114-Status: GOOD (  34.55  )
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

Hey Srivathsa,

On 7/29/26 18:13, Srivathsa L Rao wrote:
> Hi Andre,
> 
> On 7/29/2026 7:11 PM, Andre Przywara wrote:
>> The Arm MPAM Firmware-backed (Fb) Profile document[1] describes an
>> alternative way of accessing the "Memory System Components" (MSC) in an
>> MPAM enabled system.
>>
>> Normally the MSCs are MMIO mapped, but in some implementations this
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
>> (simple) SCMI message generation, for just the fields we need.
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/Makefile        |   2 +-
>>   drivers/resctrl/mpam_devices.c  |  52 ++++++--
>>   drivers/resctrl/mpam_fb.c       | 214 ++++++++++++++++++++++++++++++++
>>   drivers/resctrl/mpam_internal.h |  22 ++++
>>   include/linux/arm_mpam.h        |   2 +-
>>   5 files changed, 279 insertions(+), 13 deletions(-)
>>   create mode 100644 drivers/resctrl/mpam_fb.c
>>
>> diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
>> index 4f6d0e81f9b8..097c036724e9 100644
>> --- a/drivers/resctrl/Makefile
>> +++ b/drivers/resctrl/Makefile
>> @@ -1,5 +1,5 @@
>>   obj-$(CONFIG_ARM64_MPAM_DRIVER)            += mpam.o
>> -mpam-y                        += mpam_devices.o
>> +mpam-y                        += mpam_devices.o mpam_fb.o
>>   mpam-$(CONFIG_ARM64_MPAM_RESCTRL_FS)        += mpam_resctrl.o
>>   ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)    += -DDEBUG
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index f6910ab3bbc2..abe1e628928f 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c

[ ... ]

>> +static int mpam_fb_send_request(struct mpam_pcc_chan *pcc_chan, u32 
>> msc_id,
>> +                u16 reg, u32 *result, int mpam_fb_command)
>> +{
>> +    unsigned int token = atomic_inc_return(&mpam_fb_token);
>> +    struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem;
>> +    struct pcc_mbox_chan *chan;
>> +    void __iomem *payload_ofs;
>> +    u32 status;
>> +    int ret;
>> +
>> +    if (!pcc_chan)
>> +        return -ENODEV;
>> +
>> +    chan = pcc_chan->pcc_chan;
>> +
>> +    /* prune token to fit into the 10 bits inside the command 
>> register */
>> +    token = FIELD_GET(MPAM_MSC_TOKEN_MASK,
>> +              FIELD_PREP(MPAM_MSC_TOKEN_MASK, token));
>> +
>> +    guard(mutex)(&pcc_chan->pcc_chan_lock);
>> +
>> +    switch (mpam_fb_command) {
>> +    case MPAM_MSC_WRITE_CMD:
>> +        mpam_fb_build_write_message(msc_id, reg, *result,
>> +                        token, chan->shmem);
>> +        break;
>> +    case MPAM_MSC_READ_CMD:
>> +        mpam_fb_build_read_message(msc_id, reg, token, chan->shmem);
>> +        break;
>> +    case MPAM_PROTOCOL_VERSION_CMD:
>> +        mpam_fb_build_version_message(token, chan->shmem);
>> +        break;
>> +    default:
>> +        dev_err(pcc_chan->pcc_cl.dev, "unsupported MPAM-Fb command 
>> %d\n",
>> +            mpam_fb_command);
>> +        ret = -EINVAL;
>> +        goto out_err;
>> +    }
>> +
>> +    ret = mbox_send_message(chan->mchan, NULL);
>> +    if (ret < 0)
>> +        goto out_err;
>> +
>> +    pcc_shmem = chan->shmem;
>> +    payload_ofs = chan->shmem + sizeof(*pcc_shmem);
>> +    status = readl(&pcc_shmem->command);
>> +    if (FIELD_GET(MPAM_MSC_TOKEN_MASK, status) != token) {
>> +        ret = -ETIMEDOUT;
>> +
>> +        goto out_err;
>> +    }
>> +
>> +    ret = readl(payload_ofs + 0x0);
>> +    if (ret < 0) {
>> +        switch (ret) {
>> +        case MPAM_FB_ERR_NOT_SUPPORTED:
>> +            ret = -EOPNOTSUPP;
>> +            break;
>> +        case MPAM_FB_ERR_INVALID_PARAMETERS:
>> +            ret = -EINVAL;
>> +            break;
>> +        case MPAM_FB_ERR_NOT_FOUND:
>> +            ret = -ENOENT;
>> +            break;
>> +        case MPAM_FB_ERR_OUT_OF_RANGE:
>> +            ret = -ERANGE;
>> +            break;
> 
> While testing v4 on a QEMU setup with a fake PCC-backed MSC, I added a
> small error injection mechanism to verify the firmware response status
> code translations in mpam_fb_send_request(). I injected each defined
> MPAM_FB_ERR_* code and observed the following.

Ah, very nice, thanks for doing this!

>> +        default:
>> +            ret = -EINVAL;
>> +        }
>> +
>> +        goto out_err;
>> +    }
> 
> MPAM_FB_ERR_BUSY (-6) falls through to this default and gets -EINVAL.
> Would -EAGAIN be more appropriate here?  Callers could then maybe add a 

Oh, sure, I somehow missed that, even though it's one of the more 
obvious mappings and probably even the most useful one.

Thanks for catching that, added.

Cheers,
Andre

> short retry loop inside mpam_fb_send_request() itself, or in the probe 
> path, convert -EAGAIN to -EPROBE_DEFER so the driver core retries probe 
> automatically.
> 
> The other unhandled codes also collapse to -EINVAL, like EPROTO, EBUSY, 
> I guess that can come later.
> 
>> +
>> +    if (mpam_fb_command != MPAM_MSC_WRITE_CMD)
>> +        *result = readl(payload_ofs + 0x4);
>> +
>> +    return 0;
>> +
>> +out_err:
>> +    mpam_fb_disable_mpam(ret);
>> +
>> +    return ret;
>> +}
>> +
>> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 
>> *result)
>> +{
>> +    return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
>> +                    reg, result, MPAM_MSC_READ_CMD);
>> +}
>> +
>> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 value)
>> +{
>> +    return mpam_fb_send_request(msc->pcc_chan, msc->mpam_fb_msc_id,
>> +                    reg, &value, MPAM_MSC_WRITE_CMD);
>> +}
>> +
>> +int mpam_fb_get_protocol_version(struct mpam_msc *msc)
>> +{
>> +    u32 version;
>> +    int ret;
>> +
>> +    ret = mpam_fb_send_request(msc->pcc_chan, 0,
>> +                   0, &version, MPAM_PROTOCOL_VERSION_CMD);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return version;
>> +}
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/ 
>> mpam_internal.h
>> index 2b81b6b0bf4e..a2193e7df57c 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -11,6 +11,7 @@
>>   #include <linux/io.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/llist.h>
>> +#include <linux/mailbox_client.h>
>>   #include <linux/mutex.h>
>>   #include <linux/resctrl.h>
>>   #include <linux/spinlock.h>
>> @@ -57,6 +58,15 @@ struct mpam_garbage {
>>       struct platform_device    *pdev;
>>   };
>> +struct mpam_pcc_chan {
>> +    struct list_head    pcc_chans;
>> +    struct mbox_client    pcc_cl;
>> +    struct pcc_mbox_chan    *pcc_chan;
>> +    struct mutex        pcc_chan_lock; /* only one message at a time */
>> +    struct kref        refcount;
>> +    int            subspace_id;
>> +};
>> +
>>   struct mpam_msc {
>>       /* member of mpam_all_msc */
>>       struct list_head    all_msc_list;
>> @@ -66,6 +76,8 @@ struct mpam_msc {
>>       /* Not modified after mpam_is_enabled() becomes true */
>>       enum mpam_msc_iface    iface;
>> +    struct mpam_pcc_chan    *pcc_chan;
>> +    int            mpam_fb_msc_id;    /* in its own name space */
>>       u32            nrdy_usec;
>>       cpumask_t        accessibility;
>>       bool            has_extd_esr;
>> @@ -484,6 +496,9 @@ extern u8 mpam_pmg_max;
>>   void mpam_enable(struct work_struct *work);
>>   void mpam_disable(struct work_struct *work);
>> +/* helper function to call from outside mpam_devices.c */
>> +void mpam_fb_disable_mpam(int err);
>> +
>>   /* Reset all the RIS in a class under cpus_read_lock() */
>>   void mpam_reset_class_locked(struct mpam_class *class);
>> @@ -511,6 +526,13 @@ static inline void 
>> mpam_resctrl_offline_cpu(unsigned int cpu) { }
>>   static inline void mpam_resctrl_teardown_class(struct mpam_class 
>> *class) { }
>>   #endif /* CONFIG_RESCTRL_FS */
>> +/* MPAM-Fb Firmware-backed protocol wrappers */
>> +int mpam_fb_send_read_request(struct mpam_msc *msc, u16 reg, u32 
>> *result);
>> +int mpam_fb_send_write_request(struct mpam_msc *msc, u16 reg, u32 
>> value);
>> +int mpam_fb_get_protocol_version(struct mpam_msc *msc);
>> +
>> +#define MPAM_FB_PROT_HEADER_LEN        sizeof(u32)
>> +
>>   /*
>>    * MPAM MSCs have the following register layout. See:
>>    * Arm Memory System Resource Partitioning and Monitoring (MPAM) System
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index f92a36187a52..002f56e15362 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -12,7 +12,7 @@ struct mpam_msc;
>>   enum mpam_msc_iface {
>>       MPAM_IFACE_MMIO,    /* a real MPAM MSC */
>> -    MPAM_IFACE_PCC,        /* a fake MPAM MSC */
>> +    MPAM_IFACE_PCC,        /* using the MPAM-Fb firmware redirection */
>>   };
>>   enum mpam_class_types {
> 
> Best Regards,
> Srivathsa


