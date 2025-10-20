Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B4BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNwfPdd05fcKEKh3dO94moausSs4eG8ccoPcxY3z2Pg=; b=Yq+R7Wp0NLpbHCP3zkiP4/sM9p
	rarqOUmZVUSzxCdn4mQ4j2voFMZ5qkYWXKyK9gKofOa0/NmpfeFkbnJNIBw3j6MVuQHznd3kA8mRh
	bXcWJj+IPz0f5sDzhjBe0DdgisP8hCFpqMSCYuVfe7bY3F1Izx6NBM2rk4jMNf+rRuPof10HEHNeJ
	Tf/7JpvBG2Cnr8ek6mNVbxERyizO4cxbNFpk2Ofw/g+/ZbRKlQebdnxNDF1UHNg6t47wez4ipdBff
	pcPwdDMMlz3/zp5e3LRsp82rOZmHOsNl8qSvq4Nxfb9grS0kRC0Vyh2eMVyJCF0NLnxaYbvkkHtQM
	KVyFk8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsfj-0000000EHa9-1ntG;
	Mon, 20 Oct 2025 16:23:47 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsfg-0000000EHXt-21CF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:23:47 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr0y21BY2z6M5CH;
	Tue, 21 Oct 2025 00:19:54 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A5E21402A4;
	Tue, 21 Oct 2025 00:23:31 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 17:23:30 +0100
Date: Mon, 20 Oct 2025 17:23:28 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <d-gole@ti.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH 06/10] firmware: arm_scmi: Add System Telemetry driver
Message-ID: <20251020172328.00002fc3@huawei.com>
In-Reply-To: <20250925203554.482371-7-cristian.marussi@arm.com>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
	<20250925203554.482371-7-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.75]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_092344_812533_DC680741 
X-CRM114-Status: GOOD (  34.42  )
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

On Thu, 25 Sep 2025 21:35:50 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new SCMI System Telemetry driver which gathers platform Telemetry
> data through the new the SCMI Telemetry protocol and expose all of the
> discovered Telemetry data events on a dedicated pseudo-filesystem that
> can be used to interactively configure SCMI Telemetry and access its
> provided data.

I'm not a fan of providing yet another filesystem but you didn't
lay out reasoning in the cover letter.

One non trivial issue is that you'll have to get filesystem review on this.
My review is rather superficial but a few things stood out.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> new file mode 100644
> index 000000000000..2fec465b0f33
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c


> +static ssize_t
> +scmi_tlm_update_interval_write(struct file *filp, const char __user *buf,
> +			       size_t count, loff_t *ppos)
> +{
> +	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
> +	const struct scmi_tlm_setup *tsp = tlmi->tsp;
> +	bool is_group = IS_GROUP(tlmi->cls->flags);
> +	unsigned int update_interval_ms = 0, secs = 0;
> +	int ret, grp_id, exp = -3;
> +	char *kbuf, *p, *token;
> +
> +	kbuf = memdup_user_nul(buf, count);

I'd use a __free(kfree) as then you can directly return in error paths.
Will keep the buffer around a little longer than strictly necessary but
I'm not seeing where that will cause problems.

> +	if (IS_ERR(kbuf))
> +		return PTR_ERR(kbuf);
> +
> +	p = kbuf;
> +	token = strsep(&p, " ");
> +	if (!token) {
> +		/* At least one token must exist to be a valid input */
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	ret = kstrtouint(token, 0, &secs);
> +	if (ret)
> +		goto err;
> +
> +	token = strsep(&p, " ");
> +	if (token) {
> +		ret = kstrtoint(token, 0, &exp);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	kfree(kbuf);
> +
> +	update_interval_ms = SCMI_TLM_BUILD_UPDATE_INTERVAL(secs, exp);
> +
> +	grp_id = !is_group ? SCMI_TLM_GRP_INVALID : tlmi->grp->info->id;
> +	ret = tsp->ops->collection_configure(tsp->ph, grp_id, !is_group, NULL,
> +					     &update_interval_ms, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +
> +err:
> +	kfree(kbuf);
> +	return ret;
> +}


> +
> +static int scmi_tlm_bulk_buffer_allocate_and_fill(struct scmi_tlm_inode *tlmi,
> +						  struct scmi_tlm_priv *tp)
> +{
> +	const struct scmi_tlm_setup *tsp = tlmi->tsp;
> +	const struct scmi_tlm_class *cls = tlmi->cls;
> +	struct scmi_telemetry_de_sample *samples;
> +	bool is_group = IS_GROUP(cls->flags);
> +	int ret, num_samples, res_id;
> +
> +	num_samples = !is_group ? tlmi->info->base.num_des :
> +		tlmi->grp->info->num_des;
> +	tp->buf_sz = num_samples * MAX_BULK_LINE_CHAR_LENGTH;
> +	tp->buf = kzalloc(tp->buf_sz, GFP_KERNEL);
> +	if (!tp->buf)
> +		return -ENOMEM;
> +
> +	res_id = is_group ? tlmi->grp->info->id : SCMI_TLM_GRP_INVALID;
> +	samples = kcalloc(num_samples, sizeof(*samples), GFP_KERNEL);
> +	if (!samples) {
> +		kfree(tp->buf);
> +		return -ENOMEM;
> +	}
> +
> +	ret = tp->bulk_retrieve(tsp, res_id, &num_samples, samples);
> +	if (ret) {
> +		kfree(samples);
Free them in reverse of allocation. Makes it easier to review.

> +		kfree(tp->buf);
> +		return ret;
> +	}
> +
> +	ret = scmi_tlm_buffer_fill(tsp->dev, tp->buf, tp->buf_sz, &tp->buf_len,
> +				   num_samples, samples);
I'm a little surprised by lifetime of tp->buf if this return an error.
Perhaps add a comment on that.

> +	kfree(samples);
> +
> +	return ret;
> +}


> +
> +static struct scmi_tlm_instance *scmi_tlm_init(struct scmi_tlm_setup *tsp,
> +					       int instance_id)
> +{
> +	struct device *dev = tsp->dev;
> +	struct scmi_tlm_instance *ti;
> +	int ret;
> +
> +	ti = devm_kzalloc(dev, sizeof(*ti), GFP_KERNEL);
Given use of devm I'm guessing this will only be called from probe().
With that in mind...
> +	if (!ti)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ti->info = tsp->ops->info_get(tsp->ph);
> +	if (!ti->info) {
> +		dev_err(dev, "invalid Telemetry info !\n");
> +		return ERR_PTR(-EINVAL);

		return dev_err_probe()

> +	}
> +
> +	ti->id = instance_id;
> +	ti->tsp = tsp;
> +
> +	ret = scmi_tlm_root_instance_initialize(dev, ti);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = scmi_telemetry_des_initialize(dev, ti);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = scmi_telemetry_groups_initialize(dev, ti);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return ti;
> +}
> +
> +static int scmi_telemetry_probe(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct scmi_protocol_handle *ph;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_tlm_instance *ti;
> +	struct scmi_tlm_setup *tsp;
> +	const void *ops;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	ops = handle->devm_protocol_get(sdev, sdev->protocol_id, &ph);
> +	if (IS_ERR(ops))
> +		return dev_err_probe(dev, PTR_ERR(ops),
> +				     "Cannot access protocol:0x%X\n",
> +				     sdev->protocol_id);
> +
> +	tsp = devm_kzalloc(dev, sizeof(*tsp), GFP_KERNEL);
> +	if (!tsp)
> +		return -ENOMEM;
> +
> +	tsp->dev = dev;
> +	tsp->ops = ops;
> +	tsp->ph = ph;
> +
> +	ti = scmi_tlm_init(tsp, atomic_fetch_inc(&scmi_tlm_instance_count));
> +	if (IS_ERR(ti))
> +		return PTR_ERR(ti);
> +
> +	mutex_lock(&scmi_tlm_mtx);
> +	list_add(&ti->node, &scmi_telemetry_instances);
> +	if (scmi_tlm_sb) {
> +		int ret;
> +
> +		/*
> +		 * If the file system was already mounted by the time this
> +		 * instance was probed, register explicitly, since the list
> +		 * has been scanned already.
> +		 */
> +		mutex_unlock(&scmi_tlm_mtx);
> +		ret = scmi_telemetry_instance_register(scmi_tlm_sb, ti);
> +		if (ret)
> +			return ret;
> +		mutex_lock(&scmi_tlm_mtx);
I guess this will make sense in later patches.  Right now it looks like you should
just check scmi_tlb_sb after releasing the lock.
E.g.
	mutex_lock(&scmi_tlm_mtx); //I'd spell out mutex
	list_add(&ti->ode, &scam_telemetry_instances);
	mutex_unlock(&scmi_tlm_mtx);
	if (scmi_tlm_sb) {
		ret = scmi....

> +	}
If you really have to check if (scmi_tlb_sb) under the lock just take a copy into a local
variable and use that after releasing the lock.

> +	mutex_unlock(&scmi_tlm_mtx);
> +
> +	dev_set_drvdata(&sdev->dev, ti);
> +
> +	return 0;
> +}

> +static const struct scmi_device_id scmi_id_table[] = {
> +	{ SCMI_PROTOCOL_TELEMETRY, "telemetry" },
> +	{ },

Drop that trailing comma.  Only thing it does is make
it easy to introduce a bug by putting something after it.

> +};
> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);


> +
> +static int __init scmi_telemetry_init(void)
> +{
> +	int ret;
> +
> +	ret = scmi_register(&scmi_telemetry_driver);
Why do this first?  My immediate assumption is this allows
for drivers to register in parallel with the rest of init
happening.  Feels like it should be the last thin in init.

> +	if (ret)
> +		return ret;
> +
> +	ret = sysfs_create_mount_point(fs_kobj, TLM_FS_MNT);
> +	if (ret && ret != -EEXIST) {
> +		scmi_unregister(&scmi_telemetry_driver);

Given the classic pattern of building up more things to undo.
Use gotos and an error handling block as that's what we normally
expect to see in the kernel.

> +		return ret;
> +	}
> +
> +	ret = register_filesystem(&scmi_telemetry_fs);
> +	if (ret) {
> +		sysfs_remove_mount_point(fs_kobj, TLM_FS_MNT);
> +		scmi_unregister(&scmi_telemetry_driver);
> +	}
> +
> +	return ret;
> +}
> +module_init(scmi_telemetry_init);
> +
> +static void __exit scmi_telemetry_exit(void)
> +{
> +	int ret;
> +
> +	ret = unregister_filesystem(&scmi_telemetry_fs);

Documentation says this only fails if the filesystem isn't found.
How can that happen if the init above succeeded?

I noted from a quick scan that most filesystems don't check the
return value.  The only one that does uses it to print a message
and otherwise continues as if it succeeded.



> +	if (!ret)
> +		sysfs_remove_mount_point(fs_kobj, TLM_FS_MNT);
> +	else
> +		pr_err("Failed to unregister %s\n", TLM_FS_NAME);
Given 1 out of 100s of file systems bothers to do this. I'm suspecting
it's a thing that won't happen.

I'd just call the sysfs_remove_mount_point() unconditionally.

> +
> +	scmi_unregister(&scmi_telemetry_driver);
> +}
> +module_exit(scmi_telemetry_exit);
> +
> +MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
> +MODULE_DESCRIPTION("ARM SCMI Telemetry Driver");
> +MODULE_LICENSE("GPL");


