Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66572CA5FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Swnp5UxzGM1E07wXoCWuTUm5dNDFNjqw04IYItUiZc=; b=lL3mDyO7t+Vnm0aMcs+Ng6i+fI
	QNuFw+15Ln5kmp1H8jY9ivg6HzgY7uh+ScxJBz7GBWPU+q7qH5jspOTZj2t6G4ZB4upiFb3P6kN1c
	d6H3q7cjzHYbsERRw6UMKx+JSFh5x07NMhSjYZn9WiCYjTlpJqcRDEBFG6pq2twTHjATUGkeQnhUW
	nhB0c13Kqz9JS88lzwA8N2gH/0Zm+1Df5OgQgxw/VxeHyQJNQJpbfEMvH/sfaaBV8dcilrhmlT0Ee
	THoUkpLxUAeoYxADEyR7skM1FGhk4dVO59Yx9G2eZCTRPUP/DM9BcFNnW9Aav8leuTv6cACAzJOh8
	lrXrDtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEMh-000000048jp-03ub;
	Tue, 20 Jan 2026 16:13:59 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEMe-000000048jO-3xRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:13:58 +0000
Received: from skinsburskii.localdomain (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id D96D220B716A;
	Tue, 20 Jan 2026 08:13:55 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D96D220B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1768925636;
	bh=/Swnp5UxzGM1E07wXoCWuTUm5dNDFNjqw04IYItUiZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5fTmeb0PykDmukATKeznivsbr5F+tiwHrBIXbSukB7u/I8XQMQr07lyn7T8HB+DC
	 0Yu6Td8AvHMQu5KoktaRBGfu3OEDheGEkU1Sw9HqaN9f/pkYRdAt2lb4gKNw70hudj
	 Z1+JJSU7NLIBgTC0La4WehEREThNXf/D1ERTikfY=
Date: Tue, 20 Jan 2026 08:13:55 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-arch@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 07/15] mshv: Add ioctl support for MSHV-VFIO bridge
 device
Message-ID: <aW-pw7GlQdFv-lf5@skinsburskii.localdomain>
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-8-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-8-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_081357_020792_D3009199 
X-CRM114-Status: GOOD (  24.38  )
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

On Mon, Jan 19, 2026 at 10:42:22PM -0800, Mukesh R wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> Add ioctl support for creating MSHV devices for a paritition. At
> present only VFIO device types are supported, but more could be
> added. At a high level, a partition ioctl to create device verifies
> it is of type VFIO and does some setup for bridge code in mshv_vfio.c.
> Adapted from KVM device ioctls.
> 
> Credits: Original author: Wei Liu <wei.liu@kernel.org>
> NB: Slightly modified from the original version.
> 
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> ---
>  drivers/hv/mshv_root_main.c | 126 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
> 
> diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
> index 83c7bad269a0..27313419828d 100644
> --- a/drivers/hv/mshv_root_main.c
> +++ b/drivers/hv/mshv_root_main.c
> @@ -1551,6 +1551,129 @@ mshv_partition_ioctl_initialize(struct mshv_partition *partition)
>  	return ret;
>  }
>  
> +static long mshv_device_attr_ioctl(struct mshv_device *mshv_dev, int cmd,
> +				   ulong uarg)
> +{
> +	struct mshv_device_attr attr;
> +	const struct mshv_device_ops *devops = mshv_dev->device_ops;
> +
> +	if (copy_from_user(&attr, (void __user *)uarg, sizeof(attr)))
> +		return -EFAULT;
> +
> +	switch (cmd) {
> +	case MSHV_SET_DEVICE_ATTR:
> +		if (devops->device_set_attr)
> +			return devops->device_set_attr(mshv_dev, &attr);
> +		break;
> +	case MSHV_HAS_DEVICE_ATTR:
> +		if (devops->device_has_attr)
> +			return devops->device_has_attr(mshv_dev, &attr);
> +		break;
> +	}
> +
> +	return -EPERM;
> +}
> +
> +static long mshv_device_fop_ioctl(struct file *filp, unsigned int cmd,
> +				  ulong uarg)
> +{
> +	struct mshv_device *mshv_dev = filp->private_data;
> +
> +	switch (cmd) {
> +	case MSHV_SET_DEVICE_ATTR:
> +	case MSHV_HAS_DEVICE_ATTR:
> +		return mshv_device_attr_ioctl(mshv_dev, cmd, uarg);
> +	}
> +
> +	return -ENOTTY;
> +}
> +
> +static int mshv_device_fop_release(struct inode *inode, struct file *filp)
> +{
> +	struct mshv_device *mshv_dev = filp->private_data;
> +	struct mshv_partition *partition = mshv_dev->device_pt;
> +
> +	if (mshv_dev->device_ops->device_release) {
> +		mutex_lock(&partition->pt_mutex);
> +		hlist_del(&mshv_dev->device_ptnode);
> +		mshv_dev->device_ops->device_release(mshv_dev);
> +		mutex_unlock(&partition->pt_mutex);
> +	}
> +
> +	mshv_partition_put(partition);
> +	return 0;
> +}
> +
> +static const struct file_operations mshv_device_fops = {
> +	.owner = THIS_MODULE,
> +	.unlocked_ioctl = mshv_device_fop_ioctl,
> +	.release = mshv_device_fop_release,
> +};
> +
> +long mshv_partition_ioctl_create_device(struct mshv_partition *partition,
> +					void __user *uarg)
> +{
> +	long rc;
> +	struct mshv_create_device devargk;
> +	struct mshv_device *mshv_dev;
> +	const struct mshv_device_ops *vfio_ops;
> +	int type;
> +
> +	if (copy_from_user(&devargk, uarg, sizeof(devargk))) {
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	/* At present, only VFIO is supported */
> +	if (devargk.type != MSHV_DEV_TYPE_VFIO) {
> +		rc = -ENODEV;
> +		goto out;
> +	}
> +
> +	if (devargk.flags & MSHV_CREATE_DEVICE_TEST) {
> +		rc = 0;
> +		goto out;
> +	}
> +
> +	mshv_dev = kzalloc(sizeof(*mshv_dev), GFP_KERNEL_ACCOUNT);
> +	if (mshv_dev == NULL) {
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	vfio_ops = &mshv_vfio_device_ops;
> +	mshv_dev->device_ops = vfio_ops;
> +	mshv_dev->device_pt = partition;
> +
> +	rc = vfio_ops->device_create(mshv_dev, type);
> +	if (rc < 0) {
> +		kfree(mshv_dev);
> +		goto out;
> +	}
> +
> +	hlist_add_head(&mshv_dev->device_ptnode, &partition->pt_devices);
> +
> +	mshv_partition_get(partition);
> +	rc = anon_inode_getfd(vfio_ops->device_name, &mshv_device_fops,
> +			      mshv_dev, O_RDWR | O_CLOEXEC);
> +	if (rc < 0) {
> +		mshv_partition_put(partition);
> +		hlist_del(&mshv_dev->device_ptnode);
> +		vfio_ops->device_release(mshv_dev);
> +		goto out;
> +	}
> +
> +	devargk.fd = rc;
> +	rc = 0;
> +
> +	if (copy_to_user(uarg, &devargk, sizeof(devargk))) {

Shouldn't the partition be put here?

Thanks,
Stanislav

> +		rc = -EFAULT;
> +		goto out;
> +	}
> +out:
> +	return rc;
> +}
> +
>  static long
>  mshv_partition_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
> @@ -1587,6 +1710,9 @@ mshv_partition_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  	case MSHV_ROOT_HVCALL:
>  		ret = mshv_ioctl_passthru_hvcall(partition, true, uarg);
>  		break;
> +	case MSHV_CREATE_DEVICE:
> +		ret = mshv_partition_ioctl_create_device(partition, uarg);
> +		break;
>  	default:
>  		ret = -ENOTTY;
>  	}
> -- 
> 2.51.2.vfs.0.1
> 

