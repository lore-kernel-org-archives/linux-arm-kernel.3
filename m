Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68200606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 22:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJsk0zhL;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kOvmKR1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYS+i0Ds8xFF5qZV2X2fbTLhmpre7IccGcufFJNUJH8=; b=aJsk0zhLSCv/ygqGLi1C0KFY4n
	ocF4S1YmjzszUMxZS0K54iXf7Q/h0R3905NOsncelK+GtIFLQsqqMJTn6SmPjCvGjEjo+ULuKoc+y
	7f4M/5kqogtf6GuYQRVufUEOifa1/Vdtdz6VFwE8Yv7aKhjbjwYaXDMMglVM7rQrEgWBiwvHtlU/M
	LPgbdAvPsH2EqfIHcqMGkx/OhRSDGxRiwiXk3+bSjFqzAPsb4gyLnptJXBbhW0pBr0ZYosYeTr6fQ
	RqtFdzgphodMigIhv6WNtndf+KOJgWKr4oK+Ow/VrJjjl/1hyrhvvKJ0WjJeQ3Hyj5ih9Io4AgCpO
	J13EAIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeet-0000000CyPf-17Dl;
	Wed, 21 Oct 2026 22:19:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeeq-0000000CyPJ-2Dqx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 22:19:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e977109392so7755635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792621180; x=1793225980; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iYS+i0Ds8xFF5qZV2X2fbTLhmpre7IccGcufFJNUJH8=;
        b=kOvmKR1QrNZ7mUFeglh7+0vuOzr7PzooVMSB5wukF1nGtdkoOhz4kIZEjM8zDTR7S1
         JGRQEydx/sMFfRwkfC08NAj8+RGtztC6yQB0Kd9aCc2Li2wIazf+kGtXpA1gC7UntY0v
         GsYUJ5RbBW68av89+d8xTMUBWrOOcX9u35MwwlmBTJTLhTyCJQhTekTx8bquCm4G8+Du
         55ThZgW0UKOA5MO+rBFl4WQRQDmi+hRybQKZT//ukDXoPspVFrku8twdwoMTHJlMOtSM
         16maggRMKY6kwGbbEh+TcrpWBVzQmwynrbI1XpineFWttqdzB18xe++k5/cSxBy1sa2m
         pI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792621180; x=1793225980;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYS+i0Ds8xFF5qZV2X2fbTLhmpre7IccGcufFJNUJH8=;
        b=KBbPCPDN7Zr0B4VIGIYfwIqe26iKAx3Eas0HGSSjISIG5fh1e1jNr17hw3/KrW7xXW
         9Q2+IEwZ+nhgf0AfEQFge/gW2KuSEbdQVzWk8s12Tc1qKdpcmgs2s5RBFf0hHpOlaOmS
         8wNJogWs1hppyHh0tFV8u+DOMZrFw0bNT04I8FQTvmB1naKOKPr4qfZs00bp9FSvzOBl
         6FGyxXdylRsHbcwGdqqGpIm1qPYDWwNJ/cUkyTas5t7otYLf8LNjxWmAycFs48IWFz1w
         bCfwT+teVae5kjJljV9nl6SuyuLnCdUR1Pgq2vkGbOx1y373h8TQLHFC1Sk2btsjoHpW
         CTGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAJRjoS0Ayuz/HeN3bQiWgf+V/kjt01xzm0otwikx3TsD5jB248BZJmpCOW7p4q523xgetv7mAT9YEFplPuGIq@lists.infradead.org
X-Gm-Message-State: AFq9FYKXuaeccNq7rXgPjHbG2MwT0ePi5pl/7JdP6BgXkcACnDrRfBWY
	dHZYoPGm4jTcBEbEONuFtc8G80P6qEm0x53Ytsnc6REOOvdaU881HV7yArgw0HtOYw==
X-Gm-Gg: AYBFou0KqiZBeUwixR5J+CdT93SjsIt6NUDencYO9PudFTeA0NXfFZOGL5XWExVxo/o
	NI49rIfHiZESH3mn9QbGNeA9+KS7s54bG60I3y1TQlNjUj5nh2LiL2X69J9ZiJF6D6NF1MDnf+j
	wNnqIYEO9w/WRzwcVNH981qj8RXgLYxRHjX4zW0J+6mmmQIJtnpjwxodRbky9E4PQWbIjmIgid1
	qcTRpOhEiDuHSLuvSCUT69vGMDxQwPIyfzg69WE3TxIrLhGCpQJwFy4o18AiPQj7/MyA9h9ompp
	sF8dYKgk6RwPPynd9nDFlXvNBACblRQZn80LGr4GxMLAhcpBrhFlitOqQqRNDVm1H73cfrJiPuf
	Lg3DpmLnpO/Stxyis4Cw5gWxgX9xDWuFJgwvOCdGAmi6mUU5Bmuyb93oRyHc95AhDog9zYpUfRL
	JEGDP0BDdyUBhBr4va3Da09MYKPJy9YLzaeocv+VytUuRtyfnQjLN9w66VsX4uDsDwaRqPgr38i
	oDpanVIsFx7r4CqUlT6aMUZlKC6d6U1QyAsNYPEaf/WMbTJElF5ALbpKHrq7/cZyc9yp3kZ/eKZ
	j5OZ16MTJnJ4kZH7
X-Received: by 2002:a17:903:1a44:b0:2e9:3f26:5d83 with SMTP id d9443c01a7336-2ea43dbc13fmr25913965ad.12.1792621178933;
        Wed, 21 Oct 2026 15:19:38 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b453a4dsm16082615ad.42.2026.10.21.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:19:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 22:19:34 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 1/3] vfio: selftests: Add support of creating iommus
 from iommufd
Message-ID: <atk6drL0jn8A9Ocm@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-2-skhawaja@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925011308.3381953-2-skhawaja@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_151940_789798_CC39FB71 
X-CRM114-Status: GOOD (  28.73  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
> Add API to init a struct iommu using an already opened iommufd instance
> and attach devices to it.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
> ---
>  .../vfio/lib/include/libvfio/iommu.h          |  2 +
>  .../lib/include/libvfio/vfio_pci_device.h     |  2 +
>  tools/testing/selftests/vfio/lib/iommu.c      | 60 +++++++++++++++++--
>  .../selftests/vfio/lib/vfio_pci_device.c      | 25 ++++++--
>  4 files changed, 80 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> index e9a3386a4719..62f1e8affd2b 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
> @@ -29,10 +29,12 @@ struct iommu {
>  	int container_fd;
>  	int iommufd;
>  	u32 ioas_id;
> +	u32 hwpt_id;
>  	struct list_head dma_regions;
>  };
>  
>  struct iommu *iommu_init(const char *iommu_mode);
> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id);
>  void iommu_cleanup(struct iommu *iommu);
>  
>  int __iommu_map(struct iommu *iommu, struct dma_region *region);
> diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> index e19bd94b8dd2..4dcc23bc9b78 100644
> --- a/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> +++ b/tools/testing/selftests/vfio/lib/include/libvfio/vfio_pci_device.h
> @@ -19,6 +19,7 @@ struct vfio_pci_device {
>  	const char *bdf;
>  	int fd;
>  	int group_fd;
> +	u32 dev_id;
>  
>  	struct iommu *iommu;
>  
> @@ -82,6 +83,7 @@ static inline void vfio_pci_cmd_clear(struct vfio_pci_device *device, u16 bits)
>  	vfio_pci_config_writew(device, PCI_COMMAND, cmd & ~bits);
>  }
>  
> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu);
>  void vfio_pci_irq_enable(struct vfio_pci_device *device, u32 index,
>  			 u32 vector, int count);
>  void vfio_pci_irq_disable(struct vfio_pci_device *device, u32 index);
> diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
> index b6f3c5c84e01..6d2d5c82813c 100644
> --- a/tools/testing/selftests/vfio/lib/iommu.c
> +++ b/tools/testing/selftests/vfio/lib/iommu.c
> @@ -405,6 +405,18 @@ struct iommu_iova_range *iommu_iova_ranges(struct iommu *iommu, u32 *nranges)
>  	return ranges;
>  }
>  
> +static u32 iommufd_hwpt_alloc(struct iommu *iommu, u32 dev_id)
> +{
> +	struct iommu_hwpt_alloc args = {
> +		.size = sizeof(args),
> +		.pt_id = iommu->ioas_id,
> +		.dev_id = dev_id,
> +	};
> +
> +	ioctl_assert(iommu->iommufd, IOMMU_HWPT_ALLOC, &args);
> +	return args.out_hwpt_id;
> +}
> +
>  static u32 iommufd_ioas_alloc(int iommufd)
>  {
>  	struct iommu_ioas_alloc args = {
> @@ -415,17 +427,25 @@ static u32 iommufd_ioas_alloc(int iommufd)
>  	return args.out_ioas_id;
>  }
>  
> -struct iommu *iommu_init(const char *iommu_mode)
> +static struct iommu *iommu_alloc(const char *iommu_mode)
>  {
> -	const char *container_path;
>  	struct iommu *iommu;
> -	int version;
>  
>  	iommu = calloc_assert(1, sizeof(*iommu));
>  
>  	INIT_LIST_HEAD(&iommu->dma_regions);
>  
>  	iommu->mode = lookup_iommu_mode(iommu_mode);
> +	return iommu;
> +}
> +
> +struct iommu *iommu_init(const char *iommu_mode)
> +{
> +	const char *container_path;
> +	struct iommu *iommu;
> +	int version;
> +
> +	iommu = iommu_alloc(iommu_mode);
>  
>  	container_path = iommu->mode->container_path;
>  	if (container_path) {
> @@ -449,10 +469,42 @@ struct iommu *iommu_init(const char *iommu_mode)
>  	return iommu;
>  }
>  
> +struct iommu *iommufd_iommu_init(int iommufd, u32 dev_id)

I think this is a good opportunity to start adding kernel-doc comments.
It's not very obvious how and when to use both iommufd_iommu_init() and
vfio_pci_device_attach_iommu(). A kernel-doc comment would help clarify
that.

> +{
> +	struct iommu *iommu;
> +
> +	iommu = iommu_alloc("iommufd");
> +
> +	iommu->iommufd = dup(iommufd);
> +	VFIO_ASSERT_GT(iommu->iommufd, 0);
> +
> +	iommu->ioas_id = iommufd_ioas_alloc(iommu->iommufd);
> +	iommu->hwpt_id = iommufd_hwpt_alloc(iommu, dev_id);
> +
> +	return iommu;
> +}
> +
> +static void iommufd_cleanup(struct iommu *iommu)
> +{
> +	struct iommu_destroy args = {
> +		.size = sizeof(args),
> +	};
> +
> +	if (iommu->hwpt_id) {
> +		args.id = iommu->hwpt_id;
> +		ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);
> +	}
> +
> +	args.id = iommu->ioas_id;
> +	ioctl_assert(iommu->iommufd, IOMMU_DESTROY, &args);

Please put IOMMU_DESTROY into its own helper so this can be:

if (iommu->hwpt_id)
        iommufd_iommu_destroy(iommu, iommu->hwpt_id);

iommufd_iommu_destroy(iommu, iommu->ioas_id);

> +
> +	VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
> +}
> +
>  void iommu_cleanup(struct iommu *iommu)
>  {
>  	if (iommu->iommufd)
> -		VFIO_ASSERT_EQ(close(iommu->iommufd), 0);
> +		iommufd_cleanup(iommu);
>  	else
>  		VFIO_ASSERT_EQ(close(iommu->container_fd), 0);
>  
> diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> index 774d1e90ec0e..81d3879d064f 100644
> --- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> +++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
> @@ -469,15 +469,15 @@ int __vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
>  	if (ioctl(device_fd, VFIO_DEVICE_BIND_IOMMUFD, &args))
>  		return -errno;
>  
> -	return 0;
> +	return args.out_devid;

This breaks vfio_pci_sriov_uapi_test for all iommufd variants (9/45
fail). iommufd_setup() in that test returns the result of
__vfio_device_bind_iommufd() directly, and the
fixture/ASSERT_COND_VF_CREATION() treat any non-zero value as failure.

Something like the following is needed to fix it:

diff --git a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
--- a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
@@ -32,9 +32,14 @@ static int container_setup(struct vfio_pci_device *device, const char *bdf,
 static int iommufd_setup(struct vfio_pci_device *device, const char *bdf,
		  const char *vf_token)
 {
+    int ret;
+
     vfio_pci_cdev_open(device, bdf);
-    return __vfio_device_bind_iommufd(device->fd,
-                      device->iommu->iommufd, vf_token);
+    ret = __vfio_device_bind_iommufd(device->fd,
+                     device->iommu->iommufd, vf_token);
+
+    /* On success, __vfio_device_bind_iommufd() returns the device ID. */
+    return ret < 0 ? ret : 0;
 }

 static int device_init(const char *bdf, struct iommu *iommu,

>  }
>  
> -static void vfio_device_bind_iommufd(int device_fd, int iommufd,
> -				     const char *vf_token)
> +int vfio_device_bind_iommufd(int device_fd, int iommufd, const char *vf_token)
>  {
>  	int ret = __vfio_device_bind_iommufd(device_fd, iommufd, vf_token);
>  
> -	VFIO_ASSERT_EQ(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
> +	VFIO_ASSERT_GE(ret, 0, "Failed VFIO_DEVICE_BIND_IOMMUFD ioctl\n");
> +	return ret;
>  }
>  
>  static void vfio_device_attach_iommufd_pt(int device_fd, u32 pt_id)
> @@ -503,10 +503,25 @@ static void vfio_pci_iommufd_setup(struct vfio_pci_device *device,
>  				   const char *bdf, const char *vf_token)
>  {
>  	vfio_pci_cdev_open(device, bdf);
> -	vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
> +	device->dev_id = vfio_device_bind_iommufd(device->fd, device->iommu->iommufd, vf_token);
>  	vfio_device_attach_iommufd_pt(device->fd, device->iommu->ioas_id);
>  }
>  
> +void vfio_pci_device_attach_iommu(struct vfio_pci_device *device, struct iommu *iommu)
> +{
> +	u32 pt_id = iommu->ioas_id;
> +
> +	/* Only iommufd supports changing struct iommu attachments */
> +	VFIO_ASSERT_TRUE(iommu->iommufd);
> +
> +	if (iommu->hwpt_id)
> +		pt_id = iommu->hwpt_id;
> +
> +	VFIO_ASSERT_NE(pt_id, 0);

Is this assert needed? (Will vfio_device_attach_iommufd_pt() not handle
this appropriately?)

> +	vfio_device_attach_iommufd_pt(device->fd, pt_id);
> +	device->iommu = iommu;
> +}
> +
>  struct vfio_pci_device *vfio_pci_device_alloc(const char *bdf, struct iommu *iommu)
>  {
>  	struct vfio_pci_device *device;
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

