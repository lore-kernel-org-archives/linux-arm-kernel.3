Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD4EC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4KAYK4wDjwk4MT/V1vx5t/Byjd5owHl0n+K1EWDaTI=; b=hTIFzWcAPeodTXq226EUtZsDH7
	UbU81T4M+tBgVvHoEZzcydsGAan055FJOhPX27pgNErFFAsPB956LDOEietijkNf5EeLUcf1IRpTq
	azN34tPT2HH876pqVvZDTRHg3mqV/Hg9RsGgwwvM+zOJdOu5t8HpuncxH698Y7EvqpcEMploSXEn9
	YsRJ9oqGXLDonU2m7/dvMe/ANt5jtRuuywaxyjkyt6dMoQ9w2CLo5qabKFzseiJ7pP3ch+s0vwPzJ
	OGq5kZX7kyzx1EWu0ZP2oP2Hl3qzs/1JiEzvTYmThSh7uUTbMWa0nCA+GKvAKiCZxelUW244xju0D
	mX0yzXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5N-0000000BIOD-1YAL;
	Wed, 23 Apr 2025 17:40:37 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aiH-0000000AlQI-0gll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:04:34 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 18BF5343100;
	Wed, 23 Apr 2025 14:04:23 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 23 Apr 2025 22:03:25 +0800
Subject: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-01-sun55i-emac0-v1-4-46ee4c855e0a@gentoo.org>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
In-Reply-To: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=qSAuAQgQhfHavQWtk47cpAmLXoZ+J7eZQoz45D4TWXA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCPNG5vFfq6m2pNo7fNiwyZdlqqFu+q01jGGkS
 flwqEtfDcaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAjzRl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VUaD/46Kj92p9WGylgP3a
 wJUkJfq60kMBG8QMJYSIK94CyNGEaDTiFjkehLBOiMjK1y4CM1Yr6auiYL8DE5mPSjEjZLOw1gp
 7+V+lKUKhyjCE1xkszaFIKoyiv/BjIzrtmAycRvJuHDaRmx5CIUo/cz/h3UMHG5Sgk+ERyVDwGX
 X7AVJMgl73r19sn0TGYK7BjW4eM7FTwGCVhbS9rNom1ycFd54EzCHITztJiw8kVvUg4EVMF1KT1
 f3NnVWfIw6Qz/os/wFzw3C9gl4Ke6UADdxSvSaOf0fvEJPf56TgXkZyIhjeRadziaDfKG9qDa0F
 lQhb94tPK9N/Rg9vjcb7KGXnTqmmFFZ0c910wYhm517WpuKNGNCktGyx7yNGagcOKcak+u97PRL
 +K6n6Ub5sMGjWJcGFjQDpXXJ0pK4U7fcFS2OJ5xxeATgjXMQus2M73FZ8MZzSNYrDaUpiAq7w1D
 5b6ALD/AloErRtNZLXXaChv+M8vEg8plhq89ITqzeKTerYa1a94JlCf8ER9y+NQCPr2xgQJPGUy
 vMyuIszS/B5NcTkqT6ZugaEL2pM/NJDfXgkozMoXkZe6YGLmpkaMahM0JREwbGTCpKujAnZvM5X
 qoSt/VizNtXwVPBUGNDB/HcVfWICT9NXbDEZBp/PiTgF+IgvvxJ8C8KUn4KICfxrSQ1g==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_070433_232598_3AB66007 
X-CRM114-Status: UNSURE (   9.08  )
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

On Radxa A5E board, the EMAC0 connect to an external YT8531C PHY,
which features a 25MHz crystal, and using PH8 pin as PHY reset.

Tested on A5E board with schematic V1.20.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
index 912e1bda974ce5f64c425e371357b1a78b7c13dd..b3399a28badb5172801e47b8a45d5b753fc56ef1 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
@@ -54,6 +54,23 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	phy-mode = "rgmii";
+	phy-handle = <&ext_rgmii_phy>;
+
+	allwinner,tx-delay-ps = <300>;
+	allwinner,rx-delay-ps = <400>;
+
+	status = "okay";
+};
+
+&mdio0 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* PF6 */

-- 
2.49.0


