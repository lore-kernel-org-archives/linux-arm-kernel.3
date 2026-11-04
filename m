Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3bp6BuuR;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cq4EqdYg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VQ6z8+twtbazE0gGwJv8oBpETzY3vXo1UnhfZ17TTWc=; b=3bp6BuuRU72fBcdkW/Qd1WJ8bS
	olRpbQqBDKjEas/5ZxSYafe21cReqn8XOxrDxVu9nXmzggi+5fNcEfFxc16InnqhSYxyoVMQRS70A
	zouQd6JqCQFFgPMWOzsgsy5nbnvaXOLMjpMFqFyL9q3YyoyONIFbjnuh7tltfVtqPY0knzSpoTXs1
	sNja/t3z/d165OubVLQa7i8Eyty7PVy7uyeQk9Q3Y6IKCnd5v5x9pyIleUsyaLnaYERzAJs/eLu6J
	QHEA6Hxeeld3HCEpVZ4BHr8FRBLJuXzd1dfIbssyFCyIxKQfhtIGTX4Ri99/x/D4SQrPvnyk/5uvT
	6bj2jMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORHS-00000004EW9-2oca;
	Wed, 04 Nov 2026 03:03:18 +0000
Received: from mail-dl1-x1247.google.com ([2607:f8b0:4864:20::1247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORHO-00000004ESM-2se9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:03:18 +0000
Received: by mail-dl1-x1247.google.com with SMTP id a92af1059eb24-1aa0fb7f157so505891c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 19:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793761394; x=1794366194; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQ6z8+twtbazE0gGwJv8oBpETzY3vXo1UnhfZ17TTWc=;
        b=cq4EqdYgCp0GbFBSRxvEJY77mY3DB/1YIiYvWfGTG/KHWeeiqp7BR3f/6ZdY7CxhDa
         Thx3SM6F7Gp1lWIPBQeVm5JXKd1ZlAhHpdIRH/Zf7knRJBSlSZRIEYJyRXFk1nn5F3pf
         wkS6q7G6CFyzTIxbVE9IkyqZ9RKBqsdUGClX6MwvWfEpAEASlgCY0P67J962+SjWEbLt
         vpj9Lx0EvNW7Fz5IoGL4s7JQT8P+sE7EjAe9mXlWcP+atdspBsgANZ861UeDc3tbfnJ5
         kyGExtS2P1Su3zDdvJ2M5645d/trEIlB5YY4XnKnhDm6As0xc5eliUP2m8A5nn+ZMAOp
         HaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761394; x=1794366194;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQ6z8+twtbazE0gGwJv8oBpETzY3vXo1UnhfZ17TTWc=;
        b=XWinZpJceutue2H/Tieiv3ySFLeijmS7ea6M2mCFiFrtkOIHFN5HE+s1j89qPtyz5R
         f/V+j3Ivqj1iAjzYMqywYIzrdh5mx96hOKxceO9RJ14Yvf3o0Z6mK6Ce2Vw0zM+eNt2q
         P07OA8AZ4tnZ5QYMcuRvBncvTdYKktG6LmikKBcjrUV8YBxGq4tiSZLRoB74TLj+4PIj
         0q3f+ZUACb5PmCImh3rdtkoBgo4HgnxpRTnzBgUwj4uM95cZuJhLWhQWvejJr934oswB
         xH+VWJwqdKBni0WpfeUnpItdcwU/EYqK9fBXvW+qPIN5YKqzhjtQxZ/pGVD/7/o0wHjy
         Wvfg==
X-Forwarded-Encrypted: i=1; AKwUvBytCj5aY+VaG+/NYKYo+QheGRhOuTtiTSUCO/Aad14VTCWHZwZ7gGP0IEXjYdVuwcxcGbRH3qsmr79EQFl3oGT7@lists.infradead.org
X-Gm-Message-State: APuU4Z/ncL3tI6IhGTn9TFQH+7USYd8k+KvCexGo115rrFPP3yQAilEV
	1yP93t4oKPamQ14QIp3+BIv1fyS7UV4R8x83pvgCQp7B+crEn6WwXLjsHcMCV8UrC2ChCkc/dZv
	Rh+hy3sNoig==
X-Received: from dlep9.prod.google.com ([2002:a05:701b:4589:b0:19a:c730:c24])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a0e:b0:1b2:3448:840f
 with SMTP id a92af1059eb24-1b2344885f6mr13765484c88.7.1793761392543; Tue, 03
 Nov 2026 19:03:12 -0800 (PST)
Date: Tue,  3 Nov 2026 19:03:00 -0800
In-Reply-To: <20261104030300.1140180-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104030300.1140180-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104030300.1140180-4-irogers@google.com>
Subject: [PATCH v17 3/3] perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_190314_872399_6069B734 
X-CRM114-Status: GOOD (  17.91  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the Raspberry Pi AXI PMU driver to support the Broadcom BCM2712
used in the Raspberry Pi 5.

As on earlier chips, the System monitor is accessed directly via MMIO
and the VPU monitor via the firmware mailbox. BCM2712 has 6-bit AXI
master IDs.

The System bus names in Broadcom's documentation describe the set-top
box variant of the chip, so they were checked by measurement on C0 and
D0 boards. PCIe2 (RP1) traffic appears on the port documented as
BSTM_TOP, SD/eMMC with DMA0 and DMA1 on the one documented as SRC, and
SD/eMMC2 (WiFi SDIO) on the one documented as ARB3; these are named
pcie_02, sd_dma and emmc2 here, and the display_top and argon_top ports
are named display and argon.

From BCM2712 D0, three System monitor ports (XPT, PCIE_01 and HVDP) are
removed and the remaining ones renumbered, with the external PCIe moving
to the Argon port. The bus watchers also match a full AXI ID under a
mask: 10-bit ID and mask fields on the System monitor, and 6-bit fields
holding the master ID directly on the VPU monitor. D0 is detected at
probe by whether the ID mask field is writable, and selects its own bus
table and filter encoding.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../admin-guide/perf/rpi-axi-pmu.rst          |   34 +-
 drivers/perf/Kconfig                          |    2 +-
 drivers/perf/rpi_axi_pmu.c                    | 1230 ++++++++++++++++-
 3 files changed, 1261 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/perf/rpi-axi-pmu.rst b/Documentation/admin-guide/perf/rpi-axi-pmu.rst
index 5dc57c247769..cfe832c44a50 100644
--- a/Documentation/admin-guide/perf/rpi-axi-pmu.rst
+++ b/Documentation/admin-guide/perf/rpi-axi-pmu.rst
@@ -4,8 +4,8 @@
 Broadcom Raspberry Pi AXI Performance Monitoring Unit (PMU)
 ==============================================================
 
-Broadcom BCM2835 and BCM2711 SoCs used in Raspberry Pi boards include two AXI
-bus-watcher performance monitor blocks:
+Broadcom BCM2835, BCM2711, and BCM2712 SoCs used in Raspberry Pi boards include
+two AXI bus-watcher performance monitor blocks:
 
 - **System monitor** (``monitor=0``): Observes the primary System AXI fabric
   and is read directly via MMIO.
@@ -51,6 +51,7 @@ Counter Suffix   Width  Description
 7       rtrans   32-bit Read data beats
 8       rmax     28-bit Maximum read transaction latency (cycles)
 9       rpend    8-bit  Pending read transactions (instantaneous level)
+10      ratrans  32-bit Read address transactions (BCM2712 only)
 ======= ======== ====== =======================================================
 
 Level Counters (``*max`` and ``rpend``)
@@ -114,6 +115,35 @@ BCM2711
   (8), ``PCIE`` (9), ``DMA2`` (18), ``GIGE`` (23), ``GISB_AXI`` (28),
   ``ARM`` (30), and ``EMMCSTB`` (31).
 
+BCM2712 (C0 and D0)
+-------------------
+
+BCM2712 D0 removes three unused set-top-box System fabric ports (``xpt``,
+``pcie_01``, and ``hvdp``) and renumbers the remaining ports; the driver
+detects D0 at probe time via the bus-watcher AXI ID mask field and exposes the
+matching sysfs event table.
+
+- **BCM2712 C0 System buses (0..12):** ``vpu_uc`` (0), ``display`` (1),
+  ``v3d`` (2), ``arm`` (3), ``xpt`` (4), ``pcie_02`` (5), ``pcie_01`` (6),
+  ``argon`` (7), ``emmc2`` (8), ``sd_dma`` (9), ``hvdp`` (10), ``per`` (11),
+  ``system_l2`` (12).
+- **BCM2712 D0 System buses (0..9):** ``vpu_uc`` (0), ``display`` (1),
+  ``v3d`` (2), ``arm`` (3), ``pcie_02`` (4), ``argon`` (5), ``emmc2`` (6),
+  ``sd_dma`` (7), ``per`` (8), ``system_l2`` (9).
+- **VPU buses (0..13):** Same ``0..13`` layout as BCM2711.
+- **6-bit AXI master ID filters (1..63):** ``VPU_UC0`` (1), ``VPU_IC0`` (2),
+  ``VPU_DC0`` (3), ``VPU_UC1`` (4), ``VPU_IC1`` (5), ``VPU_DC1`` (6),
+  ``VPU_L2`` (8), ``DMA2`` (9), ``VPU_DEBUG`` (10), ``ARM`` (11),
+  ``DMA0`` (12), ``DMA1`` (13), ``RAAGA`` (14), ``BBSI`` (16), ``PCIE0`` (18),
+  ``PCIE1`` (19), ``PCIE2`` (20, RP1), ``UMR`` (27), ``SAGE`` (28),
+  ``HVDP`` (29), ``BSP`` (30), ``HVS`` (32), ``HVS_WMK`` (33), ``MOP0`` (34),
+  ``MOP1`` (35), ``MBVN`` (36), ``DSI`` (37), ``XPT`` (38), ``EMMC0`` (39),
+  ``GENET`` (40), ``USB`` (41), ``ARGON`` (42), ``UNICAM`` (43), ``PISP`` (44),
+  ``PISPFE`` (45), ``JPEG`` (46), ``EMMC1`` (47), ``EMMC2`` (48), ``TRC`` (52),
+  ``BSTM0`` (53), ``BSTM1`` (54), ``BSTM0_SEC`` (55), ``BSTM1_SEC`` (56),
+  ``AIO`` (57), ``MAP`` (58), ``SYS_DMA`` (59), ``MMUCACHE0`` (60),
+  ``MMUCACHE1`` (61), ``MPUCACHE0`` (62), ``MPUCACHE1`` (63).
+
 Examples
 ========
 
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 8a10beea1e09..e59d8d0c6947 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -332,7 +332,7 @@ config RPI_AXI_PMU
 	help
 	  Enable support for the Raspberry Pi AXI Performance Monitor.
 	  This provides access to the System and VideoCore performance
-	  counters on Broadcom BCM2835 and BCM2711 platforms.
+	  counters on Broadcom BCM2835, BCM2711, and BCM2712 platforms.
 
 	  The System monitor is read directly via MMIO, while the VideoCore
 	  VPU monitor is polled every 100ms via the Raspberry Pi firmware
diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
index c75118c7c902..08867e367ad7 100644
--- a/drivers/perf/rpi_axi_pmu.c
+++ b/drivers/perf/rpi_axi_pmu.c
@@ -62,10 +62,12 @@
  * enum rpi_axi_chip - Supported Broadcom SoC generations
  * @CHIP_BCM2835: BCM2835 / BCM2836 / BCM2837 (RPi 1-3, CM 1-3, Zero/W)
  * @CHIP_BCM2711: BCM2711 (RPi 4, CM 4)
+ * @CHIP_BCM2712: BCM2712 (RPi 5, CM 5)
  */
 enum rpi_axi_chip {
 	CHIP_BCM2835 = 0,
 	CHIP_BCM2711,
+	CHIP_BCM2712,
 };
 
 /**
@@ -123,6 +125,68 @@ enum bcm2835_system_bus {
 	BCM2835_SB_MAX,
 };
 
+/**
+ * enum bcm2712_system_bus - AXI buses monitored by the system monitor on BCM2712 C0 (RPi 5)
+ * @BCM2712_SB_VPU_UC: VPU uncached bus
+ * @BCM2712_SB_DISPLAY: Display (HVS) bus
+ * @BCM2712_SB_V3D: V3D GPU bus
+ * @BCM2712_SB_ARM: Arm CPU cluster bus
+ * @BCM2712_SB_XPT: XPT bus (unused on Raspberry Pi)
+ * @BCM2712_SB_PCIE_02: PCIe2 (RP1 south bridge on Raspberry Pi 5; BSTM_TOP in Broadcom docs)
+ * @BCM2712_SB_PCIE_01: External PCIe bus
+ * @BCM2712_SB_ARGON: Argon (HEVC decoder and PiSP back end) bus
+ * @BCM2712_SB_EMMC2: SD/eMMC2 controller bus (ARB3 in Broadcom documentation)
+ * @BCM2712_SB_SD_DMA: SD/eMMC, DMA0 and DMA1 bus (SRC in Broadcom documentation)
+ * @BCM2712_SB_HVDP: HVDP bus (unused on Raspberry Pi)
+ * @BCM2712_SB_PER: Peripheral access bus
+ * @BCM2712_SB_SYSTEM_L2: System L2 cache bus
+ * @BCM2712_SB_MAX: Number of buses
+ */
+enum bcm2712_system_bus {
+	BCM2712_SB_VPU_UC = 0,
+	BCM2712_SB_DISPLAY = 1,
+	BCM2712_SB_V3D = 2,
+	BCM2712_SB_ARM = 3,
+	BCM2712_SB_XPT = 4,
+	BCM2712_SB_PCIE_02 = 5,
+	BCM2712_SB_PCIE_01 = 6,
+	BCM2712_SB_ARGON = 7,
+	BCM2712_SB_EMMC2 = 8,
+	BCM2712_SB_SD_DMA = 9,
+	BCM2712_SB_HVDP = 10,
+	BCM2712_SB_PER = 11,
+	BCM2712_SB_SYSTEM_L2 = 12,
+	BCM2712_SB_MAX,
+};
+
+/**
+ * enum bcm2712d0_system_bus - AXI buses monitored by the system monitor on BCM2712 D0 and later
+ * @BCM2712D0_SB_VPU_UC: VPU uncached bus
+ * @BCM2712D0_SB_DISPLAY: Display (HVS) bus
+ * @BCM2712D0_SB_V3D: V3D GPU bus
+ * @BCM2712D0_SB_ARM: Arm CPU cluster bus
+ * @BCM2712D0_SB_PCIE_02: PCIe2 (RP1 south bridge on Raspberry Pi 5) bus
+ * @BCM2712D0_SB_ARGON: Argon (HEVC decoder, PiSP back end and external PCIe) bus
+ * @BCM2712D0_SB_EMMC2: SD/eMMC2 controller bus
+ * @BCM2712D0_SB_SD_DMA: SD/eMMC, DMA0 and DMA1 bus
+ * @BCM2712D0_SB_PER: Peripheral access bus
+ * @BCM2712D0_SB_SYSTEM_L2: System L2 cache bus
+ * @BCM2712D0_SB_MAX: Number of buses
+ */
+enum bcm2712d0_system_bus {
+	BCM2712D0_SB_VPU_UC = 0,
+	BCM2712D0_SB_DISPLAY = 1,
+	BCM2712D0_SB_V3D = 2,
+	BCM2712D0_SB_ARM = 3,
+	BCM2712D0_SB_PCIE_02 = 4,
+	BCM2712D0_SB_ARGON = 5,
+	BCM2712D0_SB_EMMC2 = 6,
+	BCM2712D0_SB_SD_DMA = 7,
+	BCM2712D0_SB_PER = 8,
+	BCM2712D0_SB_SYSTEM_L2 = 9,
+	BCM2712D0_SB_MAX,
+};
+
 /**
  * enum bcm2835_vpu_bus - AXI buses monitored by VPU Monitor on BCM2835 (RPi 1-3)
  * @BCM2835_VB_VPU1_D_L2: VideoCore VPU Core 1 Data L2 cache bus
@@ -403,6 +467,116 @@ enum bcm2711_filter {
 	BCM2711_FLT_MAX,
 };
 
+/**
+ * enum bcm2712_filter - AXI master ID filter options for BCM2712 (RPi 5)
+ * @BCM2712_FLT_0: Disable master ID filtering (monitor all traffic on bus)
+ * @BCM2712_FLT_VPU_UC0: VPU Uncached 0 master ID
+ * @BCM2712_FLT_VPU_IC0: VPU I-Cache 0 master ID
+ * @BCM2712_FLT_VPU_DC0: VPU D-Cache 0 master ID
+ * @BCM2712_FLT_VPU_UC1: VPU Uncached 1 master ID
+ * @BCM2712_FLT_VPU_IC1: VPU I-Cache 1 master ID
+ * @BCM2712_FLT_VPU_DC1: VPU D-Cache 1 master ID
+ * @BCM2712_FLT_VPU_L2: VPU L2 Cache master ID
+ * @BCM2712_FLT_DMA2: DMA2 master ID
+ * @BCM2712_FLT_VPU_DEBUG: VPU Debug master ID
+ * @BCM2712_FLT_ARM: Arm Quad-Core CPU Cluster master ID
+ * @BCM2712_FLT_DMA0: DMA0 master ID
+ * @BCM2712_FLT_DMA1: DMA1 master ID
+ * @BCM2712_FLT_RAAGA: RAAGA Audio Engine master ID
+ * @BCM2712_FLT_BBSI: BBSI master ID
+ * @BCM2712_FLT_PCIE0: PCIe 0 master ID
+ * @BCM2712_FLT_PCIE1: PCIe 1 master ID
+ * @BCM2712_FLT_PCIE2: PCIe 2 (RP1) master ID
+ * @BCM2712_FLT_UMR: UMR master ID
+ * @BCM2712_FLT_SAGE: SAGE master ID
+ * @BCM2712_FLT_HVDP: HVDP master ID
+ * @BCM2712_FLT_BSP: BSP master ID
+ * @BCM2712_FLT_HVS: Hardware Video Scaler (HVS) display engine master ID
+ * @BCM2712_FLT_HVS_WMK: HVS Watermark master ID
+ * @BCM2712_FLT_MOP0: MOP0 master ID
+ * @BCM2712_FLT_MOP1: MOP1 master ID
+ * @BCM2712_FLT_MBVN: MBVN master ID
+ * @BCM2712_FLT_DSI: DSI Display Interface master ID
+ * @BCM2712_FLT_XPT: XPT master ID
+ * @BCM2712_FLT_EMMC0: SD/eMMC Controller 0 master ID
+ * @BCM2712_FLT_GENET: Gigabit Ethernet Controller master ID
+ * @BCM2712_FLT_USB: USB Controller master ID
+ * @BCM2712_FLT_ARGON: Argon master ID
+ * @BCM2712_FLT_UNICAM: Unicam master ID
+ * @BCM2712_FLT_PISP: ISP master ID
+ * @BCM2712_FLT_PISPFE: ISP Front End master ID
+ * @BCM2712_FLT_JPEG: JPEG decoder master ID
+ * @BCM2712_FLT_EMMC1: SD/eMMC 1 master ID
+ * @BCM2712_FLT_EMMC2: SD/eMMC 2 master ID
+ * @BCM2712_FLT_TRC: TRC master ID
+ * @BCM2712_FLT_BSTM0: BSTM0 master ID
+ * @BCM2712_FLT_BSTM1: BSTM1 master ID
+ * @BCM2712_FLT_BSTM0_SEC: BSTM0 Secure master ID
+ * @BCM2712_FLT_BSTM1_SEC: BSTM1 Secure master ID
+ * @BCM2712_FLT_AIO: AIO master ID
+ * @BCM2712_FLT_MAP: MAP master ID
+ * @BCM2712_FLT_SYS_DMA: System DMA master ID
+ * @BCM2712_FLT_MMUCACHE0: MMU Cache 0 master ID
+ * @BCM2712_FLT_MMUCACHE1: MMU Cache 1 master ID
+ * @BCM2712_FLT_MPUCACHE0: MPU Cache 0 master ID
+ * @BCM2712_FLT_MPUCACHE1: MPU Cache 1 master ID
+ * @BCM2712_FLT_MAX: Maximum filter ID count for BCM2712
+ */
+enum bcm2712_filter {
+	BCM2712_FLT_0 = 0,
+	BCM2712_FLT_VPU_UC0 = 1,
+	BCM2712_FLT_VPU_IC0 = 2,
+	BCM2712_FLT_VPU_DC0 = 3,
+	BCM2712_FLT_VPU_UC1 = 4,
+	BCM2712_FLT_VPU_IC1 = 5,
+	BCM2712_FLT_VPU_DC1 = 6,
+	BCM2712_FLT_VPU_L2 = 8,
+	BCM2712_FLT_DMA2 = 9,
+	BCM2712_FLT_VPU_DEBUG = 10,
+	BCM2712_FLT_ARM = 11,
+	BCM2712_FLT_DMA0 = 12,
+	BCM2712_FLT_DMA1 = 13,
+	BCM2712_FLT_RAAGA = 14,
+	BCM2712_FLT_BBSI = 16,
+	BCM2712_FLT_PCIE0 = 18,
+	BCM2712_FLT_PCIE1 = 19,
+	BCM2712_FLT_PCIE2 = 20,
+	BCM2712_FLT_UMR = 27,
+	BCM2712_FLT_SAGE = 28,
+	BCM2712_FLT_HVDP = 29,
+	BCM2712_FLT_BSP = 30,
+	BCM2712_FLT_HVS = 32,
+	BCM2712_FLT_HVS_WMK = 33,
+	BCM2712_FLT_MOP0 = 34,
+	BCM2712_FLT_MOP1 = 35,
+	BCM2712_FLT_MBVN = 36,
+	BCM2712_FLT_DSI = 37,
+	BCM2712_FLT_XPT = 38,
+	BCM2712_FLT_EMMC0 = 39,
+	BCM2712_FLT_GENET = 40,
+	BCM2712_FLT_USB = 41,
+	BCM2712_FLT_ARGON = 42,
+	BCM2712_FLT_UNICAM = 43,
+	BCM2712_FLT_PISP = 44,
+	BCM2712_FLT_PISPFE = 45,
+	BCM2712_FLT_JPEG = 46,
+	BCM2712_FLT_EMMC1 = 47,
+	BCM2712_FLT_EMMC2 = 48,
+	BCM2712_FLT_TRC = 52,
+	BCM2712_FLT_BSTM0 = 53,
+	BCM2712_FLT_BSTM1 = 54,
+	BCM2712_FLT_BSTM0_SEC = 55,
+	BCM2712_FLT_BSTM1_SEC = 56,
+	BCM2712_FLT_AIO = 57,
+	BCM2712_FLT_MAP = 58,
+	BCM2712_FLT_SYS_DMA = 59,
+	BCM2712_FLT_MMUCACHE0 = 60,
+	BCM2712_FLT_MMUCACHE1 = 61,
+	BCM2712_FLT_MPUCACHE0 = 62,
+	BCM2712_FLT_MPUCACHE1 = 63,
+	BCM2712_FLT_MAX = 64,
+};
+
 /* Hardware register offsets & control bitwise constants */
 #define GEN_CTRL			0x00
 #define GEN_CTL_ENABLE_BIT		BIT(0)
@@ -440,6 +614,13 @@ enum bcm2711_filter {
 #define BW_CTRL_BUS_WATCH_MASK		GENMASK(4, 0)
 #define BW_CTRL_BUS_FILTER_SHIFT	8
 #define BW_CTRL_BUS_FILTER_MASK		GENMASK(12, 8)
+#define BW_CTRL_2712_FILTER_MASK	GENMASK(13, 8)
+#define BW_CTRL_AXI_ID			GENMASK(17, 8)
+#define BW_CTRL_AXI_ID_MASK		GENMASK(27, 18)
+#define AXI_ID_MASTER			GENMASK(8, 3)
+/* The D0 VPU monitor has a 6-bit ID holding the master directly, with its own mask */
+#define BW_CTRL_VPU_ID			GENMASK(13, 8)
+#define BW_CTRL_VPU_ID_MASK		GENMASK(23, 18)
 
 /*
  * RPI_AXI_PMU_TIMER_INTERVAL determines the background polling frequency
@@ -612,6 +793,7 @@ static int rpi_axi_hw_events__get_alloc_event_idx(struct rpi_axi_hw_events *hw_e
  * @pmu: Core Linux perf PMU structure
  * @pdev: Owning platform_device pointer
  * @chip: Detected Broadcom SoC generation (CHIP_BCM2835)
+ * @axi_id_mask: Bus watchers match a full AXI ID under a mask (BCM2712 D0)
  * @firmware: Raspberry Pi firmware handle for VideoCore mailbox calls (BCM2835-BCM2711)
  * @cpu: CPU core assigned to process uncore PMU events
  * @cpuhp_node: Dynamic CPU hotplug instance node
@@ -628,6 +810,7 @@ struct rpi_axi_pmu {
 	struct pmu		pmu;
 	struct platform_device	*pdev;
 	enum rpi_axi_chip	chip;
+	bool			axi_id_mask;
 	struct rpi_firmware	*firmware;
 	int			cpu;
 	struct hlist_node	cpuhp_node;
@@ -690,6 +873,15 @@ static bool config_is_valid(struct rpi_axi_pmu *pmu, __u64 config)
 		if (filter >= BCM2711_FLT_MAX)
 			return false;
 		break;
+	case CHIP_BCM2712:
+		if (mon == MON_SYSTEM &&
+		    bus >= (pmu->axi_id_mask ? BCM2712D0_SB_MAX : BCM2712_SB_MAX))
+			return false;
+		if (mon == MON_VPU && bus >= BCM2711_VB_MAX)
+			return false;
+		if (filter >= BCM2712_FLT_MAX)
+			return false;
+		break;
 	}
 
 	return counter < CNT_MAX;
@@ -1910,6 +2102,995 @@ static const struct attribute_group rpi_axi_pmu_bcm2711_events_group = {
 	.is_visible = rpi_axi_pmu_events_is_visible,
 };
 
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_atwait, bcm2712_vpu_vpu1_d_l2_atwait, "monitor=1,bus=0,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_atrans, bcm2712_vpu_vpu1_d_l2_atrans, "monitor=1,bus=0,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_amax, bcm2712_vpu_vpu1_d_l2_amax, "monitor=1,bus=0,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_wwait, bcm2712_vpu_vpu1_d_l2_wwait, "monitor=1,bus=0,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_wtrans, bcm2712_vpu_vpu1_d_l2_wtrans, "monitor=1,bus=0,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_wmax, bcm2712_vpu_vpu1_d_l2_wmax, "monitor=1,bus=0,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_rwait, bcm2712_vpu_vpu1_d_l2_rwait, "monitor=1,bus=0,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_rtrans, bcm2712_vpu_vpu1_d_l2_rtrans, "monitor=1,bus=0,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_rmax, bcm2712_vpu_vpu1_d_l2_rmax, "monitor=1,bus=0,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_rpend, bcm2712_vpu_vpu1_d_l2_rpend, "monitor=1,bus=0,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_l2_ratrans, bcm2712_vpu_vpu1_d_l2_ratrans, "monitor=1,bus=0,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_atwait, bcm2712_vpu_vpu0_d_l2_atwait, "monitor=1,bus=1,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_atrans, bcm2712_vpu_vpu0_d_l2_atrans, "monitor=1,bus=1,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_amax, bcm2712_vpu_vpu0_d_l2_amax, "monitor=1,bus=1,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_wwait, bcm2712_vpu_vpu0_d_l2_wwait, "monitor=1,bus=1,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_wtrans, bcm2712_vpu_vpu0_d_l2_wtrans, "monitor=1,bus=1,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_wmax, bcm2712_vpu_vpu0_d_l2_wmax, "monitor=1,bus=1,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_rwait, bcm2712_vpu_vpu0_d_l2_rwait, "monitor=1,bus=1,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_rtrans, bcm2712_vpu_vpu0_d_l2_rtrans, "monitor=1,bus=1,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_rmax, bcm2712_vpu_vpu0_d_l2_rmax, "monitor=1,bus=1,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_rpend, bcm2712_vpu_vpu0_d_l2_rpend, "monitor=1,bus=1,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_l2_ratrans, bcm2712_vpu_vpu0_d_l2_ratrans, "monitor=1,bus=1,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_atwait, bcm2712_vpu_vpu1_i_l2_atwait, "monitor=1,bus=2,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_atrans, bcm2712_vpu_vpu1_i_l2_atrans, "monitor=1,bus=2,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_amax, bcm2712_vpu_vpu1_i_l2_amax, "monitor=1,bus=2,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_wwait, bcm2712_vpu_vpu1_i_l2_wwait, "monitor=1,bus=2,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_wtrans, bcm2712_vpu_vpu1_i_l2_wtrans, "monitor=1,bus=2,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_wmax, bcm2712_vpu_vpu1_i_l2_wmax, "monitor=1,bus=2,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_rwait, bcm2712_vpu_vpu1_i_l2_rwait, "monitor=1,bus=2,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_rtrans, bcm2712_vpu_vpu1_i_l2_rtrans, "monitor=1,bus=2,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_rmax, bcm2712_vpu_vpu1_i_l2_rmax, "monitor=1,bus=2,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_rpend, bcm2712_vpu_vpu1_i_l2_rpend, "monitor=1,bus=2,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_l2_ratrans, bcm2712_vpu_vpu1_i_l2_ratrans, "monitor=1,bus=2,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_atwait, bcm2712_vpu_vpu0_i_l2_atwait, "monitor=1,bus=3,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_atrans, bcm2712_vpu_vpu0_i_l2_atrans, "monitor=1,bus=3,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_amax, bcm2712_vpu_vpu0_i_l2_amax, "monitor=1,bus=3,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_wwait, bcm2712_vpu_vpu0_i_l2_wwait, "monitor=1,bus=3,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_wtrans, bcm2712_vpu_vpu0_i_l2_wtrans, "monitor=1,bus=3,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_wmax, bcm2712_vpu_vpu0_i_l2_wmax, "monitor=1,bus=3,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_rwait, bcm2712_vpu_vpu0_i_l2_rwait, "monitor=1,bus=3,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_rtrans, bcm2712_vpu_vpu0_i_l2_rtrans, "monitor=1,bus=3,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_rmax, bcm2712_vpu_vpu0_i_l2_rmax, "monitor=1,bus=3,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_rpend, bcm2712_vpu_vpu0_i_l2_rpend, "monitor=1,bus=3,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_l2_ratrans, bcm2712_vpu_vpu0_i_l2_ratrans, "monitor=1,bus=3,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_atwait, bcm2712_vpu_system_l2_atwait, "monitor=1,bus=4,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_atrans, bcm2712_vpu_system_l2_atrans, "monitor=1,bus=4,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_amax, bcm2712_vpu_system_l2_amax, "monitor=1,bus=4,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_wwait, bcm2712_vpu_system_l2_wwait, "monitor=1,bus=4,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_wtrans, bcm2712_vpu_system_l2_wtrans, "monitor=1,bus=4,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_wmax, bcm2712_vpu_system_l2_wmax, "monitor=1,bus=4,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_rwait, bcm2712_vpu_system_l2_rwait, "monitor=1,bus=4,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_rtrans, bcm2712_vpu_system_l2_rtrans, "monitor=1,bus=4,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_rmax, bcm2712_vpu_system_l2_rmax, "monitor=1,bus=4,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_rpend, bcm2712_vpu_system_l2_rpend, "monitor=1,bus=4,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_system_l2_ratrans, bcm2712_vpu_system_l2_ratrans, "monitor=1,bus=4,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_atwait, bcm2712_vpu_dma_l2_atwait, "monitor=1,bus=5,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_atrans, bcm2712_vpu_dma_l2_atrans, "monitor=1,bus=5,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_amax, bcm2712_vpu_dma_l2_amax, "monitor=1,bus=5,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_wwait, bcm2712_vpu_dma_l2_wwait, "monitor=1,bus=5,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_wtrans, bcm2712_vpu_dma_l2_wtrans, "monitor=1,bus=5,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_wmax, bcm2712_vpu_dma_l2_wmax, "monitor=1,bus=5,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_rwait, bcm2712_vpu_dma_l2_rwait, "monitor=1,bus=5,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_rtrans, bcm2712_vpu_dma_l2_rtrans, "monitor=1,bus=5,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_rmax, bcm2712_vpu_dma_l2_rmax, "monitor=1,bus=5,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_rpend, bcm2712_vpu_dma_l2_rpend, "monitor=1,bus=5,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_dma_l2_ratrans, bcm2712_vpu_dma_l2_ratrans, "monitor=1,bus=5,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_atwait, bcm2712_vpu_vpu1_d_uc_atwait, "monitor=1,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_atrans, bcm2712_vpu_vpu1_d_uc_atrans, "monitor=1,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_amax, bcm2712_vpu_vpu1_d_uc_amax, "monitor=1,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_wwait, bcm2712_vpu_vpu1_d_uc_wwait, "monitor=1,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_wtrans, bcm2712_vpu_vpu1_d_uc_wtrans, "monitor=1,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_wmax, bcm2712_vpu_vpu1_d_uc_wmax, "monitor=1,bus=6,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_rwait, bcm2712_vpu_vpu1_d_uc_rwait, "monitor=1,bus=6,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_rtrans, bcm2712_vpu_vpu1_d_uc_rtrans, "monitor=1,bus=6,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_rmax, bcm2712_vpu_vpu1_d_uc_rmax, "monitor=1,bus=6,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_rpend, bcm2712_vpu_vpu1_d_uc_rpend, "monitor=1,bus=6,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_d_uc_ratrans, bcm2712_vpu_vpu1_d_uc_ratrans, "monitor=1,bus=6,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_atwait, bcm2712_vpu_vpu0_d_uc_atwait, "monitor=1,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_atrans, bcm2712_vpu_vpu0_d_uc_atrans, "monitor=1,bus=7,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_amax, bcm2712_vpu_vpu0_d_uc_amax, "monitor=1,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_wwait, bcm2712_vpu_vpu0_d_uc_wwait, "monitor=1,bus=7,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_wtrans, bcm2712_vpu_vpu0_d_uc_wtrans, "monitor=1,bus=7,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_wmax, bcm2712_vpu_vpu0_d_uc_wmax, "monitor=1,bus=7,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_rwait, bcm2712_vpu_vpu0_d_uc_rwait, "monitor=1,bus=7,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_rtrans, bcm2712_vpu_vpu0_d_uc_rtrans, "monitor=1,bus=7,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_rmax, bcm2712_vpu_vpu0_d_uc_rmax, "monitor=1,bus=7,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_rpend, bcm2712_vpu_vpu0_d_uc_rpend, "monitor=1,bus=7,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_d_uc_ratrans, bcm2712_vpu_vpu0_d_uc_ratrans, "monitor=1,bus=7,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_atwait, bcm2712_vpu_vpu1_i_uc_atwait, "monitor=1,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_atrans, bcm2712_vpu_vpu1_i_uc_atrans, "monitor=1,bus=8,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_amax, bcm2712_vpu_vpu1_i_uc_amax, "monitor=1,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_wwait, bcm2712_vpu_vpu1_i_uc_wwait, "monitor=1,bus=8,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_wtrans, bcm2712_vpu_vpu1_i_uc_wtrans, "monitor=1,bus=8,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_wmax, bcm2712_vpu_vpu1_i_uc_wmax, "monitor=1,bus=8,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_rwait, bcm2712_vpu_vpu1_i_uc_rwait, "monitor=1,bus=8,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_rtrans, bcm2712_vpu_vpu1_i_uc_rtrans, "monitor=1,bus=8,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_rmax, bcm2712_vpu_vpu1_i_uc_rmax, "monitor=1,bus=8,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_rpend, bcm2712_vpu_vpu1_i_uc_rpend, "monitor=1,bus=8,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu1_i_uc_ratrans, bcm2712_vpu_vpu1_i_uc_ratrans, "monitor=1,bus=8,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_atwait, bcm2712_vpu_vpu0_i_uc_atwait, "monitor=1,bus=9,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_atrans, bcm2712_vpu_vpu0_i_uc_atrans, "monitor=1,bus=9,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_amax, bcm2712_vpu_vpu0_i_uc_amax, "monitor=1,bus=9,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_wwait, bcm2712_vpu_vpu0_i_uc_wwait, "monitor=1,bus=9,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_wtrans, bcm2712_vpu_vpu0_i_uc_wtrans, "monitor=1,bus=9,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_wmax, bcm2712_vpu_vpu0_i_uc_wmax, "monitor=1,bus=9,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_rwait, bcm2712_vpu_vpu0_i_uc_rwait, "monitor=1,bus=9,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_rtrans, bcm2712_vpu_vpu0_i_uc_rtrans, "monitor=1,bus=9,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_rmax, bcm2712_vpu_vpu0_i_uc_rmax, "monitor=1,bus=9,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_rpend, bcm2712_vpu_vpu0_i_uc_rpend, "monitor=1,bus=9,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu0_i_uc_ratrans, bcm2712_vpu_vpu0_i_uc_ratrans, "monitor=1,bus=9,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_atwait, bcm2712_vpu_vpu_uc_atwait, "monitor=1,bus=10,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_atrans, bcm2712_vpu_vpu_uc_atrans, "monitor=1,bus=10,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_amax, bcm2712_vpu_vpu_uc_amax, "monitor=1,bus=10,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_wwait, bcm2712_vpu_vpu_uc_wwait, "monitor=1,bus=10,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_wtrans, bcm2712_vpu_vpu_uc_wtrans, "monitor=1,bus=10,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_wmax, bcm2712_vpu_vpu_uc_wmax, "monitor=1,bus=10,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_rwait, bcm2712_vpu_vpu_uc_rwait, "monitor=1,bus=10,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_rtrans, bcm2712_vpu_vpu_uc_rtrans, "monitor=1,bus=10,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_rmax, bcm2712_vpu_vpu_uc_rmax, "monitor=1,bus=10,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_rpend, bcm2712_vpu_vpu_uc_rpend, "monitor=1,bus=10,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_vpu_uc_ratrans, bcm2712_vpu_vpu_uc_ratrans, "monitor=1,bus=10,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_atwait, bcm2712_vpu_l2_out_atwait, "monitor=1,bus=11,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_atrans, bcm2712_vpu_l2_out_atrans, "monitor=1,bus=11,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_amax, bcm2712_vpu_l2_out_amax, "monitor=1,bus=11,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_wwait, bcm2712_vpu_l2_out_wwait, "monitor=1,bus=11,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_wtrans, bcm2712_vpu_l2_out_wtrans, "monitor=1,bus=11,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_wmax, bcm2712_vpu_l2_out_wmax, "monitor=1,bus=11,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_rwait, bcm2712_vpu_l2_out_rwait, "monitor=1,bus=11,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_rtrans, bcm2712_vpu_l2_out_rtrans, "monitor=1,bus=11,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_rmax, bcm2712_vpu_l2_out_rmax, "monitor=1,bus=11,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_rpend, bcm2712_vpu_l2_out_rpend, "monitor=1,bus=11,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_l2_out_ratrans, bcm2712_vpu_l2_out_ratrans, "monitor=1,bus=11,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_atwait, bcm2712_vpu_dma_uc_atwait, "monitor=1,bus=12,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_atrans, bcm2712_vpu_dma_uc_atrans, "monitor=1,bus=12,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_amax, bcm2712_vpu_dma_uc_amax, "monitor=1,bus=12,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_wwait, bcm2712_vpu_dma_uc_wwait, "monitor=1,bus=12,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_wtrans, bcm2712_vpu_dma_uc_wtrans, "monitor=1,bus=12,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_wmax, bcm2712_vpu_dma_uc_wmax, "monitor=1,bus=12,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_rwait, bcm2712_vpu_dma_uc_rwait, "monitor=1,bus=12,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_rtrans, bcm2712_vpu_dma_uc_rtrans, "monitor=1,bus=12,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_rmax, bcm2712_vpu_dma_uc_rmax, "monitor=1,bus=12,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_rpend, bcm2712_vpu_dma_uc_rpend, "monitor=1,bus=12,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_dma_uc_ratrans, bcm2712_vpu_dma_uc_ratrans, "monitor=1,bus=12,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_atwait, bcm2712_vpu_l2_in_atwait, "monitor=1,bus=13,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_atrans, bcm2712_vpu_l2_in_atrans, "monitor=1,bus=13,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_amax, bcm2712_vpu_l2_in_amax, "monitor=1,bus=13,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_wwait, bcm2712_vpu_l2_in_wwait, "monitor=1,bus=13,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_wtrans, bcm2712_vpu_l2_in_wtrans, "monitor=1,bus=13,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_wmax, bcm2712_vpu_l2_in_wmax, "monitor=1,bus=13,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_rwait, bcm2712_vpu_l2_in_rwait, "monitor=1,bus=13,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_rtrans, bcm2712_vpu_l2_in_rtrans, "monitor=1,bus=13,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_rmax, bcm2712_vpu_l2_in_rmax, "monitor=1,bus=13,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_rpend, bcm2712_vpu_l2_in_rpend, "monitor=1,bus=13,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_l2_in_ratrans, bcm2712_vpu_l2_in_ratrans, "monitor=1,bus=13,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_uc_atwait, bcm2712_vpu_uc_atwait, "monitor=0,bus=0,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_uc_atrans, bcm2712_vpu_uc_atrans, "monitor=0,bus=0,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_uc_amax, bcm2712_vpu_uc_amax, "monitor=0,bus=0,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_uc_wwait, bcm2712_vpu_uc_wwait, "monitor=0,bus=0,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_uc_wtrans, bcm2712_vpu_uc_wtrans, "monitor=0,bus=0,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_uc_wmax, bcm2712_vpu_uc_wmax, "monitor=0,bus=0,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_uc_rwait, bcm2712_vpu_uc_rwait, "monitor=0,bus=0,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_uc_rtrans, bcm2712_vpu_uc_rtrans, "monitor=0,bus=0,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_uc_rmax, bcm2712_vpu_uc_rmax, "monitor=0,bus=0,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_uc_rpend, bcm2712_vpu_uc_rpend, "monitor=0,bus=0,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_uc_ratrans, bcm2712_vpu_uc_ratrans, "monitor=0,bus=0,counter=10");
+PMU_EVENT_ATTR_STRING(display_atwait, bcm2712_display_atwait, "monitor=0,bus=1,counter=0");
+PMU_EVENT_ATTR_STRING(display_atrans, bcm2712_display_atrans, "monitor=0,bus=1,counter=1");
+PMU_EVENT_ATTR_STRING(display_amax, bcm2712_display_amax, "monitor=0,bus=1,counter=2");
+PMU_EVENT_ATTR_STRING(display_wwait, bcm2712_display_wwait, "monitor=0,bus=1,counter=3");
+PMU_EVENT_ATTR_STRING(display_wtrans, bcm2712_display_wtrans, "monitor=0,bus=1,counter=4");
+PMU_EVENT_ATTR_STRING(display_wmax, bcm2712_display_wmax, "monitor=0,bus=1,counter=5");
+PMU_EVENT_ATTR_STRING(display_rwait, bcm2712_display_rwait, "monitor=0,bus=1,counter=6");
+PMU_EVENT_ATTR_STRING(display_rtrans, bcm2712_display_rtrans, "monitor=0,bus=1,counter=7");
+PMU_EVENT_ATTR_STRING(display_rmax, bcm2712_display_rmax, "monitor=0,bus=1,counter=8");
+PMU_EVENT_ATTR_STRING(display_rpend, bcm2712_display_rpend, "monitor=0,bus=1,counter=9");
+PMU_EVENT_ATTR_STRING(display_ratrans, bcm2712_display_ratrans, "monitor=0,bus=1,counter=10");
+PMU_EVENT_ATTR_STRING(v3d_atwait, bcm2712_v3d_atwait, "monitor=0,bus=2,counter=0");
+PMU_EVENT_ATTR_STRING(v3d_atrans, bcm2712_v3d_atrans, "monitor=0,bus=2,counter=1");
+PMU_EVENT_ATTR_STRING(v3d_amax, bcm2712_v3d_amax, "monitor=0,bus=2,counter=2");
+PMU_EVENT_ATTR_STRING(v3d_wwait, bcm2712_v3d_wwait, "monitor=0,bus=2,counter=3");
+PMU_EVENT_ATTR_STRING(v3d_wtrans, bcm2712_v3d_wtrans, "monitor=0,bus=2,counter=4");
+PMU_EVENT_ATTR_STRING(v3d_wmax, bcm2712_v3d_wmax, "monitor=0,bus=2,counter=5");
+PMU_EVENT_ATTR_STRING(v3d_rwait, bcm2712_v3d_rwait, "monitor=0,bus=2,counter=6");
+PMU_EVENT_ATTR_STRING(v3d_rtrans, bcm2712_v3d_rtrans, "monitor=0,bus=2,counter=7");
+PMU_EVENT_ATTR_STRING(v3d_rmax, bcm2712_v3d_rmax, "monitor=0,bus=2,counter=8");
+PMU_EVENT_ATTR_STRING(v3d_rpend, bcm2712_v3d_rpend, "monitor=0,bus=2,counter=9");
+PMU_EVENT_ATTR_STRING(v3d_ratrans, bcm2712_v3d_ratrans, "monitor=0,bus=2,counter=10");
+PMU_EVENT_ATTR_STRING(arm_atwait, bcm2712_arm_atwait, "monitor=0,bus=3,counter=0");
+PMU_EVENT_ATTR_STRING(arm_atrans, bcm2712_arm_atrans, "monitor=0,bus=3,counter=1");
+PMU_EVENT_ATTR_STRING(arm_amax, bcm2712_arm_amax, "monitor=0,bus=3,counter=2");
+PMU_EVENT_ATTR_STRING(arm_wwait, bcm2712_arm_wwait, "monitor=0,bus=3,counter=3");
+PMU_EVENT_ATTR_STRING(arm_wtrans, bcm2712_arm_wtrans, "monitor=0,bus=3,counter=4");
+PMU_EVENT_ATTR_STRING(arm_wmax, bcm2712_arm_wmax, "monitor=0,bus=3,counter=5");
+PMU_EVENT_ATTR_STRING(arm_rwait, bcm2712_arm_rwait, "monitor=0,bus=3,counter=6");
+PMU_EVENT_ATTR_STRING(arm_rtrans, bcm2712_arm_rtrans, "monitor=0,bus=3,counter=7");
+PMU_EVENT_ATTR_STRING(arm_rmax, bcm2712_arm_rmax, "monitor=0,bus=3,counter=8");
+PMU_EVENT_ATTR_STRING(arm_rpend, bcm2712_arm_rpend, "monitor=0,bus=3,counter=9");
+PMU_EVENT_ATTR_STRING(arm_ratrans, bcm2712_arm_ratrans, "monitor=0,bus=3,counter=10");
+PMU_EVENT_ATTR_STRING(xpt_atwait, bcm2712_xpt_atwait, "monitor=0,bus=4,counter=0");
+PMU_EVENT_ATTR_STRING(xpt_atrans, bcm2712_xpt_atrans, "monitor=0,bus=4,counter=1");
+PMU_EVENT_ATTR_STRING(xpt_amax, bcm2712_xpt_amax, "monitor=0,bus=4,counter=2");
+PMU_EVENT_ATTR_STRING(xpt_wwait, bcm2712_xpt_wwait, "monitor=0,bus=4,counter=3");
+PMU_EVENT_ATTR_STRING(xpt_wtrans, bcm2712_xpt_wtrans, "monitor=0,bus=4,counter=4");
+PMU_EVENT_ATTR_STRING(xpt_wmax, bcm2712_xpt_wmax, "monitor=0,bus=4,counter=5");
+PMU_EVENT_ATTR_STRING(xpt_rwait, bcm2712_xpt_rwait, "monitor=0,bus=4,counter=6");
+PMU_EVENT_ATTR_STRING(xpt_rtrans, bcm2712_xpt_rtrans, "monitor=0,bus=4,counter=7");
+PMU_EVENT_ATTR_STRING(xpt_rmax, bcm2712_xpt_rmax, "monitor=0,bus=4,counter=8");
+PMU_EVENT_ATTR_STRING(xpt_rpend, bcm2712_xpt_rpend, "monitor=0,bus=4,counter=9");
+PMU_EVENT_ATTR_STRING(xpt_ratrans, bcm2712_xpt_ratrans, "monitor=0,bus=4,counter=10");
+PMU_EVENT_ATTR_STRING(pcie_02_atwait, bcm2712_pcie_02_atwait, "monitor=0,bus=5,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_02_atrans, bcm2712_pcie_02_atrans, "monitor=0,bus=5,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_02_amax, bcm2712_pcie_02_amax, "monitor=0,bus=5,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_02_wwait, bcm2712_pcie_02_wwait, "monitor=0,bus=5,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_02_wtrans, bcm2712_pcie_02_wtrans, "monitor=0,bus=5,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_02_wmax, bcm2712_pcie_02_wmax, "monitor=0,bus=5,counter=5");
+PMU_EVENT_ATTR_STRING(pcie_02_rwait, bcm2712_pcie_02_rwait, "monitor=0,bus=5,counter=6");
+PMU_EVENT_ATTR_STRING(pcie_02_rtrans, bcm2712_pcie_02_rtrans, "monitor=0,bus=5,counter=7");
+PMU_EVENT_ATTR_STRING(pcie_02_rmax, bcm2712_pcie_02_rmax, "monitor=0,bus=5,counter=8");
+PMU_EVENT_ATTR_STRING(pcie_02_rpend, bcm2712_pcie_02_rpend, "monitor=0,bus=5,counter=9");
+PMU_EVENT_ATTR_STRING(pcie_02_ratrans, bcm2712_pcie_02_ratrans, "monitor=0,bus=5,counter=10");
+PMU_EVENT_ATTR_STRING(pcie_01_atwait, bcm2712_pcie_01_atwait, "monitor=0,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_01_atrans, bcm2712_pcie_01_atrans, "monitor=0,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_01_amax, bcm2712_pcie_01_amax, "monitor=0,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_01_wwait, bcm2712_pcie_01_wwait, "monitor=0,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_01_wtrans, bcm2712_pcie_01_wtrans, "monitor=0,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_01_wmax, bcm2712_pcie_01_wmax, "monitor=0,bus=6,counter=5");
+PMU_EVENT_ATTR_STRING(pcie_01_rwait, bcm2712_pcie_01_rwait, "monitor=0,bus=6,counter=6");
+PMU_EVENT_ATTR_STRING(pcie_01_rtrans, bcm2712_pcie_01_rtrans, "monitor=0,bus=6,counter=7");
+PMU_EVENT_ATTR_STRING(pcie_01_rmax, bcm2712_pcie_01_rmax, "monitor=0,bus=6,counter=8");
+PMU_EVENT_ATTR_STRING(pcie_01_rpend, bcm2712_pcie_01_rpend, "monitor=0,bus=6,counter=9");
+PMU_EVENT_ATTR_STRING(pcie_01_ratrans, bcm2712_pcie_01_ratrans, "monitor=0,bus=6,counter=10");
+PMU_EVENT_ATTR_STRING(argon_atwait, bcm2712_argon_atwait, "monitor=0,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(argon_atrans, bcm2712_argon_atrans, "monitor=0,bus=7,counter=1");
+PMU_EVENT_ATTR_STRING(argon_amax, bcm2712_argon_amax, "monitor=0,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(argon_wwait, bcm2712_argon_wwait, "monitor=0,bus=7,counter=3");
+PMU_EVENT_ATTR_STRING(argon_wtrans, bcm2712_argon_wtrans, "monitor=0,bus=7,counter=4");
+PMU_EVENT_ATTR_STRING(argon_wmax, bcm2712_argon_wmax, "monitor=0,bus=7,counter=5");
+PMU_EVENT_ATTR_STRING(argon_rwait, bcm2712_argon_rwait, "monitor=0,bus=7,counter=6");
+PMU_EVENT_ATTR_STRING(argon_rtrans, bcm2712_argon_rtrans, "monitor=0,bus=7,counter=7");
+PMU_EVENT_ATTR_STRING(argon_rmax, bcm2712_argon_rmax, "monitor=0,bus=7,counter=8");
+PMU_EVENT_ATTR_STRING(argon_rpend, bcm2712_argon_rpend, "monitor=0,bus=7,counter=9");
+PMU_EVENT_ATTR_STRING(argon_ratrans, bcm2712_argon_ratrans, "monitor=0,bus=7,counter=10");
+PMU_EVENT_ATTR_STRING(emmc2_atwait, bcm2712_emmc2_atwait, "monitor=0,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(emmc2_atrans, bcm2712_emmc2_atrans, "monitor=0,bus=8,counter=1");
+PMU_EVENT_ATTR_STRING(emmc2_amax, bcm2712_emmc2_amax, "monitor=0,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(emmc2_wwait, bcm2712_emmc2_wwait, "monitor=0,bus=8,counter=3");
+PMU_EVENT_ATTR_STRING(emmc2_wtrans, bcm2712_emmc2_wtrans, "monitor=0,bus=8,counter=4");
+PMU_EVENT_ATTR_STRING(emmc2_wmax, bcm2712_emmc2_wmax, "monitor=0,bus=8,counter=5");
+PMU_EVENT_ATTR_STRING(emmc2_rwait, bcm2712_emmc2_rwait, "monitor=0,bus=8,counter=6");
+PMU_EVENT_ATTR_STRING(emmc2_rtrans, bcm2712_emmc2_rtrans, "monitor=0,bus=8,counter=7");
+PMU_EVENT_ATTR_STRING(emmc2_rmax, bcm2712_emmc2_rmax, "monitor=0,bus=8,counter=8");
+PMU_EVENT_ATTR_STRING(emmc2_rpend, bcm2712_emmc2_rpend, "monitor=0,bus=8,counter=9");
+PMU_EVENT_ATTR_STRING(emmc2_ratrans, bcm2712_emmc2_ratrans, "monitor=0,bus=8,counter=10");
+PMU_EVENT_ATTR_STRING(sd_dma_atwait, bcm2712_sd_dma_atwait, "monitor=0,bus=9,counter=0");
+PMU_EVENT_ATTR_STRING(sd_dma_atrans, bcm2712_sd_dma_atrans, "monitor=0,bus=9,counter=1");
+PMU_EVENT_ATTR_STRING(sd_dma_amax, bcm2712_sd_dma_amax, "monitor=0,bus=9,counter=2");
+PMU_EVENT_ATTR_STRING(sd_dma_wwait, bcm2712_sd_dma_wwait, "monitor=0,bus=9,counter=3");
+PMU_EVENT_ATTR_STRING(sd_dma_wtrans, bcm2712_sd_dma_wtrans, "monitor=0,bus=9,counter=4");
+PMU_EVENT_ATTR_STRING(sd_dma_wmax, bcm2712_sd_dma_wmax, "monitor=0,bus=9,counter=5");
+PMU_EVENT_ATTR_STRING(sd_dma_rwait, bcm2712_sd_dma_rwait, "monitor=0,bus=9,counter=6");
+PMU_EVENT_ATTR_STRING(sd_dma_rtrans, bcm2712_sd_dma_rtrans, "monitor=0,bus=9,counter=7");
+PMU_EVENT_ATTR_STRING(sd_dma_rmax, bcm2712_sd_dma_rmax, "monitor=0,bus=9,counter=8");
+PMU_EVENT_ATTR_STRING(sd_dma_rpend, bcm2712_sd_dma_rpend, "monitor=0,bus=9,counter=9");
+PMU_EVENT_ATTR_STRING(sd_dma_ratrans, bcm2712_sd_dma_ratrans, "monitor=0,bus=9,counter=10");
+PMU_EVENT_ATTR_STRING(hvdp_atwait, bcm2712_hvdp_atwait, "monitor=0,bus=10,counter=0");
+PMU_EVENT_ATTR_STRING(hvdp_atrans, bcm2712_hvdp_atrans, "monitor=0,bus=10,counter=1");
+PMU_EVENT_ATTR_STRING(hvdp_amax, bcm2712_hvdp_amax, "monitor=0,bus=10,counter=2");
+PMU_EVENT_ATTR_STRING(hvdp_wwait, bcm2712_hvdp_wwait, "monitor=0,bus=10,counter=3");
+PMU_EVENT_ATTR_STRING(hvdp_wtrans, bcm2712_hvdp_wtrans, "monitor=0,bus=10,counter=4");
+PMU_EVENT_ATTR_STRING(hvdp_wmax, bcm2712_hvdp_wmax, "monitor=0,bus=10,counter=5");
+PMU_EVENT_ATTR_STRING(hvdp_rwait, bcm2712_hvdp_rwait, "monitor=0,bus=10,counter=6");
+PMU_EVENT_ATTR_STRING(hvdp_rtrans, bcm2712_hvdp_rtrans, "monitor=0,bus=10,counter=7");
+PMU_EVENT_ATTR_STRING(hvdp_rmax, bcm2712_hvdp_rmax, "monitor=0,bus=10,counter=8");
+PMU_EVENT_ATTR_STRING(hvdp_rpend, bcm2712_hvdp_rpend, "monitor=0,bus=10,counter=9");
+PMU_EVENT_ATTR_STRING(hvdp_ratrans, bcm2712_hvdp_ratrans, "monitor=0,bus=10,counter=10");
+PMU_EVENT_ATTR_STRING(per_atwait, bcm2712_per_atwait, "monitor=0,bus=11,counter=0");
+PMU_EVENT_ATTR_STRING(per_atrans, bcm2712_per_atrans, "monitor=0,bus=11,counter=1");
+PMU_EVENT_ATTR_STRING(per_amax, bcm2712_per_amax, "monitor=0,bus=11,counter=2");
+PMU_EVENT_ATTR_STRING(per_wwait, bcm2712_per_wwait, "monitor=0,bus=11,counter=3");
+PMU_EVENT_ATTR_STRING(per_wtrans, bcm2712_per_wtrans, "monitor=0,bus=11,counter=4");
+PMU_EVENT_ATTR_STRING(per_wmax, bcm2712_per_wmax, "monitor=0,bus=11,counter=5");
+PMU_EVENT_ATTR_STRING(per_rwait, bcm2712_per_rwait, "monitor=0,bus=11,counter=6");
+PMU_EVENT_ATTR_STRING(per_rtrans, bcm2712_per_rtrans, "monitor=0,bus=11,counter=7");
+PMU_EVENT_ATTR_STRING(per_rmax, bcm2712_per_rmax, "monitor=0,bus=11,counter=8");
+PMU_EVENT_ATTR_STRING(per_rpend, bcm2712_per_rpend, "monitor=0,bus=11,counter=9");
+PMU_EVENT_ATTR_STRING(per_ratrans, bcm2712_per_ratrans, "monitor=0,bus=11,counter=10");
+PMU_EVENT_ATTR_STRING(system_l2_atwait, bcm2712_system_l2_atwait, "monitor=0,bus=12,counter=0");
+PMU_EVENT_ATTR_STRING(system_l2_atrans, bcm2712_system_l2_atrans, "monitor=0,bus=12,counter=1");
+PMU_EVENT_ATTR_STRING(system_l2_amax, bcm2712_system_l2_amax, "monitor=0,bus=12,counter=2");
+PMU_EVENT_ATTR_STRING(system_l2_wwait, bcm2712_system_l2_wwait, "monitor=0,bus=12,counter=3");
+PMU_EVENT_ATTR_STRING(system_l2_wtrans, bcm2712_system_l2_wtrans, "monitor=0,bus=12,counter=4");
+PMU_EVENT_ATTR_STRING(system_l2_wmax, bcm2712_system_l2_wmax, "monitor=0,bus=12,counter=5");
+PMU_EVENT_ATTR_STRING(system_l2_rwait, bcm2712_system_l2_rwait, "monitor=0,bus=12,counter=6");
+PMU_EVENT_ATTR_STRING(system_l2_rtrans, bcm2712_system_l2_rtrans, "monitor=0,bus=12,counter=7");
+PMU_EVENT_ATTR_STRING(system_l2_rmax, bcm2712_system_l2_rmax, "monitor=0,bus=12,counter=8");
+PMU_EVENT_ATTR_STRING(system_l2_rpend, bcm2712_system_l2_rpend, "monitor=0,bus=12,counter=9");
+PMU_EVENT_ATTR_STRING(system_l2_ratrans, bcm2712_system_l2_ratrans, "monitor=0,bus=12,counter=10");
+PMU_EVENT_ATTR_STRING(vpu_uc_atwait, bcm2712d0_vpu_uc_atwait, "monitor=0,bus=0,counter=0");
+PMU_EVENT_ATTR_STRING(vpu_uc_atrans, bcm2712d0_vpu_uc_atrans, "monitor=0,bus=0,counter=1");
+PMU_EVENT_ATTR_STRING(vpu_uc_amax, bcm2712d0_vpu_uc_amax, "monitor=0,bus=0,counter=2");
+PMU_EVENT_ATTR_STRING(vpu_uc_wwait, bcm2712d0_vpu_uc_wwait, "monitor=0,bus=0,counter=3");
+PMU_EVENT_ATTR_STRING(vpu_uc_wtrans, bcm2712d0_vpu_uc_wtrans, "monitor=0,bus=0,counter=4");
+PMU_EVENT_ATTR_STRING(vpu_uc_wmax, bcm2712d0_vpu_uc_wmax, "monitor=0,bus=0,counter=5");
+PMU_EVENT_ATTR_STRING(vpu_uc_rwait, bcm2712d0_vpu_uc_rwait, "monitor=0,bus=0,counter=6");
+PMU_EVENT_ATTR_STRING(vpu_uc_rtrans, bcm2712d0_vpu_uc_rtrans, "monitor=0,bus=0,counter=7");
+PMU_EVENT_ATTR_STRING(vpu_uc_rmax, bcm2712d0_vpu_uc_rmax, "monitor=0,bus=0,counter=8");
+PMU_EVENT_ATTR_STRING(vpu_uc_rpend, bcm2712d0_vpu_uc_rpend, "monitor=0,bus=0,counter=9");
+PMU_EVENT_ATTR_STRING(vpu_uc_ratrans, bcm2712d0_vpu_uc_ratrans, "monitor=0,bus=0,counter=10");
+PMU_EVENT_ATTR_STRING(display_atwait, bcm2712d0_display_atwait, "monitor=0,bus=1,counter=0");
+PMU_EVENT_ATTR_STRING(display_atrans, bcm2712d0_display_atrans, "monitor=0,bus=1,counter=1");
+PMU_EVENT_ATTR_STRING(display_amax, bcm2712d0_display_amax, "monitor=0,bus=1,counter=2");
+PMU_EVENT_ATTR_STRING(display_wwait, bcm2712d0_display_wwait, "monitor=0,bus=1,counter=3");
+PMU_EVENT_ATTR_STRING(display_wtrans, bcm2712d0_display_wtrans, "monitor=0,bus=1,counter=4");
+PMU_EVENT_ATTR_STRING(display_wmax, bcm2712d0_display_wmax, "monitor=0,bus=1,counter=5");
+PMU_EVENT_ATTR_STRING(display_rwait, bcm2712d0_display_rwait, "monitor=0,bus=1,counter=6");
+PMU_EVENT_ATTR_STRING(display_rtrans, bcm2712d0_display_rtrans, "monitor=0,bus=1,counter=7");
+PMU_EVENT_ATTR_STRING(display_rmax, bcm2712d0_display_rmax, "monitor=0,bus=1,counter=8");
+PMU_EVENT_ATTR_STRING(display_rpend, bcm2712d0_display_rpend, "monitor=0,bus=1,counter=9");
+PMU_EVENT_ATTR_STRING(display_ratrans, bcm2712d0_display_ratrans, "monitor=0,bus=1,counter=10");
+PMU_EVENT_ATTR_STRING(v3d_atwait, bcm2712d0_v3d_atwait, "monitor=0,bus=2,counter=0");
+PMU_EVENT_ATTR_STRING(v3d_atrans, bcm2712d0_v3d_atrans, "monitor=0,bus=2,counter=1");
+PMU_EVENT_ATTR_STRING(v3d_amax, bcm2712d0_v3d_amax, "monitor=0,bus=2,counter=2");
+PMU_EVENT_ATTR_STRING(v3d_wwait, bcm2712d0_v3d_wwait, "monitor=0,bus=2,counter=3");
+PMU_EVENT_ATTR_STRING(v3d_wtrans, bcm2712d0_v3d_wtrans, "monitor=0,bus=2,counter=4");
+PMU_EVENT_ATTR_STRING(v3d_wmax, bcm2712d0_v3d_wmax, "monitor=0,bus=2,counter=5");
+PMU_EVENT_ATTR_STRING(v3d_rwait, bcm2712d0_v3d_rwait, "monitor=0,bus=2,counter=6");
+PMU_EVENT_ATTR_STRING(v3d_rtrans, bcm2712d0_v3d_rtrans, "monitor=0,bus=2,counter=7");
+PMU_EVENT_ATTR_STRING(v3d_rmax, bcm2712d0_v3d_rmax, "monitor=0,bus=2,counter=8");
+PMU_EVENT_ATTR_STRING(v3d_rpend, bcm2712d0_v3d_rpend, "monitor=0,bus=2,counter=9");
+PMU_EVENT_ATTR_STRING(v3d_ratrans, bcm2712d0_v3d_ratrans, "monitor=0,bus=2,counter=10");
+PMU_EVENT_ATTR_STRING(arm_atwait, bcm2712d0_arm_atwait, "monitor=0,bus=3,counter=0");
+PMU_EVENT_ATTR_STRING(arm_atrans, bcm2712d0_arm_atrans, "monitor=0,bus=3,counter=1");
+PMU_EVENT_ATTR_STRING(arm_amax, bcm2712d0_arm_amax, "monitor=0,bus=3,counter=2");
+PMU_EVENT_ATTR_STRING(arm_wwait, bcm2712d0_arm_wwait, "monitor=0,bus=3,counter=3");
+PMU_EVENT_ATTR_STRING(arm_wtrans, bcm2712d0_arm_wtrans, "monitor=0,bus=3,counter=4");
+PMU_EVENT_ATTR_STRING(arm_wmax, bcm2712d0_arm_wmax, "monitor=0,bus=3,counter=5");
+PMU_EVENT_ATTR_STRING(arm_rwait, bcm2712d0_arm_rwait, "monitor=0,bus=3,counter=6");
+PMU_EVENT_ATTR_STRING(arm_rtrans, bcm2712d0_arm_rtrans, "monitor=0,bus=3,counter=7");
+PMU_EVENT_ATTR_STRING(arm_rmax, bcm2712d0_arm_rmax, "monitor=0,bus=3,counter=8");
+PMU_EVENT_ATTR_STRING(arm_rpend, bcm2712d0_arm_rpend, "monitor=0,bus=3,counter=9");
+PMU_EVENT_ATTR_STRING(arm_ratrans, bcm2712d0_arm_ratrans, "monitor=0,bus=3,counter=10");
+PMU_EVENT_ATTR_STRING(pcie_02_atwait, bcm2712d0_pcie_02_atwait, "monitor=0,bus=4,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_02_atrans, bcm2712d0_pcie_02_atrans, "monitor=0,bus=4,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_02_amax, bcm2712d0_pcie_02_amax, "monitor=0,bus=4,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_02_wwait, bcm2712d0_pcie_02_wwait, "monitor=0,bus=4,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_02_wtrans, bcm2712d0_pcie_02_wtrans, "monitor=0,bus=4,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_02_wmax, bcm2712d0_pcie_02_wmax, "monitor=0,bus=4,counter=5");
+PMU_EVENT_ATTR_STRING(pcie_02_rwait, bcm2712d0_pcie_02_rwait, "monitor=0,bus=4,counter=6");
+PMU_EVENT_ATTR_STRING(pcie_02_rtrans, bcm2712d0_pcie_02_rtrans, "monitor=0,bus=4,counter=7");
+PMU_EVENT_ATTR_STRING(pcie_02_rmax, bcm2712d0_pcie_02_rmax, "monitor=0,bus=4,counter=8");
+PMU_EVENT_ATTR_STRING(pcie_02_rpend, bcm2712d0_pcie_02_rpend, "monitor=0,bus=4,counter=9");
+PMU_EVENT_ATTR_STRING(pcie_02_ratrans, bcm2712d0_pcie_02_ratrans, "monitor=0,bus=4,counter=10");
+PMU_EVENT_ATTR_STRING(argon_atwait, bcm2712d0_argon_atwait, "monitor=0,bus=5,counter=0");
+PMU_EVENT_ATTR_STRING(argon_atrans, bcm2712d0_argon_atrans, "monitor=0,bus=5,counter=1");
+PMU_EVENT_ATTR_STRING(argon_amax, bcm2712d0_argon_amax, "monitor=0,bus=5,counter=2");
+PMU_EVENT_ATTR_STRING(argon_wwait, bcm2712d0_argon_wwait, "monitor=0,bus=5,counter=3");
+PMU_EVENT_ATTR_STRING(argon_wtrans, bcm2712d0_argon_wtrans, "monitor=0,bus=5,counter=4");
+PMU_EVENT_ATTR_STRING(argon_wmax, bcm2712d0_argon_wmax, "monitor=0,bus=5,counter=5");
+PMU_EVENT_ATTR_STRING(argon_rwait, bcm2712d0_argon_rwait, "monitor=0,bus=5,counter=6");
+PMU_EVENT_ATTR_STRING(argon_rtrans, bcm2712d0_argon_rtrans, "monitor=0,bus=5,counter=7");
+PMU_EVENT_ATTR_STRING(argon_rmax, bcm2712d0_argon_rmax, "monitor=0,bus=5,counter=8");
+PMU_EVENT_ATTR_STRING(argon_rpend, bcm2712d0_argon_rpend, "monitor=0,bus=5,counter=9");
+PMU_EVENT_ATTR_STRING(argon_ratrans, bcm2712d0_argon_ratrans, "monitor=0,bus=5,counter=10");
+PMU_EVENT_ATTR_STRING(emmc2_atwait, bcm2712d0_emmc2_atwait, "monitor=0,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(emmc2_atrans, bcm2712d0_emmc2_atrans, "monitor=0,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(emmc2_amax, bcm2712d0_emmc2_amax, "monitor=0,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(emmc2_wwait, bcm2712d0_emmc2_wwait, "monitor=0,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(emmc2_wtrans, bcm2712d0_emmc2_wtrans, "monitor=0,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(emmc2_wmax, bcm2712d0_emmc2_wmax, "monitor=0,bus=6,counter=5");
+PMU_EVENT_ATTR_STRING(emmc2_rwait, bcm2712d0_emmc2_rwait, "monitor=0,bus=6,counter=6");
+PMU_EVENT_ATTR_STRING(emmc2_rtrans, bcm2712d0_emmc2_rtrans, "monitor=0,bus=6,counter=7");
+PMU_EVENT_ATTR_STRING(emmc2_rmax, bcm2712d0_emmc2_rmax, "monitor=0,bus=6,counter=8");
+PMU_EVENT_ATTR_STRING(emmc2_rpend, bcm2712d0_emmc2_rpend, "monitor=0,bus=6,counter=9");
+PMU_EVENT_ATTR_STRING(emmc2_ratrans, bcm2712d0_emmc2_ratrans, "monitor=0,bus=6,counter=10");
+PMU_EVENT_ATTR_STRING(sd_dma_atwait, bcm2712d0_sd_dma_atwait, "monitor=0,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(sd_dma_atrans, bcm2712d0_sd_dma_atrans, "monitor=0,bus=7,counter=1");
+PMU_EVENT_ATTR_STRING(sd_dma_amax, bcm2712d0_sd_dma_amax, "monitor=0,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(sd_dma_wwait, bcm2712d0_sd_dma_wwait, "monitor=0,bus=7,counter=3");
+PMU_EVENT_ATTR_STRING(sd_dma_wtrans, bcm2712d0_sd_dma_wtrans, "monitor=0,bus=7,counter=4");
+PMU_EVENT_ATTR_STRING(sd_dma_wmax, bcm2712d0_sd_dma_wmax, "monitor=0,bus=7,counter=5");
+PMU_EVENT_ATTR_STRING(sd_dma_rwait, bcm2712d0_sd_dma_rwait, "monitor=0,bus=7,counter=6");
+PMU_EVENT_ATTR_STRING(sd_dma_rtrans, bcm2712d0_sd_dma_rtrans, "monitor=0,bus=7,counter=7");
+PMU_EVENT_ATTR_STRING(sd_dma_rmax, bcm2712d0_sd_dma_rmax, "monitor=0,bus=7,counter=8");
+PMU_EVENT_ATTR_STRING(sd_dma_rpend, bcm2712d0_sd_dma_rpend, "monitor=0,bus=7,counter=9");
+PMU_EVENT_ATTR_STRING(sd_dma_ratrans, bcm2712d0_sd_dma_ratrans, "monitor=0,bus=7,counter=10");
+PMU_EVENT_ATTR_STRING(per_atwait, bcm2712d0_per_atwait, "monitor=0,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(per_atrans, bcm2712d0_per_atrans, "monitor=0,bus=8,counter=1");
+PMU_EVENT_ATTR_STRING(per_amax, bcm2712d0_per_amax, "monitor=0,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(per_wwait, bcm2712d0_per_wwait, "monitor=0,bus=8,counter=3");
+PMU_EVENT_ATTR_STRING(per_wtrans, bcm2712d0_per_wtrans, "monitor=0,bus=8,counter=4");
+PMU_EVENT_ATTR_STRING(per_wmax, bcm2712d0_per_wmax, "monitor=0,bus=8,counter=5");
+PMU_EVENT_ATTR_STRING(per_rwait, bcm2712d0_per_rwait, "monitor=0,bus=8,counter=6");
+PMU_EVENT_ATTR_STRING(per_rtrans, bcm2712d0_per_rtrans, "monitor=0,bus=8,counter=7");
+PMU_EVENT_ATTR_STRING(per_rmax, bcm2712d0_per_rmax, "monitor=0,bus=8,counter=8");
+PMU_EVENT_ATTR_STRING(per_rpend, bcm2712d0_per_rpend, "monitor=0,bus=8,counter=9");
+PMU_EVENT_ATTR_STRING(per_ratrans, bcm2712d0_per_ratrans, "monitor=0,bus=8,counter=10");
+PMU_EVENT_ATTR_STRING(system_l2_atwait, bcm2712d0_system_l2_atwait, "monitor=0,bus=9,counter=0");
+PMU_EVENT_ATTR_STRING(system_l2_atrans, bcm2712d0_system_l2_atrans, "monitor=0,bus=9,counter=1");
+PMU_EVENT_ATTR_STRING(system_l2_amax, bcm2712d0_system_l2_amax, "monitor=0,bus=9,counter=2");
+PMU_EVENT_ATTR_STRING(system_l2_wwait, bcm2712d0_system_l2_wwait, "monitor=0,bus=9,counter=3");
+PMU_EVENT_ATTR_STRING(system_l2_wtrans, bcm2712d0_system_l2_wtrans, "monitor=0,bus=9,counter=4");
+PMU_EVENT_ATTR_STRING(system_l2_wmax, bcm2712d0_system_l2_wmax, "monitor=0,bus=9,counter=5");
+PMU_EVENT_ATTR_STRING(system_l2_rwait, bcm2712d0_system_l2_rwait, "monitor=0,bus=9,counter=6");
+PMU_EVENT_ATTR_STRING(system_l2_rtrans, bcm2712d0_system_l2_rtrans, "monitor=0,bus=9,counter=7");
+PMU_EVENT_ATTR_STRING(system_l2_rmax, bcm2712d0_system_l2_rmax, "monitor=0,bus=9,counter=8");
+PMU_EVENT_ATTR_STRING(system_l2_rpend, bcm2712d0_system_l2_rpend, "monitor=0,bus=9,counter=9");
+PMU_EVENT_ATTR_STRING(system_l2_ratrans, bcm2712d0_system_l2_ratrans, "monitor=0,bus=9,counter=10");
+
+static struct attribute *bcm2712_events[] = {
+	&bcm2712_vpu_uc_atwait.attr.attr,
+	&bcm2712_vpu_uc_atrans.attr.attr,
+	&bcm2712_vpu_uc_amax.attr.attr,
+	&bcm2712_vpu_uc_wwait.attr.attr,
+	&bcm2712_vpu_uc_wtrans.attr.attr,
+	&bcm2712_vpu_uc_wmax.attr.attr,
+	&bcm2712_vpu_uc_rwait.attr.attr,
+	&bcm2712_vpu_uc_rtrans.attr.attr,
+	&bcm2712_vpu_uc_rmax.attr.attr,
+	&bcm2712_vpu_uc_rpend.attr.attr,
+	&bcm2712_vpu_uc_ratrans.attr.attr,
+	&bcm2712_display_atwait.attr.attr,
+	&bcm2712_display_atrans.attr.attr,
+	&bcm2712_display_amax.attr.attr,
+	&bcm2712_display_wwait.attr.attr,
+	&bcm2712_display_wtrans.attr.attr,
+	&bcm2712_display_wmax.attr.attr,
+	&bcm2712_display_rwait.attr.attr,
+	&bcm2712_display_rtrans.attr.attr,
+	&bcm2712_display_rmax.attr.attr,
+	&bcm2712_display_rpend.attr.attr,
+	&bcm2712_display_ratrans.attr.attr,
+	&bcm2712_v3d_atwait.attr.attr,
+	&bcm2712_v3d_atrans.attr.attr,
+	&bcm2712_v3d_amax.attr.attr,
+	&bcm2712_v3d_wwait.attr.attr,
+	&bcm2712_v3d_wtrans.attr.attr,
+	&bcm2712_v3d_wmax.attr.attr,
+	&bcm2712_v3d_rwait.attr.attr,
+	&bcm2712_v3d_rtrans.attr.attr,
+	&bcm2712_v3d_rmax.attr.attr,
+	&bcm2712_v3d_rpend.attr.attr,
+	&bcm2712_v3d_ratrans.attr.attr,
+	&bcm2712_arm_atwait.attr.attr,
+	&bcm2712_arm_atrans.attr.attr,
+	&bcm2712_arm_amax.attr.attr,
+	&bcm2712_arm_wwait.attr.attr,
+	&bcm2712_arm_wtrans.attr.attr,
+	&bcm2712_arm_wmax.attr.attr,
+	&bcm2712_arm_rwait.attr.attr,
+	&bcm2712_arm_rtrans.attr.attr,
+	&bcm2712_arm_rmax.attr.attr,
+	&bcm2712_arm_rpend.attr.attr,
+	&bcm2712_arm_ratrans.attr.attr,
+	&bcm2712_xpt_atwait.attr.attr,
+	&bcm2712_xpt_atrans.attr.attr,
+	&bcm2712_xpt_amax.attr.attr,
+	&bcm2712_xpt_wwait.attr.attr,
+	&bcm2712_xpt_wtrans.attr.attr,
+	&bcm2712_xpt_wmax.attr.attr,
+	&bcm2712_xpt_rwait.attr.attr,
+	&bcm2712_xpt_rtrans.attr.attr,
+	&bcm2712_xpt_rmax.attr.attr,
+	&bcm2712_xpt_rpend.attr.attr,
+	&bcm2712_xpt_ratrans.attr.attr,
+	&bcm2712_pcie_02_atwait.attr.attr,
+	&bcm2712_pcie_02_atrans.attr.attr,
+	&bcm2712_pcie_02_amax.attr.attr,
+	&bcm2712_pcie_02_wwait.attr.attr,
+	&bcm2712_pcie_02_wtrans.attr.attr,
+	&bcm2712_pcie_02_wmax.attr.attr,
+	&bcm2712_pcie_02_rwait.attr.attr,
+	&bcm2712_pcie_02_rtrans.attr.attr,
+	&bcm2712_pcie_02_rmax.attr.attr,
+	&bcm2712_pcie_02_rpend.attr.attr,
+	&bcm2712_pcie_02_ratrans.attr.attr,
+	&bcm2712_pcie_01_atwait.attr.attr,
+	&bcm2712_pcie_01_atrans.attr.attr,
+	&bcm2712_pcie_01_amax.attr.attr,
+	&bcm2712_pcie_01_wwait.attr.attr,
+	&bcm2712_pcie_01_wtrans.attr.attr,
+	&bcm2712_pcie_01_wmax.attr.attr,
+	&bcm2712_pcie_01_rwait.attr.attr,
+	&bcm2712_pcie_01_rtrans.attr.attr,
+	&bcm2712_pcie_01_rmax.attr.attr,
+	&bcm2712_pcie_01_rpend.attr.attr,
+	&bcm2712_pcie_01_ratrans.attr.attr,
+	&bcm2712_argon_atwait.attr.attr,
+	&bcm2712_argon_atrans.attr.attr,
+	&bcm2712_argon_amax.attr.attr,
+	&bcm2712_argon_wwait.attr.attr,
+	&bcm2712_argon_wtrans.attr.attr,
+	&bcm2712_argon_wmax.attr.attr,
+	&bcm2712_argon_rwait.attr.attr,
+	&bcm2712_argon_rtrans.attr.attr,
+	&bcm2712_argon_rmax.attr.attr,
+	&bcm2712_argon_rpend.attr.attr,
+	&bcm2712_argon_ratrans.attr.attr,
+	&bcm2712_emmc2_atwait.attr.attr,
+	&bcm2712_emmc2_atrans.attr.attr,
+	&bcm2712_emmc2_amax.attr.attr,
+	&bcm2712_emmc2_wwait.attr.attr,
+	&bcm2712_emmc2_wtrans.attr.attr,
+	&bcm2712_emmc2_wmax.attr.attr,
+	&bcm2712_emmc2_rwait.attr.attr,
+	&bcm2712_emmc2_rtrans.attr.attr,
+	&bcm2712_emmc2_rmax.attr.attr,
+	&bcm2712_emmc2_rpend.attr.attr,
+	&bcm2712_emmc2_ratrans.attr.attr,
+	&bcm2712_sd_dma_atwait.attr.attr,
+	&bcm2712_sd_dma_atrans.attr.attr,
+	&bcm2712_sd_dma_amax.attr.attr,
+	&bcm2712_sd_dma_wwait.attr.attr,
+	&bcm2712_sd_dma_wtrans.attr.attr,
+	&bcm2712_sd_dma_wmax.attr.attr,
+	&bcm2712_sd_dma_rwait.attr.attr,
+	&bcm2712_sd_dma_rtrans.attr.attr,
+	&bcm2712_sd_dma_rmax.attr.attr,
+	&bcm2712_sd_dma_rpend.attr.attr,
+	&bcm2712_sd_dma_ratrans.attr.attr,
+	&bcm2712_hvdp_atwait.attr.attr,
+	&bcm2712_hvdp_atrans.attr.attr,
+	&bcm2712_hvdp_amax.attr.attr,
+	&bcm2712_hvdp_wwait.attr.attr,
+	&bcm2712_hvdp_wtrans.attr.attr,
+	&bcm2712_hvdp_wmax.attr.attr,
+	&bcm2712_hvdp_rwait.attr.attr,
+	&bcm2712_hvdp_rtrans.attr.attr,
+	&bcm2712_hvdp_rmax.attr.attr,
+	&bcm2712_hvdp_rpend.attr.attr,
+	&bcm2712_hvdp_ratrans.attr.attr,
+	&bcm2712_per_atwait.attr.attr,
+	&bcm2712_per_atrans.attr.attr,
+	&bcm2712_per_amax.attr.attr,
+	&bcm2712_per_wwait.attr.attr,
+	&bcm2712_per_wtrans.attr.attr,
+	&bcm2712_per_wmax.attr.attr,
+	&bcm2712_per_rwait.attr.attr,
+	&bcm2712_per_rtrans.attr.attr,
+	&bcm2712_per_rmax.attr.attr,
+	&bcm2712_per_rpend.attr.attr,
+	&bcm2712_per_ratrans.attr.attr,
+	&bcm2712_system_l2_atwait.attr.attr,
+	&bcm2712_system_l2_atrans.attr.attr,
+	&bcm2712_system_l2_amax.attr.attr,
+	&bcm2712_system_l2_wwait.attr.attr,
+	&bcm2712_system_l2_wtrans.attr.attr,
+	&bcm2712_system_l2_wmax.attr.attr,
+	&bcm2712_system_l2_rwait.attr.attr,
+	&bcm2712_system_l2_rtrans.attr.attr,
+	&bcm2712_system_l2_rmax.attr.attr,
+	&bcm2712_system_l2_rpend.attr.attr,
+	&bcm2712_system_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_ratrans.attr.attr,
+	&bcm2712_vpu_system_l2_atwait.attr.attr,
+	&bcm2712_vpu_system_l2_atrans.attr.attr,
+	&bcm2712_vpu_system_l2_amax.attr.attr,
+	&bcm2712_vpu_system_l2_wwait.attr.attr,
+	&bcm2712_vpu_system_l2_wtrans.attr.attr,
+	&bcm2712_vpu_system_l2_wmax.attr.attr,
+	&bcm2712_vpu_system_l2_rwait.attr.attr,
+	&bcm2712_vpu_system_l2_rtrans.attr.attr,
+	&bcm2712_vpu_system_l2_rmax.attr.attr,
+	&bcm2712_vpu_system_l2_rpend.attr.attr,
+	&bcm2712_vpu_system_l2_ratrans.attr.attr,
+	&bcm2712_vpu_dma_l2_atwait.attr.attr,
+	&bcm2712_vpu_dma_l2_atrans.attr.attr,
+	&bcm2712_vpu_dma_l2_amax.attr.attr,
+	&bcm2712_vpu_dma_l2_wwait.attr.attr,
+	&bcm2712_vpu_dma_l2_wtrans.attr.attr,
+	&bcm2712_vpu_dma_l2_wmax.attr.attr,
+	&bcm2712_vpu_dma_l2_rwait.attr.attr,
+	&bcm2712_vpu_dma_l2_rtrans.attr.attr,
+	&bcm2712_vpu_dma_l2_rmax.attr.attr,
+	&bcm2712_vpu_dma_l2_rpend.attr.attr,
+	&bcm2712_vpu_dma_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu_uc_ratrans.attr.attr,
+	&bcm2712_vpu_l2_out_atwait.attr.attr,
+	&bcm2712_vpu_l2_out_atrans.attr.attr,
+	&bcm2712_vpu_l2_out_amax.attr.attr,
+	&bcm2712_vpu_l2_out_wwait.attr.attr,
+	&bcm2712_vpu_l2_out_wtrans.attr.attr,
+	&bcm2712_vpu_l2_out_wmax.attr.attr,
+	&bcm2712_vpu_l2_out_rwait.attr.attr,
+	&bcm2712_vpu_l2_out_rtrans.attr.attr,
+	&bcm2712_vpu_l2_out_rmax.attr.attr,
+	&bcm2712_vpu_l2_out_rpend.attr.attr,
+	&bcm2712_vpu_l2_out_ratrans.attr.attr,
+	&bcm2712_vpu_dma_uc_atwait.attr.attr,
+	&bcm2712_vpu_dma_uc_atrans.attr.attr,
+	&bcm2712_vpu_dma_uc_amax.attr.attr,
+	&bcm2712_vpu_dma_uc_wwait.attr.attr,
+	&bcm2712_vpu_dma_uc_wtrans.attr.attr,
+	&bcm2712_vpu_dma_uc_wmax.attr.attr,
+	&bcm2712_vpu_dma_uc_rwait.attr.attr,
+	&bcm2712_vpu_dma_uc_rtrans.attr.attr,
+	&bcm2712_vpu_dma_uc_rmax.attr.attr,
+	&bcm2712_vpu_dma_uc_rpend.attr.attr,
+	&bcm2712_vpu_dma_uc_ratrans.attr.attr,
+	&bcm2712_vpu_l2_in_atwait.attr.attr,
+	&bcm2712_vpu_l2_in_atrans.attr.attr,
+	&bcm2712_vpu_l2_in_amax.attr.attr,
+	&bcm2712_vpu_l2_in_wwait.attr.attr,
+	&bcm2712_vpu_l2_in_wtrans.attr.attr,
+	&bcm2712_vpu_l2_in_wmax.attr.attr,
+	&bcm2712_vpu_l2_in_rwait.attr.attr,
+	&bcm2712_vpu_l2_in_rtrans.attr.attr,
+	&bcm2712_vpu_l2_in_rmax.attr.attr,
+	&bcm2712_vpu_l2_in_rpend.attr.attr,
+	&bcm2712_vpu_l2_in_ratrans.attr.attr,
+	NULL,
+};
+
+static struct attribute *bcm2712d0_events[] = {
+	&bcm2712d0_vpu_uc_atwait.attr.attr,
+	&bcm2712d0_vpu_uc_atrans.attr.attr,
+	&bcm2712d0_vpu_uc_amax.attr.attr,
+	&bcm2712d0_vpu_uc_wwait.attr.attr,
+	&bcm2712d0_vpu_uc_wtrans.attr.attr,
+	&bcm2712d0_vpu_uc_wmax.attr.attr,
+	&bcm2712d0_vpu_uc_rwait.attr.attr,
+	&bcm2712d0_vpu_uc_rtrans.attr.attr,
+	&bcm2712d0_vpu_uc_rmax.attr.attr,
+	&bcm2712d0_vpu_uc_rpend.attr.attr,
+	&bcm2712d0_vpu_uc_ratrans.attr.attr,
+	&bcm2712d0_display_atwait.attr.attr,
+	&bcm2712d0_display_atrans.attr.attr,
+	&bcm2712d0_display_amax.attr.attr,
+	&bcm2712d0_display_wwait.attr.attr,
+	&bcm2712d0_display_wtrans.attr.attr,
+	&bcm2712d0_display_wmax.attr.attr,
+	&bcm2712d0_display_rwait.attr.attr,
+	&bcm2712d0_display_rtrans.attr.attr,
+	&bcm2712d0_display_rmax.attr.attr,
+	&bcm2712d0_display_rpend.attr.attr,
+	&bcm2712d0_display_ratrans.attr.attr,
+	&bcm2712d0_v3d_atwait.attr.attr,
+	&bcm2712d0_v3d_atrans.attr.attr,
+	&bcm2712d0_v3d_amax.attr.attr,
+	&bcm2712d0_v3d_wwait.attr.attr,
+	&bcm2712d0_v3d_wtrans.attr.attr,
+	&bcm2712d0_v3d_wmax.attr.attr,
+	&bcm2712d0_v3d_rwait.attr.attr,
+	&bcm2712d0_v3d_rtrans.attr.attr,
+	&bcm2712d0_v3d_rmax.attr.attr,
+	&bcm2712d0_v3d_rpend.attr.attr,
+	&bcm2712d0_v3d_ratrans.attr.attr,
+	&bcm2712d0_arm_atwait.attr.attr,
+	&bcm2712d0_arm_atrans.attr.attr,
+	&bcm2712d0_arm_amax.attr.attr,
+	&bcm2712d0_arm_wwait.attr.attr,
+	&bcm2712d0_arm_wtrans.attr.attr,
+	&bcm2712d0_arm_wmax.attr.attr,
+	&bcm2712d0_arm_rwait.attr.attr,
+	&bcm2712d0_arm_rtrans.attr.attr,
+	&bcm2712d0_arm_rmax.attr.attr,
+	&bcm2712d0_arm_rpend.attr.attr,
+	&bcm2712d0_arm_ratrans.attr.attr,
+	&bcm2712d0_pcie_02_atwait.attr.attr,
+	&bcm2712d0_pcie_02_atrans.attr.attr,
+	&bcm2712d0_pcie_02_amax.attr.attr,
+	&bcm2712d0_pcie_02_wwait.attr.attr,
+	&bcm2712d0_pcie_02_wtrans.attr.attr,
+	&bcm2712d0_pcie_02_wmax.attr.attr,
+	&bcm2712d0_pcie_02_rwait.attr.attr,
+	&bcm2712d0_pcie_02_rtrans.attr.attr,
+	&bcm2712d0_pcie_02_rmax.attr.attr,
+	&bcm2712d0_pcie_02_rpend.attr.attr,
+	&bcm2712d0_pcie_02_ratrans.attr.attr,
+	&bcm2712d0_argon_atwait.attr.attr,
+	&bcm2712d0_argon_atrans.attr.attr,
+	&bcm2712d0_argon_amax.attr.attr,
+	&bcm2712d0_argon_wwait.attr.attr,
+	&bcm2712d0_argon_wtrans.attr.attr,
+	&bcm2712d0_argon_wmax.attr.attr,
+	&bcm2712d0_argon_rwait.attr.attr,
+	&bcm2712d0_argon_rtrans.attr.attr,
+	&bcm2712d0_argon_rmax.attr.attr,
+	&bcm2712d0_argon_rpend.attr.attr,
+	&bcm2712d0_argon_ratrans.attr.attr,
+	&bcm2712d0_emmc2_atwait.attr.attr,
+	&bcm2712d0_emmc2_atrans.attr.attr,
+	&bcm2712d0_emmc2_amax.attr.attr,
+	&bcm2712d0_emmc2_wwait.attr.attr,
+	&bcm2712d0_emmc2_wtrans.attr.attr,
+	&bcm2712d0_emmc2_wmax.attr.attr,
+	&bcm2712d0_emmc2_rwait.attr.attr,
+	&bcm2712d0_emmc2_rtrans.attr.attr,
+	&bcm2712d0_emmc2_rmax.attr.attr,
+	&bcm2712d0_emmc2_rpend.attr.attr,
+	&bcm2712d0_emmc2_ratrans.attr.attr,
+	&bcm2712d0_sd_dma_atwait.attr.attr,
+	&bcm2712d0_sd_dma_atrans.attr.attr,
+	&bcm2712d0_sd_dma_amax.attr.attr,
+	&bcm2712d0_sd_dma_wwait.attr.attr,
+	&bcm2712d0_sd_dma_wtrans.attr.attr,
+	&bcm2712d0_sd_dma_wmax.attr.attr,
+	&bcm2712d0_sd_dma_rwait.attr.attr,
+	&bcm2712d0_sd_dma_rtrans.attr.attr,
+	&bcm2712d0_sd_dma_rmax.attr.attr,
+	&bcm2712d0_sd_dma_rpend.attr.attr,
+	&bcm2712d0_sd_dma_ratrans.attr.attr,
+	&bcm2712d0_per_atwait.attr.attr,
+	&bcm2712d0_per_atrans.attr.attr,
+	&bcm2712d0_per_amax.attr.attr,
+	&bcm2712d0_per_wwait.attr.attr,
+	&bcm2712d0_per_wtrans.attr.attr,
+	&bcm2712d0_per_wmax.attr.attr,
+	&bcm2712d0_per_rwait.attr.attr,
+	&bcm2712d0_per_rtrans.attr.attr,
+	&bcm2712d0_per_rmax.attr.attr,
+	&bcm2712d0_per_rpend.attr.attr,
+	&bcm2712d0_per_ratrans.attr.attr,
+	&bcm2712d0_system_l2_atwait.attr.attr,
+	&bcm2712d0_system_l2_atrans.attr.attr,
+	&bcm2712d0_system_l2_amax.attr.attr,
+	&bcm2712d0_system_l2_wwait.attr.attr,
+	&bcm2712d0_system_l2_wtrans.attr.attr,
+	&bcm2712d0_system_l2_wmax.attr.attr,
+	&bcm2712d0_system_l2_rwait.attr.attr,
+	&bcm2712d0_system_l2_rtrans.attr.attr,
+	&bcm2712d0_system_l2_rmax.attr.attr,
+	&bcm2712d0_system_l2_rpend.attr.attr,
+	&bcm2712d0_system_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_d_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_d_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_i_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_amax.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_i_l2_ratrans.attr.attr,
+	&bcm2712_vpu_system_l2_atwait.attr.attr,
+	&bcm2712_vpu_system_l2_atrans.attr.attr,
+	&bcm2712_vpu_system_l2_amax.attr.attr,
+	&bcm2712_vpu_system_l2_wwait.attr.attr,
+	&bcm2712_vpu_system_l2_wtrans.attr.attr,
+	&bcm2712_vpu_system_l2_wmax.attr.attr,
+	&bcm2712_vpu_system_l2_rwait.attr.attr,
+	&bcm2712_vpu_system_l2_rtrans.attr.attr,
+	&bcm2712_vpu_system_l2_rmax.attr.attr,
+	&bcm2712_vpu_system_l2_rpend.attr.attr,
+	&bcm2712_vpu_system_l2_ratrans.attr.attr,
+	&bcm2712_vpu_dma_l2_atwait.attr.attr,
+	&bcm2712_vpu_dma_l2_atrans.attr.attr,
+	&bcm2712_vpu_dma_l2_amax.attr.attr,
+	&bcm2712_vpu_dma_l2_wwait.attr.attr,
+	&bcm2712_vpu_dma_l2_wtrans.attr.attr,
+	&bcm2712_vpu_dma_l2_wmax.attr.attr,
+	&bcm2712_vpu_dma_l2_rwait.attr.attr,
+	&bcm2712_vpu_dma_l2_rtrans.attr.attr,
+	&bcm2712_vpu_dma_l2_rmax.attr.attr,
+	&bcm2712_vpu_dma_l2_rpend.attr.attr,
+	&bcm2712_vpu_dma_l2_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_d_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_d_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu1_i_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu0_i_uc_ratrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_atwait.attr.attr,
+	&bcm2712_vpu_vpu_uc_atrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_amax.attr.attr,
+	&bcm2712_vpu_vpu_uc_wwait.attr.attr,
+	&bcm2712_vpu_vpu_uc_wtrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_wmax.attr.attr,
+	&bcm2712_vpu_vpu_uc_rwait.attr.attr,
+	&bcm2712_vpu_vpu_uc_rtrans.attr.attr,
+	&bcm2712_vpu_vpu_uc_rmax.attr.attr,
+	&bcm2712_vpu_vpu_uc_rpend.attr.attr,
+	&bcm2712_vpu_vpu_uc_ratrans.attr.attr,
+	&bcm2712_vpu_l2_out_atwait.attr.attr,
+	&bcm2712_vpu_l2_out_atrans.attr.attr,
+	&bcm2712_vpu_l2_out_amax.attr.attr,
+	&bcm2712_vpu_l2_out_wwait.attr.attr,
+	&bcm2712_vpu_l2_out_wtrans.attr.attr,
+	&bcm2712_vpu_l2_out_wmax.attr.attr,
+	&bcm2712_vpu_l2_out_rwait.attr.attr,
+	&bcm2712_vpu_l2_out_rtrans.attr.attr,
+	&bcm2712_vpu_l2_out_rmax.attr.attr,
+	&bcm2712_vpu_l2_out_rpend.attr.attr,
+	&bcm2712_vpu_l2_out_ratrans.attr.attr,
+	&bcm2712_vpu_dma_uc_atwait.attr.attr,
+	&bcm2712_vpu_dma_uc_atrans.attr.attr,
+	&bcm2712_vpu_dma_uc_amax.attr.attr,
+	&bcm2712_vpu_dma_uc_wwait.attr.attr,
+	&bcm2712_vpu_dma_uc_wtrans.attr.attr,
+	&bcm2712_vpu_dma_uc_wmax.attr.attr,
+	&bcm2712_vpu_dma_uc_rwait.attr.attr,
+	&bcm2712_vpu_dma_uc_rtrans.attr.attr,
+	&bcm2712_vpu_dma_uc_rmax.attr.attr,
+	&bcm2712_vpu_dma_uc_rpend.attr.attr,
+	&bcm2712_vpu_dma_uc_ratrans.attr.attr,
+	&bcm2712_vpu_l2_in_atwait.attr.attr,
+	&bcm2712_vpu_l2_in_atrans.attr.attr,
+	&bcm2712_vpu_l2_in_amax.attr.attr,
+	&bcm2712_vpu_l2_in_wwait.attr.attr,
+	&bcm2712_vpu_l2_in_wtrans.attr.attr,
+	&bcm2712_vpu_l2_in_wmax.attr.attr,
+	&bcm2712_vpu_l2_in_rwait.attr.attr,
+	&bcm2712_vpu_l2_in_rtrans.attr.attr,
+	&bcm2712_vpu_l2_in_rmax.attr.attr,
+	&bcm2712_vpu_l2_in_rpend.attr.attr,
+	&bcm2712_vpu_l2_in_ratrans.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group rpi_axi_pmu_bcm2712_events_group = {
+	.name = "events",
+	.attrs = bcm2712_events,
+	.is_visible = rpi_axi_pmu_events_is_visible,
+};
+
+static const struct attribute_group rpi_axi_pmu_bcm2712d0_events_group = {
+	.name = "events",
+	.attrs = bcm2712d0_events,
+	.is_visible = rpi_axi_pmu_events_is_visible,
+};
+
 static const struct attribute_group *rpi_axi_pmu_bcm2835_attr_groups[] = {
 	&rpi_axi_pmu_format_group,
 	&rpi_axi_pmu_bcm2835_events_group,
@@ -1924,6 +3105,20 @@ static const struct attribute_group *rpi_axi_pmu_bcm2711_attr_groups[] = {
 	NULL,
 };
 
+static const struct attribute_group *rpi_axi_pmu_bcm2712_attr_groups[] = {
+	&rpi_axi_pmu_format_group,
+	&rpi_axi_pmu_bcm2712_events_group,
+	&rpi_axi_pmu_cpumask_group,
+	NULL,
+};
+
+static const struct attribute_group *rpi_axi_pmu_bcm2712d0_attr_groups[] = {
+	&rpi_axi_pmu_format_group,
+	&rpi_axi_pmu_bcm2712d0_events_group,
+	&rpi_axi_pmu_cpumask_group,
+	NULL,
+};
+
 /**
  * rpi_axi_pmu__validate_event() - Validates single event resource capability
  * @pmu: Pointer to core PMU struct
@@ -2092,6 +3287,19 @@ static void set_bus_watcher_control(struct rpi_axi_pmu *pmu, enum monitor mon, i
 	}
 }
 
+static u32 rpi_axi_pmu_filter_bits(struct rpi_axi_pmu *pmu, enum monitor mon, int filter)
+{
+	if (pmu->axi_id_mask && mon == MON_VPU)
+		return FIELD_PREP(BW_CTRL_VPU_ID, filter) |
+		       FIELD_PREP(BW_CTRL_VPU_ID_MASK, GENMASK(5, 0));
+	if (pmu->axi_id_mask)
+		return FIELD_PREP(BW_CTRL_AXI_ID, FIELD_PREP(AXI_ID_MASTER, filter)) |
+		       FIELD_PREP(BW_CTRL_AXI_ID_MASK, AXI_ID_MASTER);
+	if (pmu->chip == CHIP_BCM2712)
+		return FIELD_PREP(BW_CTRL_2712_FILTER_MASK, filter);
+	return FIELD_PREP(BW_CTRL_BUS_FILTER_MASK, filter);
+}
+
 /**
  * rpi_axi_pmu_enable_bus_watcher() - Enables a hardware bus watcher unit
  * @pmu: Pointer to PMU context
@@ -2111,7 +3319,7 @@ static void rpi_axi_pmu_enable_bus_watcher(struct rpi_axi_pmu *pmu, enum monitor
 		      ((bus << BW_CTRL_BUS_WATCH_SHIFT) & BW_CTRL_BUS_WATCH_MASK);
 	if (filter) {
 		bus_control |= BW_CTRL_ENABLE_ID_FILTER_BIT;
-		bus_control |= FIELD_PREP(BW_CTRL_BUS_FILTER_MASK, filter);
+		bus_control |= rpi_axi_pmu_filter_bits(pmu, mon, filter);
 	}
 	if (!pmu->monitor[mon].hw_events.monitor_running) {
 		set_monitor_control(pmu, mon, GEN_CTL_RESET_BIT);
@@ -2769,6 +3977,16 @@ static int rpi_axi_pmu__init(struct rpi_axi_pmu *pmu, struct platform_device *pd
 		}
 	}
 
+	/* Only BCM2712 D0 and later implement the AXI ID mask field */
+	if (pmu->chip == CHIP_BCM2712 && pmu->monitor[MON_SYSTEM].base_address) {
+		void __iomem *ctrl = pmu->monitor[MON_SYSTEM].base_address + BW0_CTRL;
+		u32 old = readl(ctrl);
+
+		writel(BW_CTRL_AXI_ID_MASK, ctrl);
+		pmu->axi_id_mask = !!(readl(ctrl) & BW_CTRL_AXI_ID_MASK);
+		writel(old, ctrl);
+	}
+
 	if (pmu->monitor[MON_VPU].use_mailbox_interface &&
 	    !rpi_axi_pmu_vpu_accessible(pmu)) {
 		dev_warn(dev, "VPU monitor not accessible through firmware\n");
@@ -2790,7 +4008,11 @@ static int rpi_axi_pmu__init(struct rpi_axi_pmu *pmu, struct platform_device *pd
 		goto err_teardown;
 	}
 
-	if (pmu->chip == CHIP_BCM2711)
+	if (pmu->chip == CHIP_BCM2712 && pmu->axi_id_mask)
+		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2712d0_attr_groups;
+	else if (pmu->chip == CHIP_BCM2712)
+		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2712_attr_groups;
+	else if (pmu->chip == CHIP_BCM2711)
 		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2711_attr_groups;
 	else
 		pmu->pmu.attr_groups = (const struct attribute_group **)rpi_axi_pmu_bcm2835_attr_groups;
@@ -2876,6 +4098,10 @@ static const struct of_device_id rpi_axi_pmu_match[] = {
 		.compatible = "brcm,bcm2711-axiperf",
 		.data = (void *)CHIP_BCM2711,
 	},
+	{
+		.compatible = "brcm,bcm2712-axiperf",
+		.data = (void *)CHIP_BCM2712,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpi_axi_pmu_match);
-- 
2.56.0.385.gac671c819a-goog


