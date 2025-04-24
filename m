Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA39C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRHj8wqumJeY1shB1eYLAFm4W3tb1ZCQWYHIOBtzCdc=; b=xz/EQKZJFaHr572ao6w+kupPSC
	R27tIzZn6POFV0eYnJdeNH1iO92rfxgipDNzNf+yII6XTpyTy7Aw3yb8ibjwbKAr8y8q2p6kyTPFC
	Hlwe6wYynhwyBLmKqyjkzgpmXXTAUbkDV1UWhkUIdl+4vAuFeJcdaHp/+v4lQ/MnaaysGBpa9pnDo
	zKmYQ8KlTFz+8KIQC1kiWw7Y7OClbbATYydBp14hNo6U6bEtVQnodLFiXAIbZxsHY52lFjlt3xtSq
	u6zZwJJxLMBstJLKdIl3qzFrKgWIXfM0DwC3DnqKs4S2aovqF3aVpswR7kYpFU7xMDcKMyrlAwKz1
	tJSF6Qyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uUe-0000000DoVq-0lex;
	Thu, 24 Apr 2025 11:11:48 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tWc-0000000Dcah-1utz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:09:47 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 77E40343016;
	Thu, 24 Apr 2025 10:09:40 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 18:08:42 +0800
Subject: [PATCH v2 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-01-sun55i-emac0-v2-4-833f04d23e1d@gentoo.org>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
In-Reply-To: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=+NlsYWBT81OiKiPSY+YWQO3B5u/NpVPaPxCCQFXhMuU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCg3DeFF+Lod5Sp4RF40iamQgTlUVUaHaoQ8RN
 NdermzD1/CJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoNw18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277eLND/9ysWatZ1XvVsDrzi
 lC4N7NPUNozYOG7M2jBPgSJ6LmyzMG/VbCrpp/tI5sAAeZntM910Kdi4Jh2e4Ywml5ocAihIPRH
 dnyn166K75K8W/X9ouYXBxnLIm8xNLC5SinPbwisXjgglAre9u9KKpIJAveifvU2k6/0l4Wjdxg
 4JCVNRf55Wc5E/eNR3FEQSnMwvP3nSgKRBhaTqdeqpV1FNvTeF+u9pKFkxsa/4KF12LxcAer/SL
 cHM1ji9JXFnKXzJEC8e4K0b33ymwKMLnNVgHyVnGTjhmRBJDAJtI3VZ42bDmwLGHLmZRdMlOYoQ
 eM5mZNoGvILg+/HO1vV+5byj48sr6JJzbjGN8SVq9IA2bJ3vjHfhWqWNLgasPb8EVXpj+YGTvhF
 6/MIqFG9JYhewYyklri4rqEo3Fx9anPVR7WujXH/fLT8ffXH+A/u1NQpP6RcHaL6Uvb3DBL2vdK
 TqVXRMeHXnRwJyHtylpk8pvTNXYoOGJxlE4uoVAbdXem1727d5jYXFRlYDjylQrSrRDfJ6oX5Qr
 OSRdQ0o3kCxDenoj1iOoKcfFDeVfec3Q4tqRKApeYRargtxXN1spG5GSX8eh4APmlK80Wg39+nb
 P/oS3PF9heMj5bYB95cOQnxo9eztBD2MoIoq7JhJIn4nWod1pIiG9KaDmP280GSe52Wg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030946_518032_47149B9D 
X-CRM114-Status: UNSURE (   8.56  )
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


