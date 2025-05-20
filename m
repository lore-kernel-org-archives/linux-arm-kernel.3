Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE0FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TG25CVsnDwhCFXgyB/K9JRU4GH4Ogzyglcx6OoMkrzY=; b=mL1RFbDDziXz9a
	FEUzZtQ9Q8K1dxVm3ImM7RzLF2ZuH++jyYDZzbPsqAk4jXkTyDKLAab1NL45gO6B3+LNTY/sCM6GJ
	mM6WMH1dC9x3nqo9/gXRN67ugYKlMF7uo6ddMo4VOhmhBFVvHrjwfZisWaeBYOyx7FWCWDUWvGTRr
	6Ow+GrpTGnYXrt+x+tl4oce0ItXghcAVD+nTBzwauw/lPwKCH0ylbXQsFUh2pjYDkl7WftzdkFUzx
	UFqoY+eiKjinu+ARWpzOKtU4PWts8IA7DIDsesSAuYT+sdbWfSf9rQQNvcQVx2g4Vfqw7rtMoykci
	W8RufOakQEWYeTuP6nXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCev-0000000BKbL-1XYY;
	Tue, 20 May 2025 02:24:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCcp-0000000BKUY-06B0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 02:22:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4b1dWL4Qffz10WGF;
	Tue, 20 May 2025 10:18:06 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id ADA00140121;
	Tue, 20 May 2025 10:22:27 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 May
 2025 10:22:26 +0800
Message-ID: <42bb418d-5e6a-8922-268c-8b6e2a48d578@hisilicon.com>
Date: Tue, 20 May 2025 10:22:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1] PM / devfreq: Add HiSilicon uncore frequency scaling
 driver
To: "lihuisong (C)" <lihuisong@huawei.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <cw00.choi@samsung.com>
References: <20250506021434.944386-1-zhanjie9@hisilicon.com>
 <8ef46e21-4ad0-46ef-bfb3-fc56094ef79d@huawei.com>
 <4f910767-9a96-6229-18cb-0119574eca00@hisilicon.com>
 <74894849-4e0b-47b7-8749-fd10d30b5709@huawei.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <74894849-4e0b-47b7-8749-fd10d30b5709@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_192239_394318_94C15509 
X-CRM114-Status: GOOD (  31.13  )
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
Cc: Jie Zhan <zhanjie9@hisilicon.com>, yubowen8@huawei.com, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, liwei728@huawei.com, linuxarm@huawei.com, prime.zeng@hisilicon.com, jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 20/05/2025 09:36, lihuisong (C) wrote:
> 
> 在 2025/5/19 16:03, Jie Zhan 写道:
>> Hi Huisong,
>>
>> Thanks for reviewing.
>>
>> On 12/05/2025 10:17, lihuisong (C) wrote:
>>> Hi Jie,
>>>
>>> There are some trivia advice. please have a look.
>>>
>>> /Huisong
>>> 在 2025/5/6 10:14, Jie Zhan 写道:
>>>> Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
>>>> the devfreq framework.  The uncore domain contains shared computing
>>>> resources, including system interconnects and L3 cache.  The uncore
>>>> frequency significantly impacts the system-wide performance as well as
>>>> power consumption.  This driver adds support for runtime management of
>>>> uncore frequency from kernel and userspace.  The main function includes
>>>> setting and getting frequencies, changing frequency scaling policies, and
>>>> querying the list of CPUs whose performance is significantly related to
>>>> this uncore frequency domain, etc.  The driver communicates with a platform
>>>> controller through an ACPI PCC mailbox to take the actual actions of
>>>> frequency scaling.
>>>>
>>>> Co-developed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>>>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>>>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
>>>> ---
>>>>    drivers/devfreq/Kconfig            |  11 +
>>>>    drivers/devfreq/Makefile           |   1 +
>>>>    drivers/devfreq/hisi_uncore_freq.c | 722 +++++++++++++++++++++++++++++
>>>>    3 files changed, 734 insertions(+)
>>>>    create mode 100644 drivers/devfreq/hisi_uncore_freq.c
>>>>
>> ...
>>
>>>> +
>>>> +static int hisi_uncore_request_pcc_chan(struct hisi_uncore_freq *uncore)
>>>> +{
>>>> +    struct pcc_mbox_chan *pcc_chan;
>>>> +    int rc;
>>>> +
>>>> +    uncore->cl = (struct mbox_client) {
>>>> +        .dev = uncore->dev,
>>>> +        .tx_block = false,
>>>> +        .knows_txdone = true,
>>>> +    };
>>>> +
>>>> +    pcc_chan = pcc_mbox_request_channel(&uncore->cl, uncore->chan_id);
>>>> +    if (IS_ERR(pcc_chan)) {
>>>> +        dev_err(uncore->dev, "Failed to request PCC channel %u\n",
>>>> +            uncore->chan_id);
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    if (!pcc_chan->shmem_base_addr) {
>>>> +        dev_err(uncore->dev, "Invalid PCC shared memory address\n");
>>>> +        rc = -EINVAL;
>>>> +        goto err_pcc_chan_free;
>>>> +    }
>>>> +
>>>> +    if (pcc_chan->shmem_size < sizeof(struct hisi_uncore_pcc_shmem)) {
>>>> +        dev_err(uncore->dev, "Invalid PCC shared memory size (%lluB)\n",
>>>> +            pcc_chan->shmem_size);
>>>> +        rc = -EINVAL;
>>>> +        goto err_pcc_chan_free;
>>>> +    }
>>>> +
>>>> +    uncore->pcc_shmem_addr = ioremap(pcc_chan->shmem_base_addr,
>>>> +                     pcc_chan->shmem_size);
>>> Now driver doesn't need to ioremap repeatly because of Sudeep's work.
>>> Please see the patch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa362ffafa51b08cf8e2fcca38e056332f6b9b05
>> Cool. Now we can use pcc_chan->shmem. Will update the code based on that.
>>
>>>> +    if (!uncore->pcc_shmem_addr) {
>>>> +        rc = -ENOMEM;
>>>> +        goto err_pcc_chan_free;
>>>> +    }
>>>> +
>> ...
>>
>>>> +static int hisi_uncore_cmd_send(struct hisi_uncore_freq *uncore,
>>>> +                u8 cmd, u32 *data)
>>>> +{
>>>> +    struct hisi_uncore_pcc_shmem __iomem *addr;
>>>> +    struct hisi_uncore_pcc_shmem shmem;
>>>> +    struct pcc_mbox_chan *pchan;
>>>> +    unsigned int mrtt;
>>>> +    s64 time_delta;
>>>> +    u16 status;
>>>> +    int rc;
>>>> +
>>>> +    guard(mutex)(&uncore->pcc_lock);
>>>> +
>>>> +    pchan = uncore->pchan;
>>>> +    addr = uncore->pcc_shmem_addr;
>>>> +
>>>> +    if (!pchan || !addr)
>>>> +        return -ENODEV;
>>> This parameter validation seems redundant. From driver point, it always be ok.
>> uncore->pchan could be NULL if hisi_uncore_cmd_send() if called after
>> hisi_uncore_free_pcc_chan().
>>
>> In the driver detaching processor, the drv->remove() is called before devm
>> resources free, i.e. where devfreq device is freed.
>> Hence the devfreq governor, e.g. simpleondemand, could possibly issue a
>> freq request after the driver is removed.
>>
>> The checking and setting uncore->pchan = NULL in this driver is trying to
>> protect against the above case.  It actually happened during our tests so
>> it's not redundant unless we get a better way to solve that.
>>
>>>> +
>>>> +    /* Handle the Minimum Request Turnaround Time (MRTT) */
>>>> +    mrtt = pchan->min_turnaround_time;
>>>> +    time_delta = ktime_us_delta(ktime_get(),
>>>> +                    uncore->last_cmd_cmpl_time);
>>>> +    if (mrtt > time_delta)
>>>> +        udelay(mrtt - time_delta);
>>>> +
>>>> +    /* Copy data */
>>>> +    shmem.head = (struct acpi_pcct_shared_memory) {
>>>> +        .signature = PCC_SIGNATURE | uncore->chan_id,
>>>> +        .command = cmd,
>>>> +        .status = 0,
>>>> +    };
>>>> +    shmem.pcc_data.data = *data;
>>>> +    memcpy_toio(addr, &shmem, sizeof(shmem));
>>>> +
>>>> +    /* Ring doorbell */
>>>> +    rc = mbox_send_message(pchan->mchan, &cmd);
>>>> +    if (rc < 0) {
>>>> +        dev_err(uncore->dev, "Failed to send mbox message, %d\n", rc);
>>>> +        return rc;
>>>> +    }
>>>> +
>>>> +    /* Wait status */
>>>> +    rc = readw_poll_timeout(&addr->head.status, status,
>>>> +                status & (PCC_STATUS_CMD_COMPLETE |
>>>> +                      PCC_STATUS_ERROR),
>>>> +                HUCF_PCC_POLL_INTERVAL_US,
>>>> +                pchan->latency * HUCF_PCC_POLL_TIMEOUT_NUM);
>>>> +    if (rc) {
>>>> +        dev_err(uncore->dev, "PCC channel response timeout, cmd=%u\n", cmd);
>>>> +        goto exit;
>>>> +    }
>>>> +
>>>> +    if (status & PCC_STATUS_ERROR) {
>>>> +        dev_err(uncore->dev, "PCC cmd error, cmd=%u\n", cmd);
>>>> +        rc = -EIO;
>>>> +        goto exit;
>>>> +    }
>>>> +
>>>> +exit:
>>>> +    uncore->last_cmd_cmpl_time = ktime_get();
>>>> +
>>>> +    /* Copy data back */
>>>> +    memcpy_fromio(data, &addr->pcc_data.data, sizeof(*data));
>>>> +
>>>> +    /* Clear mailbox active req */
>>>> +    mbox_client_txdone(pchan->mchan, rc);
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>> +static int hisi_uncore_target(struct device *dev, unsigned long *freq,
>>>> +                  u32 flags)
>>>> +{
>>>> +    struct hisi_uncore_freq *uncore = dev_get_drvdata(dev);
>>>> +    struct dev_pm_opp *opp;
>>>> +    u32 data;
>>>> +
>>>> +    /*
>>>> +     * ->target() might be called after drv->remove() and before governor
>>>> +     * stopped, so it's necessary to check here, but no need to warn.
>>>> +     */
>>>> +    if (!uncore || !uncore->pchan)
>>>> +        return 0;
>>> If have the following tips, this check can be removed, right?
>> See below.
>>
>> ...
> We need to resolve the issue completely.🙂
>>>> +
>>>> +static int hisi_uncore_devfreq_register(struct hisi_uncore_freq *uncore)
>>>> +{
>>>> +    struct devfreq_dev_profile *profile;
>>>> +    unsigned long freq;
>>>> +    u32 data;
>>>> +    int rc;
>>>> +
>>>> +    rc = hisi_uncore_get_cur_freq(uncore->dev, &freq);
>>>> +    if (rc) {
>>>> +        dev_err(uncore->dev, "Failed to get plat init freq (%d)\n", rc);
>>>> +        return rc;
>>>> +    }
>>>> +
>>>> +    profile = devm_kzalloc(uncore->dev, sizeof(*profile), GFP_KERNEL);
>>>> +    if (!profile)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    profile->initial_freq = freq;
>>>> +    profile->polling_ms = DEFAULT_POLLING_MS;
>>>> +    profile->timer = DEVFREQ_TIMER_DELAYED;
>>>> +    profile->target = hisi_uncore_target;
>>>> +    profile->get_dev_status = hisi_uncore_get_dev_status;
>>>> +    profile->get_cur_freq = hisi_uncore_get_cur_freq;
>>>> +
>>>> +    rc = hisi_uncore_cmd_send(uncore, HUCF_PCC_CMD_GET_MODE, &data);
>>>> +    if (rc) {
>>>> +        dev_err(uncore->dev, "Failed to get operate mode (%d)\n", rc);
>>>> +        return rc;
>>>> +    }
>>>> +
>>>> +    if (data == HUCF_MODE_PLATFORM)
>>>> +        uncore->devfreq = devm_devfreq_add_device(uncore->dev, profile,
>>>> +                              hisi_platform_governor.name, NULL);
>>>> +    else
>>>> +        uncore->devfreq = devm_devfreq_add_device(uncore->dev, profile,
>>>> +                              DEVFREQ_GOV_PERFORMANCE, NULL);
>>> This code creates sysfs file which will be freed after .remove() executed.
>>> However, the PCC channel is released in .remove().
>>> This may lead to UAF issue.
>> Not only those sysfs files, the whole devfreq device & governor is still
>> there after drv->remove().  That's the main cause of issues when
>> registering a devfreq device by devm_devfreq_add_device().
>>
>> However, at the moment, we have prevented against any UAF issues?
> I understand you. But please see two options below again.
>>
>>> We have tow options:
>>> *option 1:*
>>> hisi_uncore_free_pcc_chan() also move to the last release instead of the .remove() by devm_add_action_or_reset() or devm_add_action().
>> I don't quite understand what this means.
>> hisi_uncore_free_pcc_chan() is currently the last step of drv->remove().
>> If we let it be managed by devm, it can't be guaranteed that the pcc chan
>> is freed after devfreq device is removed.
> This option is just to let hisi_uncore_free_pcc_chan() to call after removing all sysfs files created in devfreq.
>>
>>> *option 2:*
>>> Use devfreq_add_device() to replace devm_devfreq_add_device() and .remove() in driver call devfreq_remove_device() to delete these sysfs files.
>>>
>>> There are the resources  dependency between these interfaces. And there is a potential release sequence in .remove, devm_xxx, and even the devm_xxx release inside.
>>> I prefer to explicitly free interfaces that have resource dependencies in driver.
>>>
>>>
>> This looks like a possible plan, but we will need to go back to the raw
>> ABIs.
> 
> Yeah, this option is simple.
> 
> Whether driver selects the raw ABI or devm_ prefixed ABI, which should be open, I think. This depends on the user's preference.
> 

Sure, understood now.
Option 1: Add the devm resources in a correct order and let devm manage the
release sequence.
Option 2: Explicitly define the release sequence in the driver remove.

Since currently only one devfreq driver uses the non-devm ABI, I may prefer
to try the Option 1 first.

