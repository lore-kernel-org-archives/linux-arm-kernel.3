Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F5FCC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DETKo3yLhGWNTv/64Tlr742Y9cCdh/KuxeZvKxyI3TY=; b=W/fodkicFUhpft31vUqQB1kgC1
	D5tNlx/wu0Ob8T9XoNA6srIHF0gI6y2+BFpdM7OXCsymeJaLRa1jl/573t92WgBYASGSH5CDmqsWO
	SK5CsJUvZAIyCY6xKvoGrxXXhGsWlO8fzaASaYuxdCc9N5aR+ZNIUSybDBvkNkzciIeNuQhaRhvWU
	Gx/cJ1zRGODATZTb/Eg2JPiCBimbjwAP1m2jUVAtAZ/Pq3lYDzXgGoc+XulmJkwTMEaa5Nfj7gkiB
	9GGFDG1wbcOfv4kon2LqGO5T+XXq/sAmrwHzWsHtKcoRrvlwP53gAQg23BVAfE+FjM0VxCF9PPL/8
	z/yLbc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wH-0000000FzBR-3qYv;
	Wed, 14 Oct 2026 16:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wF-0000000Fz7W-2Vq2;
	Wed, 14 Oct 2026 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 224CA44780;
	Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05E31C2BCFD;
	Wed, 14 Oct 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995687;
	bh=K8zjjQF5yT+P0g5cD5EJ3sZntjAqtwV3y6uaav5MeLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dupVvL7jK0tZTW+Dl5XkC7hQJ2qJe6LwpUX2gbWEjdSLNU5uNfFYIm64q0BcBLsrl
	 nFzbm2HZCEPkWuiPgdvHAU/bNv8JL+PlXLexvh7jgJyGmUtU4wwjddmRu8zNX0adbf
	 tCW6pBpGwpeCa41No0aTsMBUP6dnoR/tr5v9ko0SxK1i/ticQkJc3ptIEBJW3NHuo3
	 4ZACFsCX+DAL4Ujm6eySpFBnpPzgoy6acLjxl/rwuiM6gQrFXFLEtkMJmkNTNY+rKF
	 WyMw8hfvg4esirRsVtBiAMUAT5/Zj2MdlMcgDxhS3HBCwxguQ+K1nIUfihbh1P+4M5
	 GygRhV5eXFV7g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B3CC6B1A;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 18:33:09 +0200
Subject: [PATCH 9/9] arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2
 power rail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nanopi-m6-improvements-v1-9-e713f71eb4d3@gmail.com>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1347;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=sa5+w9akUhc5UnYTeKWIOEz5rjtnoSRpmbzGcB+u7yU=;
 b=S9y6ZtmyOvHQtvQQ3RbtPmpquB7+uHS1JIHD0tDq1fzByb33nuRGpCC0nLBIpHPgHT7gRSFlw
 ZK6IvbFglwhCPJUDKZ/dwkjDGARX5g1LfxqTfkoYkjluFxMTCoAC9ar
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

vcc3v3_pcie matches the signal name in the schematics, which simplifies
cross-referencing.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
index ca115d8e108a..dd61c61fe7d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi
@@ -36,13 +36,13 @@ user_led: led-1 {
 		};
 	};
 
-	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
+	vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		enable-active-high;
 		gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie20x1_2_con_pwren>;
-		regulator-name = "vcc_3v3_pcie";
+		regulator-name = "vcc3v3_pcie";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc5v0_sys>;
@@ -95,7 +95,7 @@ &pcie2x1l1 { /* M.2 E-key 2230 */
 
 &pcie2x1l2 { /* M.2 M-key 2280 */
 	pinctrl-0 = <&pcie20x1_2_perstn_m0>, <&pcie20x1m0_clkreqn>, <&pcie20x1m0_waken>;
-	vpcie3v3-supply = <&vcc_3v3_pcie>;
+	vpcie3v3-supply = <&vcc3v3_pcie>;
 };
 
 &pinctrl {

-- 
2.56.0



