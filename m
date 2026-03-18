Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A4EFCD0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEUbFufzEriHYnPRlQ4Dq7Gc+eAvGr9KO555tXZx27I=; b=qkgnfieKR9Y/e8M3FwRFUfnJG1
	tGGJQr71yCEi+ohR8rzQ2AKctUTNqD9Vk/hE6FEaAxLTUnhZ0fFXQ+eWqhYy5sWHgGubG8bYTEEoe
	IcPmH0EWTlnA+QhovcaVmw0GKJ72CGW/0oOFWJlJJL1I3kkTfODnnc6WmcXpcjrmQJGhdk0azJpH/
	zyGDuGbl1NoPIR5kQS0Z1ofS1tS36Xp2zQj/DFLV2w2lETIRQYLJ9yjMQIbpIMjkRc884HYiISmSX
	euBfQIZ0477INrSnp8Po3SUa4Dfc2xQ+qLo0B/sgHu2uC9fOWK0dDvk/hu19A5pPUA9zyf2wiFbUh
	JeiczzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lyM-000000080Pv-2eRn;
	Wed, 18 Mar 2026 08:09:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lyM-000000080Pi-0FWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D59D60130;
	Wed, 18 Mar 2026 08:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81531C19421;
	Wed, 18 Mar 2026 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821385;
	bh=XWehK1fje4KHRkbpBzac/NKhp4/4V42IuNj7LY2qx24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=omnKShF9hCzymC55r20yNGPck3METgi4mZnqxNcZgVET/joAY7cVO389IW+ReF9ZW
	 xqGp0RqNk7B/aSMK8BJg0/HqlHgu6/011ybq7YO3bvIFZQghyaLZhxppTUHgsUHzgX
	 wnUqeiIh6q6niFux0ear4l3Zrezhq3kmawtSO+2VPy5HUMs5Kvx8o+KYyElTJLZ4jw
	 daAwW3kj2GxqULmY5OZUwrRuQmkwpVJSgcRNGdcChUiHmSESHpwzLonbgOdFwK3gLr
	 ctzAqYTK8yx2m8x9Vrifkc41GeB6y0cnjquE3q7kS9Ac/f487ucAGHbvZXzowpk2C3
	 g6VXNYLNTtsng==
Date: Wed, 18 Mar 2026 09:09:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
Message-ID: <20260318-wealthy-quartz-iguana-9a836e@quoll>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-3-andre.przywara@arm.com>
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

On Tue, Mar 17, 2026 at 11:33:28AM +0100, Andre Przywara wrote:
> +
> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
> +static const struct fw_image_uuid {
> +	const char *name;
> +	const char *uuid;
> +} fw_images_uuids[] = {
> +	{
> +		.name = "TF-A BL31 runtime",
> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
> +	},
> +	{
> +		.name = "BL33 non-secure payload",
> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
> +	},
> +	{
> +		.name = "TF-RMM",
> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
> +	},
> +};
> +
> +static struct kset *lfa_kset;
> +static struct workqueue_struct *fw_images_update_wq;
> +static struct work_struct fw_images_update_work;
> +static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];

Bunch of singletons here because (see later)...

> +
> +static const struct attribute_group image_attr_group = {
> +	.attrs = image_default_attrs,
> +};
> +
> +static const struct attribute_group *image_default_groups[] = {
> +	&image_attr_group,
> +	NULL
> +};
> +
> +static int __init lfa_init(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int err;
> +
> +	reg.a0 = LFA_1_0_FN_GET_VERSION;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == -LFA_NOT_SUPPORTED) {
> +		pr_info("Live Firmware activation: no firmware agent found\n");
> +		return -ENODEV;
> +	}
> +
> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
> +		reg.a0 >> 16, reg.a0 & 0xffff);
> +
> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
> +					      WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
> +	if (!fw_images_update_wq) {
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
> +
> +		return -ENOMEM;
> +	}
> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> +
> +	init_image_default_attrs();
> +	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
> +	if (!lfa_kset)
> +		return -ENOMEM;
> +
> +	err = update_fw_images_tree();
> +	if (err != 0) {
> +		kset_unregister(lfa_kset);
> +		destroy_workqueue(fw_images_update_wq);
> +	}
> +
> +	return err;
> +}
> +module_init(lfa_init);

You do not use driver model, but 199x style of modprobing and performing
actions.

I do not understand why module load is already doign anything. This
looks like misinterpretation/misuse of Linux driver model - in a way,
you don't use it all and this is like back to 199x where modprobe was
already meaning you bind drivers...

Best regards,
Krzysztof


