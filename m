Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nMSxjznx4/Qt08Yb8825f0/CE7W0kNgz+LETDj/E50=; b=iHk4THj84D0PMSF/pZjK6I65AS
	Hxp/KiQz4ey7438ZDEx/LPUfdC2NNeMh3wJsROZBRtIsnDZCzVTMMIt8Ah5hjlzirqj6O0Jo+R1eo
	20QVbNQsUBZ8RLokd4Gj1lcOph0ZP6gJ143llDssAQMEj+UpNaBdkyXwQayTcbfQKLdghsjp2Mrk5
	ZKMB2FNuG7LZwLQrA+nClA/WgKNUPNMwAtuLF4n3wtkRn4pGjUV+w4pnYLxzxz6gVRpJNFC9oOIOi
	0Qa1nxmNhGR6lFJ+kBBSzXkly95HDakGuqhnuwkUQXnfQfqbpzFm+ptgAiHvdjKubd7+J8GUXJ1aA
	lekimn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqHk-00000008SWf-0mXS;
	Wed, 05 Mar 2025 15:03:48 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpouC-00000008D1i-3T80
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:35:26 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fba:8cad:3d23:9db3])
	by xavier.telenet-ops.be with cmsmtp
	id M1bK2E00J0exi8p011bKwq; Wed, 05 Mar 2025 14:35:20 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpotm-0000000Cv4X-2vVH;
	Wed, 05 Mar 2025 14:35:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tpou7-00000008wpn-3M9j;
	Wed, 05 Mar 2025 14:35:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
Date: Wed,  5 Mar 2025 14:35:13 +0100
Message-ID: <3e4fca228eb049d54a1ae520104558505dbdf803.1741179629.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_053525_006401_19FB5476 
X-CRM114-Status: UNSURE (   9.15  )
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

Describe the location in the E-FUSE block of the PLL and AFE tuning
parameters for the Universal Flash Storage controller.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Updated DT bindings and driver code are available in "[PATCH v3 0/7]
scsi: ufs: renesas: Add support for R-Car S4-8 ES1.2"
https://lore.kernel.org/cover.1741179611.git.geert+renesas@glider.be
---
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
index ebed41892df3346c..b216d605c321c2f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f4.dtsi
@@ -10,3 +10,20 @@
 / {
 	compatible = "renesas,r8a779f4", "renesas,r8a779f0";
 };
+
+&fuse {
+	nvmem-layout {
+		compatible = "fixed-layout";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ufs_tune: calib@144 {
+			reg = <0x144 0x08>;
+		};
+	};
+};
+
+&ufs {
+	nvmem-cells = <&ufs_tune>;
+	nvmem-cell-names = "calibration";
+};
-- 
2.43.0


