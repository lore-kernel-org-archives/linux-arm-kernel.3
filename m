Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC29C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmqJmFqL3f9Ul549GQDF2Vbu6Pyh7mgtxvfqWIXqGs8=; b=bAvvwv8n9TdNrQICrqIUuhCmwh
	aoNjAoypBsB7XmQ0iemf+vGHk2v/FdamOvCjMgDgGMKKzEkLkfPTZpb6iHWrxXPUL89aT+if6MKwc
	i+eFVDbWBikuX+1NiKia5/H6f0tA/+8vxKhhjSEU/Hodc0VF+iyHmKi6NqETitUQq7xmPdKzZx/FZ
	4JifXleI5eMPiiRkdjiVQfkED2WlRFnFbvWj5W4qK95CNzRJdp+xTxOlMhEsCnuO+z8yhkV1yxGvF
	oMpmgpma09eir4QytB5NhS4ACdLUz9jroEJpe9SZS+idx/g6y6HH8tKeR+dBRmWC1WdJTKhEdOhsq
	9ZI/zhAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0E4-0000000CqGO-1srM;
	Thu, 23 Jan 2025 16:38:40 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0Cm-0000000CqCx-21nU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:37:22 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:4563:f165:f885:ebc1])
	by albert.telenet-ops.be with cmsmtp
	id 4gdB2E00F5PrELR06gdBEk; Thu, 23 Jan 2025 17:37:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tb0CU-0000000EEZY-3aR7;
	Thu, 23 Jan 2025 17:37:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tb0Cd-00000000mL3-24G3;
	Thu, 23 Jan 2025 17:37:11 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Disable rswitch ports by default
Date: Thu, 23 Jan 2025 17:37:10 +0100
Message-ID: <c4688de8e3289ad82c2cd85f0893eac660ac8890.1737649969.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_083720_669261_3E8E64EA 
X-CRM114-Status: GOOD (  10.11  )
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

The Renesas Ethernet Switch has three independent ports.  Each port can
act as a separate interface, and can be enabled or disabled
independently.  Currently all ports are enabled by default, hence board
DTS files that enable the switch must disable all unused ports
explicitly.

Disable all ports by default, and explicitly enable ports that are used,
next to their configuration.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is similar to how Ethernet switch ports are handled on RZ/N1D, and
CAN-FD channels on R-Car Gen3/4.

If accepted, I'm wondering if I should move it forward, before "[PATCH
3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles"[1],
which would become slightly simpler.

[1] https://lore.kernel.org/all/20250118111344.361617-3-marek.vasut+renesas@mailbox.org
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 3 +++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi                 | 3 +++
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts             | 6 ++----
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 892729786d00b36e..ad2b0398d35431a1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -57,6 +57,7 @@ &rswitch_port0 {
 	phy-handle = <&u101>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 0>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -75,6 +76,7 @@ &rswitch_port1 {
 	phy-handle = <&u201>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 1>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -93,6 +95,7 @@ &rswitch_port2 {
 	phy-handle = <&u301>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 2>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 840ba73c03f1b6f4..06be9f7720d64179 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -989,14 +989,17 @@ ethernet-ports {
 				rswitch_port0: port@0 {
 					reg = <0>;
 					phys = <&eth_serdes 0>;
+					status = "disabled";
 				};
 				rswitch_port1: port@1 {
 					reg = <1>;
 					phys = <&eth_serdes 1>;
+					status = "disabled";
 				};
 				rswitch_port2: port@2 {
 					reg = <2>;
 					phys = <&eth_serdes 2>;
+					status = "disabled";
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 24ecdf6e8476a945..df652e7b85c95ebe 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -187,6 +187,7 @@ &rswitch_port0 {
 	phy-handle = <&ic99>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 0>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -205,6 +206,7 @@ &rswitch_port1 {
 	phy-handle = <&ic102>;
 	phy-mode = "sgmii";
 	phys = <&eth_serdes 1>;
+	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -218,10 +220,6 @@ ic102: ethernet-phy@2 {
 	};
 };
 
-&rswitch_port2 {
-	status = "disabled";
-};
-
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.43.0


