Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3676DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEmntNzIgvbd3ZfuZ5iUUv+8+XvQ/yURzasHSY5J4tk=; b=f0yE8SrcQejIZIuXOboffMKCOl
	e6KGIqGav/OfmOfvLay+w83sG8iXs8XecWxyoVcj3jnhig8sUos45g5Vk2Ai/olfGeNfh6G5XyxBS
	IEUGak2XqEMgSGw8tPc4e6VyM0zx53e4lhxnjiJJoYzk4bSeU9+i4gawS6Dx3zmZw1p6ju7HpF6DE
	CKWpkdtIJVkDLUYZHmGRUfzZqUAzsnmh7N4EMFcLV75SvuuP3I9Q7Dw69fnfWzs/Q0Za7h/O5Q4h7
	BWyvoOFhMC7bnauB0zj6vgGft4zQwkCW75bveXIyIhxwhlOBaAubHlBijwPBeYCTHF2QlM2DBIxgE
	6eN+lEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtA2-00000006ZEN-1vAe;
	Fri, 31 Oct 2025 17:43:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt9y-00000006ZAo-03Nk;
	Fri, 31 Oct 2025 17:43:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B54960254;
	Fri, 31 Oct 2025 17:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D29C4CEFD;
	Fri, 31 Oct 2025 17:43:26 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 23:13:00 +0530
Subject: [PATCH 2/3] arm64: dts: amlogic: Fix the register name of the
 'DBI' region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-pci-meson-fix-v1-2-ed29ee5b54f9@oss.qualcomm.com>
References: <20251031-pci-meson-fix-v1-0-ed29ee5b54f9@oss.qualcomm.com>
In-Reply-To: <20251031-pci-meson-fix-v1-0-ed29ee5b54f9@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 stable+noautosel@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2433;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=VrcDCZTTzA+LINiKOMWUnoZKZnxjToLdODEk4F9zscM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBPUvcQMtni6PxVu1WzyHwh/xmL2GTRT+gLMvD
 3qm9hdeZ82JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQT1LwAKCRBVnxHm/pHO
 9QHMCACn74/yrdyNkuDb9Q8ggaq3DyPe6Lw0cvTnujyKrgJVZFf4BQSXH9tHZIJSo6rkn1gvzeU
 y7G/UdAy/xQuL5rnUfvUUgyAlL3A5HNyAcNQaXuyDQzIDOMWLqFKmOuby6gPQLus//caL+9OSuU
 78GgAa726V7GAD1fDBNWct89KM/YCb2s9lDGBybJHhZH4rzLIkHtIUWu1ZccEOLbI+16JP8O4Np
 i8sXcpyBgm9fxygyysYjlqLNaAdnoeZIyp8Uz8xD8jpZSbmvnWua9BexejLp7QZjSJMqqmOr2i5
 CHcpusmuKf0WpntZ0ePbBJixideGxYB3Ov5AAsFVLCbkuuc2
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

DT incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must have
region for DWC controllers as it has the Root Port and controller specific
registers, while ELBI has optional registers.

Hence, fix the DT for both Meson platforms.

Cc: stable+noautosel@kernel.org # Driver dependency
Fixes: 5b3a9c20926e ("arm64: dts: meson-axg: add PCIe nodes")
Fixes: 1f8607d59763 ("arm64: dts: meson-g12a: Add PCIe node")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 04fb130ac7c6a498f7e8029aeaa7e511cbfe815d..e95c91894968b2c8b3b8e96a5f5e85cd60f3e085 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -208,7 +208,7 @@ pcieA: pcie@f9800000 {
 			reg = <0x0 0xf9800000 0x0 0x400000>,
 			      <0x0 0xff646000 0x0 0x2000>,
 			      <0x0 0xf9f00000 0x0 0x100000>;
-			reg-names = "elbi", "cfg", "config";
+			reg-names = "dbi", "cfg", "config";
 			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
@@ -234,7 +234,7 @@ pcieB: pcie@fa000000 {
 			reg = <0x0 0xfa000000 0x0 0x400000>,
 			      <0x0 0xff648000 0x0 0x2000>,
 			      <0x0 0xfa400000 0x0 0x100000>;
-			reg-names = "elbi", "cfg", "config";
+			reg-names = "dbi", "cfg", "config";
 			interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index dcc927a9da80246da43391f9f90049c3570f10d2..ca455f634834b5a52db8ff4e6ebca35a87ea17b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -138,7 +138,7 @@ pcie: pcie@fc000000 {
 			reg = <0x0 0xfc000000 0x0 0x400000>,
 			      <0x0 0xff648000 0x0 0x2000>,
 			      <0x0 0xfc400000 0x0 0x200000>;
-			reg-names = "elbi", "cfg", "config";
+			reg-names = "dbi", "cfg", "config";
 			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0>;

-- 
2.48.1


