Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19335CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGlc5+H8uZnXaj+hM0UqmmqdaPGOtWEZtMmJdfupvbM=; b=dTcCodM1+NI2oL4TKf8PSLqF53
	b6NfJZXKk3UwpYC8v+xvdNZPsl9LphBplxjBpPQy5bisa21lpWJ1MFBCDX+DLmgaYgr0crpx4H0b6
	fumoivUvVVuqNE8glqbthR1IPfbkh91Oj96/VFLh1sis/SBgrCP8ft0Br1MuDB8yPNWEuXs/AOqQv
	oBruTagMtoLj3igk2z+DT1xukj1/XxNr0Lh7JylcCRgLrNhqLIgi7dDePIU/Y5vBga+J8lY7LZ5AT
	sIkjH+UXIP6zHiO/Tq0Ox+3qiMHB3Ih3YcPc3Ipn8d1KmdQxiAVClAXdUvdilWmalFRiPymb6Zza4
	+CjD/Wag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVHM-00000005Ggj-0dfj;
	Thu, 28 May 2026 07:35:44 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVHK-00000005Gfx-0UmH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:35:43 +0000
Received: from 8bytes.org (p200300f6af4fc5001a5b4667a2accba1.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:1a5b:4667:a2ac:cba1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7F4DD1C5BA7;
	Thu, 28 May 2026 09:35:40 +0200 (CEST)
Date: Thu, 28 May 2026 09:35:39 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, 
	bhelgaas@google.com, praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com, 
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, dan.j.williams@intel.com, 
	jonathan.cameron@huawei.com, vsethi@nvidia.com, linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 0/3] Allow ATS to be always on for certain ATS-capable
 devices
Message-ID: <ahfwOTzAWdZ7v-Ai@8bytes.org>
References: <cover.1779392420.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1779392420.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_003542_301819_C236167D 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Thu, May 21, 2026 at 01:34:19PM -0700, Nicolin Chen wrote:
> Nicolin Chen (3):
>   PCI: Add pci_ats_required() for CXL.cache capable devices
>   PCI: Allow ATS to be always on for pre-CXL devices
>   iommu/arm-smmu-v3: Allow ATS to be always on
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 +
>  drivers/pci/pci.h                           |  9 +++
>  include/linux/pci-ats.h                     |  3 +
>  include/uapi/linux/pci_regs.h               |  1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 ++++++++++++++++++---
>  drivers/pci/ats.c                           | 47 ++++++++++++
>  drivers/pci/quirks.c                        | 42 +++++++++++
>  7 files changed, 175 insertions(+), 9 deletions(-)

Applied, thanks.

