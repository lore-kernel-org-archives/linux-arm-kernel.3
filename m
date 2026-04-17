Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C808F43689
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7B6T6NkWiCQx5l1h9hFufAwuZjXqiTy70I/kGwZbAfc=; b=4iEuOwA8uwJyazz1Mw5oJ3qh4r
	Qv//im3Pmqub2EQc+pGBnDId6SyuV0FSmAdilXEAaj9pq69fDDMH+ofPTssIh4lCZbFee9NZ7ukXg
	jti7ABRkskK/fPTomcItpIb7s95qwoAx/9JUI5+F09kZc78dx9x2rg2kLTh8Z370hMNxg5DInvQ0U
	6D+CKuwjnMg3wInZ0HpITTMFZHE9gqC+iQDsCAErmAAMObT5pTEOY+onAtrxw8XbubzC2PTEzHDqd
	8QTfvHOi1cNlsc3oAEGQYTSCbCJsxDhlGt885Vri29I/Qd+oCT9eLWN325gY1I7uT6HU+eretq+3Q
	g3gWrtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRz-00000003kk6-1TZ7;
	Fri, 17 Apr 2026 09:25:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRp-00000003ka1-0eOZ;
	Fri, 17 Apr 2026 09:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417908;
	bh=1FB8Ne/opPut3k7EyBbqr/Fla+NvE26RGBGOhlMg2hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TpH6t8oJdmqg64wHT3X/ZeHiGTsq1Ucyd42T2Ay78yhi7QLYC57U9S+9Pv2V8hiIR
	 bfop1mtr4sh9alQjqIPa3OD4zzCD7XvexXwcUAizHS950nINxsI3DEt6N39MHd4IOa
	 WzX0qk3O/0llDRCqJQSQt8hbhItLfF0AEZeQxbNfGIlhjBUhTZHDo8I70eBz5GfdPQ
	 qph8aoVYW9ZlFJMsu6kLWOtYzPbq+EGBCyoQK4xdYyJzB87kN1yTo09Ja7cuv20fLB
	 oPUgX/fQ8pfXO/rjJo9dXaiU9RxSMKf21CD6v9yPrTFoGVOKFxtFkzJVOGcb7hN5hm
	 7ZGvFc9e7F7fA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA87F17E131B;
	Fri, 17 Apr 2026 11:25:08 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:35 +0300
Subject: [PATCH 01/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-100ask-dshanpi-a1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-1-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022513_363969_FDF27164 
X-CRM114-Status: UNSURE (   9.80  )
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

The board exposes the GPIO2_B0 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index b19f9b6be6bf..9f356bfcb663 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -278,6 +278,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -738,6 +740,12 @@ hp_det: hp-det {
 		};
 	};
 
+	hdmi {
+		hdmi_frl_en: hdmi-frl-en {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	pcie {
 		pcie_reset: pcie-reset {
 			rockchip,pins = <1 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


