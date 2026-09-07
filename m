Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE2C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwxlOO0PfaD5LKIbexp9WWtgAxdWlrrDi1uOebkoVNs=; b=ibxlzJavWtrndoaOeuKzGeaVEL
	pKAgUdKjtErtnqy6m1+5+aBV8RKnnu+3EdvEs97ytBqsKZvBKVLxEQNgJMYpfUshhx3l/3/Z6D+KI
	gG1TO07cpgx0TYHgltPjLMzGPrl2CH1xINwncDB2q0VCoGCwB10yy8rLEhrqYH38a/q+sp5kjnopv
	c43pzSkUV3/5tRCDc1BBDM6In6l91SMcNoW67VBiyBB0lONmZzXkrFipBOgjGGSXI3Slz6DgSETHl
	i7prIbKmb3HB2SujY9O8ciwKqCwhfTcW8JXH0WzozR1H/c1vmjAv8Gk4F3fAKCMZvbm2Xd2sc5R8q
	91qaXAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7h-00000006PgS-30JM;
	Mon, 07 Sep 2026 09:58:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7f-00000006Pes-3MTO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F53A447D8;
	Mon,  7 Sep 2026 09:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4541F00A3A;
	Mon,  7 Sep 2026 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775123;
	bh=cwxlOO0PfaD5LKIbexp9WWtgAxdWlrrDi1uOebkoVNs=;
	h=From:To:Cc:Subject:Date;
	b=PXRgUb861dJgKWzTDP+4eM3m158NKzsswprYUAuWm3jIB7Fms700gjHy6BLvU94tC
	 v8G6wq1HwEd4Ao5TvnN0p2+/ZC0j+U7PozoX/tEEoVSKfzKqz+DB7nbh5M3IfygEpg
	 x6dk9xSdDb+qYjiUqpxcLVdJUfFbeUFZCJuRSs1Yyc1oyRaOIsAWBKaU11F4sOXFQq
	 KslL8zcSZPuPQVc0axgZX4KtoHq47eT45JuUByXYAFP7Z1QGo84DtDfwtmbE77sOlw
	 uhnrwzE153VXKbDqFV3C9LruFjXYaEVjyCnVi6ZddhMuI12rHbY/LJmItnJZ/n7T5a
	 U/b2YS9qXCeKw==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.ams.internal (Postfix) with ESMTP id F1EF3198003A;
	Mon,  7 Sep 2026 05:58:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 07 Sep 2026 05:58:40 -0400
X-ME-Sender: <xms:zoqeahtfyvj_lFiq-wb-s8-9cZ3dod28hZy1Y13JeieCcir0kvSMnA>
    <xme:zoqeahYeZOtXwRhAklzmxKH36hjAIYX6QTcp7Oz5IlD8kxlcWWc0TuMZD9W2SLFDg
    5nqhIZmDcW3F2jNXTZ4CyIpTEmBK0Ma1clP7FeKV3YcMx0KTpYr5s7u>
X-ME-Received: <xmr:zoqeap3l367qfTXBo0SIfnixVryaJ3akomYxzfyn1DZtE2IXFku6XKQ4Z00>
X-ME-Proxy-Cause: dmFkZTGOV4s0uqSOWo1zXxwIR6fcdFJstUkJy5optG3EbWoIJs8tjmFUmicxaGh26muWSG
    xy/3REBSdKsUcMFMUlAjIu8YODwHEX4lsV4qe45YL34oIYFTVpgyGwGf2Ds26aCbOvpBDx
    DnxUbElYo4AqNs65BHucRKNh1y5AIS+6ewBGq+NkIzzJZj0MwRfH1Qc+isRhy05PMUybM3
    iLd8gImKieA4rTwFlNzaRKHkRM01L22dI0RPtn6h1PSywIGXBvB9/mRWMRjn+4Ath1iPFh
    T2I16TeZ5yqfuQrazi57AgN/r8uGsBM7zZtDM4Yf4ozUB/9vNb2B7MwHncknlMYxxx1vj6
    GCdpqN0JeaayTK+j22D1kYaGoDqUb4hhr5HU2i43VGz8VqW7nDAxMuZ1IZKbfDi77zlizC
    CL+7eEEPL8T0OtuxfEIsZO2a201HRM/811zb1CbPPU4Sk0OWDJSCW+3vKUhNdinqVNhlwz
    tpvO6TVEKHybtjpZE2CnsVJUO6mTO7OKPN7aafBBSA7iKDvmuZeviapeuIInWi4okt1ST9
    EE908a7oQFh084WIPJVLVFYiNGp14fCuwHewCP67enikwJsk2YGgXVl9qgOADUoh/RE8IO
    ioTTssyorZGOFDsUHN112/LKt7pClvc1ISeHz8kKn3g2pCl/BJA0p0/xDslQ
X-ME-Proxy: <xmx:zoqeavUJEpU2PeTOqrQ3CdbWm_wldu50Y2C2ThKIrMnBAzZIb9oZAA>
    <xmx:zoqeastP22u5Gk-ep2A4fxPf1YH2RKEAAoRSwI-49TZLSmo0Q94Y5w>
    <xmx:zoqeauUyBwyFZbRo7WYDFftRpwHHhbyWcKb48JcEfYSUJye1BcT17w>
    <xmx:zoqeagWyMkvyv1U311GuuBQWPbRcGmM7y6Pr3YIKT5c2UnxvZ4bmDw>
    <xmx:zoqeageZJd_hybtwzeUZh3Ve5ZgE0j7KbdPsLEkz9vuhMTMw-8veO-Du>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 05:58:37 -0400 (EDT)
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
Subject: [PATCH v5 0/2] iommu/arm-smmu-v3: Make the queue depths tunable, and shrink them in a kdump kernel
Date: Mon,  7 Sep 2026 10:58:33 +0100
Message-ID: <20260907095835.1233352-1-kas@kernel.org>
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

Patch 1 adds a cmdq_max_entries module parameter, decided in a per-queue
helper and floored at one page. Patch 2 has a kdump kernel default all
three depths to one page through the same helper. An explicit
cmdq_max_entries still wins.

Measured per instance under QEMU on -M virt,iommu=smmuv3, through a real
panic and kexec into a capture kernel:

                        4K page          64K page
      cmdq         1 MB -> 4 KB      8 MB -> 64 KB
      evtq         1 MB -> 4 KB     16 MB -> 64 KB

Every clamped queue lands on exactly one page. cmdq_max_entries moves the
command queue alone and beats the kdump default; the capture kernel
attached four devices with no CMD_SYNC timeout, GERROR or context fault.
QEMU exposes no PRI queue, which takes the same path. Build-tested across
4K/16K/64K, TEGRA241_CMDQV=n, CRASH_DUMP=n and =m, every commit
warning-free.

v5:
 - Rename cmdq_entries to cmdq_max_entries (Nicolin).
 - Take Nicolin's refactor: ceiling/floor naming, the alignment cap inside
   the per-queue helpers, evtq/priq helpers, FIELD_GET() at the call sites.
 - Keep the override in entries rather than a shift: ilog2(1) is 0 and
   collides with the "use the default" sentinel, so cmdq_max_entries=1
   would have given the hardware maximum instead of the floor.
 - min() for min_t() now that the types allow it. Changelogs tightened.

v4: https://lore.kernel.org/all/20260902121724.3494954-1-kas@kernel.org/
v3: https://lore.kernel.org/all/20260706084708.8072-1-kas@kernel.org/

Kiryl Shutsemau (Meta) (2):
  iommu/arm-smmu-v3: Add a cmdq_max_entries module parameter
  iommu/arm-smmu-v3: Default queue depths to one page in a kdump kernel

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 78 +++++++++++++++++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  1 +
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  2 +-
 3 files changed, 73 insertions(+), 8 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0


