Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A98C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 22:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47lqIEigVXAyy1WMH+pxD6Ez7sii+UkySdEqFjnwnqM=; b=xBgGJXkaOsNUWYQzjlgSR8nPjG
	J9HEWLrXOjjmqPnXl8dSKlZzVYLtv0DhVEyIbO5pcrLLGLN3ZOqWBLxWpydRuemMxCF1U9mHGbIRL
	vdtqymHCLumVtDgP5IADft8xchiy2HvLq8UDo0KcgpOV+XbDD8YVfKgVTvXYeG2myjxNDJdf2FLTH
	rvrO2wb2qTdrjpRllkEhIuAM3z8Yu9/5m1eL/54+oc5pyOpI5+VIkfcTYXqDag3g9VuvSYhtbXE6I
	LEHceT70ZV2JY3niImG7Cbs1GbtUH9WOq963xfXpgKOlcdffXTPox2ZuOJWX7SBF4+DWDbVJPu81r
	ngM2UM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPaD-00000005cVi-3s4K;
	Thu, 02 Jul 2026 22:08:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPa5-00000005cHw-0HSK;
	Thu, 02 Jul 2026 22:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 636BD43F45;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40E10C2BCF7;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=hXyDaGOydTctsYzcs0yrBjLBB6HYhhz/fnaoymcEWeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zpri5625jPcv2wRQEPRWmaigaYaEaqSEwpaPbfS3pGnWt1l91je1j1apl/qut68hL
	 RCNlZstNCsITGtODhQ0uY8pdGMHBvuILiX5GKp85iLrLDaJ6RLx4QpnopULkhsF15O
	 hjRJpn7CbfEZqbpoy20EfzZ96Zy+dGHUWhbu5k0aA3uGcGP/w6SkF9wt6BV0JVFxCy
	 VIls5OfjwbQHCjfJDBF+X2Af23x93zi0/u3S4oLfckvErjp3sGIjjIJd1dbq5+dL1i
	 haBRF8WqtLzp5A2+kZe8mBSmQEgeZ1dT5/DG/Ro9Di5SMkENXAbcIOTAaL/0atUw+B
	 qrcmX5rSMuYRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E356C43602;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:25 +0200
Subject: [PATCH 10/12] arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add
 phy-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-10-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=729;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=gBMET+DbG+jwN0qr/elYvKg3AjYOtdT2r4WKrOud/RA=;
 b=CkSZApDW0t37iqFUuP0m7yJwqvjLXBQVuuMCGZB0WtQqb9NYVo8yYAV16HpqkkRni0u+K5Prv
 QQFQmeUvdzZCimaa3lWH3EjANXVsUVhXfHBx5loK28BrexstMB+3odQ
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



