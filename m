Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F94C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=past/mepzg6rqY2RYWZlZQLkBpCV2fVSE/34MT/V+r8=; b=dJbIGjX84p6MbkAFTBevkp0Pt3
	Xuc8kkvNk3qiMKriOrp0wiXy7ShRFyC6A9+UDwoRq6rmgEVHnfkOaCq1hXcQb6HZGopKSFuDnf33T
	7qgqOZwQ/PA5hlwh8AP+FuZPY4xLG5iT/79QugmgdvH4eXrIHXusmw9bAC920QLJPzNMZZHIcvt9f
	sWUYyQo2WwekxQgV/2wiyiVYbTxG15Wr+FXB8wzWdvSMqz0c208Pt16Gp7hRRq/NxJePouOO5FTXa
	3GuK7VBxzxGGZcSMCKdZzI5c5w9MSbcjNV1efs3ND2zYFRZZWlnWC1oN/nGOcU70BGCL63G52jqRa
	Ia0g7w/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uWS-0000000DoeN-3lCw;
	Thu, 24 Apr 2025 11:13:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tWn-0000000Dccw-1056
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=past/mepzg6rqY2RYWZlZQLkBpCV2fVSE/34MT/V+r8=; b=UC/ewTLCf+w4ez+otN+o7s8UEF
	D1AS5SjFPTAr1taH9bk81a3+Wecf2YiAOj9IZSb9hh1d234jDFo8Qi2OttfifdnWtPPfLrMQi8MVx
	mBCQEirfYyKPlRewfbEl7crUOoxgrXzGA0VjrSHVs4RkvlUda/adPYb45Va/JRpj1WrQgUW3NJy8b
	LjMMWMjJLnFyJz7+Q/GMqxIWe+TvyP5dG9m0zGIngZwlasUwsK8yNHVdSNMPANoacSMLWjci5L0oW
	SUzMm+1Ti/5xr5EC+OYkup6uRA+42HpT2tgTy+GI//oKdy0ZMTKZDf1KAhaF9r4y3KHztQ76ur8Al
	t8mvZ5tA==;
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tWk-0000000Binw-1cVW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:09:56 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AF62B343027;
	Thu, 24 Apr 2025 10:09:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 18:08:43 +0800
Subject: [PATCH v2 5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-01-sun55i-emac0-v2-5-833f04d23e1d@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KQtVVkxqKgq++RrOtQPY3AP4zXz78fWySFRMQ+WV2cw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCg3GHd+62qSSkn94thh/HAXXXHgj44BYpE48o
 WutGzlFxRWJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoNxl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Ql5EACOHBo/C7Rx5AnIKo
 rr3Dalwn3ZiZLtEdQV1KWZJaG/9ESoBa05BjqyasPxKW7WgBAdDhtbpSr/mGRIA6lniNriFwG/x
 eqgCzGgo7uLlMTW7zkkWqksyGjHP7VrBg+6ive3c79XSPwtRdCkwIkzHP0JYLsA76ulS0OV9scQ
 XGUIBwuXq7KeNwDbxYj9jVbbDANgtQTUwZbRbt4KfFTaD38YxBCJ3K6efrbAauTSVSYo47YXFda
 Poax1LpDBHeYIOaHQk0yapKDKCB1YI3/bKm6TVWdgqOTtAD2L93lLg9lRM5q63qDbJGaG1f7Wat
 xU99G7BLllfXr4yCsnhL+dmESQ9Ejr7Uc8lV0OERG+HH0YW1/syji49ZoVCeM3WBOq4wp7g84mq
 Z+mePEiFTiWD4FLP3gMR5EU9t5i71fpGsYj9GsfGxBrzdaz00sho1gIaerU/3bIoPx2KhwOUMOJ
 Inf3lGdKIoiBPqkfTRTE8rZ6Y0xdQzIgsGlYjApWh3kWs14BcAs/LJtHfqboNpWeaOW8nqZPZ1Y
 QZehZ8wIapGvcipCGCYQLZP18tYQH2Y/7KphyMa69i02B38UudA/3l3MzA+GpcwVWJxz55o9bK+
 1GugbzP1B+yzyv1pxl+P3myxpIUlNHmDJKzkygjMFn8seXhTBrZGWolU6ItWJTIHlPvA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_110954_712870_94E5FD2E 
X-CRM114-Status: UNSURE (   9.18  )
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

On Avaota A1 board, the EMAC0 connect to an external RTL8211F-CG PHY,
which features a 25MHz crystal, and using PH8 pin as PHY reset.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
I don't own this board, only compose this patch according to the
schematics. Let me know if it works.
---
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85a546aecdbe149d6bad10327fca1fb7dafff6ad..4524a195e86d20089cc35610495424ed2dec7e95 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -12,6 +12,7 @@ / {
 	compatible = "yuzukihd,avaota-a1", "allwinner,sun55i-t527";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 
@@ -64,6 +65,24 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	phy-mode = "rgmii-id";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_dcdc4>;
+
+	allwinner,tx-delay-ps = <100>;
+	allwinner,rx-delay-ps = <300>;
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


