Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 22:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PXsWonMu;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TEqk7FiA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXLtP8iji/E6g+v1wNlt1USSNo7BmW/WXCZuZX1tS6I=; b=PXsWonMuENjZ0GQwm71k9w4cEo
	kQckLycKJ6GMqsNBBuwxzRLgsR0cO0PctrApyygBnGahUC9Pp/892hqKkU85AUCzvL9yr3CBfoLGG
	c/W0o0k/eQ94z2HAy7VzUgszH057oM5m2WYc5MWaX+joiRHqn2T1lDOG3d2FAOUd4HbbS/dNMer+G
	Jtw0URx5fPZr/7Q1InmC8rpoa4b1Z6iBIz7Pv3k+HZmKXezHdzPkOQu1lYCY00+RBj/TdPHGAntXf
	wrHHt7yGnorjIjliRpwRrvMV0FnaixqrbFzy6PealicGgnubHOM6A7NwzXYqJvo2SDWgoc/98t9pO
	wWV0tKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeyF-0000000CzXZ-3rHU;
	Wed, 21 Oct 2026 22:39:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJeyD-0000000CzXD-20BY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 22:39:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e8fe8e343fso8392065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 15:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622380; x=1793227180; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXLtP8iji/E6g+v1wNlt1USSNo7BmW/WXCZuZX1tS6I=;
        b=TEqk7FiAlyeagjdCyFCEQF4rZoW4nDJfVv10KNTJJrHZgetSgDU7OxGIr1Sppy8/S9
         Sb+7E+ldkljASg/TJSHXDL9IhFI5Ban6rKOB3AQvX9023brE0w/V3cbEh0FF07y6mGjT
         piQEEkSa/osa17iE2C/8pYmCk2Lb/1aDfuX53JEGOnkBjM8Xb9Dm0858Rq412Iw0PTZq
         VZo99wOXB39f0CDtg5GEyCGr7LZDE47+EDnyZ1GzuiHw+D5faqHF7Z9oaMVb2CIP/1Yi
         vHe0lxTqy3g/Ft+sapYG9YeFqrG9GXZCoOJdhJkZn5cd8HGgkXkCbQ1PEh3Cm+C54uth
         QiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622380; x=1793227180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXLtP8iji/E6g+v1wNlt1USSNo7BmW/WXCZuZX1tS6I=;
        b=T3z8X26rOQJr1mgZYfFH18RpfbDXS2s3aI04IZVFL2syBBz0dw+3Y5qFA2+QGbOAZ3
         DB1t7yFszZLnTGX+rrv2v/Qk4KWRee8lv/8JhtLYdACzx2rZUoEBG5ctt70m6b8TgZrT
         Q8hesZa9brQJGveABEc5coKsWjecaVBj34GdZ3mt7PVbqP+6pczZcxrO2Zh4mwY08Vel
         aLbeDAgk+G5WKO9BOkJT1drBVpuBOEA82Q2nZHZHUHw9OTUGMfZoApsK5gI8UR06YlIZ
         LOSXhCVZmzC+biBbOOYRm9n/+UNTwB5/ur1x/dxWqPQddKzXELPfVq+NAI52AI3tqStf
         9MmA==
X-Forwarded-Encrypted: i=1; AKwUvBwwogRLyGutC2rEzsH9lYpGsP9NhroAXc8/807fnGC8HR7PqR2+cV00S9M+EHcbTi1GSI8iiqv+0DC9rkjpCSgM@lists.infradead.org
X-Gm-Message-State: AFq9FYI7T5jE77aLGsvsOxo07tQBtEa0zTGQAcGjimKCICvfCeEXLD/5
	lTrfJ/umFBvgodDxOAaUA//Hf+2pqLlVL4iNnL4l8lvNGGBNdiz9hjqx95lp1h/Vkg==
X-Gm-Gg: AYBFou1sQsKhnboFi2wqlWrkyoQm/1o8NKCqDR3kENPafZour3TS5a3Vy7oNP5qIxEH
	WS/Ru+bYkcL7EHp7kTXtLBd9PQzChaz7U9g+t6n5pLxn7pMqZsJ2ApCJ7OazkmRdFoe6Atb7xMs
	jAbju0VIOEY9VNUv+j8F+ao6e1z/cyJrW0HqrsBj4ICLpVZuzkjW9BJAcGzf+V8I16ojXeIdhNb
	siPkwUH8DSTvLgbu29U1wnhBXHYEF7IAB/PjH/bwTo1IjiKnpjS29uQcgmPszBIKyoquUdBpvV9
	wphwJWARn8DkesKTcDxNwh7ICzbSgswIvCSG7nsDgHcw5eg7LcB3yuU7DkuI0I1wafoevhIS/xx
	V54Q9C3siBOVpcOLFG/TH/DV31ri/nBUFQSocgXgkqXmMTZLEB2JeAUu19qC2+4oZsid0n3/7vY
	sdkrvwxC1yXPJTs2UyWIMk0WRCQcC4yRxNW0gkgO5kaHGmZlTsVGWOHV5pLtaPmherhfDFztU1b
	+BagVLFyRSo0yZCw6dp39oHC6T90Jf1BGGk2hPYUXc2vr23zPBUlbFx/M5l4bJ6DTM6Rw1Zd3SM
	o4NYhrLDnXgQUnb6
X-Received: by 2002:a17:903:144e:b0:2dd:c053:82f6 with SMTP id d9443c01a7336-2ea43fe27cemr24610525ad.45.1792622379947;
        Wed, 21 Oct 2026 15:39:39 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4ada65sm15769465ad.73.2026.10.21.15.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 15:39:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 22:39:34 +0000
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
Subject: Re: [RFC PATCH 2/3] vfio: selftests: Add iommufd hwpt replace test
Message-ID: <atk_Jq9gEpU5kB8p@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-3-skhawaja@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925011308.3381953-3-skhawaja@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_153941_531767_2B248CE9 
X-CRM114-Status: GOOD (  32.46  )
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
> Add a test that does iommufd hwpt replace while a DMA is ongoing. This
> verifies the hitless replace of IOMMU domain without disrupting the DMA.
> 
> Note that the new domain is attached after mapping the required DMA
> memory at the same IOVA in the new domain.
> 
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>

Aside from the MODE_IOMMUFD nit,

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  tools/testing/selftests/vfio/Makefile         |   1 +
>  .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
>  2 files changed, 172 insertions(+)
>  create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> 
> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
> index 2c32c48db509..01d0e808871b 100644
> --- a/tools/testing/selftests/vfio/Makefile
> +++ b/tools/testing/selftests/vfio/Makefile
> @@ -8,6 +8,7 @@ else
>  CFLAGS = $(KHDR_INCLUDES)
>  TEST_GEN_PROGS += vfio_dma_mapping_test
>  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
> +TEST_GEN_PROGS += vfio_iommufd_hwpt_replace_test
>  TEST_GEN_PROGS += vfio_iommufd_setup_test
>  TEST_GEN_PROGS += vfio_pci_device_test
>  TEST_GEN_PROGS += vfio_pci_device_init_perf_test
> diff --git a/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> new file mode 100644
> index 000000000000..3ec243aae626
> --- /dev/null
> +++ b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +
> +#include <linux/sizes.h>
> +#include <linux/vfio.h>
> +
> +#include <libvfio.h>
> +
> +#include "kselftest_harness.h"
> +
> +static const char *device_bdf;
> +
> +static void region_setup(struct iommu *iommu,
> +			 struct iova_allocator *iova_allocator,
> +			 struct dma_region *region, u64 size)
> +{
> +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
> +	const int prot = PROT_READ | PROT_WRITE;
> +	void *vaddr;
> +
> +	vaddr = mmap(NULL, size, prot, flags, -1, 0);
> +	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
> +
> +	region->vaddr = vaddr;
> +	region->iova = iova_allocator_alloc(iova_allocator, size);
> +	region->size = size;
> +
> +	iommu_map(iommu, region);
> +}
> +
> +static void region_teardown(struct iommu *iommu, struct dma_region *region)
> +{
> +	iommu_unmap(iommu, region);
> +	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
> +}
> +
> +FIXTURE(vfio_iommufd_replace_hwpt_test) {
> +	struct iommu *iommu;
> +	struct vfio_pci_device *device;
> +	struct iova_allocator *iova_allocator;
> +	struct dma_region memcpy_region;
> +
> +	u64 size;
> +	void *src;
> +	void *dst;
> +	iova_t src_iova;
> +	iova_t dst_iova;
> +};
> +
> +FIXTURE_SETUP(vfio_iommufd_replace_hwpt_test)
> +{
> +	struct vfio_pci_driver *driver;
> +
> +	self->iommu = iommu_init("iommufd");

nit: iommu_init(MODE_IOMMUFD)

This needs to be fixed in iommufd_iommu_init() in the previous patch as
well.

> +	self->device = vfio_pci_device_init(device_bdf, self->iommu);
> +	self->iova_allocator = iova_allocator_init(self->iommu);
> +
> +	driver = &self->device->driver;
> +
> +	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_2M);
> +	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);

The driver->region.size is now populated automatically based on what the
driver needs. So you can just pass in driver->region.size here instead
of hard-coding SZ_2M.

> +
> +	if (driver->ops)
> +		vfio_pci_driver_init(self->device);
> +
> +	self->size = self->memcpy_region.size / 2;
> +	self->src = self->memcpy_region.vaddr;
> +	self->dst = self->src + self->size;
> +
> +	self->src_iova = to_iova(self->device, self->src);
> +	self->dst_iova = to_iova(self->device, self->dst);
> +}
> +
> +FIXTURE_TEARDOWN(vfio_iommufd_replace_hwpt_test)
> +{
> +	struct vfio_pci_driver *driver = &self->device->driver;
> +
> +	if (driver->ops)
> +		vfio_pci_driver_remove(self->device);
> +
> +	region_teardown(self->iommu, &self->memcpy_region);
> +	region_teardown(self->iommu, &driver->region);
> +
> +	iova_allocator_cleanup(self->iova_allocator);
> +	vfio_pci_device_cleanup(self->device);
> +	iommu_cleanup(self->iommu);
> +}
> +
> +FIXTURE_VARIANT(vfio_iommufd_replace_hwpt_test) {
> +	u32 attaches;
> +};
> +
> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, domain_replace) {
> +	.attaches = 1000,

Maybe we should replace memcpy_wait() with memcpy_poll() and move the
wait loop out into the generic driver layer (vfio_pci_driver.c)
repeatedly calling memcpy_poll(). The would let you do replaces until
the memcpy is done instead of hard-coding a random number, and also lift
more code out of the the drivers and into the generic core.

It should be easy enough to swap the drivers from wait() to poll() model
if you are feeling up for it. Not a blocker for this series though.

> +};
> +
> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, noreplace) {
> +	.attaches = 0,
> +};
> +
> +TEST_F_TIMEOUT(vfio_iommufd_replace_hwpt_test, memcpy, 120)
> +{
> +	struct dma_region memcpy_region = {}, driver_region = {};
> +	struct vfio_pci_driver *driver = &self->device->driver;
> +	struct iommu *iommu2 = NULL;
> +	u64 size = 0;
> +	int ret;
> +	u32 i;
> +
> +	if (variant->attaches) {
> +		iommu2 = iommufd_iommu_init(self->iommu->iommufd,
> +					    self->device->dev_id);
> +
> +		memcpy_region = self->memcpy_region;
> +		driver_region = self->device->driver.region;
> +
> +		iommu_map(iommu2, &memcpy_region);
> +		iommu_map(iommu2, &driver_region);
> +	}
> +
> +	if (driver->ops) {
> +		memset(self->src, 'x', self->size);
> +		memset(self->dst, 'y', self->size);
> +
> +		size = min_t(u64, driver->max_memcpy_size, self->size);
> +
> +		/*
> +		 * Fill the device's queue. memcpy_start() returns with
> +		 * max_memcpy_count transfers still outstanding.
> +		 */
> +		vfio_pci_driver_memcpy_start(self->device,
> +					     self->src_iova,
> +					     self->dst_iova,
> +					     size, driver->max_memcpy_count);
> +	}
> +
> +	/*
> +	 * Replace the domain repeatedly while that transfer is in flight. Since
> +	 * domain replacement is a race with the translation requests, it needs
> +	 * to be done multiple times to capture the small window where iommu
> +	 * faults can occur.
> +	 *
> +	 * The loop ends on the original domain, so the teardown below is safe.
> +	 */
> +	for (i = 0; i < variant->attaches; i++) {
> +		vfio_pci_device_attach_iommu(self->device, iommu2);
> +		vfio_pci_device_attach_iommu(self->device, self->iommu);
> +	}
> +
> +	if (driver->ops) {
> +		ret = vfio_pci_driver_memcpy_wait(self->device);
> +
> +		ASSERT_EQ(0, ret);
> +		ASSERT_EQ(0, memcmp(self->src, self->dst, size));
> +	}
> +
> +	if (iommu2) {
> +		iommu_unmap(iommu2, &memcpy_region);
> +		iommu_unmap(iommu2, &driver_region);
> +		iommu_cleanup(iommu2);
> +	}
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	device_bdf = vfio_selftests_get_bdf(&argc, argv);
> +
> +	return test_harness_run(argc, argv);
> +}
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

