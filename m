Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90EAE9A77D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqcLRKudHgKSmtkMDFCAvoKWKKoLB9Rc1nid7QyUgsk=; b=qQwqOnR+M0bJUIU7cBEMUAj2OX
	W1Ic1qUzK1y2lJbBVqyDZS60E+ZZodtD9WVG4P3103r74h6iPW02+yF+ppy6Olf8vZdYyB4/4boGK
	xdzVVYiz8B8zCypOhKqFpsnA508Y3XCXgk7Sxc+iYMfAs75pwIbAzcQoHw/2GXqWujY/V52CD5hBd
	LmqZv6oa57SNmsYXCjk/1XbJ/vLht1P5+7RHum5XUoUKhCbAWC51t9JpeQ+Z0pDGt1JG6W6Fj5Nmo
	UZEh+d822988s4hhKWiR6Nm8yAI7sOwZLDgSTZN6uWcmYYxAaV29DCs/baXiupv3FFQ5szW2U0C4w
	xk2Jl3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50u9-00000001Nck-4BE7;
	Tue, 24 Mar 2026 12:30:42 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50ty-00000001NWn-3bDd;
	Tue, 24 Mar 2026 12:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KqcLRKudHgKSmtkMDFCAvoKWKKoLB9Rc1nid7QyUgsk=; b=c76tjtOf9ZadDn52buaIMXYV9x
	I3eh3Ugqpq5lz/jLCzFReaKfl/3oZh6fCQas8DZU7GjxfkFu4j8uAkpIfWr9c7qtk+CK5xW6zrfUA
	ADBXdZTWSh3e/FeNjpTckiSLhzxmI2DxK7iTXaXE7XglyuAgMJ4AZkP0oV3BtHc7NeCuQMhrOGPAQ
	dzGYHyvblvMy6fi3tWQP6HH8/rlGVDsVwGm5Y2zniBg0/U9geuCP2J0y20pd8QFFxRZdXeucSU24W
	PZOAdKXbVG0mhbvHTO6of1VvcPxP74wto3ytmI4kA+gEoOkHn8ailBGaPZm4kmeFAu1U4rtYwRC9o
	91AVNbCQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tr-0005qM-2r;
	Tue, 24 Mar 2026 13:30:23 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w50tr-000Pna-2M;
	Tue, 24 Mar 2026 13:30:23 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 4/7] phy: ti: phy-j721e-wiz: add support for J722S SoC family
Date: Tue, 24 Mar 2026 13:29:40 +0100
Message-ID: <2e7975baed312b8428199a88e92be47442af964f.1774354734.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_053031_032322_6D744918 
X-CRM114-Status: GOOD (  13.57  )
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
index 6b584706b913a..7531a8a049123 100644
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


