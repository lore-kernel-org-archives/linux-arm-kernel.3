Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E8D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 23:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I10I+TGg;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q0NloxJr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y/7UYsTuFvcPMA42JSSO+NZ9EnoRizOOg7pUXOjzzPY=; b=I10I+TGgMTKKJbzTYxLfnTFbjT
	focfWR+rR5n5SN+54PiDJQcIpYaUd7cGGTjWVI3vtRmcZ7otv3hc34oNBjHdZwYQuEIO+X9jHv+eQ
	372HsQgTQewdnVi+M3pFqnI750lacikh7ZSb8a/iXo6ahhznP8fKEJ2NJW7WHUxpFRESw47hQOuqK
	bHpUANNA6kXmZs98vfck7nh373xtN2i7jfHK3J6sBBWAKWnPI7J0Xq6toKpkgjXdbC9DQiageeEw+
	HRz3D2GtbO2hWzxIHyZjH2CupKKaDNvlcgWugUm3SUgtTUPKJm98eLU1hTMfFzlPPvCeXRkPBDg2b
	dLA8+D1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOPM-0000000H9SJ-3um5;
	Fri, 23 Oct 2026 23:10:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOPK-0000000H9Rg-1CPI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 23:10:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2db33db4de9so21145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 16:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792797041; x=1793401841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/7UYsTuFvcPMA42JSSO+NZ9EnoRizOOg7pUXOjzzPY=;
        b=q0NloxJrOL7+/6HOTZyCCyxTZPen8iB86Z5uIlA+GetXuf0c6dbMikJVPsaxx6jExC
         5saepwbnphqIh7p6sCGy/fTIr1DvjC/cyTL3cRJEQWcRYJmcGeqHe36859VKYj4lq4pO
         1dF+R/I+m0pkn7I6ObHYOG6kgId7uI35lf8kZRPd4rqkZ0NRJWmYjR0+TwGWIfCTjsXQ
         i5BJfc3WPezt/hXTkYgvlFvNJ9ZOL5O42vS0lVBQZ9TYJB+ik+w2EYGiTfD/2nqZLv3g
         Ds+DQA14FbLtgd+S9uEUkXNjPv24eAx9NRyeYmQ29EZQDM+m+WOZbUtwMR4EvmCSacwe
         mDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797041; x=1793401841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/7UYsTuFvcPMA42JSSO+NZ9EnoRizOOg7pUXOjzzPY=;
        b=kAu0yxsG9vEGGMcwv2POM3ZqDiQrCkrMg2FbC1AXjEgB9gMJeY9NeycLXz0m5qGS4Y
         wxdhAD+kqnOmoi5/muyw6TzmkCR23iyc4DC1gw3BlKqnV33/4RfeH8MkZdKkAdT+me5k
         o1bt0GrzOm9GK8jWEKup9yfhVV12g3etFmu5rCSaS1EyRwvVivonz/X/bhCvauZY0lW3
         2YjXLJ1rZAI0q8TLFX0tjWIHLmklPmy6kUHIkjNhrw/lJjPNm8zIjejYcIF0TOUTJxXY
         PHodzGF9u7QMlplPAR4l2/Dqm4rLhukFeFusurgIijK5gmzm1TI1s+bUUqIJwtYDCFYm
         jLYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAyU/0Z/N6zoaNX+CgxCBUdUfIV39K6wb3L0B43ai0Mliy0p532kwWlyeKCie86SpeUJVH9vDdOme9cmZ6W/3s@lists.infradead.org
X-Gm-Message-State: AFq9FYIAFzz+iKwtRWe6BhxkN1Ul5A5m8tBFMRDgiq0CAMciNzPSoP+o
	UTxqunrxRjepbd1KwTRB+8lu9Z5U8GZWDYFMkxuZhRXwpHaWsRXLjaA+0WQypyf/Xw==
X-Gm-Gg: AYBFou3D1x8gu3pCvH35qZkfPdAVrtzW+RHwL33JutwraVwt1UFkiLbb64oOR38k4XY
	fLbtRCcvla/aLaldVO41zaiGCQh6G19KgXZ9LpuQIyz7Yy3ZlVXKTqWCzTEq43g39KJzYQjswup
	wtD2RPOS5nJKf3K5190qpFIsAn40H/LKx5rGmWi8UrJdujtpIlCGQt2K7TqR2aj3iTwYLlHiME2
	RXALcfqqSGjO79XKxLd8gG9v+sCffKk3suclRgD4v8mkqZJncYrlptFoDOBL2kEr29U4GSm5HpL
	x8JJNgofYLI7HuL1VKhvbsugC4b3AhS9/FpLq3ud3ApqlsCFYCcv3txvTmS/xDjxpA3ZT7qX0Ei
	Z8qgia4Lc8P96HhEgCUs4b7w/v/erMv8WGpWbL1TbzTK9pKQqrJxtpSXURdCjcJ+9vARi22rp8w
	YQa2tjFibhPkINXjN7GSuN/45cSUtsIVan9U2gq36ldKzgd/GKDkr/17UkpAZiocqEUMzA77Gbf
	xW12xBB6cEH9ihZAuXp2vFFGG/CFwfyBzZrEvNIZPCovAn5DuNFvbtkkb8+Pg7FUofPttd5veTX
	lD9uvVzWiX1tyLs4l6imOcUqYe3X26NpHdBZ38rMiuw2F3MU
X-Received: by 2002:a17:903:19ce:b0:2e6:1735:f645 with SMTP id d9443c01a7336-2ea9d1089fdmr862725ad.4.1792797040825;
        Fri, 23 Oct 2026 16:10:40 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6946dsm622657a91.4.2026.10.23.16.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:10:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 23:10:36 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 2/3] vfio: selftests: Add iommufd hwpt replace test
Message-ID: <atvop22fFX7tkt9G@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-3-skhawaja@google.com>
 <atk_Jq9gEpU5kB8p@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <atk_Jq9gEpU5kB8p@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_161042_335178_2AEAC3E3 
X-CRM114-Status: GOOD (  29.12  )
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

On Wed, Oct 21, 2026 at 10:39:34PM +0000, David Matlack wrote:
>On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
>> Add a test that does iommufd hwpt replace while a DMA is ongoing. This
>> verifies the hitless replace of IOMMU domain without disrupting the DMA.
>>
>> Note that the new domain is attached after mapping the required DMA
>> memory at the same IOVA in the new domain.
>>
>> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>
>Aside from the MODE_IOMMUFD nit,
>
>Reviewed-by: David Matlack <dmatlack@google.com>
>
>> ---
>>  tools/testing/selftests/vfio/Makefile         |   1 +
>>  .../vfio/vfio_iommufd_hwpt_replace_test.c     | 171 ++++++++++++++++++
>>  2 files changed, 172 insertions(+)
>>  create mode 100644 tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
>>
>> diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
>> index 2c32c48db509..01d0e808871b 100644
>> --- a/tools/testing/selftests/vfio/Makefile
>> +++ b/tools/testing/selftests/vfio/Makefile
>> @@ -8,6 +8,7 @@ else
>>  CFLAGS = $(KHDR_INCLUDES)
>>  TEST_GEN_PROGS += vfio_dma_mapping_test
>>  TEST_GEN_PROGS += vfio_dma_mapping_mmio_test
>> +TEST_GEN_PROGS += vfio_iommufd_hwpt_replace_test
>>  TEST_GEN_PROGS += vfio_iommufd_setup_test
>>  TEST_GEN_PROGS += vfio_pci_device_test
>>  TEST_GEN_PROGS += vfio_pci_device_init_perf_test
>> diff --git a/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
>> new file mode 100644
>> index 000000000000..3ec243aae626
>> --- /dev/null
>> +++ b/tools/testing/selftests/vfio/vfio_iommufd_hwpt_replace_test.c
>> @@ -0,0 +1,171 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +#include <string.h>
>> +#include <sys/ioctl.h>
>> +#include <sys/mman.h>
>> +
>> +#include <linux/sizes.h>
>> +#include <linux/vfio.h>
>> +
>> +#include <libvfio.h>
>> +
>> +#include "kselftest_harness.h"
>> +
>> +static const char *device_bdf;
>> +
>> +static void region_setup(struct iommu *iommu,
>> +			 struct iova_allocator *iova_allocator,
>> +			 struct dma_region *region, u64 size)
>> +{
>> +	const int flags = MAP_SHARED | MAP_ANONYMOUS;
>> +	const int prot = PROT_READ | PROT_WRITE;
>> +	void *vaddr;
>> +
>> +	vaddr = mmap(NULL, size, prot, flags, -1, 0);
>> +	VFIO_ASSERT_NE(vaddr, MAP_FAILED);
>> +
>> +	region->vaddr = vaddr;
>> +	region->iova = iova_allocator_alloc(iova_allocator, size);
>> +	region->size = size;
>> +
>> +	iommu_map(iommu, region);
>> +}
>> +
>> +static void region_teardown(struct iommu *iommu, struct dma_region *region)
>> +{
>> +	iommu_unmap(iommu, region);
>> +	VFIO_ASSERT_EQ(munmap(region->vaddr, region->size), 0);
>> +}
>> +
>> +FIXTURE(vfio_iommufd_replace_hwpt_test) {
>> +	struct iommu *iommu;
>> +	struct vfio_pci_device *device;
>> +	struct iova_allocator *iova_allocator;
>> +	struct dma_region memcpy_region;
>> +
>> +	u64 size;
>> +	void *src;
>> +	void *dst;
>> +	iova_t src_iova;
>> +	iova_t dst_iova;
>> +};
>> +
>> +FIXTURE_SETUP(vfio_iommufd_replace_hwpt_test)
>> +{
>> +	struct vfio_pci_driver *driver;
>> +
>> +	self->iommu = iommu_init("iommufd");
>
>nit: iommu_init(MODE_IOMMUFD)
>
>This needs to be fixed in iommufd_iommu_init() in the previous patch as
>well.
>
>> +	self->device = vfio_pci_device_init(device_bdf, self->iommu);
>> +	self->iova_allocator = iova_allocator_init(self->iommu);
>> +
>> +	driver = &self->device->driver;
>> +
>> +	region_setup(self->iommu, self->iova_allocator, &self->memcpy_region, SZ_2M);
>> +	region_setup(self->iommu, self->iova_allocator, &driver->region, SZ_2M);
>
>The driver->region.size is now populated automatically based on what the
>driver needs. So you can just pass in driver->region.size here instead
>of hard-coding SZ_2M.
>
>> +
>> +	if (driver->ops)
>> +		vfio_pci_driver_init(self->device);
>> +
>> +	self->size = self->memcpy_region.size / 2;
>> +	self->src = self->memcpy_region.vaddr;
>> +	self->dst = self->src + self->size;
>> +
>> +	self->src_iova = to_iova(self->device, self->src);
>> +	self->dst_iova = to_iova(self->device, self->dst);
>> +}
>> +
>> +FIXTURE_TEARDOWN(vfio_iommufd_replace_hwpt_test)
>> +{
>> +	struct vfio_pci_driver *driver = &self->device->driver;
>> +
>> +	if (driver->ops)
>> +		vfio_pci_driver_remove(self->device);
>> +
>> +	region_teardown(self->iommu, &self->memcpy_region);
>> +	region_teardown(self->iommu, &driver->region);
>> +
>> +	iova_allocator_cleanup(self->iova_allocator);
>> +	vfio_pci_device_cleanup(self->device);
>> +	iommu_cleanup(self->iommu);
>> +}
>> +
>> +FIXTURE_VARIANT(vfio_iommufd_replace_hwpt_test) {
>> +	u32 attaches;
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, domain_replace) {
>> +	.attaches = 1000,
>
>Maybe we should replace memcpy_wait() with memcpy_poll() and move the
>wait loop out into the generic driver layer (vfio_pci_driver.c)
>repeatedly calling memcpy_poll(). The would let you do replaces until
>the memcpy is done instead of hard-coding a random number, and also lift
>more code out of the the drivers and into the generic core.

The purpose of this being here was to a N number of attaches/replaces as
it might have chance to produce faults, as this is basically race. While
I agree poll() is a useful op to have, but in the context of this test
maybe it is an overkill.

Thanks,
Sami
>
>It should be easy enough to swap the drivers from wait() to poll() model
>if you are feeling up for it. Not a blocker for this series though.
>
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(vfio_iommufd_replace_hwpt_test, noreplace) {
>> +	.attaches = 0,
>> +};
>> +
>> +TEST_F_TIMEOUT(vfio_iommufd_replace_hwpt_test, memcpy, 120)
>> +{
>> +	struct dma_region memcpy_region = {}, driver_region = {};
>> +	struct vfio_pci_driver *driver = &self->device->driver;
>> +	struct iommu *iommu2 = NULL;
>> +	u64 size = 0;
>> +	int ret;
>> +	u32 i;
>> +
>> +	if (variant->attaches) {
>> +		iommu2 = iommufd_iommu_init(self->iommu->iommufd,
>> +					    self->device->dev_id);
>> +
>> +		memcpy_region = self->memcpy_region;
>> +		driver_region = self->device->driver.region;
>> +
>> +		iommu_map(iommu2, &memcpy_region);
>> +		iommu_map(iommu2, &driver_region);
>> +	}
>> +
>> +	if (driver->ops) {
>> +		memset(self->src, 'x', self->size);
>> +		memset(self->dst, 'y', self->size);
>> +
>> +		size = min_t(u64, driver->max_memcpy_size, self->size);
>> +
>> +		/*
>> +		 * Fill the device's queue. memcpy_start() returns with
>> +		 * max_memcpy_count transfers still outstanding.
>> +		 */
>> +		vfio_pci_driver_memcpy_start(self->device,
>> +					     self->src_iova,
>> +					     self->dst_iova,
>> +					     size, driver->max_memcpy_count);
>> +	}
>> +
>> +	/*
>> +	 * Replace the domain repeatedly while that transfer is in flight. Since
>> +	 * domain replacement is a race with the translation requests, it needs
>> +	 * to be done multiple times to capture the small window where iommu
>> +	 * faults can occur.
>> +	 *
>> +	 * The loop ends on the original domain, so the teardown below is safe.
>> +	 */
>> +	for (i = 0; i < variant->attaches; i++) {
>> +		vfio_pci_device_attach_iommu(self->device, iommu2);
>> +		vfio_pci_device_attach_iommu(self->device, self->iommu);
>> +	}
>> +
>> +	if (driver->ops) {
>> +		ret = vfio_pci_driver_memcpy_wait(self->device);
>> +
>> +		ASSERT_EQ(0, ret);
>> +		ASSERT_EQ(0, memcmp(self->src, self->dst, size));
>> +	}
>> +
>> +	if (iommu2) {
>> +		iommu_unmap(iommu2, &memcpy_region);
>> +		iommu_unmap(iommu2, &driver_region);
>> +		iommu_cleanup(iommu2);
>> +	}
>> +}
>> +
>> +int main(int argc, char *argv[])
>> +{
>> +	device_bdf = vfio_selftests_get_bdf(&argc, argv);
>> +
>> +	return test_harness_run(argc, argv);
>> +}
>> --
>> 2.56.0.rc1.315.gc6ed9934b7-goog
>>

