Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66430D3517F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri29mMECTRLPmj/f28VKUr01MxVHN14NYrO0oRv5ApA=; b=alefdLd9RuHKpw7SHlb7/NLbCG
	EQM71cGfXCtWr/b2W9W4z+SGy0W1+zfDj6CxfWiCgEUSxdNRuThY5N5dfTvTegNyg3BxobxRxhoBU
	U/bKQILQdaFzEZZu6qngUjc1NsrQeISfpr2ZfQotx7klUbF2gP0YJVj8BOSoD7NbN1gNnK9zlhOOM
	zrQOQrwQbz12cKUJwt3KrGq98esw5HPgwOZ/kMpCenxjZ35PEowtVAdOMtsj63SK/ylYkoTFeTwJX
	LX298no+CGjxIf4Yk5dn+UHuUSPV7XXo3Nc4ESe1O3OSsILkyQ/1af9D2EOATxWJUS3qJzpNfy4x1
	zYFlpn2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upj-0000000FCZL-0D0U;
	Wed, 01 Apr 2026 12:38:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ueA-0000000F3o2-1p9w;
	Wed, 01 Apr 2026 12:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ri29mMECTRLPmj/f28VKUr01MxVHN14NYrO0oRv5ApA=; b=lKxiby4m25UBk/HEC8lcqjsFXs
	nCFR7VSkefWypi7f0r0ETOhpQJuDcpYkRjpI26Brs3/BK1JOOjzkmNIcbMpRM8eJZLt2A1quJWhrW
	js0V06HtEDX8sU0VE+GroupYnjSXDsXv1E5TCMvCf7+cMg05JLgOT9V6qHfnBQLczY+DTGefeIQNu
	PuFKh/svxs3hGeKkPykqEAHbckmCAVRpyvt99gqUtRxhQxKrcHoZUgDli+mw0bZC9CNn0smxprDjX
	KEMpQme/ZcX7yn/I2rENRRnFqKNNHtkyJ0tR7bMcKn/QG6H5UNvIpwG6hD7LhREaBMT1k7c9VTcFd
	ZrP/nKvQ==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ue7-00000000Ktt-1NpB;
	Wed, 01 Apr 2026 12:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Ri29mMECTRLPmj/f28VKUr01MxVHN14NYrO0oRv5ApA=; b=HZ2L4lL7AGedirOqb9tjtBdAlV
	1qJiVnnR+Yi01Pq4ofNg0n9DUg4j5WAldI9fdZdPGYA/gvzdaDF9VJF24lSWA1zFhRYwzyu9C11PP
	NwglrqTzTIxGd2/fwobjTI0i/BTxUfqi+nHYtczInCJok2TQd7k4UFcC1KwpAMcSxvRo/vXAa/iSe
	zW5vR7bYYoWOFx44AijBiBBkCf29z9wYD9+AjmiskBJ4qhG75etHcuW9OHcTGjqEk3Lir0hcMdNIV
	/ja3zYgNngwI0ORPqr/U7edKYst61l3GpFO+R+4Gsw02LQySL9vRQsgva+BDc0LVWrKtevRhLhQvv
	AB93wUrA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue4-000IQz-0t;
	Wed, 01 Apr 2026 14:26:04 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue3-00089b-2W;
	Wed, 01 Apr 2026 14:26:03 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 3/5] phy: ti: phy-j721e-wiz: add support for J722S SoC family
Date: Wed,  1 Apr 2026 14:25:23 +0200
Message-ID: <feb36d4077a57767572b72d8a47c0e582d3e358f.1775045279.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
References: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_132607_497006_87BE3175 
X-CRM114-Status: GOOD (  13.29  )
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

The J722S WIZ is mostly identical to the AM64's, but additionally supports
SGMII.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 6e9ecb88dc8b7..99a80740cdc6b 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -331,6 +331,7 @@ enum wiz_type {
 	J721E_WIZ_16G,
 	J721E_WIZ_10G,	/* Also for J7200 SR1.0 */
 	AM64_WIZ_10G,
+	J722S_WIZ_10G,
 	J7200_WIZ_10G,  /* J7200 SR2.0 */
 	J784S4_WIZ_10G,
 	J721S2_WIZ_10G,
@@ -1020,6 +1021,7 @@ static void wiz_clock_cleanup(struct wiz *wiz, struct device_node *node)
 
 	switch (wiz->type) {
 	case AM64_WIZ_10G:
+	case J722S_WIZ_10G:
 	case J7200_WIZ_10G:
 	case J784S4_WIZ_10G:
 	case J721S2_WIZ_10G:
@@ -1089,6 +1091,7 @@ static void wiz_clock_init(struct wiz *wiz)
 
 	switch (wiz->type) {
 	case AM64_WIZ_10G:
+	case J722S_WIZ_10G:
 	case J7200_WIZ_10G:
 		switch (rate) {
 		case REF_CLK_100MHZ:
@@ -1158,6 +1161,7 @@ static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
 
 	switch (wiz->type) {
 	case AM64_WIZ_10G:
+	case J722S_WIZ_10G:
 	case J7200_WIZ_10G:
 	case J784S4_WIZ_10G:
 	case J721S2_WIZ_10G:
@@ -1246,6 +1250,14 @@ static int wiz_phy_fullrt_div(struct wiz *wiz, int lane)
 		if (wiz->lane_phy_type[lane] == PHY_TYPE_SGMII)
 			return regmap_field_write(wiz->p0_fullrt_div[lane], 0x2);
 		break;
+
+	case J722S_WIZ_10G:
+		if (wiz->lane_phy_type[lane] == PHY_TYPE_PCIE)
+			return regmap_field_write(wiz->p0_fullrt_div[lane], 0x1);
+		if (wiz->lane_phy_type[lane] == PHY_TYPE_SGMII)
+			return regmap_field_write(wiz->p0_fullrt_div[lane], 0x2);
+		break;
+
 	default:
 		return 0;
 	}
@@ -1350,6 +1362,15 @@ static struct wiz_data am64_10g_data = {
 	.clk_div_sel_num = WIZ_DIV_NUM_CLOCKS_10G,
 };
 
+static struct wiz_data j722s_10g_data = {
+	.type = J722S_WIZ_10G,
+	.pll0_refclk_mux_sel = &pll0_refclk_mux_sel,
+	.pll1_refclk_mux_sel = &pll1_refclk_mux_sel,
+	.refclk_dig_sel = &refclk_dig_sel_10g,
+	.clk_mux_sel = clk_mux_sel_10g,
+	.clk_div_sel_num = WIZ_DIV_NUM_CLOCKS_10G,
+};
+
 static struct wiz_data j7200_pg2_10g_data = {
 	.type = J7200_WIZ_10G,
 	.pll0_refclk_mux_sel = &sup_pll0_refclk_mux_sel,
@@ -1389,6 +1410,9 @@ static const struct of_device_id wiz_id_table[] = {
 	{
 		.compatible = "ti,am64-wiz-10g", .data = &am64_10g_data,
 	},
+	{
+		.compatible = "ti,j722s-wiz-10g", .data = &j722s_10g_data,
+	},
 	{
 		.compatible = "ti,j7200-wiz-10g", .data = &j7200_pg2_10g_data,
 	},
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


