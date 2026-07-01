Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA62C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S5CD9RCGzTJ8lEWCXCyIZVGHOFsiCgVXwE8Z7g69M4c=; b=eVhsOmjNKTvGMx1YPvXwlso32K
	d/iYae7w7TD4iZmNaO7pNhxuMyLibqNaMnE+yl6xvYKxzoxaAhm3ClKjClcqSCFHPxiBgiMvkF+qN
	SdmxdxE54v8InUYIZFDQ4IQzbkG4nNlIR6EfjXeIoZmA5Q89uM+QbGeFG0JBu7KWX9C8IMC3psIXY
	KctdmDCGZBKxL39OcSL8xOVi4n81AfLy/OBtxT4AGLD/fI/A2Ee1eRxhkccwnduluwD0iYDfqyf6a
	qkxW2DDtlMaTFpaIuEvi/sbjwrPcP87zF4GwZPZkDdejrP8RFC8/6j7BE2QvFCmdCQxUuEBYqUtH+
	BheYp/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werVY-00000001Dpq-1BzQ;
	Wed, 01 Jul 2026 09:45:28 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werVV-00000001Dp3-3atg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=S5CD9RCGzTJ8lEWCXCyIZVGHOFsiCgVXwE8Z7g69M4c=; b=jQrFf5/IjpRWnpMNXSB11D6z+8
	zzx6sCrx6XRbFWE3+I/L/ThV1vsBBSW2gWNmf1jMIsXIoUmd9n1ioU2iIRUATvigGkNkXZ2D7Dfp1
	YtN8xXr3otSf0zQnN18xGcDprra3IefSKll4N3TxBRDik4MeoWjqu+ll3tvuNZB9/yqdLNHPpBggn
	azRfeBdA62Ryx1vPeoGgHUXnohYgj+YNzsTVFaZOLPMTEpniJXPJAoUbmZpF/AdD8wyFxedNWKVY3
	DAWzWQZyOWRxzCkpf9lOT4FsutupWe5kFUn3Cz7bTi+xDakejCH/yWXag6EUDruS8eIUeE/632B6v
	U/b2VZHA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1werVT-000Fue-2j;
	Wed, 01 Jul 2026 11:45:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <Max.Merchel@ew.tq-group.com>)
	id 1werVT-000DCq-1P;
	Wed, 01 Jul 2026 11:45:23 +0200
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6qdl-tqma6: add nvmem-layout
Date: Wed,  1 Jul 2026 11:45:18 +0200
Message-ID: <20260701094520.1482697-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28047/Tue Jun 30 23:29:24 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_024526_007510_926AD6F0 
X-CRM114-Status: UNSURE (   7.93  )
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

TQMa6x has board-information located in EEPROM at offset 0x20.
Add necessary nodes and properties for nvmem cell.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 67f8f59aff5ae..2fa116e1ca9a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -39,6 +39,16 @@ m24c64_50: eeprom@50 {
 		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&sw4_reg>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			module_info: module-info@20 {
+				reg = <0x20 0x60>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index db552802554d4..4361c7efb9d73 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -32,6 +32,16 @@ m24c64_50: eeprom@50 {
 		reg = <0x50>;
 		pagesize = <32>;
 		vcc-supply = <&sw4_reg>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			module_info: module-info@20 {
+				reg = <0x20 0x60>;
+			};
+		};
 	};
 };
 

base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
-- 
2.43.0


