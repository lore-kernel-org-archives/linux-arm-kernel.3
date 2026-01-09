Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD50FD16819
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ys+BbLelsXeoy9OLae2axeGeJbQPDJZtbQQShWDkoE4=; b=D3mIclZyqDXFWaBjXhAwxnfuom
	M1dJztgk5sdEmwEwla204cIOjX6/2dlMcaAlYy7O39h1lxBgC86hp/bqLUWctJdD2+UanoZgnE2N2
	wTepLdgJaJrcZ2VpkV04c4j1lCRVxe5RX55VZLeboCcGb9mSL7NYNOVvvRyuQiZLhgU9SaAFuKfWA
	9NHPaKCB6U5KPdIi98iJjK9lDI5OafGHu/3BZaGL4JVCXsv99Y1ZsFEuizBSvtYdBTPAD3ilCaj2E
	RDUrvHJ2IimIGE2io8JzS3XT2xmFUV0YJ5hXsrB9PSwKGyToSJqJ3WAjI6SIFI43MMJLpjjlYkWqA
	WXxR4mYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyI-00000002Euv-1065;
	Fri, 09 Jan 2026 11:48:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyF-00000002EtJ-2Abg;
	Fri, 09 Jan 2026 11:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959277;
	bh=AVFWBiwKCm/jZQoJ113urftXHpU+cSUYCfQDg7/mJEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AITNui0cJxabFuy9PzATJ5qODmy+Cth07zX772tiMKwxYTvpl0py0wjahLV2aW9sK
	 eq4ly0QogJRmkzMl388A0RDU8/8ax8m4JOUY+otgMpsIrPmIs0URou7slIS3BBDTVM
	 ve0nH/3MaG5+kQEesE2EJE0byiiNmQQJ7Wa7sdxKYIu+5JirhL3Yw7FIg8YxY/nwoS
	 io4b9EggLG7bU6uK9B1pDIFVqVzZjtugaENtZ0lOIyZGjpSrsZXpwpOBrOsmZ8IEy7
	 CY9XkQtPI9OzD3wQzn5B1BFrwhMgIhl1Qjkc7TMLOwfZJVPVAFZ/YTGOurV01EjRcw
	 XewxfX3o87bEQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6937517E13D3;
	Fri,  9 Jan 2026 12:47:56 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 02/11] arm64: dts: mediatek: mt8183: Fix dtb warnings in display graph
Date: Fri,  9 Jan 2026 12:47:38 +0100
Message-ID: <20260109114747.37189-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034759_722419_71498987 
X-CRM114-Status: UNSURE (   9.22  )
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

---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 119 +++++------------------
 1 file changed, 23 insertions(+), 96 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index db86e2bd0c7b..676f8ecd89e2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1755,22 +1755,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					ovl0_in: endpoint@0 {
-						reg = <0>;
+					ovl0_in: endpoint {
 						remote-endpoint = <&mmsys_ep_main>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					ovl0_out: endpoint@0 {
-						reg = <0>;
+					ovl0_out: endpoint {
 						remote-endpoint = <&ovl_2l0_in>;
 					};
 				};
@@ -1792,22 +1784,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					ovl_2l0_in: endpoint@0 {
-						reg = <0>;
+					ovl_2l0_in: endpoint {
 						remote-endpoint = <&ovl0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					ovl_2l0_out: endpoint@0 {
-						reg = <0>;
+					ovl_2l0_out: endpoint {
 						remote-endpoint = <&rdma0_in>;
 					};
 				};
@@ -1867,22 +1851,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					rdma0_in: endpoint@0 {
-						reg = <0>;
+					rdma0_in: endpoint {
 						remote-endpoint = <&ovl_2l0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					rdma0_out: endpoint@0 {
-						reg = <0>;
+					rdma0_out: endpoint {
 						remote-endpoint = <&color0_in>;
 					};
 				};
@@ -1904,9 +1880,9 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
-					reg = <0>;
 					#address-cells = <1>;
 					#size-cells = <0>;
+					reg = <0>;
 
 					rdma1_in: endpoint@1 {
 						reg = <1>;
@@ -1915,9 +1891,9 @@ rdma1_in: endpoint@1 {
 				};
 
 				port@1 {
-					reg = <1>;
 					#address-cells = <1>;
 					#size-cells = <0>;
+					reg = <1>;
 
 					rdma1_out: endpoint@1 {
 						reg = <1>;
@@ -1942,22 +1918,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					color0_in: endpoint@0 {
-						reg = <0>;
+					color0_in: endpoint {
 						remote-endpoint = <&rdma0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					color0_out: endpoint@0 {
-						reg = <0>;
+					color0_out: endpoint {
 						remote-endpoint = <&ccorr0_in>;
 					};
 				};
@@ -1978,22 +1946,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					ccorr0_in: endpoint@0 {
-						reg = <0>;
+					ccorr0_in: endpoint {
 						remote-endpoint = <&color0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					ccorr0_out: endpoint@0 {
-						reg = <0>;
+					ccorr0_out: endpoint {
 						remote-endpoint = <&aal0_in>;
 					};
 				};
@@ -2014,22 +1974,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					aal0_in: endpoint@0 {
-						reg = <0>;
+					aal0_in: endpoint {
 						remote-endpoint = <&ccorr0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					aal0_out: endpoint@0 {
-						reg = <0>;
+					aal0_out: endpoint {
 						remote-endpoint = <&gamma0_in>;
 					};
 				};
@@ -2050,22 +2002,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					gamma0_in: endpoint@0 {
-						reg = <0>;
+					gamma0_in: endpoint {
 						remote-endpoint = <&aal0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					gamma0_out: endpoint@0 {
-						reg = <0>;
+					gamma0_out: endpoint {
 						remote-endpoint = <&dither0_in>;
 					};
 				};
@@ -2086,22 +2030,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					dither0_in: endpoint@0 {
-						reg = <0>;
+					dither0_in: endpoint {
 						remote-endpoint = <&gamma0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					dither0_out: endpoint@0 {
-						reg = <0>;
+					dither0_out: endpoint {
 						remote-endpoint = <&dsi_in>;
 					};
 				};
@@ -2128,23 +2064,14 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					dsi_in: endpoint@0 {
-						reg = <0>;
+					dsi_in: endpoint {
 						remote-endpoint = <&dither0_out>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					dsi_out: endpoint@0 {
-						reg = <0>;
-					};
+					dsi_out: endpoint { };
 				};
 			};
 		};
@@ -2165,9 +2092,9 @@ ports {
 				#size-cells = <0>;
 
 				port@0 {
-					reg = <0>;
 					#address-cells = <1>;
 					#size-cells = <0>;
+					reg = <0>;
 
 					dpi_in: endpoint@1 {
 						reg = <1>;
@@ -2176,11 +2103,11 @@ dpi_in: endpoint@1 {
 				};
 
 				port@1 {
-					reg = <1>;
 					#address-cells = <1>;
 					#size-cells = <0>;
+					reg = <1>;
 
-					dpi_out: endpoint@1 {
+					dpi_out: endpoint@1  {
 						reg = <1>;
 					};
 				};
-- 
2.52.0


