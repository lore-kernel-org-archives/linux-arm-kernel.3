Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE680D3B7DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P+iuscllDb8ilfy3+mvnn24ddRVkHcFUY/gEBiJ/Ps4=; b=0os6v2OBbKXuKX/R10S2YRJ+xN
	C70he9KLtH7trtOXeZ536Hlsm7wqkDICjhcwLeU9qwTsC5rXsCccLDXkAUUltAAPEwKq/FcFm/0Lc
	wLqwd0AlLNGzZna8rRdbVZYNjEQK/r+GZkuFGRMYteqnx6g93D8kqv+NQvmEVLKOeR4gfGVNBroGf
	y6f7UdOWJYPxGUbLnLLv5t17CyJw5EFcuJ19TjGD6ddo4xPBE9cwxeVPmA5msPwhhtW37G+v1shto
	ipYMiNmSLhmux3WKnPUwparsrGt7NLZFwGH/LXCrDLRfbm5vtX9IjekzXIm2YLdSFuePoctCy298g
	1D5rGqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwUA-0000000B6WO-1dNg;
	Sat, 06 Dec 2025 17:54:22 +0000
Received: from abscue.de ([89.58.28.240] helo=srv01.abscue.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRwU7-0000000B6Vo-11tI;
	Sat, 06 Dec 2025 17:54:21 +0000
Received: from srv01.abscue.de (localhost [127.0.0.1])
	by spamfilter.srv.local (Postfix) with ESMTP id BEA4D1C560C;
	Sat, 06 Dec 2025 18:53:55 +0100 (CET)
Received: from fluffy-mammal.metal.fwg-cag.de (unknown [IPv6:2001:9e8:cdc0:3900:2bdf:1fd3:90e3:ead1])
	by srv01.abscue.de (Postfix) with ESMTPSA id 3764F1C560B;
	Sat, 06 Dec 2025 18:53:55 +0100 (CET)
From: =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Date: Sat, 06 Dec 2025 18:53:51 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8183: Add missing endpoint IDs to
 display graph
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251206-mt8183-display-graph-v1-1-a30e54481f28@abscue.de>
X-B4-Tracking: v=1; b=H4sIAK5tNGkC/x2MWwqAIBAArxL73YIainSV6ENzq4UeohFFdPekz
 xmYeSBTYsrQVg8kOjnzvhWQdQXD7LaJkENhUEJpqYTB9bDSNhg4x8XdOCUXZ9TCFDkY6xsPJY2
 JRr7+bde/7wecG5dVZgAAAA==
X-Change-ID: 20251206-mt8183-display-graph-506183c68b3b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Evans Jahja <evansjahja13@gmail.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_095419_440910_9E01B5FE 
X-CRM114-Status: UNSURE (   9.55  )
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

The endpoint IDs in the display graph are expected to match the
associated display path number, i.e. all endpoints connected to
mmsys_ep_main must have reg = <0> and all endpoints connected to
mmsys_ep_ext must have reg = <1>.

Add the missing ID to all endpoints in the display graph, based on
mt8365.dtsi as an existing example that does this correctly.

Fixes: e72d63fa0563 ("arm64: dts: mediatek: mt8183: Migrate to display controller OF graph")
Reported-by: Evans Jahja <evansjahja13@gmail.com>
Closes: https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/
Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 122 +++++++++++++++++++++++++------
 1 file changed, 98 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 4e20a8f2eb25803057955401a7737c7f029a1424..0c73043c67fd01147179e8f9b065684f67749ec2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1754,15 +1754,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					ovl0_in: endpoint {
+					ovl0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&mmsys_ep_main>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					ovl0_out: endpoint {
+					ovl0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ovl_2l0_in>;
 					};
 				};
@@ -1783,15 +1789,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					ovl_2l0_in: endpoint {
+					ovl_2l0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ovl0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					ovl_2l0_out: endpoint {
+					ovl_2l0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&rdma0_in>;
 					};
 				};
@@ -1812,15 +1824,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					ovl_2l1_in: endpoint {
+					ovl_2l1_in: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&mmsys_ep_ext>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					ovl_2l1_out: endpoint {
+					ovl_2l1_out: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&rdma1_in>;
 					};
 				};
@@ -1842,15 +1860,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					rdma0_in: endpoint {
+					rdma0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ovl_2l0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					rdma0_out: endpoint {
+					rdma0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&color0_in>;
 					};
 				};
@@ -1872,15 +1896,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					rdma1_in: endpoint {
+					rdma1_in: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&ovl_2l1_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					rdma1_out: endpoint {
+					rdma1_out: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&dpi_in>;
 					};
 				};
@@ -1901,15 +1931,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					color0_in: endpoint {
+					color0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&rdma0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					color0_out: endpoint {
+					color0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ccorr0_in>;
 					};
 				};
@@ -1929,15 +1965,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					ccorr0_in: endpoint {
+					ccorr0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&color0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					ccorr0_out: endpoint {
+					ccorr0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&aal0_in>;
 					};
 				};
@@ -1957,15 +1999,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					aal0_in: endpoint {
+					aal0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&ccorr0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					aal0_out: endpoint {
+					aal0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&gamma0_in>;
 					};
 				};
@@ -1985,15 +2033,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					gamma0_in: endpoint {
+					gamma0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&aal0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					gamma0_out: endpoint {
+					gamma0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&dither0_in>;
 					};
 				};
@@ -2013,15 +2067,21 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					dither0_in: endpoint {
+					dither0_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&gamma0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					dither0_out: endpoint {
+					dither0_out: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&dsi_in>;
 					};
 				};
@@ -2047,15 +2107,22 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					dsi_in: endpoint {
+					dsi_in: endpoint@0 {
+						reg = <0>;
 						remote-endpoint = <&dither0_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					dsi_out: endpoint { };
+					dsi_out: endpoint@0 {
+						reg = <0>;
+					};
 				};
 			};
 		};
@@ -2076,15 +2143,22 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
-					dpi_in: endpoint {
+					dpi_in: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&rdma1_out>;
 					};
 				};
 
 				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
-					dpi_out: endpoint { };
+					dpi_out: endpoint@1 {
+						reg = <1>;
+					};
 				};
 			};
 		};

---
base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
change-id: 20251206-mt8183-display-graph-506183c68b3b

Best regards,
-- 
Otto Pflüger <otto.pflueger@abscue.de>


