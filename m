Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49FCCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yW1d/42R1GYGDeKdMOCSDfspCBXcLTUFYYPPsL73KZ8=; b=DZUG9WX7M68E/YUcqOfnRp3NAi
	nZXpvkM28kzvw11HQ44PCMDJwrBwSJkzRMcYkVxWSrDZVWPe0LMIr+9/5T3Lm7MRTUCZnK+gHALA4
	Fj+XMryD7tcUtlXb+6iZZn4fUNxBP8Di6g9jlWk60/yAqkc1cq1+/M1CoawYeGEx/P2ajqeAcrmtN
	0leENKSpnUAwLpAQLjB9cUfel9X7pNWg7+CK4j76nKcIfCsxG6elOyL+qAYWyVpBOnIthPMA3CRQw
	r1kR7hzPHLfy1jiPwlYJlPHmEa1O/j+yftWuGUMvbDAgpXCxaSbEdXCWOBbIxSba5VLN6ufM9ktlM
	Ame+ss/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3us-00000008F88-1pQm;
	Mon, 18 Aug 2025 17:45:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3PT-000000086XY-0Vhh;
	Mon, 18 Aug 2025 17:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755537154;
	bh=SAYLvt+TdvOMWkry0P3jnEHv9OeBgLFTEiK5Js0VPL0=;
	h=From:Date:Subject:To:Cc:From;
	b=kvOsrAjxoBCrN6ZAjhHp+z6Fuy0Lo20VFIjJfaDaDPOCCe7o0JbPjwjYS76J3ubGS
	 qWyd/zPiFeiVp7gohcE4Apj156HY4FeK0naTjIE4aMNyogQNoHW5f1ulEKp8N3x7o3
	 clRVSYPBLI8GmMjwN1qULWlx2p8gWwti1duFk7LY1BqOh0eeskM7g33w8sn8+vPopz
	 Ho2RU+lzNU2m+iwEitCoL5/vmWbtKsKVegkaJo3WlCjCZXUbT5gRYhwtZgs094fqld
	 2986+acmaY0ilq+Mdwvvgp+X3L6+2PNnk9TYqKhwgSJP8S/Qd37H7z1fmDXfNn/YYk
	 KbRBagbd5lMGQ==
Received: from jupiter.universe (dyndsl-091-248-210-167.ewe-ip-backbone.de [91.248.210.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B4B817E0DE3;
	Mon, 18 Aug 2025 19:12:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id EF42B480044; Mon, 18 Aug 2025 19:12:33 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 18 Aug 2025 19:12:23 +0200
Subject: [PATCH] arm64: dts: rockchip: correct network description on Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-sige5-network-phy-clock-v1-1-87a9122d41c2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPZeo2gC/x3MTQqAIBBA4avErBtQSZCuEi3KRhsKDY1+iO6et
 PwW7z2QKTFlaKsHEh2cOYYCWVdg5yF4Qp6KQQmlhZEGM3vSGGg/Y1pwm2+0a7QLSiuF040ZtVJ
 Q6i2R4+s/d/37fiaJqhRpAAAA
X-Change-ID: 20250818-sige5-network-phy-clock-1c10f548b522
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=sre@kernel.org;
 h=from:subject:message-id; bh=SAYLvt+TdvOMWkry0P3jnEHv9OeBgLFTEiK5Js0VPL0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGijXwGfiXygZXsYaSAVonahjYg5JoVKFCg4Q
 9VsgfeiOl0lzIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoo18BAAoJENju1/PI
 O/qaZIAQAIivfyWW5RnxUMO+tth3rMGHps2imw6cUeNR4+0t9cuxpBEADAt80yezHZSyh+zsWxa
 InHZXkOFhskpyVidwH20dSEH0nOLqfCppPrkMSBZWUtw9C7b7BEnsldbEhAzCL0FieWbcazhjmq
 JtBVRaLQAvfyQvX4NuWJlkTgOlfSztBRMVEnsbDJVqmAEuUk/GRCyH+WMNV7L9YpoE8JZkLkcy3
 KV6JGwY4R50uakSP0mGjCErSo03xyKFM9CKMD6P3NVfN6H6Gy5gWb1HFb4ZozKJQblkr9n5nxH3
 seEihsfl+BPFnJXEr+pNWEgRZ66GGEllIte9hGnndUWLwKRlC8yw6Q1d8gYFHaQHqQ+If+IEUDo
 vFmy9Fh7M8/afwO7GF5KLF4icJWbGo0iNNJK6jnHofAe54ZHsA+/zMSxyf/HrbCID+ClStZHDdL
 iSgrMNzj299F/KmnOR2JJKdFUIHYdWLBq75vljDWrBwhLS0M0X/cJ0vi9vE0SSmFoYC/z0LDijE
 a+5oAgxw4wkRqJ9Dvpsl7Yl9w8egD+C6+GSxTM9G1iOqsmGda9V5fKh3WG+CStHKHe8jekieNSu
 +0bD8nubWi9aBe13EoFJV1bJc5JpyUHjJftLMwii8LZVNYtd4ZD5MgJaML4bou4fopZC80ayXc4
 SsZ+jPlbGL6q2WEuwKbIgFQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_101239_325858_B9975016 
X-CRM114-Status: GOOD (  10.37  )
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

Both network PHYs have dedicated crystals for the 25 MHz clock
and do not source it from the RK3576.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 101e2ee9766d7bf5dc09eb29b66f5afd89985b76..3386084f63183efe62beea86bc6fe310cc4ed565 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -302,8 +302,7 @@ &gmac1 {
 		     &eth1m0_tx_bus2
 		     &eth1m0_rx_bus2
 		     &eth1m0_rgmii_clk
-		     &eth1m0_rgmii_bus
-		     &ethm0_clk1_25m_out>;
+		     &eth1m0_rgmii_bus>;
 	status = "okay";
 };
 
@@ -784,7 +783,6 @@ &mdio0 {
 	rgmii_phy0: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
-		clocks = <&cru REFCLKO25M_GMAC0_OUT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac0_rst>;
 		reset-assert-us = <20000>;
@@ -797,7 +795,6 @@ &mdio1 {
 	rgmii_phy1: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
-		clocks = <&cru REFCLKO25M_GMAC1_OUT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&gmac1_rst>;
 		reset-assert-us = <20000>;

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250818-sige5-network-phy-clock-1c10f548b522

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


