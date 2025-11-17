Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6398CCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NuOzoWu1ZX7kiDaJxWcvYRuB/bAwL3zBFJ7eTEgkTjA=; b=qmyq4aWLmiW4oj5RXO080tuzsY
	d+k+FZT0GQ4/NoHVMu6xlnApMhf8nSg/AjCllNtKs4fE2j7kWpEl5GAW9Ex3rrrjYk0L260pZQd89
	ViBDb2Zd8L4aABP3KPWbNGEfiRfRB5B8hERZ78HkUq/jYEASrqieO/kPeH73akqqeB8P4L0UBdb2d
	0q85t0ycB4WrvEQM+AVLnLcmg4kMYD7JlT86foYyRGdTufHdRkGvt5ECO/6gODrArFSoVC0jV+MDd
	Ax5knGops8U6DcPZgRnomO11k6fN2LfWAjY/X40i7gdge6hBOddlv1Fk3b7qFAuh0jb6xLdvgjmBK
	nQeO9T8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6XO-0000000Gs0q-3g7t;
	Mon, 17 Nov 2025 21:13:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL6XL-0000000Grzk-2tjX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5668B43306;
	Mon, 17 Nov 2025 21:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83947C2BCB9;
	Mon, 17 Nov 2025 21:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763414003;
	bh=jq1Emf1oDWfJ6t8L5tAfm+ZeQHcFmUcK0fvV0zCk7aI=;
	h=From:To:Cc:Subject:Date:From;
	b=L2KAMUEtciD6KR3xc6xSlviWQpcKO95d4+mGSIqTLrhX01pEVN1jvhdeY6O/52k4Z
	 BUtwd21vXmoWe4MxLni6cANy48YYcKqmjDIWLw+lrZ568hTjbU2KMavkKuREnV6hfh
	 pPSn986/nksabiXQzBv96TDWgMDmvTCWHWG3vtduRNRd5ALHd+n3JHuVioGPkSdj5P
	 7dwqkEeEkMy9chC7JgASFCWX2m5i4DQ2Y4yxi7QZVKtFWhxldN90HFv5Gc0BYtSWx5
	 K0w0MO33div3PSb8WEEm5kP+QayJMBo+qe+h6rivY5pF/ebDNDKAzFmfy220ZqY8ks
	 yrwOIXUVQ1NBQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: Add missing applied DT overlay targets
Date: Mon, 17 Nov 2025 15:13:15 -0600
Message-ID: <20251117211316.725960-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_131323_769365_922E55CB 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

It's a requirement that DT overlays be applied at build time in order to
validate them as overlays are not validated on their own.

Add the missing TI overlays. Some of the TI overlays have the first part
needed (a "*-dtbs" variable), but not the second part adding the target to
dtb-y/dtb- variable.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
This will soon be a warning[1].

[1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
---
 arch/arm64/boot/dts/ti/Makefile | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 743115b849a7..54c4a6ba23c7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -115,7 +115,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-j7200-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j7200-evm-pcie1-ep.dtbo
 
 # Boards with J721e SoC
-k3-j721e-evm-dtbs := k3-j721e-common-proc-board.dtb k3-j721e-evm-quad-port-eth-exp.dtbo
+k3-j721e-evm-dtbs := k3-j721e-common-proc-board.dtb \
+	k3-j721e-evm-quad-port-eth-exp.dtbo k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-beagleboneai64.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
@@ -177,6 +178,7 @@ k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
+k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-sk-csi2-imx219-dtbs := k3-am62a7-sk.dtb \
 	k3-am62x-sk-csi2-imx219.dtbo
 k3-am62a7-sk-csi2-ov5640-dtbs := k3-am62a7-sk.dtb \
@@ -254,11 +256,17 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
+	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
+	k3-am625-phyboard-lyra-disable-rtc.dtb \
+	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
+	k3-am625-phyboard-lyra-gpio-fan.dtb \
+	k3-am625-phyboard-lyra-qspi-nor.dtb \
 	k3-am625-sk-csi2-imx219.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
+	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-sk-csi2-imx219.dtb \
 	k3-am62a7-sk-csi2-ov5640.dtb \
 	k3-am62a7-sk-hdmi-audio.dtb \
@@ -268,6 +276,14 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
 	k3-am642-evm-pcie0-ep.dtb \
+	k3-am642-phyboard-electra-disable-eth-phy.dtb \
+	k3-am642-phyboard-electra-disable-rtc.dtb \
+	k3-am642-phyboard-electra-disable-spi-nor.dtb \
+	k3-am642-phyboard-electra-qspi-nor.dtb \
+	k3-am642-phyboard-electra-gpio-fan.dtb \
+	k3-am642-phyboard-electra-pcie-usb2.dtb \
+	k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtb \
+	k3-am642-phyboard-electra-peb-c-010.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
-- 
2.51.0


