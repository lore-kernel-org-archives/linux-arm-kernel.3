Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5WVyT0qkVGJ2mWGgmL1yXzdV66mznvraSdPE0vx3bo=; b=NIt1T/ZplcCx3bL2scez2Cez/q
	vWwBx6MkHFF1N4rCHPRc6a0ngHA1GDrD9/Ed9WlHVZrntB3iShfzMDDQXOevGqAwqnpsIgO0uDQo4
	7LiwNORNSEGksymBSxOxGO6Klt4xfTa+d5NNpYNry7vqDv6I3cMl4fd0najezwSgakd+Oxkgl+BSU
	cIhXv+sEnRmBUbSIrgBgDvLFDJEWXrmUiH+ztgSY6JOYETILxs0QD6qe/osZF8eGNiKnhFS/WKTlR
	hi4gVsC+VuKdnUDUEBPFyc+YSkdEooL4S8xGZ+5sHHjj4pVIOMk0DDbR3t3pFL7TtNZnswTmKkasn
	wpM6cUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5N-0000000BIOH-3meW;
	Wed, 23 Apr 2025 17:40:37 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aiO-0000000AlS3-14OC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:04:41 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EF8843430DF;
	Wed, 23 Apr 2025 14:04:32 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 23 Apr 2025 22:03:26 +0800
Subject: [PATCH 5/5] arm64: dts: allwinner: t527: add EMAC0 to Avaoto-A1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-01-sun55i-emac0-v1-5-46ee4c855e0a@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1241; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=M4BoCqHOzCogtKg+TanyAV3G2PPloVmiBgQFQOsTpKc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCPNJikiDFxOUjRYRat/2gcDcU/vJZBj8PEW6I
 iQ73O1J436JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAjzSV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277SYoD/421Qk44Q1Jus7V78
 qGm7OCd/RJkrPzvCpOHoJDYcTCHzrTRyO7tl8VxeN5a932xDcPVevZ8aha/TCrP/Bzcm/XNEouE
 4wjv6wRl3CTZKzTeWpDHTnQP39PxDk6GVUARB1LPmaKu58WtV2SZXsuj1/0LX3pWrLvPQP7se7e
 aOComIv4VVjwV9Ig/92thsQ9KLGkNKqb/aSheFRnMqxWlG1sW9qo39QtT7bjCv+BKFdZ21lBD6/
 3jJRJTFSlFJnwSDJ+gaA/YZpOosc9jrrYlGgTt8O59te51ZGzosG5phw5NJYgviOVQ8l5VZsoWY
 lHiMEHtxBjJcEuo6SG3u2SbnN93Pe8Kht0euT0g08nXl90vIqjk/WVifcz6LidlbVpJodqKJsZ/
 zYY802jn5jcm8Gp+BTvsIHcbx6jROTtWsJDaPnp1ryBltHHbHqEIlA6qpC3yUb3kkr0aOXbZXz5
 MVN/ONnW4tHBF5xdjoSEY95QcYlU0fqaCZ9+I+ogzj2Lq//3RX5AaYhBukK/Jji7H2Ce/bIPdAE
 qHu5rMkNzcNjSbBesBSuGE/TFttTGQostbY+8G/DLPfE7B63bCSzF5PpEUOR5XA1vIgi1SU+vUY
 xjezmq6zY4QSHVxk73iCHESfvvzSUvL/OZn7fdY9ItnEv1L+VvkgPTSZwwxsECXD49TQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_070440_328063_2EA55DD7 
X-CRM114-Status: UNSURE (   9.36  )
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

On Avaoto A1 board, the EMAC0 connect to an external RTL8211F-CG PHY,
which features a 25MHz crystal, and using PH8 pin as PHY reset.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
I don't own this board, only compose this patch according to the
schematics. Let me know if it works.
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 85a546aecdbe149d6bad10327fca1fb7dafff6ad..23ab89c742c679fb274babbb0205f119eb2c9baa 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -64,6 +64,23 @@ &ehci1 {
 	status = "okay";
 };
 
+&emac0 {
+	phy-mode = "rgmii";
+	phy-handle = <&ext_rgmii_phy>;
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


