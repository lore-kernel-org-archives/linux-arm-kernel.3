Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C1C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 22:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=279tSLrov/wxN8jRYJcD1Jhg+HaTlhUiXxXsS/jZ4Kk=; b=a/NJal7yFStLJsQo6px6k9Tyq6
	MS3CHCucKsSrYg0nUc821FaoEX35B4SHWFdjIu5yP3mVrOEzbR0O1CHygX9KcEmtf3xiKF2q03nKF
	YFFn90/xY9KeRIbRha+vGXzPN6qLjXHv+3EBNyuiRc+24IxE13uf3k1tqxnX6kLWXuzm3SNy+nHi4
	b/PJgbnXxb9P47BSjetXVWPT7rMtvmGdp/wJ5FBbcHwIZR3DJulEHfkRGJKe2f8P6Mrn3AmMGv8tw
	8c/mBUuEL5tT6aUPEjZt/6Cg8Man3JXFkzvemIlWw5G/IGX8gezk5cz0W9mdjBwmM7KagG52MdZXo
	P2bo6MSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPaC-00000005cR3-2Ta8;
	Thu, 02 Jul 2026 22:08:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPa4-00000005cHL-3akY;
	Thu, 02 Jul 2026 22:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 203B243EF8;
	Thu,  2 Jul 2026 22:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C45C2BCFF;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783030104;
	bh=ott/e/PsVQ7ftOVMoDZvH/I1/494RVUTk6InVE/vBKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DZJeYkNh5/Zqu+LUlcJ9qLgv5Bv5kM2jZXGCvVNN6qSAQbjYLvGyknQwkJWysoSAF
	 cV21zUOBr1oWcM08vfBlL7nIeBL/dKiZ85K/JcIaBOKbsNpBKjgnsIuPebH0zRnfgM
	 yuBBp2bO9Kr28uiAZPj0n8SBZPMji65jp0KIJxfmRWvvXOlrftVk0MP1vnFk11i1iH
	 M4RebIgvMkOZQsLM/0reoaiqrynZxynk6uHcCWISYL+S47mpEgsQq834Gz0dWqtKXU
	 9EtLPyDEhM8bBGP5aU6is4+zObl6uuroeZ2frMRVdnpI+iDAwSAugP15GNjRVn/kyu
	 jlZiOCXYRF/bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D231AC44502;
	Thu,  2 Jul 2026 22:08:23 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Fri, 03 Jul 2026 00:07:19 +0200
Subject: [PATCH 04/12] arm64: dts: rockchip: rk3588s-nanopi: add missing
 sdmmc cd pinctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-nanopi-m6-v1-4-8344a1559519@gmail.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
In-Reply-To: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783030102; l=1037;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=RwYpiB/RtND/z6LPjHWK2wsSxC8Q0Qs9K3NgIPhkNgo=;
 b=XisTuZZGCV1AVfD+TzkRzyHXLHFHpBImklosu4XKYZv5/Dji/tqIl2PXldu3LKtNebjAStaiP
 eLSoD9/PhqYD/Ji28zIJlxCjd6ItJt3v5tF7laDFKxZK9Wp8k4aOPCG
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

The cd (card detect) pin is used, but not reserved through pinctrl.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index d41c49716fa2..a8f32b994b10 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -336,6 +336,10 @@ rtc_int: rtc-int {
 	};
 
 	sdmmc {
+		sdmmc_det_pin: sdmmc-det-pin {
+			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		sd_s0_pwr: sd-s0-pwr {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -407,6 +411,8 @@ &sdmmc {
 	no-mmc;
 	no-sdio;
 	sd-uhs-sdr104;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
 	vmmc-supply = <&vcc_3v3_sd_s0>;
 	vqmmc-supply = <&vccio_sd_s0>;
 	status = "okay";

-- 
2.55.0



