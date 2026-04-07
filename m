Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245A1FEEF25
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=j0DMuMONrRv8UpM3Cja7uLBbiJ
	6yA2H6skQOUP0GSCqnNuYihIaVBnqkha27cgFazRuV+OST4TSFVITtAuE/Af9ruCkSgcYtdAeRzUS
	TV/zRPxvdlv/X1FO4i1FrT0jm/MbgG29oaeUIAAYIILm+6AnvGcEWbnwHdyGNnsJbHeTmBtgFIUdw
	0SIRlzBg15nAef2/BG45GHs16IwJdgxBGK1+zK6NEgJZhF2Evu3SfnfjokzzCUw2y9v3NTlqSGt+B
	LIcBvaSvWggSNjX8GChaZFakGu76mhplQDkoD31QX+8MXFFIA8MhgVuM37dWbMzc24abWzmVw5abf
	+jjg/grg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4q2-00000006OCv-0cBL;
	Tue, 07 Apr 2026 11:43:22 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4pu-00000006O5g-1HcP;
	Tue, 07 Apr 2026 11:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iXZKh39YA9QQda5suRG0NPBgfkw/vmM7xN5WKLiYDaU=; b=KolcFXn6jaP6Ezc5ELoY4CHeDE
	5UUtQvUEGdFBGtCo+KK1CcWybnglFHBKFkC/SRNhY/bAqNWep4bn4pHGNSS1D6zI2CZLWSNuhsXY5
	/0giUl3b3VuYljl1jimVrcbVO2HgVHUaeC9UCh9ZFUTK4HbK4qunewJb1n4UhTB4ndixIZCfwZLQ8
	7Si8wUoN+aoy71MwHVy9UF10HmEzeEWg8KVX71Me0eJ3XMIbd/qLfJukXDsWzZ5kdmCAN1318x0aK
	UHbqsTZsUHaUNdLojv97WXZnoHCseuqzPueOge4/xw4oLin86j2xmSdGZ01PrL0FAK6WUOhDPaRu1
	KHYkgJ7A==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wA4pr-000IKn-2L;
	Tue, 07 Apr 2026 13:43:11 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wA4pq-000PKA-0V;
	Tue, 07 Apr 2026 13:43:11 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v4 5/5] arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-sel and CPSW3G
Date: Tue,  7 Apr 2026 13:42:37 +0200
Message-ID: <391f17ba7b0e9dcaa1fc8210114dfda7eb3c0467.1775559102.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775559102.git.nora.schiffer@ew.tq-group.com>
References: <cover.1775559102.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27964/Tue Apr  7 08:24:40 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_044314_356316_6BBA1128 
X-CRM114-Status: UNSURE (   8.65  )
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

Update WIZ, gmii-sel and CPSW3G to use the J722S-specific compatible
strings, enabling SGMII support. The fallback compatibles preserve
compatibility of the updated Device Trees with older kernels.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 9ee5d0c8ffd1e..70f430aa3a944 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -18,7 +18,7 @@ serdes_refclk: clk-0 {
 
 &cbass_main {
 	serdes_wiz0: phy@f000000 {
-		compatible = "ti,am64-wiz-10g";
+		compatible = "ti,j722s-wiz-10g", "ti,am64-wiz-10g";
 		ranges = <0x0f000000 0x0 0x0f000000 0x00010000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -56,7 +56,7 @@ serdes0: serdes@f000000 {
 	};
 
 	serdes_wiz1: phy@f010000 {
-		compatible = "ti,am64-wiz-10g";
+		compatible = "ti,j722s-wiz-10g", "ti,am64-wiz-10g";
 		ranges = <0x0f010000 0x0 0x0f010000 0x00010000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -451,6 +451,14 @@ pcie0_ctrl: pcie0-ctrl@4070 {
 	};
 };
 
+&cpsw3g {
+	compatible = "ti,j722s-cpsw-nuss", "ti,am642-cpsw-nuss";
+};
+
+&phy_gmii_sel {
+	compatible = "ti,j722s-phy-gmii-sel", "ti,am654-phy-gmii-sel";
+};
+
 &oc_sram {
 	reg = <0x00 0x70000000 0x00 0x40000>;
 	ranges = <0x00 0x00 0x70000000 0x40000>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


