Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58E606D813
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+rU8lo7;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=cnECqWCX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ozS0HsIF2lssUIRaRndjvOgXBu43I7UaYAzMd09TIC8=; b=u+rU8lo73sL73N
	wd2fUlp5FrtThD/2z4W/0fG0I7zqh3gFzbscaNV1NB51/hYebfQ9ZnqVxT9FFwkYwpOaBmlJAj+fb
	ts07WlKKjesSVMBeHXZeJMHhwfiYqMimYn1RQaKYeQUVF6tr8qOUGY41b8SX5w2CU1uxHLoEvmc7e
	W5REwhUd96tA3f3YDjb6ygpuLlassEoUs1L5Xh94zM1BHxPkm91zM5Rez0UB0RjvjMg6atmPzVBzm
	EnZ6uZwQaHiwpvcn/yDe8zBh5SHXjt7ux+FC20GMplFgr6LGlnzyW649zkDOGe0nEnk83dmkBqgF9
	Edee0ciUugo4p+qx4RjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqr-0000000BVG3-39pw;
	Fri, 06 Nov 2026 07:59:09 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPEqp-0000000BVER-1tfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:59:08 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0AF90200938;
	Fri, 06 Nov 2026 08:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozS0HsIF2lssUIRaRndjvOgXBu43I7UaYAzMd09TIC8=;
	b=cnECqWCXPPLSRtRdhwHtTCt4rna/DoVZL78ejMab6/AWflEJC3jYaA3bQnN8fzXxFpcV5x
	XLtfzEjc4SPUnYxOSuC736ZK8UwKArlKU7Tji72F/+V+cuNjNpR16zSNOvmTqi20RtjBJG
	s+Saz9ST7jvVv4j+mBU7O9RnIUOplFaCfzgdvgnwu/oS+9ggL7gUpP8LX6PumW+YPu9oin
	pZlL7bH8niQ2LcHKBlKHNiFGjzzKERn6jLD3hUnNsvls0gjeynbexs5v4OgVFJDGv4R3Ya
	9yDpfPawr5YRQtj7Ze0kM0HjXdx99UNVs5k2b8p/+s4KxFCqQSo2ZDM648PcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793951943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ozS0HsIF2lssUIRaRndjvOgXBu43I7UaYAzMd09TIC8=;
	b=MgIvFRkxBAiAaygjCDoi6NV+DIPAA2KxozDd70f4gn336GocJTm2jPSYq7ji6TOiKdU2fF
	enbtQCMKJmaFRfHyhe84Td6f+IDQi7RXAVkR07aCxC3/bk/gM92Akq/HiU1efMZT/HXARC
	0Bu+V7ogk/YLQ0OZ9WyEqm1qL+I8etppuA9J2ckJu1Z73xkHmDICu5bb3PfR40rfVY9UCr
	8yzM5jZtPySvOajuReCYEI0rMTR3cI4vFYdPcEcmjk0rjqkenpqpqFBbdcXJZ+c0D976CS
	lDcfWgD6WWoD8kHVJZLSnvD3vobkhTc8ekCyqjLP3X0C0W9uWyM4i0bqBSh7og==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793951943; a=rsa-sha256;
	cv=none;
	b=UqCmfhPTdKR/LEFltSDXEWquJCxrurbIfFWX8+byZvbzcaqzHUWhrfJQ4fJqAGxcf/EL5t
	++1UuCybi49uhuMjoZrE4EILmJ5HU5S6fLMHgs8O27AARcY7dZVffZYAl3SkxEdvbAGsDh
	dDvaR50pBefekMLgd1Lxr5enZuLeX56T8E91KTA4VV2MFRs59QiwBGrVToQQIS7Ce0yMmO
	LfaCJMyW56lgf1PW0j08OlBFlKb8hO+RzoL3/rV9nZUgy49NzPWv7ETXQNatjD4Pf93LOY
	InCicEj2qyY1AVKoW89z+1p+IBig6lETchhavWXIIN8XrGifRMAz5T36JpYd+w==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Fri, 06 Nov 2026 08:47:25 +0100
Subject: [PATCH net-next v3 1/5] arm64: dts: xilinx: drop unused #phy-cells
 from the DP83867 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-v7-2-topic-dp83867-v3-1-45e1d3adf1bf@pengutronix.de>
References: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
In-Reply-To: <20261106-v7-2-topic-dp83867-v3-0-45e1d3adf1bf@pengutronix.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Michal Simek <michal.simek@amd.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6739;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=1VOsPRL3wJvr3e89gbBMUTN0fzKah8vOne4ypiJ5r14=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bbjqMWnmfvim9QF3TtbV3/JmZhZe8LVfl7DvuSXlQsZ
 z7yvXVFRykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIk8NGNkWP/4m5FN6Eavm0vf
 nBaOcbl3Kki8Z5NI5tNVB1hkfv47vZbhN/upL22nH/5X23BmasPMucXmPR6rLwflLE9bcNDV4i7
 3CiYA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_235907_650603_5001F103 
X-CRM114-Status: GOOD (  10.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DP83867 ethernet PHY nodes have a #phy-cells property, but no node
refers to them with a phys property; the MACs use phy-handle, which
takes no arguments. #phy-cells belongs to generic PHY providers.

Drop it, so the nodes validate against the ti,dp83867 binding once it
is applied to them.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 2 --
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts    | 1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts    | 1 -
 10 files changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b82a056be2f9..930f0e54fdac 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -254,7 +254,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@4 { /* u81 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <4>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -266,7 +265,6 @@ phy0: ethernet-phy@4 { /* u81 */
 			reset-gpios = <&slg7xl45106 5 GPIO_ACTIVE_LOW>;
 		};
 		phy1: ethernet-phy@8 { /* u36 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <8>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 4dcf92a2158f..e05667f6e946 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -255,7 +255,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@4 { /* u81 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <4>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -267,7 +266,6 @@ phy0: ethernet-phy@4 { /* u81 */
 			reset-gpios = <&slg7xl45106 5 GPIO_ACTIVE_LOW>;
 		};
 		phy1: ethernet-phy@8 { /* u36 */
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <8>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 52954761c9f3..af897c3cd168 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -200,7 +200,6 @@ mdio: mdio {
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@1 {
-			#phy-cells = <1>;
 			reg = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 49732de5fa4b..a1f0592e7958 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -191,7 +191,6 @@ mdio: mdio {
 		#size-cells = <0>;
 
 		phy0: ethernet-phy@1 {
-			#phy-cells = <1>;
 			reg = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index a5bc521ab679..42030547a32d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -217,7 +217,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@21 {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <21>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
index 3c28130909bc..bad59d7b1d26 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dts
@@ -19,7 +19,6 @@ &gem3 {
 	phy-handle = <&phyc>;
 	mdio: mdio {
 		phyc: ethernet-phy@c {
-			#phy-cells = <0x1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index 32509083e54f..898a9000daea 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -126,7 +126,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 96699be8430f..b0a08cf1d03b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -131,7 +131,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
index 52441e5c8739..58684af4b98c 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
@@ -217,7 +217,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			reg = <0xc>;
 			compatible = "ethernet-phy-id2000.a231";
 			ti,rx-internal-delay = <0x8>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index b34e4c93d249..30f97f67e8c8 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -189,7 +189,6 @@ mdio: mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		phy0: ethernet-phy@c {
-			#phy-cells = <1>;
 			compatible = "ethernet-phy-id2000.a231";
 			reg = <0xc>;
 			ti,rx-internal-delay = <0x8>;

-- 
2.56.0


