Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD20C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgepeSx67hsYHNYGjYwGRa1LEvEdPFkoaEhmv1rgZso=; b=0Jr/642TJKyY7HU6i4rK7OFEb8
	ltwT6qUCHLpWr+IpzbbMsK7nYN98LV0DtZxvTG9Vfq2frN58v3/29HxpO/2neNhygT0tf7V7evTot
	Q33I5SfTJSwX5CacQMGfWVJqIYL1uLSrUju58lwWa4jr2937HHfgzSIRR3e9ru/6F9X5Ycqrjp+1j
	uy4CGT/PAVKdZ3lnjH6TqqSkBfT9evAmvIzJVrf1D77A1m+R7ut1vQUgFReGuxdwJtJ192tXc23Nb
	LbM6nNQHZSnbDza//1HRl3Y6ZZ3ZWNLKmNTlzFhik0mLz4MpEozW8c8LK6WxKBHcTu8RLLLE0ArDa
	BuTO2xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp05s-00000007Hlm-2zy9;
	Wed, 29 Jul 2026 08:56:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp05p-00000007HlI-3PCw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:56:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ADA2169C;
	Wed, 29 Jul 2026 01:56:42 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 395D43F66F;
	Wed, 29 Jul 2026 01:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785315406; bh=FFQG9krjJGFnmWpDsjdCrknEsKfMtLYnE/mkAybCzLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JRIpnnoggdGCK+GZSYVy/wNCRrt3U1/ukf8GwB4W+6XhFvtLU5EBYPaL3+iPdSCzH
	 cJge0UCICE6ZbczEO0nEzJ88xJX+lg4cmQIsBpnJaDtUq1I0nzUMU/4GeBexWLsJTm
	 RD8XCpE6BT06p5HyXqhz3pdlb9CUGKkftJwRkawk=
Message-ID: <07375e75-972e-43af-9588-dabb0e81443f@arm.com>
Date: Wed, 29 Jul 2026 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 10/10] arm_mpam: detect and enable MPAM-Fb PCC support
To: Andre Przywara <andre.przywara@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723155454.1760823-1-andre.przywara@arm.com>
 <20260723155454.1760823-11-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260723155454.1760823-11-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_015649_957821_A83868BB 
X-CRM114-Status: GOOD (  35.46  )
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

Hi Andre,

Just a couple of nits I spotted just now.

On 7/23/26 16:54, Andre Przywara wrote:
> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/acpi/arm64/mpam.c      |   6 +-
>  drivers/resctrl/mpam_devices.c | 127 ++++++++++++++++++++++++++++++++-
>  2 files changed, 129 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
> index 84963a20c3e7..ca9b8754ae5f 100644
> --- a/drivers/acpi/arm64/mpam.c
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -220,8 +220,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>  	struct platform_device *pdev __free(platform_device_put) =
>  		platform_device_alloc("mpam_msc", tbl_msc->identifier);
>  	int next_res = 0, next_prop = 0, err;
> -	/* pcc, nrdy, affinity and a sentinel */
> -	struct property_entry props[4] = { 0 };
> +	/* pcc, msc-id, nrdy, affinity and a sentinel */
> +	struct property_entry props[5] = { 0 };
>  	/* mmio, 2xirq, no sentinel. */
>  	struct resource res[3] = { 0 };
>  	struct acpi_device *companion;
> @@ -256,6 +256,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>  	} else if (iface == MPAM_IFACE_PCC) {
>  		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>  							tbl_msc->base_address);
> +		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
> +							tbl_msc->identifier);
>  	}
>  
>  	acpi_mpam_parse_irqs(pdev, tbl_msc, res, &next_res);
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index fea3161ffbe9..fc4b5f87fbe9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -19,14 +19,19 @@
>  #include <linux/irqdesc.h>
>  #include <linux/list.h>
>  #include <linux/lockdep.h>
> +#include <linux/mailbox_client.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
> +#include <linux/property.h>
>  #include <linux/srcu.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> +#include <acpi/pcc.h>
> +#include <acpi/acpi_io.h>
> +
>  #include "mpam_internal.h"
>  
>  /* Values for the T241 errata workaround */
> @@ -49,6 +54,86 @@ static LIST_HEAD(mpam_all_msc);
>  
>  struct srcu_struct mpam_srcu;
>  
> +/* PCC channels might be serving multiple MSCs, so keep a refcounted list. */
> +static DEFINE_MUTEX(pcc_chan_list_lock);
> +static LIST_HEAD(pcc_chan_list);
> +
> +static void mpam_pcc_chan_release(struct kref *ref)
> +{
> +	struct mpam_pcc_chan *cur = container_of(ref, struct mpam_pcc_chan,
> +						 refcount);
> +
> +	pcc_mbox_free_channel(cur->pcc_chan);
> +	list_del(&cur->pcc_chans);
> +	kfree(cur);
> +}
> +
> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
> +					       int subspace_id)
> +{
> +	struct mpam_pcc_chan *cur;
> +	int ret;
> +
> +	guard(mutex)(&pcc_chan_list_lock);
> +
> +	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
> +		if (cur->subspace_id == subspace_id) {
> +			kref_get(&cur->refcount);
> +
> +			return cur;
> +		}
> +	}
> +
> +	cur = kzalloc_obj(*cur);
> +	if (!cur)
> +		return ERR_PTR(-ENOMEM);
> +
> +	cur->pcc_cl.dev = dev;
> +	cur->pcc_cl.tx_block = true;
> +
> +	cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
> +	if (IS_ERR(cur->pcc_chan)) {
> +		long err = PTR_ERR(cur->pcc_chan);
> +
> +		kfree(cur);
> +		return ERR_PTR(err);
> +	}
> +
> +	/* Timeout based on the "nominal latency" from the PCC ACPI table. */
> +	cur->pcc_cl.tx_tout = cur->pcc_chan->latency * 5;
> +
> +	ret = devm_mutex_init(dev, &cur->pcc_chan_lock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	cur->subspace_id = subspace_id;
> +	kref_init(&cur->refcount);
> +
> +	list_add_tail(&cur->pcc_chans, &pcc_chan_list);
> +
> +	return cur;
> +}
> +
> +static int mpam_pcc_chan_put(struct mpam_pcc_chan *pcc_chan)
> +{
> +	struct mpam_pcc_chan *cur, *tmp;
> +
> +	if (!pcc_chan)
> +		return 0;
> +
> +	guard(mutex)(&pcc_chan_list_lock);
> +
> +	list_for_each_entry_safe(cur, tmp, &pcc_chan_list, pcc_chans) {
> +		if (cur == pcc_chan) {
> +			kref_put(&cur->refcount, mpam_pcc_chan_release);
> +
> +			return 0;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
>  /*
>   * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
>   * can be enabled.
> @@ -2201,6 +2286,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>  {
>  	struct mpam_msc *msc = platform_get_drvdata(pdev);
>  
> +	mpam_pcc_chan_put(msc->pcc_chan);
> +
>  	mutex_lock(&mpam_list_lock);
>  	mpam_msc_destroy(msc);
>  	mutex_unlock(&mpam_list_lock);
> @@ -2211,7 +2298,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>  static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  {
>  	int err;
> -	u32 tmp;
> +	u32 pcc_subspace_id;
>  	struct mpam_msc *msc;
>  	struct resource *msc_res;
>  	struct device *dev = &pdev->dev;
> @@ -2259,7 +2346,8 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +	if (device_property_read_u32(&pdev->dev, "pcc-channel",
> +				     &pcc_subspace_id))
>  		msc->iface = MPAM_IFACE_MMIO;
>  	else
>  		msc->iface = MPAM_IFACE_PCC;
> @@ -2275,6 +2363,41 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  		}
>  		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>  		msc->mapped_hwpage = io;
> +	} else if (msc->iface == MPAM_IFACE_PCC) {
> +		u32 msc_id;
> +		int ret;
> +
> +		if (device_property_read_u32(&pdev->dev, "msc-id", &msc_id)) {

We have an existing local variable 'dev' we can use here...

> +			pr_err("missing MPAM-Fb MSC identifier\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		msc->mpam_fb_msc_id = msc_id;
> +
> +		msc->pcc_chan = mpam_pcc_chan_get(&pdev->dev, pcc_subspace_id);

and here.

> +		if (IS_ERR(msc->pcc_chan)) {
> +			pr_err("Failed to request MSC PCC channel\n");
> +			return ERR_CAST(msc->pcc_chan);
> +		}
> +
> +		if (msc->pcc_chan->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
> +			pr_err("MPAM-Fb PCC channel size too small.\n");
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +		ret = mpam_fb_get_protocol_version(msc);
> +		if (ret < 0) {
> +			pr_err("Cannot query MPAM-Fb protocol version.\n");
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +
> +			/* ret is an MPAM-Fb error code, return a Linux one. */
> +			return ERR_PTR(-EIO);
> +		}
> +		if ((ret >> 16) != 1) {

We can use FIELD_GET() to make this check clearer and to populate the error message just below.

> +			pr_err("Incompatible MPAM-Fb protocol version %d.%d\n",
> +			       ret >> 16, ret & 0xffff);
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-EINVAL);
> +		}
>  	} else {
>  		return ERR_PTR(-EINVAL);
>  	}

Thanks,

Ben


