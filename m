Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04684C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhPSIXHdToiGcaqd79fdmw3XU7GLfIRh50kF9qU1jso=; b=gwn2R4uGnxUyxBLKJysreulHUr
	F+dQ9Ab52ye4ffEbH3yNVa7fj8Yh9CUOc8qKQlby4F0aa/FGnsFB1x1sichL4ZC4RJu16tFxxGO7h
	8aaq0MkVtIspH4vraj83uZXW5dvOxjkrsnfTOe5eiCyAEdW5yC3V+vSO+RKxh//6aUKduQvOmX3ih
	TFRkHjCkGBozf9sy8PydxbPNg3exFC/HiQ24wYePtQlJrrtPFjZYQbzFBVeMpTbrEXXY6mofBhaRm
	sd5BDcsAFxD2h8jKXWyCq21g7ZDNIAHJ3M1h5fJlVnv1vX/CIoNw4mrJoi0iqHIyJ0b95v41Cej+W
	NlIV8vAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1juy-0000000EdbM-16hF;
	Wed, 02 Sep 2026 12:18:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jux-0000000EdbA-2ozk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:18:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0B2A600D9;
	Wed,  2 Sep 2026 12:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591FB1F000E9;
	Wed,  2 Sep 2026 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788351494;
	bh=YhPSIXHdToiGcaqd79fdmw3XU7GLfIRh50kF9qU1jso=;
	h=From:To:Cc:Subject:Date;
	b=Q1ghggeiKqvI9NApI9GNsQFSKe1CI1FmKgSIKkolKnCvtp5+o7lXNGMxBPyWvuI23
	 3D63PZCabagZRyTWYW574OhVJW5P0HEPxKuJW//6Pf0KpPyrieENeSLD+DN+58eJHm
	 7bKt6sc8z8aVDU05mlxY5G86uYBM3yyie7byUHDI9FNEJWP4iQiP2EizaTJ+jYUf3K
	 aaiYNp1x3eyeBq105F3EBffZ0xF4VHA/Oz5RNwAbWstaYoVgoLKdiHDhP3/l857CFY
	 vEO/41LfwQtV9zg2pa1yU9xFhGtbgmKoAWCBOt01YrBJAvPumgNrK7x/fbf6vOFXcB
	 FDz+9sPn3inww==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 8A52B1980047;
	Wed,  2 Sep 2026 08:18:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 02 Sep 2026 08:18:12 -0400
X-ME-Sender: <xms:ARSYaiWBKoWrKeZFf-PSFHd57k_mCh3jyrl-I7FRVrO7atAw5Rkacw>
    <xme:ARSYaliYHxySxbd2Ifnm7q2ntVpCFKuUL32v_RaVznfT0IvP_RA4t8XrTnUQaxW0V
    VER6VH3eNUIZ5iqlG7Xj3MhnDWT5Yhxa-CO8sWLEw-sH1B7lextP1Q1>
X-ME-Received: <xmr:ARSYarc_Ys8Dixp7XFnIhB2qCDRA-zErOop1h6Mz8jYYd5l5YIK-1U7epoI>
X-ME-Proxy-Cause: dmFkZTFxcxWBUMmCGUYTzHIBFXChJL048yU1tUCJoUmE055C1DdrJJMKYdvMxSf8ayH7Oc
    WW99ucrNMnMi72vDOcOYanv1/fCOMldtkrN+Nq9epu/39Bs4Z7ovcMCCC5o1Mkvg68ueYu
    Gv4V97g/rvY2ll3V8dMTPAiXaZ17SKE6JVLkqIRrVw9QkMnnw84ktuMpGsQ71VAtkeSdKx
    cs3VUx7NI/0LSdHtPryG8sWhkT5L3NUF1B1iUxGHiy48on7QctR9fZ3yF7JGxYTSgCNs42
    60hHQ8L03nbINRMwYss+QHjZR1hdcKgX/73T0stkq4GpB71mFHJl8+BoWFu3zosA8PkpMi
    CUdoUtbPaVqIz9mjHDjDpYQhJaOVyv3HAsW970BOSljTDTlixU7+NdcXzlFF+ThfegapWr
    r4xIt8x25tAYpDVomeJNgkUUOdcyjOlu1jhC/UtPRJYT/1WvQFL76l8NpvRmB4K1lTDSqL
    7cNiP3ZyKqYEVI/kkpy2CFSbLXNJM7n4dQb6EWwWqq+JG4cI3pmuIK7R+zqvXlLhz6dE59
    evWHprf4PWKmpARnGR97qfr4N7w8KVAoYVpAKCDPwCCR/gIxtDaCWb4yHMqviVe4i5Jpa7
    h2tXcuKhcJ5HzR2oYgVaYbhG5eDIVfekE44IFcLBooYYPkSJePSpo8zVEsXA
X-ME-Proxy: <xmx:AhSYagfDfSUc66x6h2oPERZxttSZ_hdr2o00tR5sBUaMoWADzYyR2Q>
    <xmx:AhSYanVIl-qoAaNOi1UVRy1CHU6Bqar3jkOdLECXumHP3AcyXDpQ9g>
    <xmx:AhSYakfPMIzb9BCoifNYOaP9coHX1s5SFO8-UW2u3nVZBWWm2R8W4A>
    <xmx:AhSYar9TwmVgcUEYRD0LlZto_xA3-tQMI88pKIz4Q_cvKki7SbvdIA>
    <xmx:AhSYajmREp2ekNjshg3WYPuG0GZpHck0pnHNzq3edDWYNdTPAOM_Bmex>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 08:18:09 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Breno Leitao <leitao@debian.org>,
	Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: [PATCH v4 0/2] iommu/arm-smmu-v3: Make the queue depths tunable, and shrink them in a kdump kernel
Date: Wed,  2 Sep 2026 13:17:22 +0100
Message-ID: <20260902121724.3494954-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The queues are sized from the IDR1 maxima and allocated at probe, costing
megabytes per queue per SMMU instance. A kdump capture kernel pays that out
of a small crashkernel reservation, for queues it barely uses and two of
which it switches off anyway.

v3 clamped every queue to a page under is_kdump_kernel(). Review wanted a
general mechanism instead, so patch 1 adds a cmdq_entries module parameter
at the max_n_shift initialisation in arm_smmu_device_hw_probe() (Robin),
command queue only (Will), floored at one page (Jason). Patch 2 then has a
kdump kernel default all three depths to one page through the same helper,
with no command line needed (Jason). An explicit cmdq_entries still wins.

The v3 Reviewed-by from Breno, Pranjal, Jason and Nicolin, and Nicolin's
Tested-by, are dropped: this is not the patch they were given to.

Measured per instance under QEMU on -M virt,iommu=smmuv3, through a real
panic and kexec into a capture kernel:

                        4K page          64K page
      cmdq         1 MB -> 4 KB      8 MB -> 64 KB
      evtq         1 MB -> 4 KB     16 MB -> 64 KB

Every clamped queue lands on exactly one page. cmdq_entries moves the
command queue alone and beats the kdump default; the capture kernel
attached four devices with no CMD_SYNC timeout, GERROR or context fault, so
batching survives the floor. QEMU exposes no PRI queue, which takes the
same path. Also build-tested across 4K/16K/64K, TEGRA241_CMDQV=n,
CRASH_DUMP=n and =m, every commit warning-free.

The kdump stream table adoption series drops the event and PRI allocations
outright as of its v10. This sits on the same base, applies on top with no
conflict, and sizes the command queue that series leaves alone.

v3: https://lore.kernel.org/all/20260706084708.8072-1-kas@kernel.org/

Kiryl Shutsemau (Meta) (2):
  iommu/arm-smmu-v3: Add a cmdq_entries module parameter
  iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 61 +++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  5 +-
 3 files changed, 59 insertions(+), 8 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0


