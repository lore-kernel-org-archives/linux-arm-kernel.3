Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EC1C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQjgHcRCWrQo9LyCSUi1s4mSdMOlhPB33VHZe2vFb8E=; b=OqpISZzrYkUmqaMOZ1Eq0PDNdU
	gP7UhMHa2VhLZAyU2uhfDw2I/Gd2BMXZc63HSOtehf5iG3qqe8qJJ5+wxsPOECud47V4T522qC2ib
	tOBFZD9HVmgmjx277xM23jXt2rm19adgA5d6KvlHHSYj0Ncq23FjtjDY2P1phMc1kFqzmtEeTvQLD
	+mXvg/Jgkl0Q4j1lDjGZ7m2I+pvOfQAnqEQzOfjmnh6sLjX6ZuIaTeF4UvmI1co8g//BuppyPKQy6
	MP+W3Vj5IUDolRNYVhKDUcSnG1snrdI3ht+zj2UgIUvwtFX04xKsvZ7JJ++puvGihQjkACWFBmFCR
	rXLvGxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUhQ-0000000HY8N-09Eu;
	Wed, 08 Jul 2026 16:00:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUhO-0000000HY8B-2Jlv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:00:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 111F543487;
	Wed,  8 Jul 2026 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C465B1F000E9;
	Wed,  8 Jul 2026 16:00:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 10/10] arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
Date: Wed,  8 Jul 2026 18:00:20 +0200
Message-ID: <b3bf4e1f45bf7fba9a4c4f2f0961ce2986ea02ff.1783505329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
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

Link the various Clock Pulse Generator (CPG) and Module Controller
(MDLC) device nodes to their SCMI provider.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 00b5a010b7247722..5c009df903771687 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -129,6 +129,10 @@ tee@8c400000 {
 	};
 };
 
+&cpg {
+	firmware = <&scmi>;
+};
+
 &extal_clk {
 	clock-frequency = <16666600>;
 };
@@ -142,6 +146,118 @@ &hscif0 {
 	status = "okay";
 };
 
+&mdlc_aon {
+	firmware = <&scmi>;
+};
+
+&mdlc_cmnn {
+	firmware = <&scmi>;
+};
+
+&mdlc_cmns {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr0 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr1 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr2 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr3 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr4 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr5 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr6 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr7 {
+	firmware = <&scmi>;
+};
+
+&mdlc_dsp {
+	firmware = <&scmi>;
+};
+
+&mdlc_gpc {
+	firmware = <&scmi>;
+};
+
+&mdlc_hscn {
+	firmware = <&scmi>;
+};
+
+&mdlc_hscs {
+	firmware = <&scmi>;
+};
+
+&mdlc_imn {
+	firmware = <&scmi>;
+};
+
+&mdlc_ims {
+	firmware = <&scmi>;
+};
+
+&mdlc_mm {
+	firmware = <&scmi>;
+};
+
+&mdlc_npu0 {
+	firmware = <&scmi>;
+};
+
+&mdlc_npu1 {
+	firmware = <&scmi>;
+};
+
+&mdlc_pere {
+	firmware = <&scmi>;
+};
+
+&mdlc_perw {
+	firmware = <&scmi>;
+};
+
+&mdlc_rt {
+	firmware = <&scmi>;
+};
+
+&mdlc_scp {
+	firmware = <&scmi>;
+};
+
+&mdlc_top {
+	firmware = <&scmi>;
+};
+
+&mdlc_vio {
+	firmware = <&scmi>;
+};
+
+&mdlc_vipn {
+	firmware = <&scmi>;
+};
+
+&mdlc_vips {
+	firmware = <&scmi>;
+};
+
 &mfis_scp {
 	status = "okay";
 };
-- 
2.43.0


