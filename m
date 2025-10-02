Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F2DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTH0b7xAirQQTRRBx3rhou0NkDJmW/aLTDZEodUR3uQ=; b=loSLQoIh9Tkr4ml6D4u8NnCxOO
	Zwkvkr1rDw1HWD9QnZGSpKgKAYxxX+ty3qGrtuo+rcYfhrlcX4dEbtCUHjVhC/J3UPywHxPM1l2GV
	Ib2S65CJtqU3Yb6y1wyzEqIX1Nz1v7T15A7mJB1uk1qFy4Ts88kSPQ41cADMObM7fD0nHnywMHCgU
	+wIRKKekKj3gyXJyyyPb89xDthutG5I4+7ZDkb5uOKVvgYt6THy20qpu2ubakMsu2AhAfcEqbP6oO
	dAXP0GpyfibyZvdcu3BtxP7tVIE6E2/PG93tsKUL/haF+sAlrIHRAISJCJVSYv0kLufxVPX+LbPln
	x7XFoSMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KUa-0000000Ad10-2lJz;
	Thu, 02 Oct 2025 14:41:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KUY-0000000Acxp-2ZWN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB7D060300;
	Thu,  2 Oct 2025 14:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C22C4CEFD;
	Thu,  2 Oct 2025 14:41:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:41 +0200
Message-ID: <8416011a488aa5ba883fca2647d09e21cad26351.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Move the "interrupt-parent = <&gic>" properties from the soc and timer
nodes to the root node, to reduce duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 13a60656b0447084..95e12b34f8bad37e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r9a06g032";
 	#address-cells = <1>;
 	#size-cells = <1>;
+	interrupt-parent = <&gic>;
 
 	cpus {
 		#address-cells = <1>;
@@ -63,7 +64,6 @@ soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		interrupt-parent = <&gic>;
 		ranges;
 
 		rtc0: rtc@40006000 {
@@ -522,7 +522,6 @@ can1: can@52105000 {
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupt-parent = <&gic>;
 		arm,cpu-registers-not-fw-configured;
 		always-on;
 		interrupts =
-- 
2.43.0


