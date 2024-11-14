Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E0D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZrqoNR06/CL9cr4an/fqubFTdKIUH32d5EHZzbPv8I=; b=foqQRcyqPOhGzZJJq4EkgX5pX+
	WxntlPV6tOq4a/dmEk1TTa5sDhGFS0bUagJ5yzy+hUqMzjOjad87qXPTrsI/ZgkDnaRSCWgnb08mY
	IDNwXRd62f5GlRmdC076qot5jafKDqHSWHaF3c6Ye0waNtWO/N+RaAnDHbxoaBHExegpJyBif/6pj
	Ogr11kckEheuNDXnLD23P/a4MRHEVdV0utxSJ+WhCsXjaZDmEFPSL/FkzaOkVVwm32Yb/PhvY65FC
	Er2DgbtuAp/DQJ9B6io8A8lDaNnjEb6ZwegqsL87rZZ//zbZhexCk0I1zgXGDr3NaOQzgB+oy0oY4
	YNXucC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdUv-00000000IM8-3si7;
	Thu, 14 Nov 2024 17:19:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBdTz-00000000IBL-1ZFY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 17:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B0905C5F31;
	Thu, 14 Nov 2024 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B69DC4CECD;
	Thu, 14 Nov 2024 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731604694;
	bh=LEScVdE1MmRWG9RlagdTE4dJgZgN9CYYoi/c43WPRXw=;
	h=Date:From:To:Cc:Subject:From;
	b=iu/9dD9T8apb8rpUwdvWz0nd1RHmoZ70W8mu51pn7loG9dSffXjV54idqmmpXU/Mw
	 b3fzN2suCvLwEHauAKWP80nPgAlHWcY2Dd0lZZbZ/om5M8inY+pOG++/Ul7hcs7fuL
	 L7guv/mr24X4Ke4RMEJ7+FDtxmzKBLJvxLazjedjeeXLdNuWiSFEDo90oxhkqqGeFr
	 sPAFoOJe25aTnGvls8TM1JiMb5B/9MVEwiaOWimsmVEV5sx0uuasTlw2TGEfnYO+N7
	 q69g/qxzRbpb1S2MRkCD5fnYYPJy8hpMU2ToMuZSTxXD8w8q0CcLHSV+QNT2PlpkLN
	 hKKvxEq+SPiNQ==
Date: Thu, 14 Nov 2024 17:18:09 +0000
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com,
	kernel-team@android.com
Subject: [GIT PULL] iommu/arm-smmu: Updates for 6.13
Message-ID: <20241114171808.GA24017@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_091815_451679_133AB3A0 
X-CRM114-Status: GOOD (  11.11  )
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

Hi Joerg,

Please pull these Arm SMMU updates for 6.13.

The summary is in the tag, but the highlight is definitely the removal
of the complicated block-splitting code from the Arm page-table
implementations. It even means that we have a negative diffstat!

As with 6.12, I've already pushed this lot to the arm/smmu branch in
the iommu tree. Please can you merge that into 'next'?

Cheers,

Will

--->8

The following changes since commit 8e929cb546ee42c9a61d24fae60605e9e3192354:

  Linux 6.12-rc3 (2024-10-13 14:33:32 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates

for you to fetch changes up to a3799717b881aa0f4e722afb70e7b8ba84ae4f36:

  iommu/tegra241-cmdqv: Fix alignment failure at max_n_shift (2024-11-12 15:09:42 +0000)

----------------------------------------------------------------
Arm SMMU updates for 6.13

- SMMUv2:
  * Return -EPROBE_DEFER for client devices probing before their SMMU.
  * Devicetree binding updates for Qualcomm MMU-500 implementations.

- SMMUv3:
  * Minor fixes and cleanup for NVIDIA's virtual command queue driver.

- IO-PGTable:
  * Fix indexing of concatenated PGDs and extend selftest coverage.
  * Remove unused block-splitting support.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      dt-bindings: iommu: arm,smmu: Add Qualcomm SAR2130P compatible

Jason Gunthorpe (3):
      iommu/io-pgtable-arm: Remove split on unmap behavior
      iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
      iommu: Add a kdoc to iommu_unmap()

Mostafa Saleh (2):
      iommu/io-pgtable-arm: Fix stage-2 map/unmap for concatenated tables
      iommu/io-pgtable-arm: Add self test for the last page in the IAS

Nicolin Chen (2):
      iommu/tegra241-cmdqv: Staticize cmdqv_debugfs_dir
      iommu/tegra241-cmdqv: Fix alignment failure at max_n_shift

Pratyush Brahma (1):
      iommu/arm-smmu: Defer probe of clients after smmu device bound

Qingqing Zhou (1):
      dt-bindings: arm-smmu: document QCS615 APPS SMMU

Will Deacon (2):
      iommu/tegra241-cmdqv: Fix unused variable warning
      Merge branch 'for-joerg/arm-smmu/bindings' into arm/smmu

 .../devicetree/bindings/iommu/arm,smmu.yaml        |   5 +
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c     |   7 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c              |  11 ++
 drivers/iommu/io-pgtable-arm-v7s.c                 | 149 +--------------------
 drivers/iommu/io-pgtable-arm.c                     | 114 +++++-----------
 drivers/iommu/iommu.c                              |  14 ++
 6 files changed, 74 insertions(+), 226 deletions(-)

