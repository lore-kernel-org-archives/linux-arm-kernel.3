Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39425C88E6F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2lpOwqwwWWqvtF5ZG2J22MmAgTdqVo1i0uZSJYQvyg4=; b=M2iqdSMhf+L0Ul4O1Q1WDrFgyK
	b5j4L7vHTaC2+rYztvtZ915+IG8ByOt9iulr6OJp5/WyhUL5WDe6cKpOa4vwhZu/njdf0ed4h/CKC
	FYNT61N1/b4KE1IR7/ADJVmJXZUx+Vn+KH9PCpXAYvFAkvn0Zf0bsbGfvxw1MntTaTqN0Z1+KKsTL
	qcDNFJDC/GxFNMosBvtihJqiLAdXa62vxUKOIjTePVDqAXHJMaeJ79CyDqbyoMdxmDAXtei7hZQUv
	KDPb4h8hZcgfUc6AUnvO7m8klfvYT8ppfIulhzouNuZtCDDj7bQy4ybykRlslD/InRKrCC2D9mnwd
	zm/lE8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bah-00000004Stl-46kf;
	Mon, 14 Sep 2026 18:39:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Bae-00000004Ssx-21Vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 18:39:42 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2FA601FEC8;
	Mon, 14 Sep 2026 20:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789411178;
	bh=2lpOwqwwWWqvtF5ZG2J22MmAgTdqVo1i0uZSJYQvyg4=; h=From:To:Subject;
	b=0yeBtz7G3SjFamZwOgEoGQKJVcj29lojNIqR4oTjLqrv9ACPkNuwHNg9MisohyvKh
	 b4iB9m76RuXQ1NgjF5OW3Hf+3hIyrE0xM2Y8tSbedA+4zfQvcfeH98LkiWDSRDa9pb
	 7d7RpIjXuJCQXcQ4fp10Qk6gEJnJnzjGdeNgHvSZ4F288ZDGReVFx3hYS3lrArsRlM
	 Oyjiy4Vdod6WUcwCEKmYUz1NqICcgLZ2Qt+gbh7SYpDS3ll2JKnEuV17F8ICcpe6IE
	 j36RFuGc4qIqbykx8w1mDuFAkbHZ91F7rGnrAl90QaKRdI1kYTTwZh9Lgp/QpTq9vg
	 QrsTdTiWQFaFQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx8mp-verdin-yavia: fix external GPIOs
Date: Mon, 14 Sep 2026 20:39:31 +0200
Message-ID: <20260914183932.30325-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_113940_986428_2EE4F98C 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

pinctrl_gpios_ext_yavia (SODIMM 64/66) is defined but never applied to
gpio3, so those pins stay at their NAND reset function instead of GPIO.

Fix SODIMM 64 to the correct pad, MX8MP_IOMUXC_NAND_READY_B (GPIO3_IO16).

Fixes: b694fbe2ff40 ("arm64: dts: imx8mp-verdin: Add yavia carrier board")
Cc: stable@vger.kernel.org
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
index f3d28e23ba6c..2a90f312fb27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
@@ -117,6 +117,11 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpios_ext_yavia>;
+};
+
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>;
@@ -266,7 +271,7 @@ MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09	0x106	/* SODIMM 62 */
 
 	pinctrl_gpios_ext_yavia: gpiosextyaviagrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_CE1_B__GPIO3_IO02	0x106	/* SODIMM 64 */
+			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x106	/* SODIMM 64 */
 			MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14	0x106	/* SODIMM 66 */
 		>;
 	};
-- 
2.47.3


