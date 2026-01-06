Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197FFC47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cRpex42fGgyXVHSWOllrPxFrDLh4lSLEJKcidCW9g6k=; b=Lrv/YjpioZcHNWQf/p4hmLAfFq
	gLPKCTncRZkIGqIR/oDH1ApU8F8cGknUbFKV3S31UL7wUdR7U/Fep6BGykSjDhPRDaJC+ZgHJRQu/
	NjmC9bkqqOWpLorpfiUPcv/7mHBITUZhs+Ve7tkmPZZSGRi4aOZ7jtYsHi0K19ZY/ZQb/LHuPqTPv
	539Jw3sNpT0hfFU2H7e7YU1LVPdUT9JnVlrcGkwsOefl+H1PN1CZyZ+yhcbLxPlis/Sssu9QY0GLM
	8G2UAzxD+247+lewMqvx8LcbK2AH5GZntKrGJTOATsV3lV/HzS/xHozmVEJopamUYmEfa7cue6jrE
	dgdOeizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd42M-0000000ClJ0-3wyZ;
	Tue, 06 Jan 2026 10:11:38 +0000
Received: from abscue.de ([89.58.28.240] helo=srv01.abscue.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd42I-0000000ClG6-2mSb;
	Tue, 06 Jan 2026 10:11:37 +0000
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id CFC531C244E;
	Tue, 06 Jan 2026 11:11:16 +0100 (CET)
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdc2:6400:a8e6:fbd5:9810:ee8b])
	by srv01.abscue.de (Postfix) with ESMTPSA id 6E9501C244D;
	Tue, 06 Jan 2026 11:11:16 +0100 (CET)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Tue, 06 Jan 2026 11:11:12 +0100
Subject: [PATCH v2] arm64: dts: mediatek: mt8183: Add missing endpoint IDs
 to display graph
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de>
X-B4-Tracking: v=1; b=H4sIAL/fXGkC/4WNTQqDMBBGryKz7pT8qISueo/iIiajDrQaEhsq4
 t2beoEu34PvfTskikwJbtUOkTInXuYC6lKBm+w8ErIvDEqoRirR4ms10mj0nMLTbjhGGyZsRFu
 ka02veyjTEGngz5l9dIUnTusSt/Mly5/9E8wSJVotqKlrIwdl7rZP7k1XT9Adx/EFAWJigrgAA
 AA=
X-Change-ID: 20251206-mt8183-display-graph-506183c68b3b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Evans Jahja <evansjahja13@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_021135_877273_1D521D7A 
X-CRM114-Status: GOOD (  11.94  )
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

The endpoint IDs in the display graph are expected to match the
associated display path number, i.e. all endpoints connected to
mmsys_ep_main must have reg = <0> and all endpoints connected to
mmsys_ep_ext must have reg = <1>.

Add the missing ID to all endpoints in the display graph, based on
mt8365.dtsi as an existing example that does this correctly.

Fixes: e72d63fa0563 ("arm64: dts: mediatek: mt8183: Migrate to display controller OF graph")
Reported-by: Evans Jahja <evansjahja13@gmail.com>
Closes: https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
Changes in v2:
- Change property order to follow device tree coding style
- Link to v1: https://lore.kernel.org/r/20251206-mt8183-display-graph-v1-1-a30e54481f28@abscue.de
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 146 ++++++++++++++++++++++++++-----
 1 file changed, 122 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 4e20a8f2eb25803057955401a7737c7f029a1424..db86e2bd0c7bd61236a9eef16e803374810d3d1a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1755,14 +1755,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					ovl0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ovl0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&mmsys_ep_main>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					ovl0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ovl0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ovl_2l0_in>;
 					};
 				};
@@ -1784,14 +1792,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					ovl_2l0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ovl_2l0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ovl0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					ovl_2l0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ovl_2l0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&rdma0_in>;
 					};
 				};
@@ -1813,14 +1829,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					ovl_2l1_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ovl_2l1_in: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&mmsys_ep_ext>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					ovl_2l1_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ovl_2l1_out: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&rdma1_in>;
 					};
 				};
@@ -1843,14 +1867,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					rdma0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rdma0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ovl_2l0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					rdma0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rdma0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&color0_in>;
 					};
 				};
@@ -1873,14 +1905,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					rdma1_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rdma1_in: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&ovl_2l1_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					rdma1_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rdma1_out: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&dpi_in>;
 					};
 				};
@@ -1902,14 +1942,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					color0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					color0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&rdma0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					color0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					color0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ccorr0_in>;
 					};
 				};
@@ -1930,14 +1978,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					ccorr0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ccorr0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&color0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					ccorr0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					ccorr0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&aal0_in>;
 					};
 				};
@@ -1958,14 +2014,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					aal0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					aal0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ccorr0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					aal0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					aal0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&gamma0_in>;
 					};
 				};
@@ -1986,14 +2050,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					gamma0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					gamma0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&aal0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					gamma0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					gamma0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&dither0_in>;
 					};
 				};
@@ -2014,14 +2086,22 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					dither0_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dither0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&gamma0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					dither0_out: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dither0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&dsi_in>;
 					};
 				};
@@ -2048,14 +2128,23 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					dsi_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dsi_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&dither0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					dsi_out: endpoint { };
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dsi_out: endpoint@0 {
+						reg = <0>;
+					};
 				};
 			};
 		};
@@ -2077,14 +2166,23 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					dpi_in: endpoint {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dpi_in: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&rdma1_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					dpi_out: endpoint { };
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dpi_out: endpoint@1 {
+						reg = <1>;
+					};
 				};
 			};
 		};

---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20251206-mt8183-display-graph-506183c68b3b

Best regards,
-- 
Otto Pflüger <otto.pflueger@abscue.de>


