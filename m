Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCCB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rpyRAOQU;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=ncM5MH9O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=htf0XnCq8b3mGZpyFUeRWCE6zqOV8+iGrdXbpt9HnI4=; b=rpyRAOQUlJAULbwtql0hA3xXEH
	vPphEcWqtsa+b1xT+9Mc69pML5SQAzjIl0QVCRujxT8akyls1zPAD/GRyqCbu91PV2k65rGi99n50
	e3xB7iM7pcIbt6UZeEjq2I9gLHkJJTI7ZOX96kDh3wamngsW65IRmDV/PrkMdzmuoWIbAhDUEoAe4
	b621k257omQESZHUdaHRDMeZoWCb1jQyshwovTqvd2YBOXnI7LxDZcDOy9OAFfDXeRmDEi/r/AxNI
	g9Mg7oibYmyLSlJacHY57mFB5VzxBiPcpXYopwZSM3mLa5VM7dZyqZrVGGoiUTkAsKjZ2Q5DIEKm4
	zUzbyXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhw8-0000000B6sH-0CEy;
	Fri, 30 Oct 2026 08:26:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhw5-0000000B6qC-0jd7;
	Fri, 30 Oct 2026 08:26:06 +0000
X-UUID: 8598ffa2d43b11f1acbe4559397dec65-20261030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=htf0XnCq8b3mGZpyFUeRWCE6zqOV8+iGrdXbpt9HnI4=;
	b=ncM5MH9OiDXnAMTTfYf0ACPVHJ23Z8v6Lomf7KRzk/qFLgelf9qT6jetllI7MafB1AU7OAL47L59aY1x85doyqoVZyASr4fVXk6ZOdVEuOZ5MFJ64ZLTnCUx5whZKBbqzxmzzOme///MIIitcuMR/BHGNrrv3MCvk30JnzJ5V+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4f0d36ce-7fb7-44b9-b56b-d58a1d5fa6a0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:3462e7ec-b50c-48b5-b20a-bfe3130e16d3,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8598ffa2d43b11f1acbe4559397dec65-20261030
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 286893183; Fri, 30 Oct 2026 01:25:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 30 Oct 2026 16:25:50 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 30 Oct 2026 16:25:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat
	<YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH 0/4] add support platform nhi driver
Date: Fri, 30 Oct 2026 16:25:35 +0800
Message-ID: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_012605_226402_4F793469 
X-CRM114-Status: GOOD (  14.20  )
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

This patch series introduces support for platform bus-based USB4/Thunderbolt
Host Interface (NHI) controllers on embedded SoCs, along with two fixes/
improvements in the Thunderbolt core connection manager.

Historically, the Thunderbolt NHI driver has assumed a PCI bus binding
(pci.c), with tb_domain_init()/exit() tightly coupled to the PCI module
lifecycle. Modern ARM64 SoCs integrate the USB4 NHI controller directly
onto the platform bus, described via Device Tree or ACPI.

This series decouples the core domain initialization from the PCI driver
and adds a dedicated platform driver (plat.c) supporting standard platform
probing, OF/ACPI device tables, runtime PM, and an optional dedicated
out-of-band wakeup IRQ.

Additionally, this series resolves two issues observed during runtime PM
and link training:
1. Premature link-up timeout when bringing up USB3 adapters on links with
   multiple retimers.
2. Kernel warnings when authorizing/de-authorizing PCIe tunnels on switches
   that have been marked unplugged or lost during suspend.

Patches in this series:
======================
Patch 1: thunderbolt: add platform nhi driver
  Decouples tb_domain_init()/exit() using subsys_initcall() and adds plat.c
  to support memory-mapped NHI host controllers on the platform bus with
  Device Tree (CONFIG_OF) and ACPI (CONFIG_ACPI) match tables.

Patch 2: thunderbolt: add support optional dedicated wakeup irq
  Adds support for an optional dedicated wakeup interrupt for platform NHI
  controllers using dev_pm_set_dedicated_wake_irq(), allowing out-of-band
  wake-up lines from SoC power management units during low-power states.

Patch 3: thunderbolt: improve usb3 adapter link up timeout value
  Increases tb_wait_for_port() timeout from 1.0s to 2.5s. In the USB4 spec,
  Phase 5 (Link Equalization) alone is permitted up to 1000 ms. When factoring
  in Phase 3/4 and retimer transaction delays across multiple retimers, link
  training can legitimately take 1.2s to 1.5s+. The previous 1.0s timeout
  caused premature aborts and disconnects upon wakeup.

Patch 4: thunderbolt: fix pcie tunnel create/destroy core dump
  Checks sw->is_unplugged in tb_switch_set_authorized(), tb_disconnect_pci(),
  and tb_tunnel_pci(). When de-authorizing an unplugged/lost switch via sysfs,
  this prevents redundant lookups and eliminates false-positive
  WARN_ON(!tunnel) stack traces when tunnels have already been destroyed.

Testing:
========
Tested on ARM64 platform hardware with USB4 hubs and downstream PCIe/USB3
devices across plug/unplug, system suspend/resume, and runtime PM transitions,
the kernel boots from UEFI/ACPI.

Chunfeng Yun (4):
  thunderbolt: add platform nhi driver
  thunderbolt: add support optional dedicated wakeup irq
  thunderbolt: improve usb3 adapter link up timeout value
  thunderbolt: prevent pcie tunnel activation/teardown warnings

 drivers/thunderbolt/Makefile |   2 +-
 drivers/thunderbolt/domain.c |  10 +-
 drivers/thunderbolt/nhi.c    |   2 +
 drivers/thunderbolt/nhi.h    |   1 -
 drivers/thunderbolt/pci.c    |  26 +-----
 drivers/thunderbolt/plat.c   | 171 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c |   8 +-
 drivers/thunderbolt/tb.c     |   7 ++
 drivers/thunderbolt/tb.h     |   2 -
 include/linux/thunderbolt.h  |   2 +
 10 files changed, 200 insertions(+), 31 deletions(-)
 create mode 100644 drivers/thunderbolt/plat.c

-- 
2.43.0


