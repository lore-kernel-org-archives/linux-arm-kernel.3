Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AA9C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ow24c27y1MdDUasmTFiG6SjMW8p2EZl/QfEeSzXEiH0=; b=IXDXPG9DA/rDwM
	UVnS4aZJPN7nHKXGjCNejz4hc3Me/EpQKFd46PDH1D7V6LLUwkfnWMCBcnhd/xoJcvEVvgtX/aNYj
	psd2ioom3u+z5HVH5QdIyHXkkYOGmNTHhdhJMkmWzfAyjNVbfjP6m/ntNu0gX1oqa9dXF31YHXxGF
	E/ultEkiqkIXiO1bbAfZ3gUFmDnNQjBwRLfidZIinj1E1EmjhEXaHj8wWKtZJOkogcNV776J1HSDG
	4pHXrwX0eV7qOySnDi9G+TPH8RbTsh4AwMNbcA5R3yL/9o0/2mTWPe0c5q8G2eXBn22v7qlTlrtzh
	YWTrR/o6+FE7bCRO+IQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTd3N-000000025lS-3uDG;
	Mon, 23 Jun 2025 09:01:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcmF-000000022Uu-3z2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 08:43:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bQhM72796z10XM3;
	Mon, 23 Jun 2025 16:38:59 +0800 (CST)
Received: from kwepemo100006.china.huawei.com (unknown [7.202.195.47])
	by mail.maildlp.com (Postfix) with ESMTPS id AB1F91402DF;
	Mon, 23 Jun 2025 16:43:35 +0800 (CST)
Received: from [10.67.121.58] (10.67.121.58) by kwepemo100006.china.huawei.com
 (7.202.195.47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 23 Jun
 2025 16:43:34 +0800
Message-ID: <6d6e7ea0-4188-1f5b-43a2-2d76f79286c3@hisilicon.com>
Date: Mon, 23 Jun 2025 16:43:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v5 2/2] PM / devfreq: Add HiSilicon uncore frequency
 scaling driver
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250619151456.3328624-1-zhanjie9@hisilicon.com>
 <20250619151456.3328624-3-zhanjie9@hisilicon.com>
 <20250620141021.0000694c@huawei.com>
From: Jie Zhan <zhanjie9@hisilicon.com>
In-Reply-To: <20250620141021.0000694c@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.58]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemo100006.china.huawei.com (7.202.195.47)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_014344_305362_C6141494 
X-CRM114-Status: GOOD (  30.45  )
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
Cc: yubowen8@huawei.com, linux-pm@vger.kernel.org, zhenglifeng1@huawei.com, liwei728@huawei.com, linuxarm@huawei.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, lihuisong@huawei.com, prime.zeng@hisilicon.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 20/06/2025 21:10, Jonathan Cameron wrote:
> On Thu, 19 Jun 2025 23:14:56 +0800
> Jie Zhan <zhanjie9@hisilicon.com> wrote:
> 
>> Add the HiSilicon uncore frequency scaling driver for Kunpeng SoCs based on
>> the devfreq framework.  The uncore domain contains shared computing
>> resources, including system interconnects and L3 cache.  The uncore
>> frequency significantly impacts the system-wide performance as well as
>> power consumption.  This driver adds support for runtime management of
>> uncore frequency from kernel and userspace.  The main function includes
>> setting and getting frequencies, changing frequency scaling policies, and
>> querying the list of CPUs whose performance is significantly related to
>> this uncore frequency domain, etc.  The driver communicates with a platform
>> controller through an ACPI PCC mailbox to take the actual actions of
>> frequency scaling.
>>
>> Co-developed-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
>> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> 
> Hi zhanjie,
> 
> A few more things inline that I missed in earlier review.
> 
> The devm_mutex one is a definite thing to fix as having it
> where it is will make it far to easy to add bugs.
> 
> The other stuff is a nice to have.
> 
> So with at least the devm_mutex() call moved
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> 
Hi Jonathan,

Thanks for reviewing again.
Will update the next version soon.

Jie

>> diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
>> new file mode 100644
>> index 000000000000..e19678692c16
>> --- /dev/null
>> +++ b/drivers/devfreq/hisi_uncore_freq.c
>> @@ -0,0 +1,664 @@
> 
>> +static int hisi_uncore_request_pcc_chan(struct hisi_uncore_freq *uncore)
>> +{
>> +	struct device *dev = uncore->dev;
>> +	struct pcc_mbox_chan *pcc_chan;
>> +	int rc;
>> +
>> +	uncore->cl = (struct mbox_client) {
>> +		.dev = dev,
>> +		.tx_block = false,
>> +		.knows_txdone = true,
>> +	};
>> +
>> +	pcc_chan = pcc_mbox_request_channel(&uncore->cl, uncore->chan_id);
> 
> I'm not particularly keen on the repeats of pcc_mbox_free_channel() in each of
> the error paths.  Either use a goto and clean it up at the end or
> DEFINE_FREE(pcc_mbox_chan, struct pcc_mbox_chan *, if (_T) pcc_mbox_free_channel(_T));
> 
> then here
> 	struct pcc_mbox_chan __free(pcc_mbox_chan) *pcc_chan =
> 		pcc_mbox_request_channel(&uncore->cl, uncore->chan_id);
> 
> remembering to do 
> 	uncor->chan = no_free_ptr(pcc_chan);
> where you currently set it below.
> 
> The DEFINE_FREE() might prove useful in other drivers.  kunpeng_hccs
> for instance could be simplified with this.  Various other candidates
> though not sure how keen on cleanup.h magic those areas of the kernel are.
> 
> 
Yeah, good suggestion for cleanup, but the DEFINE_FREE() stuff should go
into acpi/pcc.h.

I think it's better to make it a new patchset later, including the new
DEFINE_FREE() for pcc_mbox_free_channel() and other corresponding driver
changes, and send it to the ACPI/PCC folks.  Let's keep it unchanged for
this driver patch at this stage.
>> +	if (IS_ERR(pcc_chan))
>> +		return dev_err_probe(dev, PTR_ERR(pcc_chan),
>> +			"Failed to request PCC channel %u\n", uncore->chan_id);
>> +
>> +	if (!pcc_chan->shmem_base_addr) {
>> +		pcc_mbox_free_channel(pcc_chan);
>> +		return dev_err_probe(dev, -EINVAL,
>> +			"Invalid PCC shared memory address\n");
>> +	}
>> +
>> +	if (pcc_chan->shmem_size < sizeof(struct hisi_uncore_pcc_shmem)) {
>> +		pcc_mbox_free_channel(pcc_chan);
>> +		return dev_err_probe(dev, -EINVAL,
>> +			"Invalid PCC shared memory size (%lluB)\n",
>> +			pcc_chan->shmem_size);
>> +	}
>> +
>> +	rc = devm_mutex_init(dev, &uncore->pcc_lock);
> 
> This is oddly placed.  Drop this out of this function and do it at least one layer
> up.
> 
> Having it here leaves the risk of future error cases being added after this
> where the devm cleanup will happen out of order as a result.
> 
Thanks, nice spot.
hisi_uncore_init_pcc_chan() is a suitable place.
>> +	if (rc) {
>> +		pcc_mbox_free_channel(pcc_chan);
>> +		return rc;
>> +	}
>> +
>> +	uncore->pchan = pcc_chan;
>> +
>> +	return 0;
>> +}

