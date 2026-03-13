Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12DE105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb22//JkpP5BwvWmzaDm/sCTSSoUJl7iNZkE5rQuo4k=; b=1r0vgopsD418aJ+CgMYOYjPpiL
	csXe4vkI3i/IDrFwOdonZiOHlX43Wt+95oN5VzF6lGCNiTff2lHdvUNo3VXhl4cjZv+Mrt4/qCLam
	Ec/QwK0rPVHmAfyFPEme+gXiZwbxLHk9Kfxubjbs2Zi/4qVJeOaKFeSJwZd5uvJseGgeVwUWB2qEL
	qSi+MauCavdh1EmupjiluXMgbad28LHf5+rsFqYawdjFEPkSw7hxDIaQc6MCFUq5yLmBF9yleRcy5
	7lybLxxbSc8erpN88GcOAUXN/41kxNnfj8MLKJa/y/K+y8V5BsUAVrZO0onbwyRoBOsmXTGfDvMzH
	BPqnt0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13gJ-00000000Pa9-1aLB;
	Fri, 13 Mar 2026 14:40:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13gG-00000000PZB-2cWB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:40:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33D81165C;
	Fri, 13 Mar 2026 07:39:53 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 530863F7BD;
	Fri, 13 Mar 2026 07:39:57 -0700 (PDT)
Message-ID: <1e233b43-0118-435e-a9df-29a535d63740@arm.com>
Date: Fri, 13 Mar 2026 15:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Nirmoy Das <nirmoyd@nvidia.com>, Salman Nabi <salman.nabi@arm.com>,
 vvidwans@nvidia.com, sudeep.holla@arm.com, mark.rutland@arm.com,
 lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <19aeb934-7e36-4f30-8f7f-a8ae74a797f5@nvidia.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <19aeb934-7e36-4f30-8f7f-a8ae74a797f5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074000_787678_3B911181 
X-CRM114-Status: GOOD (  23.97  )
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

Hi Nirmoy,

On 3/13/26 10:46, Nirmoy Das wrote:
> Hi Salman and Andre,
> 
> 
> We found an bug while testing LFA. See below:
> 
> On 19.01.26 14:27, Salman Nabi wrote:
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>> at system runtime, without requiring a reboot.
>> The specification covers the SMCCC interface to list and query available
>> components and eventually trigger the activation.

[ .... ]

>> +
>> +    update_fw_images_tree();
>> +
>> +    /*
>> +     * Removing non-valid image directories at the end of an activation.
>> +     * We can't remove the sysfs attributes while in the respective
>> +     * _store() handler, so have to postpone the list removal to a
>> +     * workqueue.
>> +     */
>> +    INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> 
> 
> This can get invoke multiple times so re-initializing a work item that 
> may already be queued or running
> 
> is unsafe. This should be moved to lfa_init() so it is only called once. 
> I suggest:

Ah, good point, thanks for spotting and reporting. Will fold this into 
the next post!

Cheers,
Andre

> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/ 
> lfa_fw.c
> index 90727a66e49a5..135358113104c 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -653,7 +653,6 @@ static int update_fw_images_tree(void)
>           * _store() handler, so have to postpone the list removal to a
>           * workqueue.
>           */
> -       INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>          queue_work(fw_images_update_wq, &fw_images_update_work);
> 
>          return 0;
> @@ -680,7 +679,7 @@ static void lfa_notify_handler(acpi_handle handle, 
> u32 event, void *data)
>           * of all activable and pending images.
>           */
>          do {
> -               /* Reset activable image flag */
> +               flush_workqueue(fw_images_update_wq);
>                  found_activable_image = false;
>                  list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>                          if (attrs->fw_seq_id == -1)
> @@ -782,6 +781,8 @@ static int __init lfa_init(void)
>                  return -ENOMEM;
>          }
> 
> +       INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> +
>          pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>                  reg.a0 >> 16, reg.a0 & 0xffff);
> 
> 
> Regards,
> 
> Nirmoy
> 
>> +    queue_work(fw_images_update_wq, &fw_images_update_work);
>> +    mutex_unlock(&lfa_lock);
>> +
>> +    return ret;
>> +}
>> +

