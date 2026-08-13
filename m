Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2BCC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMObuXg4XANbdtPQvTLG1yzUld/TUllacqUrLQ7NcZk=; b=sCrgWQ41d+Lfiw+o2D7faXZZ11
	49cNIwCyn5lzHfIEI1IUaVhaXAFlDDsEhF8D22EYbN8FhK31Lo6lX+/uoDfO/HjqqjDhdshOczifn
	R0n/sSbSRupxHQbjMobMqklJ1rXTXAnEQG9iD6zEE6NHHtAsl/dwvqwy4IV+Y2dQ8HT+BXA9vSrMR
	1T6gg81/h0aePaiaVzUdKYbzrUHMVXoobnP8uDGkWE8AO2OkNTCFO2QkDGeXjvZHzPpEJR30k/52u
	E20BOli7uzZPTFgbjrz0uIkyg9rSV+IwgyCUVILoDfSAFe4FgbaNfRI1OjZfJC8Ba3cpcdvp2HZv7
	PONthEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRkB-00000000J1s-36v8;
	Thu, 13 Aug 2026 09:28:59 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRk3-00000000Ivl-2P49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:28:52 +0000
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id A25FC22BB2;
	Thu, 13 Aug 2026 11:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786613329;
	bh=uMObuXg4XANbdtPQvTLG1yzUld/TUllacqUrLQ7NcZk=; h=From:To:Subject;
	b=xweJDG9w5XYkeRYl6GUrH/mg5AhHv664MD6H3sWNidHwOizM+yr3eZG1vwKOD50ck
	 yI4KwiERxH+E+MbHeZQV1AfLyG9VuofTHjAF3xFmRkn8eMmdjwQTUdpY690BZUx40z
	 DUdInTTAHdoH7DDGVGEcQXM7TAqDFU/nMiyGzBO0fQQv42vquG6yrCqZzbYnt31K7p
	 gLYU17eUImiiraU3xq/DlhIjK3XT2YuIhe473we6CDurgVmF5kDGMJBvWqMyT1fqmt
	 eBOsKtb/H8GJrEUKzQpizC1QrUq6DW5yg9D1S8SsdUHLa1+JefOj4aqHXp2ql2Gs1e
	 MrG2NSe0eNAgw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Date: Thu, 13 Aug 2026 11:28:33 +0200
Message-ID: <20260813092836.38367-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813092836.38367-1-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_022851_778875_4D009581 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4: no changes
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..1eb1cf2d7395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -229,6 +229,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3


