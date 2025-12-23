Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290ECE6F09F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 16:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRrkmvhzu2YQMk3bdMEXXwokIel0iB14JRo8xu+Pvg0=; b=jb/GTsDh1arwo+TxWKwe3o3ac3
	GYl77nYp1VlIUgBLEINx5HXLiPbLBrm8DAVkttZ8rDwy/SEAUqcgPUswEqYO+xme3SUSiOok3x/xt
	bYtWU6hiLWkYUCFprOyByHm2P5Mu4dFQls4pEUBEDA9IerGqFmS6OKFAHFWSDF1mi/LeNPjxiHwSM
	6Gp3tItcSI9fAsdWXC5LkvPiaQiIO2G+FcC5WOjplco6jYScnPt+Vie0dhoqh7AYhEDTuGePeg521
	4S66ZIt1buaatiiwOv/DkyGErrN+IVmCZkHu2YoPg1VSuQfK5c++dnSvjZbX8MCu74DCuipqLZum8
	DN/tZVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fk-0000000FlAM-38Kw;
	Tue, 23 Dec 2025 16:28:52 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fd-0000000Fl6N-2ayZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 16:28:48 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 360AA1FE66;
	Tue, 23 Dec 2025 17:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507323;
	bh=WRrkmvhzu2YQMk3bdMEXXwokIel0iB14JRo8xu+Pvg0=; h=From:To:Subject;
	b=w/FkMiIp2fwdn7DuybuT8W46jKLSkE9gX+eGG28zg0ZSuzfdy+wWDyTTg2sm5/xki
	 yDhCisMNpzc7h9EaDJketXxAD8qrv/2FivO0aj7zmiqVNT41fY9yF+IcI6itGSdA0N
	 WbZGsEltrKb3OhNvMDMIJsQEFSeFTk/Q4QtfiwTnbNbaGbMowrtD+HjJXn6No6Wb91
	 ozaSimlRej36EWQKsgXutNC68m4FVoBhqYfPcN3jLY2v79uQIzs1+hTJEgixBDs9VL
	 E7SI5O5HiFKQfbeF0MwfLU+z0LOgFtEYF4/pD10Ly41i7oz5bN0AyMODu9VHkv05QK
	 JL2r/R9TgRrXA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/4] arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
Date: Tue, 23 Dec 2025 17:28:29 +0100
Message-ID: <20251223162833.138286-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_082846_605744_9DC21E8B 
X-CRM114-Status: GOOD (  10.53  )
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

Add support for NXP i.MX8QP SoC, this is pin to pin compatible variant
of the i.MX8QM, with a slower GPU and one Cortex A72 core instead of
two.

Link: https://www.nxp.com/products/i.MX8
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8qp.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qp.dtsi b/arch/arm64/boot/dts/freescale/imx8qp.dtsi
new file mode 100644
index 000000000000..26af9c5a51c5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+#include "imx8qm.dtsi"
+
+/delete-node/ &A72_1;
+
+&cluster1 {
+	/delete-node/ core1;
+};
+
+&gpu_3d0 {
+	assigned-clock-rates = <625000000>, <625000000>;
+};
+
+&thermal_zones {
+	cpu1-thermal {
+		cooling-maps {
+			map0 {
+				cooling-device =
+					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.47.3


