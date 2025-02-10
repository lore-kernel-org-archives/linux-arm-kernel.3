Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31448C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 20:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dV5w3UHBCGcbAsXZRRMC2zTxiPj8XCL5iTAd+5Q6CJ4=; b=Jc9gZIuYL/+afwan3aneYta4JQ
	08KcoH0dZPvUaeDA86j4qUzHLLZnZDG6uyAz5ENS4Ybquyy4xTNT6Ovh7t6VtLrEdq3lGtI8Cata7
	10uWSKIasHbaVEExcH7NaEh5eAxUHB1RX0iJMUHNggjmWt4WrYSgNu4EhBRRxjuXUl4CKapmttxgB
	LmfaN1NikyEmsYSyyUVM1bdLWekBblu6okKLJ58YyaGIo/fNCggcBaHXUYlx6dQgUar6hWx7qXPSW
	UxAiUG2DkIeyz9OCuV5vfqDXduKwTEdi4TEzXBDt13t78z8Ujen6441Xfaf/CYNvTeDjA6LZGvHeW
	kvjc9FVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaEj-00000001I5A-3iBV;
	Mon, 10 Feb 2025 20:18:33 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaDL-00000001HuV-0B7e;
	Mon, 10 Feb 2025 20:17:08 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1739218624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dV5w3UHBCGcbAsXZRRMC2zTxiPj8XCL5iTAd+5Q6CJ4=;
	b=IhlLpxqkJJL6dNK5E2+EUEooDerJiXSj4mLQXWRdr0ETtimSMCE4KJG+5yj9mTjaibyXAF
	ZEt0pv07TsKdBhIgJq5dygzn0OiFol+k2u9hmEyGYIYRO7RIcK6k+fgBcJYyhUSG0THH8/
	iQeme1JgJEjtopGYntiKfb6y/SWkc2FkEpSeFm+8i28Oz9iGdyEfnl6Ji622oiuq0Pb7fP
	VZPP7IufmFL9olgINwvyi1pdOZ5woL49uvSwrbP15qu7lajvdexo6K8e4BIIFOOCKTnlC4
	va9EgM1TlIc5j7rl8dPrHqXTkK210GfgVtl6CXBpIULxNAnPZ5c+J+HaJ8pYAg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [PATCH] arm64: dts: rockchip: Reflow Quartz64 Model A/B board dts files a bit
Date: Mon, 10 Feb 2025 21:17:00 +0100
Message-Id: <7eea4ebdb19d5f43d24074a166e6c46bb5424d46.1739218324.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_121707_235593_3A64D415 
X-CRM114-Status: UNSURE (   8.50  )
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

Going over the 80-column width limit, and using all 100 columns, is intended
for improving code readability.  This wasn't the case in a few places in the
Quartz64 Model A/B board dts files, so let's reflow them a bit, to both obey
the 80-column limit and make them a bit more readable.

No intended functional changes are introduced by these changes.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts | 8 ++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
index 98e75df8b158..3c127c5c2607 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
@@ -265,8 +265,12 @@ map1 {
 };
 
 &gmac1 {
-	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>, <&gmac1_clkin>;
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>,
+			  <&cru SCLK_GMAC1_RGMII_SPEED>,
+			  <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>,
+				 <&cru SCLK_GMAC1>,
+				 <&gmac1_clkin>;
 	clock_in_out = "input";
 	phy-supply = <&vcc_3v3>;
 	phy-mode = "rgmii";
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
index 24928a129446..5707321a1144 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
@@ -173,8 +173,12 @@ &cpu3 {
 };
 
 &gmac1 {
-	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru SCLK_GMAC1>, <&gmac1_clkin>;
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>,
+			  <&cru SCLK_GMAC1_RGMII_SPEED>,
+			  <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>,
+				 <&cru SCLK_GMAC1>,
+				 <&gmac1_clkin>;
 	clock_in_out = "input";
 	phy-mode = "rgmii";
 	phy-supply = <&vcc_3v3>;

