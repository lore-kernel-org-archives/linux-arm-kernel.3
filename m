Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CB8C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAdFq/HquCPEOwe3O39yGHp6X7TbyFjfrWxFg5C9wy0=; b=MaVxgc2enSG0+3BgNho4xf9Wak
	WomeOoS0CtvR8fhcUgDH4pTqaJWNT8rV0jtK53xG1c4q25ZLAPVoQviIxk9PlG8DokDYGZ79Nvwxh
	Ngpj+86/ZDoaVbBmq2M7pm1t1eggK5AKfPIjKsHer+E2xiIVZQRFZbYQZRwC8a9wuC6O/5WBmcc9y
	3bnJ8NvObeSYN8JcHaNs9TpHmB6JIVrKLPKbCiCPzT6Maj44Kcn6eC60ozMUr7kZ5TJpmic1xYvMS
	FKZWEWR74i56A59b6JQ4TyriSAUW+E/ARXa3zvhOMQsfWe0twel7tLFCB5NwibTDlpl7pN31chG8J
	EXGZxNgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWo-000000088TL-2RA8;
	Wed, 23 Sep 2026 11:52:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LWl-000000088Rn-1iKp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:52:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso40265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 04:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790164361; x=1790769161; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fAdFq/HquCPEOwe3O39yGHp6X7TbyFjfrWxFg5C9wy0=;
        b=s+5VFh38Ssg1yQYPpK3xG9MslV1+zFp/eCVQtPI1acRWhvcl/dStzY14KIoTmKElm8
         LSnJ+F3zzCQ9o2/XZ5MsVqTBFzTnlM3mXTQFTXIsyJwcV4VjmFB5V3f0sXII5fY9OBkg
         gv5mouj+cWslYlLsKl9w3pDPoOcqNXRU1KpKyGYky1eYp73eszs7dybThzIAPI3Ekn0H
         L2cb7JRwalo6eMJkaJD+lieeoen6L22pKqG8JlaJ12rDvmE0XrQI88CmsODOGzP/iZp/
         fKr1ZVhbaSc4kbV++HVZv2EyUkia0JTcvjuYHThyuRFmx4TFPUJx3vcYG3wMtlCd5bVh
         z+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164361; x=1790769161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAdFq/HquCPEOwe3O39yGHp6X7TbyFjfrWxFg5C9wy0=;
        b=HHTnixodKmbTF3WKFsKFKcbByAR1MWx69SlFdKAExJXdRB7IryhPy3n4658+IwZMn6
         cDd0Fc7dU6EAb5gwkRCXFPAwxNTwnKserXzaG/YVAx2ewJI3zzmF77i+uaI+zmK1Uvgc
         TSH/vvKETWETVNG+mRJr1CJhQEu1ZIW7kKqA6v7DUsaAQ0x2EGcgIzCKVfKCM263apjY
         FRSagmmQNPuCEIEehIQvPWxd8IlGyPa/hxGfOyeBnO4HoVWgHOvTTTFJY5unfdiA/zJs
         DesxCdp6riAoEtdA9yjcYN4GyS02btiNQSbag8wF9TcO9P1VE1rysssxXGotvmqW0L5G
         d12g==
X-Gm-Message-State: AFuF++nEZ++VV8eeyQTrYA7+tfMVP6H562WOwZe/xTSR8Q27z5mElxVk
	BEOsmkBasUmP3j1QYN/tnWCcjbElLlgGR5U3XkTr0CIqvYfPavNEbpAD4PeSl6nMAQ==
X-Gm-Gg: AYBFou2Qzh1vXbYrw+SDSNuTdE5geRGIXcgfqd31GZFGZuovb/rE19I9ICsyCIqfz/w
	OGNQV+InlAFXvwMsh8FCH46Kfo5YAwNwJ2uoeCTiUI9eZHl20egAnGwQFzjn6H+p9IFBMpm+qVa
	TMcGxWvvEIy/KHZm9AvNEmTOZhe701U0e//P6pCbNr7o6eYgimd+9f3yl7gPcgkPsfdDb+ea4u4
	1i37Mo3S3FnUs7m2ltx4HsHIvnvyg2bSpzRv9iPQD37/pyQSJGiHYlDAuPFxEid6vdjlXJrCEp2
	tpLL3+7nxmWQ+zCZu6g3BqiDrKMq6lLN+10nyClaJOozVArESStiNF29noyso5jFSragamHNAwN
	q/VLN85W1ZkoRzdH8s22vt1lHxKgDSLEL+POHvcT7zfx1w4qvsHPtIP5+gS5m9wnVOTV5RdzZIw
	zLqeLLXqVGyqo2JOSmlMoFYBSyJvob35+yKdgyyUOltXj3/xaWwpr6wr8r9lPU1gc1BZ/CRuvhI
	Jy3ANwkkP1UHZoVZahMRY7JMC8NXIMj3gh1PKOaFS3mzQfz6y4=
X-Received: by 2002:a05:600c:17ca:b0:49f:e12d:1a60 with SMTP id 5b1f17b1804b1-49fe12d2109mr449435e9.4.1790164360990;
        Wed, 23 Sep 2026 04:52:40 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm6433690f8f.2.2026.09.23.04.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:52:40 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:52:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <arO9hGmEx7c9mZAj@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-12-smostafa@google.com>
 <arMbxX+sqTS3gByB@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arMbxX+sqTS3gByB@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_045243_500562_84D078FE 
X-CRM114-Status: GOOD (  67.77  )
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

On Tue, Sep 22, 2026 at 05:22:29PM -0700, Nicolin Chen wrote:
> On Tue, Sep 22, 2026 at 01:12:44PM +0000, Mostafa Saleh wrote:
> > When KVM runs in protected mode, and CONFIG_ARM_SMMU_V3_PKVM
> > is enabled, it will manage the SMMUv3 HW using trap and emulate
> > and present emulated SMMUs to the host kernel.
> > 
> > In that case, those SMMUs will be on the aux bus, so make it
> > possible to the driver to probe those devices.
> > 
> > Otherwise, everything else is the same, as the KVM emulation
> > complies with the architecture,so the driver doesn't need
> 
> Missing space before "so".

Will do.

> 
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
> > @@ -0,0 +1,187 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * pKVM host driver for the Arm SMMUv3
> 
> I am a bit confused by pkvm/arm-smmu-v3.c and arm-smmu-v3-kvm.c
> 
> It would be nicer to have a design doc or diagram here and the
> other place to show their relationships (with host and KVM too).

I can add more info in the cover letter about the code split. Mainly:
- arm-smmu-v3-kvm.c: Is the kernel driver for KVM SMMUv3 (this runs in
  EL1 and can use all the kernel functions).
  The main job of this driver is for discovery, it doesn't do anything
  else in the runtime.

- pkvm/arm-smmu-v3.c: Is the hypervisor driver (this runs in EL2), this
  is the driver that does the trap and emulate and is considered
  trusted. It can not access the kernel functions (all the code split
  is added for this file)

- After arm-smmu-v3-kvm.c creates the AUX devices, the upstream kernel
  driver (arm-smmu-v3.c) runs normally and the emulation code in
  pkvm/arm-smmu-v3.c should be transparent.


> 
> Naming-wise, could it be arm-smmu-v3-pkvm? I also wonder if we
> could move it into the pkvm folder:
>   pkvm/arm-smmu-v3-hyp.c
>   pkvm/arm-smmu-v3.c
> 

Anything under pkvm/ runs in EL2, so arm-smmu-v3-kvm.c should stay
outside. I am happy renaming both files (arm-smmu-v3-hyp.c,
arm-smmu-v3-pkvm works)

> > + *
> > + * Copyright (C) 2022 Linaro Ltd.
> > + */
> > +#include <asm/kvm_mmu.h>
> > +#include <asm/kvm_pkvm.h>
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "arm-smmu-v3.h"
> > +#include "pkvm/arm-smmu-v3-hyp.h"
> > +
> > +extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
> > +
> > +static size_t				kvm_arm_smmu_count;
> > +static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
> > +static size_t				kvm_arm_smmu_cur;
> 
> That spaces/tabs in those two lines look a bit odd..
> 

These are tabs to indent the variables, similar cases exist in the
SMMUv3 driver, check arm_smmu_cmdq and friends for example.

> > +static unsigned int smmu_hyp_pgt_pages(void)
> > +{
> > +	struct device_node *np = of_find_compatible_node(NULL, NULL, "arm,smmu-v3");
> > +
> > +	/*
> > +	 * SMMUv3 uses the same format as the CPU stage-2 and hence have the same memory
> > +	 * requirements, we add extra 500 pages for L2 STEs.
> > +	 * Only one set of memory is allocated as the page table is shared between all
> > +	 * the SMMUs.
> 
> Mind briefly elaborate the 500 pages in this notes? Why pick 500?
> 
> Also, there is no hard requirement, but the main driver still wraps
> inline comments at 80 cols. So, it would be nicer for this driver to
> follow that.
> 

TBH, this is a bit of a hack. The hypervisor can not allocate memory
at the runtime. All of the hypervisor memory comes from a carveout
allocated at boot (see kvm_hyp_reserve())

So we allocate the worst case for memory mapping with leaf granule. But
the hypervisor also need to allocate L2 pointers and the SID space can
be massive making the upper limit for this too large.

However, smmu_hyp_pgt_pages() defines the minimum pages required,
actual allocation comes from the command line, so it is possible to
tune the system without re-compiling the kernel.

Thinking about it now, we can just drop the 500 as this is the lower
bound, earlier versions of this series would allocate the carveout
based on this size, but it is not needed anymore.

> > +	 */
> > +	if (np) {
> > +		of_node_put(np);
> > +		return host_s2_pgtable_pages() + 500;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver smmuv3_nesting_driver;
> > +static int smmuv3_nesting_probe(struct platform_device *pdev)
> > +{
> > +	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +
> > +	/* Only device tree, ACPI not supported. */
> > +	if (!dev->of_node)
> > +		return -EINVAL;
> 
> Sashiko reported a critical finding, which sounds plausible to me:
> "
> Can an adversary bypass pKVM stage-2 memory protections here?
> If an SMMU fails to bind to the hypervisor due to early returns in this
> probe function (like missing a device tree node or hitting the cavium
> erratum below), it is excluded from kvm_arm_smmu_array and the hypervisor
> does not trap its MMIO.
> When the native host arm_smmu_driver registers at device_initcall, it can
> successfully bind to this unbound SMMU. Does this allow an adversary host
> kernel at EL1 to natively program this untrapped SMMU to perform arbitrary
> DMA into hypervisor or guest memory?
> "
> 
> Would you please justify?

Yes, Sashiko replied to this mail with it and I replied:
https://lore.kernel.org/all/20260922132814.D398D1F000FF@smtp.kernel.org/

Basically, yes that is possible. Some SMMUs might not be in the device
tree or might not be compatiable or the system might have an SMMUv2 or
a completely different arch or no IOMMU at all.

pKVM can not defend against bad FW or missing HW, and if something i
missing there is nothing to do about (and it won't even know)

There are some extra notes in the last patch that includes the
documentation I can add more.

But this is also similar to how pKVM monitors SMC (TZ channels), by
inspecting FFA traffic, if some system decided that TZ will accept
other side channels for sharing physical addresses, pKVM can not do
anything about it and the system is not secure by design.

> 
> > +	if (kvm_arm_smmu_cur >= kvm_arm_smmu_count)
> > +		return -ENOSPC;
> 
> Both counts and probe() are coming from Device Tree. So, it doesn't
> seem possible unless a kernel bug. Should it WARN_ON?

I will add a WARN_OON()

> 
> > +	smmu->mmio_addr = res->start;
> > +	smmu->mmio_size = resource_size(res);
> > +	if (smmu->mmio_size < SZ_128K) {
> > +		dev_err(dev, "MMIO region too small(%pr)\n", res);
> > +		return -EINVAL;
> > +	}
> 
> Should it reject !PAGE_ALIGNED(addr|size) like the other driver?
> 

That check is in the hypervisor part but can be added here instead to
save a trip. Although that should never happen.

> > +static int __init kvm_arm_smmu_v3_register(void)
> > +{
> [...]
> > +out_err:
> > +	kvm_arm_smmu_count = 0;
> > +	kvm_arm_smmu_array = NULL;
> > +	return ret;
> > +};
> 
> No ';' after '}'.

Oops, will fix it.

> 
> > +static int kvm_arm_smmu_v3_post_init(void)
> 
> __init?
> 

That should be possible, I will add it.

> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -5203,6 +5204,72 @@ static struct platform_driver arm_smmu_driver = {
> >  module_driver(arm_smmu_driver, platform_driver_register,
> >  	      arm_smmu_driver_unregister);
> >  
> > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > +/*
> > + * Now we have 2 devices, the aux device bound to this driver, and pdev
> > + * which is the physical platform device bound to the KVM driver but not used.
> > + * However, this driver keeps using the platform device for 2 reasons:
> > + * 1) Simplicity: Avoiding changing big parts of the code assuming
> > + *    the underlying device is a platform device.
> > + * 2) Dealing with DMA-API, irqs(MSIs), RPM... requires the physical device.
> > + *
> > + * That means arm_smmu_device_probe() allocates its devm resources on the
> > + * platform device, where they are not freed when the aux device unbinds.
> > + * The devres group bounds them to the lifetime of this binding instead.
> 
> There is an "unbinds", so I assume it should be:
> 
> s/bounds/binds
> 
> ?

I think "is bound", I am not sure if bounds/unbounds is correct.

Thanks,
Mostafa

> 
> Nicolin

