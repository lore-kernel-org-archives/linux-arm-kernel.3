Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zQafo1Qz;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EaTH8EjF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZAB7/hCKkKAoMIDThIlw5LbxXMZC/TORWW4H4NENksU=; b=zQafo1QzZvrwioyhHa+cXIgVlE
	E+vQEc1iU499oqlbwabjI86rQ9y/T2vIv2VkR97vWAm8H2uZxcXdugYKfzXYKmuD5mz/GT1m87e52
	jW15MrZtdyFBOA7zU9deu9kqWnDMN9P4PzyAax+Goi1pe9H+F3h0o9mnxGgOZ6X0bQvd2rq5r9IIQ
	K+nS/hiU70hp+4tlvNVepVnrrNFgeLh5Ipi6bT7q6IGPHb1UBr2WxFRxEqpykmfvgvculXQ7vMS7e
	GWuYr1uIIeV0TipBn1/NGg/mKvy5OK/K9OZYuRfnv9KKEaAbdPbnJL7hFUQjwf/DC4HjUjbZqs2p0
	7xskVlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJROi-0000000BIrd-0kxg;
	Wed, 21 Oct 2026 08:10:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJROY-0000000BInX-2tId
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:10:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E2F3C5CD71;
	Wed, 21 Oct 2026 08:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26FEB606E3;
	Wed, 21 Oct 2026 08:09:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75F7C10328934;
	Wed, 21 Oct 2026 10:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570192; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ZAB7/hCKkKAoMIDThIlw5LbxXMZC/TORWW4H4NENksU=;
	b=EaTH8EjFazQqArMqLY4HQgSKLw5UTigyedzb/yLfJdgfm1IitqfbT6GmAplaOonaoTKPNx
	E8YmCNLQsrWoPu9xBjqIGJeWvraAt4xi/TxsyEMgDz16lIC7vuA+SFwgtP3MQ47Hw/ULXw
	nk3zpWM7bQ7/ZtiC/dqiZ4+IGNm2mu3EMiK4bh4jj2HlmSLEArLslt0t2f8PGfzRh3+J+w
	CgF7wel8SHo8HrAWsZqZTPqA2SyPuC7XwmB8jIqbr0/CD+56fWY0NXDUu4QA/x3e18roYG
	LT/KXyQNhqXHVg/YBNEbSZ+H3rETKO/sf2dVufO/kQy1lG9UGHuOiWE+5BHqCQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v5 0/6] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:41 +0200
Message-ID: <20261021080947.3747284-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_010958_902923_F1F0C84A 
X-CRM114-Status: GOOD (  11.53  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For TI Jacinto SoCs (J7200, J721S2, J784S4, J722S, J742S2) which support
low power modes, a chunk of memory is reserved for LPM metadata, needed
for saving ATF context and the certificate information of ATF and OPTEE
and the DM image. This LPM metadata area is firewalled to be accessed
only by TIFS.

At boot time, U-Boot R5 SPL copies the DM image into this memory region
so that it doesn't have to be reloaded from storage at resume, speeding
up the resume time.

U-Boot R5 SPL/TIFS use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: Unlike for Sitara, this memory region is not part of the DM memory,
which is not retained across suspend, so the Sitara binding can't be
re-used here.

Patch 1 adds a new binding for this layout.
Patch 2 skips the firewalled lpm-metadata memory region
The other patches add the memory region for the TI Jacinto SoCs (J7200,
J721S2, J784S4/J742S2, J722S)

Changes since v4:
- rebase on v7.3
- move J784S4/J742S2 carveout before optee and factorize it in
  k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi (suggested by Udit)
- use dedicated printk format %pR for dev_dbg() log
Link to v4: https://lore.kernel.org/lkml/20260921145325.300025-1-richard.genoud@bootlin.com/

Changes since v3:
- rebase on v7.3-rc4
- skip mapping the firewalled lpm-metadata memory region
Link to v3: https://lore.kernel.org/lkml/20260703143717.177362-1-richard.genoud@bootlin.com/

Changes since v2:
- Split the DTS changes per ipc-firmware.dtsi
- Reference the LPM carveout through a phandle
- Add a dt-bindings patch documenting the "lpm-metadata" memory-region
  name for the Jacinto layout.
- Use the generic @memory node naming instead of @lpm-memory.
- Clarify how the DM image is handled
Link to v2: https://lore.kernel.org/lkml/20260427160326.370415-1-richard.genoud@bootlin.com/

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
Link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Richard Genoud (TI) (6):
  dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
  remoteproc: k3: skip mapping firewalled lpm-metadata memory region
  arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve
    memory for LPM metadata
  arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM
    metadata

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 18 ++++++++--
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 +++++--
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 12 +++++--
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 +++++--
 ...-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 12 +++++--
 drivers/remoteproc/ti_k3_common.c             | 36 +++++++++++++------
 6 files changed, 80 insertions(+), 22 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222

