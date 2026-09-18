Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2381AC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QzjGL8i2xD9owxa0oyNC87+Z1gVtPpJBZx4LO123qZA=; b=KbQp197/QHvLyZ
	H6F8A45D60qAzoqAtmnYNJjsYGguvu4sDr0vViCYt9SHQj7MHT57mJZnaNh0kert2b2twqwUFtdP6
	tG4K7E1t8BvZY9L1OlI977zTcGe2aK8Vi5oholUllcME1YA74JZx07ZFLEIcyMwAeSs2gXVxF/ORH
	G4SgOTCDtpX9jTYtsxAZHE7yh14cM3Sw0mYlDt5O9QXuayztba2up1ej0/y6cgv1qdc/TsBoL6irv
	MDmd0rZUscrsoI8dxxKvh3wh33Ez2+gPmvCuw5CPS0zuyEHX1TMgBBPxi4Pj80Z29puQwlsBl+Sgj
	HtbcHb5ICT7LBVvc/9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZNF-0000000EggJ-22MV;
	Fri, 18 Sep 2026 14:15:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZNB-0000000Egfp-04BJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:15:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFA3168F;
	Fri, 18 Sep 2026 07:15:24 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78BC83F86C;
	Fri, 18 Sep 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740928; bh=Sh6KgtQA7JqW8xAzFBw7sj89Paj3qp613tU3kW0Wuf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BDDBtKw7cvqWJ1ClbeP3Z6jjwxU2R/V7fN8OGQMyWaJrpUeZLwaWnuGf3O0SNB+E2
	 TdTtcXhfYggvNWbgXzsLDY9Lc63+r3imQVLjZujAnTByCC8FsXbZMWkeinabcm4Nns
	 6+TlN7QdkiSQl3LGOfKy5eQ26q4B224XaKle+6EI=
Message-ID: <59d1947d-d3cd-4621-9377-b206afd18bd6@arm.com>
Date: Fri, 18 Sep 2026 16:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] firmware: smccc: lfa: Add auto_activate sysfs file
To: Nirmoy Das <nirmoyd@nvidia.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-6-andre.przywara@arm.com>
 <20260710140856.3323523-1-nirmoyd@nvidia.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260710140856.3323523-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071529_132479_4524CCE1 
X-CRM114-Status: GOOD (  39.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Nirmoy,

On 7/10/26 16:07, Nirmoy Das wrote:
> On Mon, 6 Jul 2026 15:44:45 +0200, Andre Przywara wrote:
> 
> Hi Andre,
> 
>> The Arm LFA spec places control over the actual activation process in
>> the hands of the non-secure host OS. An platform initiated interrupt or
>> notification signals the availability of an updateable firmware image,
>> but does not necessarily need to trigger it automatically.
>>
>> Add a sysfs control file that guards such automatic activation. If an
>> administrator wants to allow automatic platform initiated updates, they
>> can activate that by echoing a "1" into the auto_activate file in the
>> respective sysfs directory. Any incoming notification would then result
>> in the activation triggered.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 34 ++++++++++++++++++++++++++++++---
>>   1 file changed, 31 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 5b7f9b07f6c8..ce4f966db475 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -89,6 +89,7 @@ enum image_attr_names {
>>   	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
>>   	LFA_ATTR_ACTIVATE,
>>   	LFA_ATTR_CANCEL,
>> +	LFA_ATTR_AUTO_ACTIVATE,
>>   	LFA_ATTR_NR_IMAGES
>>   };
>>   
>> @@ -103,6 +104,7 @@ struct fw_image {
>>   	bool may_reset_cpu;
>>   	bool cpu_rendezvous;
>>   	bool cpu_rendezvous_forced;
>> +	bool auto_activate;
>>   	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
>>   };
>>   
>> @@ -550,6 +552,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
>>   	return count;
>>   }
>>   
>> +static ssize_t auto_activate_store(struct kobject *kobj,
>> +				   struct kobj_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	struct fw_image *image = kobj_to_fw_image(kobj);
>> +	int ret;
>> +
>> +	ret = kstrtobool(buf, &image->auto_activate);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t auto_activate_show(struct kobject *kobj,
>> +				  struct kobj_attribute *attr, char *buf)
>> +{
>> +	struct fw_image *image = kobj_to_fw_image(kobj);
>> +
>> +	return sysfs_emit(buf, "%d\n", image->auto_activate);
>> +}
>> +
>>   static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>   	[LFA_ATTR_NAME]			= __ATTR_RO(name),
>>   	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
>> @@ -560,7 +584,8 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>   	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
>>   	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
>>   	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
>> -	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
>> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel),
>> +	[LFA_ATTR_AUTO_ACTIVATE]	= __ATTR_RW(auto_activate),
>>   };
>>   
>>   static void init_image_default_attrs(void)
>> @@ -631,6 +656,7 @@ static int update_fw_image_node(char *fw_uuid, int seq_id,
>>   	image->kobj.kset = lfa_kset;
>>   	image->image_name = image_name;
>>   	image->cpu_rendezvous_forced = true;
>> +	image->auto_activate = false;
> 
> Following up on our v2 discussion about the udev anchor after the
> SMCCC bus rework: I got a chance to try v3 on a real machine, and
> like the faux device in v2, the SMCCC bus device also works as the
> udev anchor:
> 
>    ACTION=="bind|change", SUBSYSTEM=="arm_smccc", KERNEL=="arm-smccc-lfa-*", \
>            RUN+="/usr/local/sbin/lfa-auto-activate"
> 
> Matching on "bind" instead of "add" worked better when I tried it,
> bind fires only after probe so /sys/firmware/lfa is already
> populated.

Ah, nice, thanks for staying on this!


> What is still missing is a notification when the image inventory
> changes at runtime. I tried the KOBJ_CHANGE approach from our v2
> discussion on top of v3, emitting from the SMCCC bus device after
> the image tree is refreshed, and it works: the same rule re-arms
> auto_activate when the event fires. What do you think about adding
> such a notification? I can send a patch on top once this series has
> landed,

I am not super excited about adding a global variable for the smccc bus 
device just for this, but it's not a showstopper either. Maybe just 
store the kobject we need?
In any case, can you please send a patch on top of v4 I just sent, maybe 
as a --in-reply-to to the cover letter? This would honour your 
contribution, and keep this patch close to the source and separate.

Cheers,
Andre


together with an example udev rule. This is what I tested:
> 
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -142,6 +142,7 @@
>   };
>   
>   static struct kset *lfa_kset;
> +static struct arm_smccc_device *lfa_sdev;
>   static struct workqueue_struct *fw_images_update_wq;
>   static struct work_struct fw_images_update_work;
>   static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
> @@ -229,6 +230,19 @@
>   
>   		delete_fw_image_node(image);
>   	}
> +
> +	/*
> +	 * Notify user space only after the firmware image tree has been
> +	 * fully reconciled, so that consumers reading /sys/firmware/lfa/
> +	 * see a settled inventory.
> +	 */
> +	if (lfa_sdev) {
> +		int ret = kobject_uevent(&lfa_sdev->dev.kobj, KOBJ_CHANGE);
> +
> +		if (ret)
> +			pr_warn("failed to send inventory change uevent: %d\n",
> +				ret);
> +	}
>   }
>   
>   static void set_image_flags(struct fw_image *image, int seq_id,
> @@ -925,6 +939,8 @@
>   	}
>   	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>   
> +	lfa_sdev = sdev;
> +
>   	init_image_default_attrs();
>   	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
>   	if (!lfa_kset) {
> @@ -966,6 +982,7 @@
>   	flush_workqueue(fw_images_update_wq);
>   	destroy_workqueue(fw_images_update_wq);
>   	clean_fw_images_tree();
> +	lfa_sdev = NULL;
>   	kset_unregister(lfa_kset);
>   }
> 
>>   	set_image_flags(image, seq_id, image_flags, reg_current_ver,
>>   			reg_pending_ver);
>>   	if (kobject_init_and_add(&image->kobj, &image_ktype, NULL,
>> @@ -700,7 +726,8 @@ static int update_fw_images_tree(void)
>>   
>>   /*
>>    * Go through all FW images in a loop and trigger activation
>> - * of all activatible and pending images.
>> + * of all activatible and pending images, but only if automatic
>> + * activation for that image is allowed.
>>    * We have to restart enumeration after every triggered activation,
>>    * since the firmware images might have changed during the activation.
>>    */
>> @@ -719,7 +746,8 @@ static int activate_pending_image(void)
>>   			continue; /* Invalid FW component */
>>   
>>   		update_fw_image_pending(image);
>> -		if (image->activation_capable && image->activation_pending) {
>> +		if (image->activation_capable && image->activation_pending &&
>> +		    image->auto_activate) {
>>   			found_pending = true;
>>   			break;
>>   		}
>> -- 
>> 2.43.0
> 
> Regards,
> Nirmoy


