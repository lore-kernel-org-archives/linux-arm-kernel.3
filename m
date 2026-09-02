Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5FCC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYz90TRr0+Fy2EqkgCP2u40jCTa6/ZMbOumw0L8qocQ=; b=RACzifvYSbUXwAja+j63aNyiEk
	6WGdFh27kSTUUhnCdnRVwlpEaVirPk77BpkfYe+CwdA6fnl4L71CQGFrlNVa07AriqyDApV82qiYz
	IAVHF0DEFvnMcbO833BLFBOLouHtyfVP3omNZUppDAWSln5WLX+AQ+IU8CkWBY/Lye9CzmdntBK/U
	mkF7jUIAkQb+LTfDYB68tD/nGi9C5EPDeggDBuyQ2UVClAXxXcVnY4E1786TLXhd/CF9DmDGR4lBQ
	n/IvboUyInWcvJFLYPOqe+aJEhH2qpdxhoww+ilLM7bsxfuEN9saR8yQYmaoTU5XiD28zkOjai5FV
	tyoBRLgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fz8-0000000E1kj-1yEJ;
	Wed, 02 Sep 2026 08:06:18 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fz4-0000000E1gP-1qRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PYz90TRr0+Fy2EqkgCP2u40jCTa6/ZMbOumw0L8qocQ=; b=emjCrp2JvyczuPrIEBTplKFjtE
	LKCZfjLlFj7phDxV1jGutyp1XnN6fxkulEK9Aon2XwK2r9/oZTgJSdw3zh/Quxx9yEjHHzipN5Y7V
	7dBWJgF16D3QKPlZWJ5A4DfBEwdixEmvU2boH6mcOb6uiFyBNJ/uhi61rkhFEr9km7u4Y72lcmeZY
	8Ir5J0TalNLme14G4ewxrbc7a1N7zSuwN5N2xwJ/BaXCzQkWiXtFAMVqQZ7SO53UHPA6yKBKG/5MW
	EBaEFK/N7zga8MR39BhlHQGEeYIXr56fMa+nkUbTVGM+zxpcLS5CquztF2ogM8IzWOxj14ndC1Ta3
	Atuj2+HQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1fyx-000KR8-1a;
	Wed, 02 Sep 2026 10:06:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1fyw-0006It-34;
	Wed, 02 Sep 2026 10:06:07 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 2/2] ARM: dts: imx7-tqma7: sort I2C device nodes by address
Date: Wed,  2 Sep 2026 10:05:38 +0200
Message-ID: <322d6e916243122662e06941ff6b0104cf84fb09.1788335665.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
References: <9a916f24b610cc60e0efd13296f281e00b41391e.1788335665.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010614_587952_5DFEAA88 
X-CRM114-Status: GOOD (  11.78  )
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

Fix order of the nodes to follow convention.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
index 7f49c80fef4c6..353af6b320cb6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi
@@ -137,6 +137,12 @@ vgen6_reg: vldo4 {
 		};
 	};
 
+	/* NXP SE97BTP with temperature sensor + eeprom, TQMa7x 02xx */
+	se97b: temperature-sensor@1e {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x1e>;
+	};
+
 	/* LM75A temperature sensor, TQMa7x 01xx */
 	lm75a: temperature-sensor@48 {
 		compatible = "national,lm75a";
@@ -144,12 +150,6 @@ lm75a: temperature-sensor@48 {
 		vs-supply = <&vgen4_reg>;
 	};
 
-	/* NXP SE97BTP with temperature sensor + eeprom, TQMa7x 02xx */
-	se97b: temperature-sensor@1e {
-		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
-		reg = <0x1e>;
-	};
-
 	/* ST M24C64 */
 	m24c64: eeprom@50 {
 		compatible = "atmel,24c64";
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


