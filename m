Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ACFD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+JFtEDU/oKUi/rr51XwyYzzIDWFw8SGvZN3B2/eueY=; b=WQ0XldQfQ/bWhrL/N7Sm0nTuG+
	MnTfo4tURm0HeyoH9Xc7i9n8um2w/zD1Qezf7C6Li457vUqSjUXq3kZ5DUiiWCXJp+Pt/KRjpHjSl
	FC++bL2eeyibEQz4KVCMJqxBgG1cmqNmitsXM/Axir15n2uqZWIvL4wobK1QG47/RYCm60hB8zNOR
	Agm8CX0fS/enr0fZ1p7+EY6gdCV23QoD+hcsjHPJNm87NUxgzYW+Bx9Ku7lO0BPCgbSM1p7A95iBS
	GgwHxXdtDJYr+9IkXTU+RacFfcscEvDAeyYVdtf0TTrMU3/NpiapPNTv39xbSi/Muan2orbo+p7Oe
	ttgHgKIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunM-0000000E5s4-2Q9U;
	Tue, 09 Dec 2025 10:18:12 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSunH-0000000E5oz-49Sh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:18:09 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 894E122B28;
	Tue,  9 Dec 2025 11:18:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275486;
	bh=P+JFtEDU/oKUi/rr51XwyYzzIDWFw8SGvZN3B2/eueY=; h=From:To:Subject;
	b=VkZ7kgBzwHHZfMY9gd/n7EvwJq7XU0BJ/4CRbn1RdDQwSqYPjDwrL2jHEJgu3flXH
	 Qx9wfPEOM1YGD6sQD+JYIV7koXl5TYQ2hQDs9zqzdtLbXvoZC85wxJjbL9RXa3dx04
	 yX5hhoATWS01NKfrfHAHFOKK77LzioiuS1vOrJ/yOvUj9hM1VvZ8kpdcxAa30jm3ux
	 GtfjXEes4aZKjfwVAQif2dFvBITu/Qdk52+nXcjWDb1/8nTNP8KKv1YTXuSIaBY8yp
	 SG+kdpm9PEDeX8sTXnHfLhROvPvjiXcrxxV9WfUq3Husenhx02J6w6H4oiKZ8DiJtV
	 0d3penjE09kTQ==
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
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
Date: Tue,  9 Dec 2025 11:17:50 +0100
Message-ID: <20251209101754.54067-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209101754.54067-1-francesco@dolcini.it>
References: <20251209101754.54067-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_021808_183338_944D225A 
X-CRM114-Status: UNSURE (   8.96  )
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

Enable the hdmi_pai device on the various iMX8M Plus Verdin boards that
feature the related HDMI interface.

The hdmi_pai device, together with aud2htx module, hdmi_pai and hdmi
controller compose the HDMI audio pipeline.

See commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai
device") for the equivalent change on the NXP i.MX8MP EVK board.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi  | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 1493319aa748..0e218e6b8e29 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -112,6 +112,10 @@ &gpio4 {
 };
 
 /* Verdin HDMI_1 */
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index a38e7c947a42..72a4f846d694 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -121,6 +121,10 @@ &gpio_expander_21 {
 };
 
 /* Verdin HDMI_1 */
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 11cf3bdc95c4..846b36706821 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -109,6 +109,10 @@ &flexcan2 {
 };
 
 /* Verdin HDMI_1 */
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
index cc389cda2af2..f3d28e23ba6c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi
@@ -123,6 +123,10 @@ &gpio4 {
 };
 
 /* Verdin HDMI_1 */
+&hdmi_pai {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
-- 
2.47.3


