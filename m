Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6597BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIvil1XTQQt9u3NhMsB/k5XUsEzU7eJBZS/1DsW0pLE=; b=ye31gRMsXhtXAJRMDM3lGSdrN9
	/k+ws61mGKV6CCvepIS+jVI0w8Vt99+iznFgn6tDCMUVJAaScsba3oHqeGoNbCKqxLZxCQUIYgvvI
	AM/Ri461FxXHifjWRqBmxaUVfyDrpFy1UJnfBmQwq50YPfmh2wllOi/lEivGP3gfwFVU9u0omlMEh
	sByShfAE1uXIBIXmZkEctiSNanQDAflGklYKEsOLYWukNqXpxkiB80PK8Jw4dRIySuUxcqXGyPnCE
	FU6NQlAoGEoamynJI7tQPDMZOHGvLINyYeyRwWaCGNlT6fh7WZYhwOsx77VunAas8hJ6V/Vgk9dfH
	m8+ghOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdDC-000000030A8-1hNw;
	Wed, 05 Feb 2025 11:04:54 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdBp-00000002zuG-2z6C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 11:03:31 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c448:5c9f:5d50:ad45])
	by laurent.telenet-ops.be with cmsmtp
	id 9n3M2E0045P95W301n3MM5; Wed, 05 Feb 2025 12:03:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfdBU-0000000Fss8-3JJ8;
	Wed, 05 Feb 2025 12:03:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfdBg-00000006O1x-3TeW;
	Wed, 05 Feb 2025 12:03:20 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: freescale: Switch to hp-det-gpios
Date: Wed,  5 Feb 2025 12:03:19 +0100
Message-ID: <accb30064064bb5987520b8c7e74a941b08140e6.1738753123.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_030329_896253_F684551A 
X-CRM114-Status: UNSURE (   9.82  )
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

Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in
Freescale Generic ASoC Sound Card device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Dependency commit cfd1054c65eefec3 ("ASoC: fsl-asoc-card: Add missing
    handling of {hp,mic}-dt-gpios") is in v6.13.
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts      | 2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 50fd3370f7dce9b3..fe186b4bcb48ccbf 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -249,7 +249,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
 		audio-routing =	"Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index be79c793213a53f6..190a19b0a2f5a445 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -213,7 +213,7 @@ sound-wm8960 {
 		model = "wm8960-audio";
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
-		hp-det-gpio = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&lsio_gpio1 0 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 8bc066c3760cb13b..4ba86a6e7e28907b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -183,7 +183,7 @@ sound-wm8962 {
 		model = "wm8962-audio";
 		audio-cpu = <&sai3>;
 		audio-codec = <&wm8962>;
-		hp-det-gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
 		audio-routing = "Headphone Jack", "HPOUTL",
 				"Headphone Jack", "HPOUTR",
 				"Ext Spk", "SPKOUTL",
-- 
2.43.0


