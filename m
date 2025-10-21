Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAdZ2v0KQLCYpU4TBi2UYXKu86U9Ir2WkGk7AE4KPP4=; b=ktSBj5y5p8NvSGobrj4NYTQvPc
	4ISKYcqWuu9fl9W/henCMbMAE3KlSv2IPnMQnazXWSXp8IM7i85E5LxWODCegM/dPFWoD2V8++TUb
	gT9x4FlmZ3dFNGW7UPSHXUk5DMpk5lIRE3U9/JkzvZmBfNVwh/MFejHUH1iBAy26OxxFMCawaG4Ct
	1bl/PPweM0tN4SK8VPT/SbADqBnkvn4mVeGGFH7nvgctTAUfvIC2wIuwQIHr0cufqdiG4JL682b75
	rWN6+LQBfzh1S7E3raBIuRZ5N1qda2ERY5GQX70LXiJLndFlPHg1jIykRw4L0M5RBoJ+gtBOFcqD0
	W0+TTSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9aA-0000000Gcgp-2eUS;
	Tue, 21 Oct 2025 10:27:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9a7-0000000Gcg3-42AL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:27:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1433F1007;
	Tue, 21 Oct 2025 03:26:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1EFF3F63F;
	Tue, 21 Oct 2025 03:27:04 -0700 (PDT)
Date: Tue, 21 Oct 2025 11:27:02 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 06/10] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <aPdf9lyY9ysq2mPx@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
 <20250925203554.482371-7-cristian.marussi@arm.com>
 <20251020172328.00002fc3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020172328.00002fc3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_032708_108921_7B456993 
X-CRM114-Status: GOOD (  47.42  )
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

On Mon, Oct 20, 2025 at 05:23:28PM +0100, Jonathan Cameron wrote:
> On Thu, 25 Sep 2025 21:35:50 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Add a new SCMI System Telemetry driver which gathers platform Telemetry
> > data through the new the SCMI Telemetry protocol and expose all of the
> > discovered Telemetry data events on a dedicated pseudo-filesystem that
> > can be used to interactively configure SCMI Telemetry and access its
> > provided data.
>

Hi,
 
> I'm not a fan of providing yet another filesystem but you didn't
> lay out reasoning in the cover letter.

Sorry, I dont understand..you mean here that I did NOT provide enough reasons
why I am adopting a new FS approach ? ... or I misunderstood the English ?

.. because I did provide a lot of reasons (for my point-of-view) to go
for a new FS in the cover-letter...

> 
> One non trivial issue is that you'll have to get filesystem review on this.
> My review is rather superficial but a few things stood out.

Well yes I would have expected that, but now the FS implementation
internals of this series is definetely immature and to be reworked (to
the extent of using a well-know deprecated FS mount api at first..)

So I posted this V1 to lay-out the ideas and the effective FS API layout
but I was planning to extend the review audience once I have reworked fully
the series FS bits in the next V2...

> 
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> > diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> > new file mode 100644
> > index 000000000000..2fec465b0f33
> > --- /dev/null
> > +++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> 
> 
> > +static ssize_t
> > +scmi_tlm_update_interval_write(struct file *filp, const char __user *buf,
> > +			       size_t count, loff_t *ppos)
> > +{
> > +	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
> > +	const struct scmi_tlm_setup *tsp = tlmi->tsp;
> > +	bool is_group = IS_GROUP(tlmi->cls->flags);
> > +	unsigned int update_interval_ms = 0, secs = 0;
> > +	int ret, grp_id, exp = -3;
> > +	char *kbuf, *p, *token;
> > +
> > +	kbuf = memdup_user_nul(buf, count);
> 
> I'd use a __free(kfree) as then you can directly return in error paths.
> Will keep the buffer around a little longer than strictly necessary but
> I'm not seeing where that will cause problems.
> 

Ok.

> > +	if (IS_ERR(kbuf))
> > +		return PTR_ERR(kbuf);
> > +
> > +	p = kbuf;
> > +	token = strsep(&p, " ");
> > +	if (!token) {
> > +		/* At least one token must exist to be a valid input */
> > +		ret = -EINVAL;
> > +		goto err;
> > +	}
> > +
> > +	ret = kstrtouint(token, 0, &secs);
> > +	if (ret)
> > +		goto err;
> > +
> > +	token = strsep(&p, " ");
> > +	if (token) {
> > +		ret = kstrtoint(token, 0, &exp);
> > +		if (ret)
> > +			goto err;
> > +	}
> > +
> > +	kfree(kbuf);
> > +
> > +	update_interval_ms = SCMI_TLM_BUILD_UPDATE_INTERVAL(secs, exp);
> > +
> > +	grp_id = !is_group ? SCMI_TLM_GRP_INVALID : tlmi->grp->info->id;
> > +	ret = tsp->ops->collection_configure(tsp->ph, grp_id, !is_group, NULL,
> > +					     &update_interval_ms, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return count;
> > +
> > +err:
> > +	kfree(kbuf);
> > +	return ret;
> > +}
> 
> 
> > +
> > +static int scmi_tlm_bulk_buffer_allocate_and_fill(struct scmi_tlm_inode *tlmi,
> > +						  struct scmi_tlm_priv *tp)
> > +{
> > +	const struct scmi_tlm_setup *tsp = tlmi->tsp;
> > +	const struct scmi_tlm_class *cls = tlmi->cls;
> > +	struct scmi_telemetry_de_sample *samples;
> > +	bool is_group = IS_GROUP(cls->flags);
> > +	int ret, num_samples, res_id;
> > +
> > +	num_samples = !is_group ? tlmi->info->base.num_des :
> > +		tlmi->grp->info->num_des;
> > +	tp->buf_sz = num_samples * MAX_BULK_LINE_CHAR_LENGTH;
> > +	tp->buf = kzalloc(tp->buf_sz, GFP_KERNEL);
> > +	if (!tp->buf)
> > +		return -ENOMEM;
> > +
> > +	res_id = is_group ? tlmi->grp->info->id : SCMI_TLM_GRP_INVALID;
> > +	samples = kcalloc(num_samples, sizeof(*samples), GFP_KERNEL);
> > +	if (!samples) {
> > +		kfree(tp->buf);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	ret = tp->bulk_retrieve(tsp, res_id, &num_samples, samples);
> > +	if (ret) {
> > +		kfree(samples);
> Free them in reverse of allocation. Makes it easier to review.
> 

Ok.

> > +		kfree(tp->buf);
> > +		return ret;
> > +	}
> > +
> > +	ret = scmi_tlm_buffer_fill(tsp->dev, tp->buf, tp->buf_sz, &tp->buf_len,
> > +				   num_samples, samples);
> I'm a little surprised by lifetime of tp->buf if this return an error.
> Perhaps add a comment on that.

Ok.

> 
> > +	kfree(samples);
> > +
> > +	return ret;
> > +}
> 
> 
> > +
> > +static struct scmi_tlm_instance *scmi_tlm_init(struct scmi_tlm_setup *tsp,
> > +					       int instance_id)
> > +{
> > +	struct device *dev = tsp->dev;
> > +	struct scmi_tlm_instance *ti;
> > +	int ret;
> > +
> > +	ti = devm_kzalloc(dev, sizeof(*ti), GFP_KERNEL);
> Given use of devm I'm guessing this will only be called from probe().
> With that in mind...

Yes...

> > +	if (!ti)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ti->info = tsp->ops->info_get(tsp->ph);
> > +	if (!ti->info) {
> > +		dev_err(dev, "invalid Telemetry info !\n");
> > +		return ERR_PTR(-EINVAL);
> 
> 		return dev_err_probe()
> 

Indeed.

> > +	}
> > +
> > +	ti->id = instance_id;
> > +	ti->tsp = tsp;
> > +
> > +	ret = scmi_tlm_root_instance_initialize(dev, ti);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	ret = scmi_telemetry_des_initialize(dev, ti);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	ret = scmi_telemetry_groups_initialize(dev, ti);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	return ti;
> > +}
> > +
> > +static int scmi_telemetry_probe(struct scmi_device *sdev)
> > +{
> > +	const struct scmi_handle *handle = sdev->handle;
> > +	struct scmi_protocol_handle *ph;
> > +	struct device *dev = &sdev->dev;
> > +	struct scmi_tlm_instance *ti;
> > +	struct scmi_tlm_setup *tsp;
> > +	const void *ops;
> > +
> > +	if (!handle)
> > +		return -ENODEV;
> > +
> > +	ops = handle->devm_protocol_get(sdev, sdev->protocol_id, &ph);
> > +	if (IS_ERR(ops))
> > +		return dev_err_probe(dev, PTR_ERR(ops),
> > +				     "Cannot access protocol:0x%X\n",
> > +				     sdev->protocol_id);
> > +
> > +	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> > +	if (!tsp)
> > +		return -ENOMEM;
> > +
> > +	tsp->dev = dev;
> > +	tsp->ops = ops;
> > +	tsp->ph = ph;
> > +
> > +	ti = scmi_tlm_init(tsp, atomic_fetch_inc(&scmi_tlm_instance_count));
> > +	if (IS_ERR(ti))
> > +		return PTR_ERR(ti);
> > +
> > +	mutex_lock(&scmi_tlm_mtx);
> > +	list_add(&ti->node, &scmi_telemetry_instances);
> > +	if (scmi_tlm_sb) {
> > +		int ret;
> > +
> > +		/*
> > +		 * If the file system was already mounted by the time this
> > +		 * instance was probed, register explicitly, since the list
> > +		 * has been scanned already.
> > +		 */
> > +		mutex_unlock(&scmi_tlm_mtx);
> > +		ret = scmi_telemetry_instance_register(scmi_tlm_sb, ti);
> > +		if (ret)
> > +			return ret;
> > +		mutex_lock(&scmi_tlm_mtx);
> I guess this will make sense in later patches.  Right now it looks like you should
> just check scmi_tlb_sb after releasing the lock.
> E.g.
> 	mutex_lock(&scmi_tlm_mtx); //I'd spell out mutex
> 	list_add(&ti->ode, &scam_telemetry_instances);
> 	mutex_unlock(&scmi_tlm_mtx);
> 	if (scmi_tlm_sb) {
> 		ret = scmi....
> 
> > +	}
> If you really have to check if (scmi_tlb_sb) under the lock just take a copy into a local
> variable and use that after releasing the lock.
> 


Yes a lot to review/rework here...

> > +	mutex_unlock(&scmi_tlm_mtx);
> > +
> > +	dev_set_drvdata(&sdev->dev, ti);
> > +
> > +	return 0;
> > +}
> 
> > +static const struct scmi_device_id scmi_id_table[] = {
> > +	{ SCMI_PROTOCOL_TELEMETRY, "telemetry" },
> > +	{ },
> 
> Drop that trailing comma.  Only thing it does is make
> it easy to introduce a bug by putting something after it.
> 

I'll do.

> > +};
> > +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
> 
> 
> > +
> > +static int __init scmi_telemetry_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = scmi_register(&scmi_telemetry_driver);
> Why do this first?  My immediate assumption is this allows
> for drivers to register in parallel with the rest of init
> happening.  Feels like it should be the last thin in init.
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = sysfs_create_mount_point(fs_kobj, TLM_FS_MNT);
> > +	if (ret && ret != -EEXIST) {
> > +		scmi_unregister(&scmi_telemetry_driver);
> 
> Given the classic pattern of building up more things to undo.
> Use gotos and an error handling block as that's what we normally
> expect to see in the kernel.

Ok.

> 
> > +		return ret;
> > +	}
> > +
> > +	ret = register_filesystem(&scmi_telemetry_fs);
> > +	if (ret) {
> > +		sysfs_remove_mount_point(fs_kobj, TLM_FS_MNT);
> > +		scmi_unregister(&scmi_telemetry_driver);
> > +	}
> > +
> > +	return ret;
> > +}
> > +module_init(scmi_telemetry_init);
> > +
> > +static void __exit scmi_telemetry_exit(void)
> > +{
> > +	int ret;
> > +
> > +	ret = unregister_filesystem(&scmi_telemetry_fs);
> 
> Documentation says this only fails if the filesystem isn't found.
> How can that happen if the init above succeeded?
> 
> I noted from a quick scan that most filesystems don't check the
> return value.  The only one that does uses it to print a message
> and otherwise continues as if it succeeded.

Ok.

> 
> 
> 
> > +	if (!ret)
> > +		sysfs_remove_mount_point(fs_kobj, TLM_FS_MNT);
> > +	else
> > +		pr_err("Failed to unregister %s\n", TLM_FS_NAME);
> Given 1 out of 100s of file systems bothers to do this. I'm suspecting
> it's a thing that won't happen.
> 
> I'd just call the sysfs_remove_mount_point() unconditionally.
> 

Ok.

I wil rework heavily in V2 the FS layer and post also to the related FS
mailing lists...

Thanks,
Cristian

