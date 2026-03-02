Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C90E9B35C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DT1IgYu7pZghFZq7hdsx84xOqAbbJU2Y5KlsIdmuPIQ=; b=lBx56h/BrEXr0qSKEmLEVtYGxm
	o0WfSD0YXo94IJBAjrWudgZ0P9qgps+2a16D3b6DZ8b0ZBbS4QgajAN27K0yhaPE7rL0WBsRh1ddr
	BcMxRuaz6HxTzsmkjzyh08ZKMRYBtQmfPS4MFttCkY5xBfmvxutod3G2gKcLAYyHtLtTH3+0PlKx1
	OXjPL3zb9m0+RriLrrE5XGulkvR1B/3DuqeCJ1AUlM0GYnoDwVvfCxiBP3qLKzpswwA+ot+HL0giL
	P07Cy4OA8nPgG2czaoKsN7GyIarADddQNlwJwfNtNly2+pGJi0GSlvJS4n/N8UBGzZ+XzRaC5aGCj
	jcmbFLsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0SG-0000000Ch4M-0TtO;
	Mon, 02 Mar 2026 10:24:48 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0SE-0000000CgxJ-3H94
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:24:47 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 2 Mar
 2026 18:24:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 2 Mar 2026 18:24:30 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 2 Mar 2026 18:24:32 +0800
Subject: [PATCH net-next v6 5/5] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260302-rgmii_delay_2600-v6-5-68319a4c4110@aspeedtech.com>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
In-Reply-To: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Po-Yu Chuang <ratbert@faraday-tech.com>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <taoren@meta.com>, Jacky Chou
	<jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772447070; l=1846;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=mSTj0/1ebY8L7mt7gTJMaZk9J3MyMEdQcNyTSUI6OwE=;
 b=5fzmv3bsgeb2/RQViDqnCtMOTTx6t3KTiHO1+AoPpZJLdthznMTUVInVZgZpZHoimVgMVO/Ca
 t+4evIfn0Q2DOJiX+nJBH6rdMAyJo0hfb2mFFnCByKyM59DRd5+oO5e
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022446_827882_25B0F36E 
X-CRM114-Status: UNSURE (   8.51  )
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

This change sets the rx-internal-delay-ps and tx-internal-delay-ps
properties to control the RGMII signal delay.
The phy-mode for MAC0–MAC3 is updated to "rgmii-id" to enable TX/RX
internal delay on the PHY and disable the corresponding delay
on the MAC.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index 3f2ca9da0be2..a2a1c1dbb830 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -123,42 +123,54 @@ ethphy3: ethernet-phy@0 {
 &mac0 {
 	status = "okay";
 
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii1_default>;
+
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
 };
 
 
 &mac1 {
 	status = "okay";
 
-	phy-mode = "rgmii-rxid";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy1>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii2_default>;
+
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
 };
 
 &mac2 {
 	status = "okay";
 
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy2>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii3_default>;
+
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
 };
 
 &mac3 {
 	status = "okay";
 
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
+
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
 };
 
 &emmc_controller {

-- 
2.34.1


