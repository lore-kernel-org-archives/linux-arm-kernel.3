Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BFC60A5BEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3FgC9ak+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MURkbgD0;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=BDigdHUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sZzW7JYVrmh754uY37zU3QW1aKqFPt/3sf0AcxHaA8U=; b=3FgC9ak+dNSyv1
	O03QecK1BTY6pn7bAbYgj4tw4X0+TZgh6xDyTq47dFrrKXUQFsGCal/gSDOKx4hRNYqbVUYr5a5rK
	Y+O+XwGKXnXgpYXGVKdSxUFL05Dnj/xgz/OLLkS8pIGklfxBjt3wfMuNN0D7TIDyrgzcMuCGCnwfc
	R+uXPnxT7eXJQNtbVUDumx0yiRDj6/hRhJno/I0gNcUa0tLCrvDU3HrBV3id4K85j+m5fU43irbNQ
	o4uupdlsq/N5c5TAkoRaD22YfG/gJ6nJZcNxxCdMvgeqKGVnlklG4X+4AbEzOPU8mrSDYkcCV43eU
	q4XnTEwQtqBMYLBcbbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP15x-00000009rUS-03JU;
	Thu, 05 Nov 2026 17:17:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP153-00000009qoH-0ZTS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sZzW7JYVrmh754uY37zU3QW1aKqFPt/3sf0AcxHaA8U=; b=MURkbgD0Zu5raMDVJ66Dt1DjZg
	ppYSS/x3uleG4hTSHd8/ZJTVUojkmoDHrhytbCUm21ADU+uFDAs+9GWgfIOWuZv0exBqXS1lH7DbM
	SzUrf5n+v5qKI0kL0fqf9NaitaU0VwwS4yO/D962+xWclOjELE8uGobB9d+elIaWsX26pusQG5kGx
	t4cxoLo0VwVyXA7fjcqyU7d23iV+whE6DpoB74/wIEWMjwCRi3rLisb91BoQC3NaksHtPY5OkQ/Jt
	PhCedJ0SqMlIGSzDhBBSxxRnbGkRAXg23n4t5nRmG/4Ihammz7i5qKK4JDmKETxOYAw0xB9kAVGSK
	aep7w86g==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP150-00000003KXB-1pUU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:52 +0000
Received: from localhost (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id DC88420B7166;
	Thu,  5 Nov 2026 09:16:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC88420B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793898990;
	bh=sZzW7JYVrmh754uY37zU3QW1aKqFPt/3sf0AcxHaA8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BDigdHUcFCn/BGRR+msSMNpyCmQhCddheyhTHa7wwd9XqbOQJv7c+S9FDhQb3VNVZ
	 RLnMGIyNgvt+VCa/EaPADFS35i/IrjwJEXySHjy9vWowetESB57/SzTQSzchZl/PMv
	 YUtjHkuVWQPmp+6/ZuXR4XHcImqNujF+A/aE2m08=
Date: Thu, 5 Nov 2026 09:16:22 -0800
From: Jacob Pan <jacob.pan@linux.microsoft.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 iommu@lists.linux.dev, Alex Williamson <alex@shazbot.org>, Alexey
 Kardashevskiy <aik@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan
 Cameron <jic23@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin
 Tian <kevin.tian@intel.com>, Krishna Reddy <vdumpa@nvidia.com>, Lukas
 Wunner <lukas@wunner.de>, Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Ortiz <sameo@rivosinc.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Steven Price
 <steven.price@arm.com>, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thierry Reding <thierry.reding@kernel.org>, Vasant Hegde
 <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, Xu Yilun
 <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-tegra@vger.kernel.org, jacob.pan@linux.microsoft.com
Subject: Re: [PATCH v8 12/15] iommufd/viommu: Allow PCI TSM backends to
 provide vIOMMU operations
Message-ID: <20261105091622.00004a9c@linux.microsoft.com>
In-Reply-To: <20261105004934.GE3889730@ziepe.ca>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
	<20261104161632.3547423-13-aneesh.kumar@kernel.org>
	<20261104152351.00002565@linux.microsoft.com>
	<20261105004934.GE3889730@ziepe.ca>
Organization: LSG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171650_558501_86AF3BE2 
X-CRM114-Status: GOOD (  22.10  )
X-Spam-Score: -0.2 (/)
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

Hi Jason,

On Wed, 4 Nov 2026 20:49:34 -0400
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, Nov 04, 2026 at 03:23:51PM -0800, Jacob Pan wrote:
> 
> > I am thinking MSHV/pKVM can register an assignment-only tsm_dev to
> > leverage this? Could PCI/TSM support this role without
> > device-security?  
> 
> It is certainly not what TSM was originally imagined for, but with our
> new arrangement, yah maybe so?
I will rebase on this set and send out patches for a detailed review.

> TSM basically just becomes this weird overlay driver on the PCI device
> that does stuff. Some of the stuff it might do:
>  - Register an attestation subsystem device to do SPDM
>  - Register to allow iommufd to create a viommu
>  - Some status sysfs ?
>  - ??
> 
So we may expand pci tsm to have more than one role? currently it has
one.
int pci_tsm_register(struct tsm_dev *tsm_dev) {
...
	roles = is_link_tsm(tsm_dev) + is_devsec_tsm(tsm_dev) +
		is_assignment_tsm(tsm_dev);
	if (roles != 1)
		return -EINVAL;
> It all seems separable and composable to me, so if you don't want to
> launch an attestation subsystem device because there is no SPDM then I
> think that might be OK?
> 
> Another option would be to somehow obtain the viommu from the kvm file
> descriptor and rely on the fd to handle the module pinning/etc. I
> don't know how to do that nicely with the way the modules work
> though..
I did this in mshv-iommufd RFC to associate hypervisor FD file to
viommu.
VMM:
	struct iommu_viommu_hypervisor hypervisor = {
		.vm_fd = vm_fd,
	};
	struct iommu_viommu_alloc alloc = {
		.size = sizeof(alloc),
		.type = IOMMU_VIOMMU_TYPE_HYPERVISOR,
		.dev_id = dev_id,
		.data_len = sizeof(hypervisor),
		.data_uptr = (uintptr_t)&hypervisor,
	};
	rc = do_ioctl(iommufd, IOMMU_VIOMMU_ALLOC, &alloc,
		      "IOMMU_VIOMMU_ALLOC");

Since mshv creates partition file with anon_inode_getfile() which does a
try_module_get(fops->owner), then in mshv_viommu_init, it does
fget(hypervisor.vm_fd) which will indirectly keep the module pinned.

I guess we have to enforce this pattern to make it universally viable?

Thanks,

Jacob

