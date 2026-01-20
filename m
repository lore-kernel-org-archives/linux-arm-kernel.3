Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98909D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S7951CmhBfNyeg6X5oFR/k3HQrKbwIeGqG50J+wopCs=; b=i0tBhGZixbg6iJl1zlieX7hFW4
	hlCV/IoEczTtDOeudyB5PO1Ll1IoS4z0FrrM1Sayw7YjRKfRt+EYGsYzKcNY57wZ6waJZQvh+vmMJ
	uwsVa5R9WNE7AlzbzRCF4dLkd7f9FU3aBHLpd7XBRFuqT5f7XRdrXGQZ+vyNXGK43/6/U3ocGvUPW
	5dOFbdyQggYOFXpWYOV1UojMEMMEynYjsOwR6xA75ykGf23Mfr5XzhgsSamgJMlmNjBTHCK/1a4rC
	Ek1WmHpoMb4XlDL3fBRbusdxlmnKqqNz4TB7k/q9g7j4x8elI35OvSE20WX1Phe56TxtkzK6nHj2S
	rCvRB1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8ZG-00000003Zcz-21PB;
	Tue, 20 Jan 2026 10:02:34 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8ZC-00000003ZcJ-1r6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:02:32 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 95CA11FA75;
	Tue, 20 Jan 2026 11:02:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1768903346;
	bh=S7951CmhBfNyeg6X5oFR/k3HQrKbwIeGqG50J+wopCs=; h=From:To:Subject;
	b=nXcYyEHE74KQFgZYlqNEYOwELUmuiRjg5OfOpQzSJvGrksJAWOIapHaax/BFHmdNC
	 vOaAziDCQq3TIVmDnugwbW0XJ2MKVA1pw6krg6+geqjdL35ykM3PqyEIs9otZRD2LT
	 u3JEsfuVeLKiMCPc0hocUoKRafgn2CV46g7diXpLkJZRL093EqxNPOEuvU2RCZA16X
	 nbR+kW27/OcRIovle8po3kwtzEuhEXrP8u+qZoXByFtpI5cfV8DmPyAUpGSme9T9xn
	 svducdGRKvgP5kMeMQxLK0U5Lvcl99tmNh+gnaigXi9OsRV7eyreWaXVXF+wlUOeqW
	 0QLZ759V9jyWQ==
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
Subject: [PATCH v1] arm64: dts: imx8-apalis: Disable the audmix
Date: Tue, 20 Jan 2026 11:02:20 +0100
Message-ID: <20260120100221.47274-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_020231_359502_F08BA28F 
X-CRM114-Status: UNSURE (   9.71  )
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

The audmix is not used on apalis imx8, disable it.

This solves the following warning message

  imx-audmix imx-audmix.0: failed to find SAI platform device
  imx-audmix imx-audmix.0: probe with driver imx-audmix failed with error -22

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi       | 4 ----
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 4 ----
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 06790255a764..6f5af37ba9af 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -22,10 +22,6 @@ &adc1 {
 	status = "okay";
 };
 
-&amix {
-	status = "okay";
-};
-
 &asrc0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 7022de46b8bf..97fcd865fe3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -62,10 +62,6 @@ &adc1 {
 	status = "okay";
 };
 
-&amix {
-	status = "okay";
-};
-
 &asrc0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 12732ed7f811..b70cf3e8f8c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -94,10 +94,6 @@ &adc1 {
 	status = "okay";
 };
 
-&amix {
-	status = "okay";
-};
-
 &asrc0 {
 	status = "okay";
 };
-- 
2.47.3


