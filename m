Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB1FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLT4fxUunr4SenpEsMdSCII5G72GyT2Gjjn7e7GZCj0=; b=v/rh8Tx78ci7Fw2lj7W1syUIxr
	RQ0t//lo2Lm+xNj/0s7NBgvH8EGrEL0mxMmICATBScNa6kwvYn/Qv9HSR5DXKzTp02moNOe1s5yr9
	gE1qcURzzZCKvBKUMnt4b2sseKOpqbzYTJ/JCY8rTit2443l+JNlgEXMhNsDwOUetzaVfIvxYZYDJ
	uaY57RPXihe2dgGpDnEMWwKlherOVyAEcd+9SRja8aybCUUwVBLOvzH3ulsfkQXSJ0USp/CfTx89u
	SnGL6DC0AAAw0bGFQ1OowBO3fO2GwTbmqniiukAme+PAAb03AK2TUxkOKrfSbEGUwesaYm0LGRc/0
	2S7Hxv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpqq-0000000HNQc-14CJ;
	Wed, 17 Jun 2026 12:58:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpqm-0000000HNO5-3VC5;
	Wed, 17 Jun 2026 12:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6641E40D84;
	Wed, 17 Jun 2026 12:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 494AFC4AF15;
	Wed, 17 Jun 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781701116;
	bh=ZwE7QIllR5UjXdD36Vy637TMxtThVapvnR6S8FAuDUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KU1YOTDw+2Rbp9JYLM/X5toz84SrCiAiJJd9fs7Gt1YL2XZANdp2NpBwTNoimI7ST
	 A6D4qK+KjRNE5hThoKjc285XJMs7Vz8G1EIxewiLTLjSBND64yHMCYuGWXdIMdbtaX
	 sf1j9IWmH5V1Rcw50LtR6DNVI8dYM20Ph3Xw84TOHxVtrXgW47lvipKnH288Op6JXD
	 /niP7NdOjSocZVzUfY3S3ChBzQ+seaduSPDP1R7G85PBdP5ZiX6ZRQF0A/T24Aipox
	 4uuww7Xq6c/mh5Tgo81VuCgsYETU/VNZwgQIT+IE1W0ThZvQmgF3oASB07bwjHq0wS
	 OtQGlHwK2XBtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B585CD98E2;
	Wed, 17 Jun 2026 12:58:36 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 17 Jun 2026 14:58:30 +0200
Subject: [PATCH v4 3/3] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on Radxa ROCK 5 family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-3-2bd38922d129@pardini.net>
References: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
In-Reply-To: <20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=MognxmUJ6xqKPxqxbx7vV1ir4AaICF3oo7pMGUUP9SY=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqMpn5nzZFgZCVPzJQ5hejWuqpriuYPqCKN4E+U
 5NPdJDcxIyJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCajKZ+RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7enDYQgAhTEPZa3xyAoVucFR5lfweGyEi+18ig9
 hNb6ty67yz4A3kVZVJCXGioEFpOu+Ax+hJm9ELV/6LyvrlwG1w0pNQOf4rcGdrMLjwqy9E8C39T
 ghQRgAXm6LXw65+9MgOI145DYXEQJJpKQHou7q6z0IAJ9tkruKPBT9emgh/BEZLfbj6fV1MtKk/
 +CdRbKuQtC1Pj/mhR1bpIBhF0dKvZ/7hkzw53fc+Fqr/Yij7vwX4QXY9a04EhtBNovJV0eKMeGn
 LDDq4bteRpWmn0N+xtwtxU77fJtGs80K7qJ3xGyInpOvgpZLx/R9KECSZaZ3PIwLwg0CxiFaSLR
 Ol3DM6fti8Q==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The Radxa ROCK 5B / 5B+ / 5T all carry on-board Realtek RTL8125 NICs.

Describe the fixed function nodes and attach ethernet0/ethernet1
aliases, so that U-Boot's fdt_fixup_ethernet() can inject mac-address
properties from its ethaddr/eth1addr env, for stable MACs across
boots that both U-Boot and the kernel agree on.

The RTL8125 on pcie2x1l2 is shared by all three variants. The ROCK 5T
additionally describes pcie2x1l1 with its second RTL8125.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts        | 18 ++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index bf4a1d2e55ca3..b53dfe6848cce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -10,6 +10,7 @@
 
 / {
 	aliases {
+		ethernet0 = &rtl_eth0;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 		mmc2 = &sdio;
@@ -482,6 +483,20 @@ &pcie2x1l2 {
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x41 0x4f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
index 425036146b6d9..b1a3e4b2165f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
@@ -8,6 +8,10 @@ / {
 	model = "Radxa ROCK 5T";
 	compatible = "radxa,rock-5t", "rockchip,rk3588";
 
+	aliases {
+		ethernet1 = &rtl_eth1;
+	};
+
 	analog-sound {
 		compatible = "audio-graph-card";
 		label = "rk3588-es8316";
@@ -76,6 +80,20 @@ &pcie2x1l1 {
 	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l1>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x31 0x3f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.54.0



