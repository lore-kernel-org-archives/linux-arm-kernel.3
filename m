Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE08BC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 20:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRTL55Yp5rdfawk8dYsP2AMk1ZvGzyXpeQ+qidhSt5I=; b=NXhxrs33eMUxkRD3gR/DigRyQI
	FE3zPkyh0eUq+N8tcFwqaUhRYj4kbinsXd6ZLIyw2TvDEh9yHPk7CdvtD1yobDLVCBgJdpa1i81TS
	qkhkDLy0JxeKwx/HLWqOReJJHTg+3vMGKb8y2wv7wgj7vbPdg4iz9Oer1qbY4iqEgfBooT7A2/FLf
	/Brxr8UL/h2L5CvN1M5n8sc8N49gommCNFUZDvcgdUUIjGLMct8qH+o2YLyUlraNYbJ3O7WunHqVM
	j4eRCuFZrugySab8W8iE4rM6cLfxMt/L5rBY7riARLp5E9YoLI7LQHjHzjWPzSfh/nl4wRQyXHgit
	KeF/8tfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJHa2-00000007c2J-0BzY;
	Sun, 25 May 2025 20:04:22 +0000
Received: from 9.mo576.mail-out.ovh.net ([46.105.56.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJHVt-00000007bf3-2JJH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 20:00:07 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.51])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4b58rL0qr1z2xqP
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 20:00:01 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-cdtwd (unknown [10.110.188.135])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BD4071002C8;
	Sun, 25 May 2025 20:00:00 +0000 (UTC)
Received: from m-works.net ([37.59.142.102])
	by ghost-submission-5b5ff79f4f-cdtwd with ESMTPSA
	id vl/DI8B2M2gitwEAfeggxA
	(envelope-from <maciej.andrzejewski@m-works.net>); Sun, 25 May 2025 20:00:00 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-102R004bf5f71c3-fc6e-4fc8-87c4-48da0460db3c,
                    541B4E8188618F4BBD52FD3E2510040D9AEB4DAF) smtp.auth=maciej.andrzejewski@m-works.net
X-OVh-ClientIp: 80.238.108.7
Date: Sun, 25 May 2025 22:00:00 +0200
From: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
To: linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, maciej.andrzejewski@m-works.net,
	maciej.andrzejewski@iceye.com
Cc: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>,
	Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
Subject: [PATCH 2/2] DT bindings docs for Driver Xilinx ZynqMP AXI Timeout
 Block (ATB)
Message-ID: <20250525195955.2843076-2-maciej.andrzejewski@m-works.net>
References: <20250525195955.2843076-1-maciej.andrzejewski@m-works.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525195955.2843076-1-maciej.andrzejewski@m-works.net>
X-Mailer: git-send-email 2.43.0
X-Ovh-Tracer-Id: 8557120771103169438
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheehvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjofesthdtredtredtvdenucfhrhhomhepofgrtghivghjucetnhgurhiivghjvgifshhkihcuoehmrggtihgvjhdrrghnughriigvjhgvfihskhhisehmqdifohhrkhhsrdhnvghtqeenucggtffrrghtthgvrhhnpeeftdekudelvdfghfdvteduieeugeetvedvtedutdfhffekvdfhteeiheeileetgfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeduvdejrddtrddtrddupdektddrvdefkedruddtkedrjedpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrtghivghjrdgrnhgurhiivghjvgifshhkihesmhdqfihorhhkshdrnhgvthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_130005_874658_98BAF17E 
X-CRM114-Status: GOOD (  19.72  )
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

Add DT bindings docs for Driver Xilinx ZynqMP AXI Timeout Block (ATB)

Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
Signed-off-by: Maciej Andrzejewski <maciej.andrzejewski@iceye.com>
---
 .../bindings/soc/xilinx/xlnx,zynqmp-atb.yaml  | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml
new file mode 100644
index 000000000000..d92747fba947
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-atb.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/xilinx/xlnx,zynqmp-atb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx ZynqMP AXI Timeout Block peripheral
+
+maintainers:
+  - Maciej Andrzejewski <maciej.andrzejewski@m-works.net>
+
+description: |+
+
+  This module implements a driver for the Xilinx AXI Timeout Block (ATB).
+  The ATB is used to detect and handle timeouts on AXI transactions.
+  It supports configuration and handling of timeout interrupts for both
+  the Full Power Domain (FPD) and Low Power Domain (LPD) in Xilinx SoCs.
+  The driver reads configuration from the device tree, sets up the necessary
+  registers, and handles interrupts to report timeout events.
+
+  AXI timeouts can be harmful as they stall the bus and can potentially
+  stall the entire Linux system. Due to hardware limitations, this driver
+  cannot completely prevent bus stalls; only a limited number of AXI timeouts
+  can be registered before the bus will eventually stall.
+
+  It is important to note that this driver should produce dmesg error output
+  (grep for "atb: Timeout detected") to notify the user that the system
+  configuration is not properly handled. Once an AXI timeout is detected,
+  additional measures should be taken to address the issue.
+
+  The bool properties enable the corresponding interrupts for the
+  FPD and LPD.
+  The driver will read these properties and configure the ATB accordingly.
+  If the bool property is not present, the functionality for this ATB will be
+  disabled.
+
+  Enable this driver by selecting ZYNQMP_ATB in the kernel config.
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-atb
+
+  fpd_afifs1_enable:
+    description: |
+      ATB instance 5: FPD Main Switch to M_AXI_HPM1_FPD interface.
+      This is used to detect timeouts on the M_AXI_HPM1_FPD.
+    type: boolean
+    default: false
+
+  fpd_afifs0_enable:
+    description: |
+      ATB instance 4: FPD Main Switch to M_AXI_HPM0_FPD interface.
+      This is used to detect timeouts on the M_AXI_HPM0_FPD.
+    type: boolean
+    default: false
+
+  fpd_fpds_enable:
+    description: |
+      ATB instance 3: FPD Main Switch to SIOU slaves.
+      This is used to detect timeouts on the SIOU slaves.
+    type: boolean
+    default: false
+
+  lpd_afifs2_enable:
+    description: |
+      ATB instance 2: LPD Main Switch to M_AXI_HPM2_LPD interface.
+      This is used to detect timeouts on the M_AXI_HPM2_LPD.
+    type: boolean
+    default: false
+
+  lpd_lpdm_enable:
+    description: |
+      ATB instance 1: LPD Main Switch to M_AXI_LPD interface.
+      This is used to detect timeouts on the M_AXI_LPD.
+    type: boolean
+    default: false
+
+examples:
+  - |
+
+  atb {
+      compatible = "xlnx,zynqmp-atb";
+      status = "okay";
+
+      fpd_afifs1_enable;
+      fpd_afifs0_enable;
+      fpd_fpds_enable;
+      lpd_afifs2_enable;
+      lpd_lpdm_enable;
+    };
\ No newline at end of file
-- 
2.43.0


