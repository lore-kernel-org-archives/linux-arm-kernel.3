Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A11606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKZrS/51;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=PCfMpJeV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OmwMq0ptkj37+lT6Yat2Qo4/kdnOLTu6VC5yk+uY2QU=; b=qKZrS/51aMhIFeypQL117DtJig
	fEyVSomEhAsxgkzsvcWswR8onMi0y5cGAmM+1BIdtTAU+bujiHZeui/UvRf+EN9SKXPUemBBiCEPY
	TtR6yj7EZ84J/Xy4yrrmmKCG8jhPlkbbUE3BTgdoaHMD6ZdtzMgjOVnl7uYl2ChTu+Gb8ykXy4Qx2
	uWfzIs6bRSky3Fn1RWikO0qAEbxDxogGUTubLffhwfOA8sRz1vy9UR8v1CjVE5c/F4Chh/YX9dL1B
	y0UBVBgWuvmxfUzz5Wuju+n7PkmPpD5ck8iZwyLmm4AHedbu/YUbB+Zl766gsLIOCs+C6JoB5wat4
	GPQ6+uRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoGj-0000000Fz62-2WAk;
	Mon, 02 Nov 2026 09:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoGg-0000000Fz5T-3b7S;
	Mon, 02 Nov 2026 09:23:56 +0000
X-UUID: 1a9665b2d69f11f1afed4741b24580c9-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OmwMq0ptkj37+lT6Yat2Qo4/kdnOLTu6VC5yk+uY2QU=;
	b=PCfMpJeVPRPbqzOZoTBADNRCEQKC2DuGO7TV7Bf7HieG73J5VYDXimBOruNriKfYRjYhhXe4IIolNzFs7amuT0b4qQlfC6pwggUXi5iIzCOuc1eLc+7zRSF4kMM7UBdtsTvSpTwcEkWdsi1oLYxULmiAX0+QTZ4RDnM7aXa4o4U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4c7c73c7-1bca-442b-b73b-98ad78658f95,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:7f7969a3-2f6f-43d1-a751-2a61c87fd6c5,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a9665b2d69f11f1afed4741b24580c9-20261102
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1615474101; Mon, 02 Nov 2026 02:23:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:23:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:23:43 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 00/11] soc: mediatek: add a DRAM ECC error handling driver
Date: Mon, 2 Nov 2026 17:23:22 +0800
Message-ID: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012354_911963_BE5F07D1 
X-CRM114-Status: GOOD (  18.48  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Santino Wang <santino.wang@mediatek.com>

On the MediaTek mt8992 SoC the DRAM controller (DRAMC) raises an interrupt for
every corrected (CE) and uncorrectable (UCE) ECC error. The interrupt is
owned by the secure firmware (Arm Trusted Firmware at EL3). It reads the
DRAMC error registers, applies the error containment policy and the CE
storm protection, and hands the error to the OS firmware-first as an ACPI
GHES record in a buffer that UEFI describes in the HEST. The OS is
notified with an edge interrupt that the DSDT delivers through a Generic
Event Device and a Hardware Error Device (GSIV notification).

The record carries a standard Platform Memory Error section and a
MediaTek vendor section with the raw DRAMC error registers. This series
adds the driver that consumes the vendor section through the existing
ghes_register_vendor_record_notifier() interface. No change to the GHES
core or to arm64 code is needed.

The driver
 - decodes the most severe error of a record and keeps counters, also
   across boots in EFI variables,
 - isolates pages with memory_failure(): immediately for a recoverable
   UCE on memory that Linux manages, and for a page whose corrected
   error count reaches a threshold (leaky bucket); memory owned by a
   device is only reported to its owner,
 - lets in-kernel clients and user space (generic netlink, tracepoints)
   follow the events,
 - exposes the containment policy, the storm protection and per range
   severity overrides in sysfs and pushes them to the secure firmware
   through a vendor SMC call,
 - after a fatal UCE (GHES panic and reset), finds the error in the BERT
   of the next boot and reports it through the mc_event tracepoint.

The driver depends on firmware that is not part of this series: the
secure firmware provides the SMC interface used by patch 2 and writes the
vendor section decoded by patch 4. The firmware side (the TF-A and
edk2-platforms changes for the mt8992 SoC, plus the preloader that keeps
the error across the reset) is being developed in the vendor's BSP trees
and is not published yet.

Open question for this RFC: is drivers/soc/mediatek the right place for a
driver that is built on GHES vendor records and a vendor SMC interface, or
would the maintainers prefer another location?

Testing: each patch builds with the arm64 defconfig plus
CONFIG_MTK_DRAM_ECC=m on linux-next 20261030 (W=1, no warnings).
The series has been tested pre-silicon on a Palladium emulation platform.

Santino Wang (11):
  soc: mediatek: dram-ecc: add the DRAM ECC driver skeleton
  soc: mediatek: dram-ecc: add the SMC interface to the secure firmware
  soc: mediatek: dram-ecc: add tracepoints
  soc: mediatek: dram-ecc: handle GHES vendor records from the firmware
  soc: mediatek: dram-ecc: add error counters and the address lists
  soc: mediatek: dram-ecc: keep error counters across boots
  soc: mediatek: dram-ecc: add containment policy and storm protection
  soc: mediatek: dram-ecc: add the corrected error leaky bucket
  soc: mediatek: dram-ecc: add a generic netlink event interface
  soc: mediatek: dram-ecc: report an uncorrectable error of the previous
    boot
  Documentation: ABI: add the sysfs attributes of the MediaTek DRAM ECC
    driver

 .../ABI/testing/sysfs-class-mtk-dram-ecc      | 182 +++++++++
 MAINTAINERS                                   |  10 +
 drivers/soc/mediatek/Kconfig                  |   2 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/dram-ecc/Kconfig         |  19 +
 drivers/soc/mediatek/dram-ecc/Makefile        |   3 +
 drivers/soc/mediatek/dram-ecc/core/Makefile   |  20 +
 .../soc/mediatek/dram-ecc/core/addresses.c    |  88 ++++
 .../soc/mediatek/dram-ecc/core/addresses.h    |  13 +
 .../soc/mediatek/dram-ecc/core/bert_check.c   | 240 +++++++++++
 .../soc/mediatek/dram-ecc/core/bert_check.h   |  12 +
 drivers/soc/mediatek/dram-ecc/core/counters.c | 336 ++++++++++++++++
 drivers/soc/mediatek/dram-ecc/core/counters.h |  29 ++
 .../mediatek/dram-ecc/core/ghes_notifier.c    | 377 ++++++++++++++++++
 .../mediatek/dram-ecc/core/ghes_notifier.h    |  22 +
 drivers/soc/mediatek/dram-ecc/core/main.c     | 113 ++++++
 .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h |  27 ++
 .../dram-ecc/core/mtk_dram_ecc_event.h        |  47 +++
 drivers/soc/mediatek/dram-ecc/core/netlink.c  |  83 ++++
 drivers/soc/mediatek/dram-ecc/core/netlink.h  |  14 +
 .../dram-ecc/core/policy/address_range.c      | 120 ++++++
 .../dram-ecc/core/policy/containment.c        | 107 +++++
 .../dram-ecc/core/policy/leaky_bucket.c       | 277 +++++++++++++
 .../mediatek/dram-ecc/core/policy/policy.c    |  57 +++
 .../mediatek/dram-ecc/core/policy/policy.h    |  23 ++
 .../dram-ecc/core/policy/storm_protection.c   | 137 +++++++
 drivers/soc/mediatek/dram-ecc/core/smc.c      | 137 +++++++
 drivers/soc/mediatek/dram-ecc/core/smc.h      |  55 +++
 drivers/soc/mediatek/dram-ecc/core/trace.c    |   6 +
 drivers/soc/mediatek/dram-ecc/core/trace.h    | 119 ++++++
 include/uapi/linux/mtk_dram_ecc_netlink.h     |  44 ++
 31 files changed, 2720 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-mtk-dram-ecc
 create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
 create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/addresses.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/bert_check.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/counters.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/ghes_notifier.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc_event.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/netlink.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/address_range.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/containment.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/leaky_bucket.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/policy.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/policy/storm_protection.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/smc.h
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/trace.h
 create mode 100644 include/uapi/linux/mtk_dram_ecc_netlink.h

-- 
2.45.2


