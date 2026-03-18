Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB6103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8/+Bjuf1VRufBBLttladMiStiEmATSWnzW41zZKAhs=; b=MGM8mFuyCpBB1U
	4jAxPz7D5j3dvDh3PSJClfAW7gIkIeGyOypqdWew+AoX9bO04QUhNaJUu7Y6QWtt78qwsUwlR+nme
	/ETBys8N2Yqew6mqXFxGH4Jv/CxTBc/1ktqv0wmqN6PFSENdttYnmv7WYb2VWNzetUw984wxdDmdz
	duDhZWKbnpJbHlcoQU2/wy5AdELw/3gUgBDZKgkYcC8WaCv3YKpZs8r9PSiqwX5ypj9BBoAWj1YqR
	D7TKwFi5g5XHMLYxWADa1vmDaTak2wSk3X9/LGWoMOSDjzGdbWgARzVjMNtHv1qsliA1o6qvGCaJH
	RRF2oGizAdfoIVLcZVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2szP-00000008jZQ-3RK2;
	Wed, 18 Mar 2026 15:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2szM-00000008jYj-3w94
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:39:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AF651C2B;
	Wed, 18 Mar 2026 08:39:04 -0700 (PDT)
Received: from [192.168.178.23] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB60B3F73B;
	Wed, 18 Mar 2026 08:39:07 -0700 (PDT)
Message-ID: <43679cb9-da06-401c-b608-4d22565191c5@arm.com>
Date: Wed, 18 Mar 2026 16:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-3-andre.przywara@arm.com>
 <20260318-wealthy-quartz-iguana-9a836e@quoll>
 <bad30062-3f61-41cb-af78-21f13b77ed4d@kernel.org>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <bad30062-3f61-41cb-af78-21f13b77ed4d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_083917_075442_B15D87ED 
X-CRM114-Status: GOOD (  26.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

thanks for having a look!

On 3/18/26 09:12, Krzysztof Kozlowski wrote:
> On 18/03/2026 09:09, Krzysztof Kozlowski wrote:
>> On Tue, Mar 17, 2026 at 11:33:28AM +0100, Andre Przywara wrote:
>>> +
>>> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
>>> +static const struct fw_image_uuid {
>>> +	const char *name;
>>> +	const char *uuid;
>>> +} fw_images_uuids[] = {
>>> +	{
>>> +		.name = "TF-A BL31 runtime",
>>> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
>>> +	},
>>> +	{
>>> +		.name = "BL33 non-secure payload",
>>> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
>>> +	},
>>> +	{
>>> +		.name = "TF-RMM",
>>> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
>>> +	},
>>> +};
>>> +
>>> +static struct kset *lfa_kset;
>>> +static struct workqueue_struct *fw_images_update_wq;
>>> +static struct work_struct fw_images_update_work;
>>> +static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
>>
>> Bunch of singletons here because (see later)...
>>
>>> +
>>> +static const struct attribute_group image_attr_group = {
>>> +	.attrs = image_default_attrs,
>>> +};
>>> +
>>> +static const struct attribute_group *image_default_groups[] = {
>>> +	&image_attr_group,
>>> +	NULL
>>> +};
>>> +
>>> +static int __init lfa_init(void)
>>> +{
>>> +	struct arm_smccc_1_2_regs reg = { 0 };
>>> +	int err;
>>> +
>>> +	reg.a0 = LFA_1_0_FN_GET_VERSION;
>>> +	arm_smccc_1_2_invoke(&reg, &reg);
>>> +	if (reg.a0 == -LFA_NOT_SUPPORTED) {
>>> +		pr_info("Live Firmware activation: no firmware agent found\n");
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>>> +		reg.a0 >> 16, reg.a0 & 0xffff);
>>> +
>>> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
>>> +					      WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
>>> +	if (!fw_images_update_wq) {
>>> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
>>> +
>>> +		return -ENOMEM;
>>> +	}
>>> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>>> +
>>> +	init_image_default_attrs();
>>> +	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
>>> +	if (!lfa_kset)
>>> +		return -ENOMEM;
>>> +
>>> +	err = update_fw_images_tree();
>>> +	if (err != 0) {
>>> +		kset_unregister(lfa_kset);
>>> +		destroy_workqueue(fw_images_update_wq);
>>> +	}
>>> +
>>> +	return err;
>>> +}
>>> +module_init(lfa_init);
>>
>> You do not use driver model, but 199x style of modprobing and performing
>> actions.
>>
>> I do not understand why module load is already doign anything. This
>> looks like misinterpretation/misuse of Linux driver model - in a way,
>> you don't use it all and this is like back to 199x where modprobe was
>> already meaning you bind drivers...
> 
> Although now going through further patches I found you implementing some
> parts of driver model, so probably this split is just needing fix.

The discovery of the LFA service works via SMC calls, which have a safe 
discovery route by just calling arm_smccc_1_2_invoke() - that function 
will query the conduit and do all the necessary checks.

But yes, this looks a bit out of place, and indeed there have been 
proposals to create some kind of "SMCCC bus", even though this requires 
some squinting to call this a "bus". But it makes some sense in the 
Linux driver model, so we probably want this.
At the moment there is smccc_trng[1], where the SMCCC code registers a 
simple platform device, which is matched later in the driver. But this 
seems somewhat ad-hoc and overkill as well.
I just got pointed to Aneesh's recently proposed [2] auxiliary bus 
approach for SMCCC, it looks like this could be generalised for all 
SMCCC users?
Sudeep, can you comment what's the latest on this front? Have there been 
patches or more sketched out proposals for a proper bus already?

Cheers,
Andre

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/smccc/smccc.c#n88
[2] https://lore.kernel.org/linux-arm-kernel/yq5av7f51d8y.fsf@kernel.org/

P.S.: So yes, I was aware that putting this in module_init() was not the 
neatest solution, but I didn't want to hold all the rest of the code 
back until we get a better one (TM).

> 
> Modprobe must not do "arm_smccc_1_2_invoke" or any other device related
> things. You only initialize your bus, just like every other bus driver
> would do, but honestly this should not be a bus-like code.
> 
> Best regards,
> Krzysztof


