Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26F8C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1mH6YXkKjYveaMEEmKxLa8h3j6vD8suFECLiBU+ZF8=; b=GXesipa7N87bySgayRn9exlNgb
	07qq56lZrbz1tTlZM+H0++dmsq7aWc4oUetWY18Fk+slDoajlqktCzOawqvJTOt+s5UGDhYRd4D9g
	ZokStYuU8vMchaH95drMCAo0DLI0vYr1soXAe3iBP4Mx8jV3byvg+Tb49M/1hy9Lg8mqFHOyKFS2D
	ghtC4eyH/qLWKKmg7XdWAXrgs2W1OsePTw6rgSa1291/cPRtThhFdLsSbGEg8jS/d7yAsU2TnnVDK
	uztHc1Xm2OtgfnX+NlPDwr+ImraA29nuDiA6x1sL6rASyf8ijRGgTNtLsvdOMLRrAngzBpGOEyFuQ
	nRo6FzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eys-0000000BLrv-3pv4;
	Wed, 09 Sep 2026 09:52:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Eyq-0000000BLrg-1KLZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:52:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7897760207;
	Wed,  9 Sep 2026 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CE541F00A3E;
	Wed,  9 Sep 2026 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947555;
	bh=A1mH6YXkKjYveaMEEmKxLa8h3j6vD8suFECLiBU+ZF8=;
	h=From:To:Cc:Subject:Date;
	b=EBv3HfYqinuqKoW5fn1TxTz4ApjsNiRStVFwX3lcFVJMpxaRcSERfMH5Qnj/3eIgj
	 Tl4WtM1ZAUbbgW4znyiugv6zJvlP0PtKiQzT/dYmBhf4qGg8vNDnyiq3n9LfwO6EgV
	 QaZqG6mBVr6DQCgefS+dJ98MLveQvBwYyTB2GZKw8HKrK2DjMdnTZvq6KyECkU1ILF
	 0BX3fAtRjg2kk/aOL9U67awk4PU0xlNNrVm0dXwiz5+frLQbokFBOhYLFpk86TkYPw
	 7B5yfEEkN00U1kNRdNwYmHpN6v20tiQa8gzeNMYUNYPObbhBVdoEO6rBxEZUmjOwCA
	 9Gk4rN0Zc4Rog==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4F86F1980050;
	Wed,  9 Sep 2026 05:52:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 09 Sep 2026 05:52:32 -0400
X-ME-Sender: <xms:XiyhastfpMYf09d1ttYArPCf7TJBaJTfLsoEyodPKoLrS6KorUpcfA>
    <xme:XiyhagaJFLDFQglul_8JnD0j5JfMtpnMX5kaOgmY1vz6qiGk7GC2FCTBdtV5fh3m-
    n0Y4aOn2BlD1NkbZ9hluORZSO49RKDdtOWLYogaPOFGv07qTiyos_XD>
X-ME-Received: <xmr:Xiyhas0NUaO0EI_z-v8rH5KEZANLC4mn0RkTj8msTBYbpoxcqGG1S2MvpcA>
X-ME-Proxy-Cause: dmFkZTFdXEAt8Xoifn3HkMvmPrf3pdMTyQIQP6Aj3OujnVUZN6058eZl0xTCRZuAYJ+0HC
    8qc4gz01mjgRj+9r0kfXnzkY1H+KSr3uvCg/aQhbrf2lEreUjRytWz8OvpgHDh1c1a/rwH
    KO5/1ykH2rj8erZ+bSyokXSFrp8mX0/cyxOcNFl8y96joF53k5aRibyS/SShSTu6chBfYJ
    741Ug35JL3m8/wMe3559u2iJNdscI97Ja4MxvUprYMMMEOZ48IQH7BY8BVxwNDzJy8V0C2
    0deKwBYVFl0QBnpADvehmKoeLOgkYECDl8/Ukd5upAlpXGD851ILq+CLZ1ZzJg8SPyD3l5
    EMOg3u7PNME81Ch4t4yaBJHfb4jUZMvWKM6lOtY80loYkRwUAMWiICXCkUBrgNog1fi4ja
    063KZhqOn59ljj65C6vQ7nk/qpSbw+ahWlhYL6QkOP22NkX+6V5LrwCg6epGo8rxeMVKz7
    uuQSKzb8vpX0Ay0nKOT1vvUzzNOeXc0CYQ+f0ZkHaj/FDcWEERf/q27ganz5MBC/6SaP9+
    t9OApQn23jNdRDHbAZZm+3b7mrfJnKyamCQBS8IZPnnMwnKYHEJGVd+wkyak41iz6adQhV
    3hd5uCAH25srvblyvSv41IlZNyJM2UTR965FsoJGKshx3DWWxvzR1/x56cNg
X-ME-Proxy: <xmx:XiyhamVGm__Wd8wgJ3VTxeyP9ikGxJIUkNhU_-W47-CMTel4LJCABQ>
    <xmx:Xiyhanur1uuJPAMztkiXUApBkD1kEUnCERpIgh7l2EnKlSw0Czthig>
    <xmx:XiyhatVcrYRIED6j61FYUUpZeiD0e7GHvWeBJKEHUkAWMeiAgHTGlg>
    <xmx:XiyhajUt4LyHthI4m1uORmxaMOZ0uSYN8r-ChEzUvYoOLr4KBfztlQ>
    <xmx:Xiyhancs8FIZe3ZN_PtgD2z5d1IzGWxBDAjoqnbAnPnGtPJfInT9xpUb>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 05:52:30 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: [PATCH v6 0/2] iommu/arm-smmu-v3: Make the queue depths tunable, and shrink them in a kdump kernel
Date: Wed,  9 Sep 2026 10:52:26 +0100
Message-ID: <20260909095228.2174031-1-kas@kernel.org>
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

Patch 1 adds a cmdq_max_n_shift module parameter, decided in a per-queue
helper and floored at one page. Patch 2 has a kdump kernel default all
three depths to one page through the same helper. An explicit
cmdq_max_n_shift still wins.

Measured per instance under QEMU on -M virt,iommu=smmuv3, through a real
panic and kexec into a capture kernel:

                        4K page          64K page
      cmdq         1 MB -> 4 KB      8 MB -> 64 KB
      evtq         1 MB -> 4 KB     16 MB -> 64 KB

Every clamped queue lands on exactly one page. cmdq_max_n_shift moves the
command queue alone and beats the kdump default; the capture kernel
attached four devices with no CMD_SYNC timeout, GERROR or context fault.
QEMU exposes no PRI queue, which takes the same path. Build-tested across
4K/16K/64K, TEGRA241_CMDQV=n, CRASH_DUMP=n and =m, every commit
warning-free.

v6:
 - Take the parameter as a log2 depth and call it cmdq_max_n_shift (Nicolin).
 - Nicolin's Reviewed-by and Tested-by from v5 are not carried over, as
   the parameter changed shape.

v5: https://lore.kernel.org/all/20260907095835.1233352-1-kas@kernel.org/
v4: https://lore.kernel.org/all/20260902121724.3494954-1-kas@kernel.org/
v3: https://lore.kernel.org/all/20260706084708.8072-1-kas@kernel.org/

Kiryl Shutsemau (Meta) (2):
  iommu/arm-smmu-v3: Add a cmdq_max_n_shift module parameter
  iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 75 +++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  2 +-
 3 files changed, 70 insertions(+), 8 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0


