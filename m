Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA69DC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3Ti8CpL2SuZlpXJVuEEcZYpKMhbGVINjeKpUqbZCso=; b=2+c7/69htE6LXffFRZjRUODWxc
	/sEofjA2bFuCIHk/3YX14v2E1a4B/MOVZeKhLgrwfaT15kRr0qDU1VHpF0u8NcNy1oSrfb8k1d7AA
	y08LEtQhEvRpaB4mgI7LgIsKbZS67p1n2Yv37779PUlEbQheRTL4GfcYl2sZkPF5DYvVizYY/3PD0
	+MZhDtcbE5bLp5CiKpdBdhTxwvcUYWD2iLfVRAy89NJ5u3wZpXRp4vR3SFid5fFuWQsfMNwUcL6AU
	iZ7nDCS3KTCtVok33p+xmDoHarO/FUlNXnzGvo0R0FsDp85w0sBPIjly+TuV32ocfS4+QlsOB7K3d
	9QKVaa2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP511-00000007y0y-1UVF;
	Tue, 10 Jun 2025 19:52:11 +0000
Received: from smtp-42aa.mail.infomaniak.ch ([84.16.66.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1kA-00000007S53-3Vux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:22:38 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bGvFy4TQbzqkH;
	Tue, 10 Jun 2025 18:22:30 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bGvFx5nLjz14f;
	Tue, 10 Jun 2025 18:22:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 10 Jun 2025 18:22:16 +0200
Subject: [PATCH v2 1/3] arm64: dts: rockchip: fix endpoint dtc warning for
 PX30 ISP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-ringneck-haikou-video-demo-cam-v2-1-de1bf87e0732@cherry.de>
References: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
In-Reply-To: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092235_011095_DD5D0B55 
X-CRM114-Status: GOOD (  14.40  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

dtc complains with the following message for DTSes which use the ISP:

arch/arm64/boot/dts/rockchip/px30.dtsi:1272.19-1276.6: Warning (graph_child_address): /isp@ff4a0000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

Typically, it is expected from the device DTS(I) to update the SoC DTSI
nodes if they have more than one endpoint, so let's assume there's only
one endpoint in port@0 by default, instead of forcing board DTS(I)s to
/delete-property/ address-cells and size-cells to make dtc happy.

Because PX30 PP1516/EVB's endpoint@0 is the only endpoint and
considering its parent node now has no address-cells property, dtc
complains (same messages for PX30 EVB):

arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (avoid_default_addr_size): /isp@ff4a0000/ports/port@0/endpoint@0: Relying on default #address-cells value
arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (avoid_default_addr_size): /isp@ff4a0000/ports/port@0/endpoint@0: Relying on default #size-cells value
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (graph_endpoint): /isp@ff4a0000/ports/port@0/endpoint@0: graph node '#address-cells' is -1, must be 1
arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-451.6: Warning (graph_endpoint): /isp@ff4a0000/ports/port@0/endpoint@0: graph node '#size-cells' is -1, must be 0
arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'

so we fix that by removing the reg property. dtc still complains (same
messages for PX30 EVB):

arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi:447.29-450.6: Warning (unit_address_vs_reg): /isp@ff4a0000/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property

so we also remove the @0 suffix off the node name.

Fixes: 8df7b4537dfb ("arm64: dts: rockchip: add isp node for px30")
Fixes: 474a77395be2 ("arm64: dts: rockchip: hook up camera on px30-evb")
Fixes: 56198acdbf0d ("arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-evb.dts     | 3 +--
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi | 3 +--
 arch/arm64/boot/dts/rockchip/px30.dtsi        | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
index d93aaac7a42f151590808083e3956a0f64ce7710..bfd724b73c9a7647f661b4799df00edd838f1085 100644
--- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
@@ -483,8 +483,7 @@ &isp {
 
 	ports {
 		port@0 {
-			mipi_in_ucam: endpoint@0 {
-				reg = <0>;
+			mipi_in_ucam: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&ucam_out>;
 			};
diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 3f9a133d7373a122861931b7c8199bee485234a5..b4bd4e34747ca0bc5a6407bf8b0a3de8c08899a7 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -444,8 +444,7 @@ &isp {
 
 	ports {
 		port@0 {
-			mipi_in_ucam: endpoint@0 {
-				reg = <0>;
+			mipi_in_ucam: endpoint {
 				data-lanes = <1 2>;
 				remote-endpoint = <&ucam_out>;
 			};
diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index feabdadfa440f96c0134a0bb05e64a0c7b5adf2e..8220c875415f52bb2098af5c0647cae8fe5c9aed 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1271,8 +1271,6 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 			};
 		};
 	};

-- 
2.49.0


