Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47lqIEigVXAyy1WMH+pxD6Ez7sii+UkySdEqFjnwnqM=; b=3ENyIICIXOIZb2q6IdLoWl+XZr
	/hAjK7X2fPFUBxZN/UBhVzX1Pi9xFSTG4bgMzqqYANWJztOSOoDVyn+O34OEgK/hOvpxM28JNOnS1
	z9UJGNpAfibV5qydIL8SHc8UiDX6UfBHVpp9fS6pfuqX1tyaAMWHaASUm6Vv/4qiSYFg8Wo9rczLx
	oP7PN+IhdOFx9XN6NJI1wKBV08D7y7XxKo+FqlNS1R92ue/WVVqFJWAO0OjYBJ2vHq1idwHXQTXb/
	O/obp8c59u9F+sYHXGVRQUw/AAv+U+fby6lRBvwh7/59zb3q8q5XxvPTRrYS2GWUEaQsuaIGr7DeR
	/id+5Y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJSS-00000005udQ-1a0U;
	Fri, 10 Jul 2026 22:12:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJS9-00000005uE8-3VvW;
	Fri, 10 Jul 2026 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E39261371;
	Fri, 10 Jul 2026 22:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6FDDC2BD04;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=hXyDaGOydTctsYzcs0yrBjLBB6HYhhz/fnaoymcEWeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HTU3kkjQ/jJQxMRHNaTSj3vUhvakobrddpK8UXdKaX4MxLJtH2NoknnNPywMbfAuO
	 UIK0asci8vStypsxoY/HP6rtytFjRYJMIiRHxub0O53j0SKGGMU26u1hqF74mXimd3
	 mfgkzfCIdP+5Y+/BDwyIBzjnsEsVe9RgLZUYRBoLJ44/7HfHt90KaGYPqCQH/QIBVR
	 gRAgvwm8/uDuhW9lkvTMK6MFoDsVJgnzoDYt3WfAMUUxd8ygOjAHLwcU2vluO2g1uj
	 /cv8/HhDIj04/C+LRykBe9lf6w+GlQU2KVaRBruJCn6om131kAOVQXqB866cmgM0qn
	 EeMZjbw6/6QOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AD0C43458;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:59 +0200
Subject: [PATCH v2 10/12] arm64: dts: rockchip: rk3588s-nanopi: add gmac1
 add phy-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-10-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=729;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=gBMET+DbG+jwN0qr/elYvKg3AjYOtdT2r4WKrOud/RA=;
 b=IuKyPvfhXNslByk1jK5xmmwoen/bUYZpX3zi1ek05uKjgV+9AeayQ462IUG1PaOfupCsRmf7+
 12UMJfRza2LDBtLf4kELVxtv3pQwObU+Pi2NGoereneAD5ykbAf0Isd
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

The RTL8211F Ethernet phy is power from the VCC_3V3_S3 rail.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index e4900af9822a..596b5a64c191 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -153,6 +153,7 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.55.0



