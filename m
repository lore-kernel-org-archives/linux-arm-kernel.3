Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACC6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 03:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbW5gVH0/GMypEjK6NX6CcK7rWry03g6woQ7It58TtI=; b=KjefBXi35V0V0p4K62/U/SHhyJ
	9hPbKIg7blNPAhpwvQtQLgns3FbbkqGLU57ib9evM+ksZg9Y6lciNOAXIKCyY+f/utB3toA7yyJeR
	wxzWjUzbqFuPeMd+7zw5TmCswVYBQK+qi5VKdefaTetTMK14PlW0Aj0f87c6UvpXI31vXteOCq0Be
	YlZkX5tmsZ85R+7RrZKFTe0EAwGZL/r1R3CohlT13dkvpeUJFVOjP71wwhycRML5yb7bAmRwpWKyN
	nw+wAY7C/8uhQXC7jA0f/jJ8/KA/kUYziOdB63fJu/qj+Y18lw/L83Ksv6ReKJ2HGDQL3lL03k78Y
	CieFgqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0mV-0000000118T-0JRx;
	Mon, 17 Mar 2025 03:04:47 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu0ha-00000000zyY-1DvU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 02:59:43 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Mar
 2025 10:59:22 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Mar 2025 10:59:22 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <ratbert@faraday-tech.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [net-next 2/4] ARM: dts: ast2600-evb: add default RGMII delay
Date: Mon, 17 Mar 2025 10:59:20 +0800
Message-ID: <20250317025922.1526937-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_195942_329884_A4571E4D 
X-CRM114-Status: UNSURE (   7.64  )
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

Use tx-internal-delay-ps and rx-internal-delay-ps to
configure the RGMII delay on MAC.
And add default value for AST2600 MAC in dts.
Refer to faraday,ftgmac100yaml to know how to configure
the RGMII delay.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index de83c0eb1d6e..1db1f2a02d91 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -126,6 +126,9 @@ &mac0 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&ethphy0>;
 
+	tx-internal-delay-ps = <16>;
+	rx-internal-delay-ps = <10>;
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii1_default>;
 };
@@ -137,6 +140,9 @@ &mac1 {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&ethphy1>;
 
+	tx-internal-delay-ps = <16>;
+	rx-internal-delay-ps = <10>;
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii2_default>;
 };
@@ -147,6 +153,9 @@ &mac2 {
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy2>;
 
+	tx-internal-delay-ps = <8>;
+	rx-internal-delay-ps = <4>;
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii3_default>;
 };
@@ -157,6 +166,9 @@ &mac3 {
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy3>;
 
+	tx-internal-delay-ps = <8>;
+	rx-internal-delay-ps = <4>;
+
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii4_default>;
 };
-- 
2.34.1


