Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C00AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e96lqBbt+a5mVKiKm8ju8Tz8O5PGPr04HwmLOn7N++I=; b=Rsc2cra2ppBcK4RDIGXXJcnap/
	7GZgVpktl1Gqsf7GqIg/2WXgtf+iEIWlOiENEtSmnEwVivtFgyDbCnY3d5zrruCt0QsvcdcyBrF4V
	AcktqFVLmLV9pIHSUA5K/SNWrYQqEWJRUtZIRyvImLdOySjFKFKsVVzt4BC0CXLxam+Xpiqqhm513
	uqx55Aaieaym1dxLMYcj74d19wZsO/TXGYD92kcvSNu9d1L/zwedd1bMF2x74kHnvN+KAL9VuW3jG
	oP4J+eOIsrR4mM15zqLpebuO3Hyt6imc2eYqvpSxXEGvJyrSpyFhZXcYtTcZSs3I3InIM76JAu/yi
	+zpTM1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDLy-0000000EBBZ-1h8h;
	Wed, 13 Aug 2025 15:25:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtR-0000000E4ss-2bnj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e96lqBbt+a5mVKiKm8ju8Tz8O5PGPr04HwmLOn7N++I=; b=gLLQ6ZP+B7MXK/ZvhimQOKdEG4
	B8lvBO9669cwZhTbG+NFcCqNHaOD9znQs09pockJqTSuqKnZ7N0RjkIiKYIsXBDMy17iczyjzptXP
	n1BPj4FcQ4eLAzlA3aU9UpEyuztLXVR4WwazRyVkZpJqfnTaLn9JzPddhgQHkYVoFylH/SrjcUnS6
	etr38V98npMPRMn/9H3YbCaon7azVM8PDMq3jWhZGr1Sor+YL36m1DAQBJatOS7OXaTsDgb2YRI2F
	zW6DURghGz7Y5Mb6uqsYpNabpiw2uhJX51BMfGUNk89PkbM+TXzW4AeG6vSxbkGHFDMumZjyEpOEM
	AmYfsRrw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtN-0000000G73P-2DYf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E4A545CAF;
	Wed, 13 Aug 2025 14:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FF8C4CEF7;
	Wed, 13 Aug 2025 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096950;
	bh=5v1d2ZPdszghDIrJGhbTRJ0+vB3QSvZx9Rmgr+KUWTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/tw9UyRi9WYAJpGYKFhq/mzhwsoJ9WvfHDmvHoORmD9os65C3G8v7G8n24guF39l
	 +Ul0dpo0nlD7HyHP3LtVb+SZWbE535S8lmnQ8CLUkVnlKvK9KpInLx0xFvEXmsj2L8
	 zQM85epB76RtyEyelkpmpDJ4rgfCAknVgEb5G2P/F2N6bylYEvM7fKunH1d57hMNTA
	 nkkM/PInbP33R62/RmZcV+eQSuajZ/mNwvdA/7pCMAj1kZVEBFTtbw/El6Me9CiYh+
	 pej+180DDPjBxq0ukp/6CpuidncOY0o7R/fXd7Hu/v61+5cUqhWT9bTU5cDuOY/JJQ
	 UqZD7RENdW0hQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 610145FF91; Wed, 13 Aug 2025 22:55:45 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v2 10/10] arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port
Date: Wed, 13 Aug 2025 22:55:40 +0800
Message-Id: <20250813145540.2577789-11-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813145540.2577789-1-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155553_860058_DCD0A00C 
X-CRM114-Status: GOOD (  10.54  )
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

From: Chen-Yu Tsai <wens@csie.org>

On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200,
is connected to an external Motorcomm YT8531 PHY. The PHY uses an external
25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and
the PI16 pin for its interrupt pin.

Enable it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Changes since v1:
- Switch to generic (tx|rx)-internal-delay-ps properties
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index d07bb9193b43..b604d961c4fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -15,6 +15,7 @@ / {
 	compatible = "xunlong,orangepi-4a", "allwinner,sun55i-t527";
 
 	aliases {
+		ethernet0 = &gmac1;
 		serial0 = &uart0;
 	};
 
@@ -95,11 +96,33 @@ &ehci1 {
 	status = "okay";
 };
 
+&gmac1 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_cldo4>;
+
+	tx-internal-delay-ps = <0>;
+	rx-internal-delay-ps = <300>;
+
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_dcdc2>;
 	status = "okay";
 };
 
+&mdio1 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		interrupts-extended = <&pio 8 16 IRQ_TYPE_LEVEL_LOW>; /* PI16 */
+		reset-gpios = <&pio 8 15 GPIO_ACTIVE_LOW>; /* PI15 */
+		reset-assert-us = <10000>;
+		reset-deassert-us = <150000>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.39.5


