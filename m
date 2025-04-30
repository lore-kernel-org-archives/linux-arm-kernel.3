Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C0C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXEx63bWfg+NpArJXkr9NmH7sgZrWsOtLPEU764wB3Y=; b=fJxBLMR7LluK2Nq9zPucesI+eN
	BtlKd3JnQu4H/mhiyYZN0N57EuVzg7wljOH3pXNdxgLFIrgjUj20zg1KSIZp4uBcbBo2mt4Lp1Ilt
	RcAMe2sASRlor9dNT5a20vu/uM5aSZH1pxLVzR5eUnbPLFVdBG1p8HNNS6U59iB4HrTKQZPd4LDyR
	5Lo/a0jLh4F3EWZXwnSKAm7ixiVUvIZeT8xEE7h8MQLZUJahPFuOlOV9s3p0iKCd6uaWueXcS4+kQ
	lrTI2VmNDvTdvb/NgGfhmUqQZKLy6yfSrW8H1bX3THsmJ6LcFKrqYv2XYM0VsM9eSU3vW+O5RYvop
	6vwNHkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0BH-0000000BmSC-1rfH;
	Wed, 30 Apr 2025 05:40:27 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA04E-0000000Blc6-1byL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:33:11 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5BB0C342FEF;
	Wed, 30 Apr 2025 05:33:03 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 30 Apr 2025 13:32:06 +0800
Subject: [PATCH v3 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-01-sun55i-emac0-v3-4-6fc000bbccbd@gentoo.org>
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
In-Reply-To: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=+xnhPAiqUtLKUq/HZ9jywkOy5GBJ0Z23GSWcCzDUBKg=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEbXuUxfH+H4Pdw6T4crbCWAQ7c2I9Em8iiyCV
 ht13AZULYGJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBG17l8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277V32D/4mG88MeMRBinBzvh
 15g2QUaZ71AZ2IKdE2xgRx/dvRrKhNwiw33uvozsePf5V+YBKFzvTpa413EbZL1Ey2kF1CQjkLA
 vRKJusKl9g3mC1KYGDWoTyGz3UUL20DIvfCNeutNfy348BU3yvqL7XrEww86RR9/aJKXFnJwOHx
 7zrzVJxGQ5b0/EwQ6nXEfBT878mPhvh1+VX8utCIvHZ7oLrn1oxQ4kxs7R+Qckb0TaXxguSjIIK
 NBaD26rLsECB2FNMuCdCKaczIisapmQGmV8Qb6Ozi03zQE98qq64FF0ZfwtAdpW4cdGLq8otkC0
 nHY00IPa7jswXdqNPyC4JztVzf6FBRGzE69d02+AuelQyMeiELuRzrXpwAmsOossm0yOAvlc49d
 mW7kqTdR3rYobn7hSmXr9MCHH47cbUsGot9LIft5FMTyxTU4XIF1cqDnOtdEgxDb0wFV/nfCC2S
 ywryVl02zgCY+fYjmmdOXFQMavFpRAVSrVtVkQQpE3c85SzHfFvabMUjgcnQAiaJ5hAhdlcUiof
 bju0CpULaSrTIrH80bMwLxl46fozfm58Xl/iY3fKJQZekVUikBurpQwGQexVIvTzD3RyoiP1R8r
 IJcEr0FPfJ4BaqDae9CE9I6SEhzrVHFk/4GDw5r2zvetJZz8kjyP3mDbfnIxew5g9Wew==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_223310_453484_03986689 
X-CRM114-Status: UNSURE (   9.14  )
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

On Radxa A5E board, the EMAC0 connect to external Maxio MAE0621A PHY,
which features a 25MHz crystal, and using PH8 pin as PHY reset.

Tested on A5E board with schematic V1.20.

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../boot/dts/allwinner/sun55i-a527-radxa-a5e.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
index 912e1bda974ce5f64c425e371357b1a78b7c13dd..4ba01ea6f0db793b08fb0645226126535d91c43b 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "radxa,cubie-a5e", "allwinner,sun55i-a527";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 
@@ -54,6 +55,24 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_cldo3>;
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


