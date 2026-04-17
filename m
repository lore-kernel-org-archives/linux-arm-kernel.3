Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62712F43689
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBLEQZ5UofSst9vxE8n+3OgLb6sLe31w/UkPcyON7ZE=; b=VASXxzhNvjNCqAfVIQ0FDX6tGW
	NAhUTbLnRe4mxBVMEDqMPSFiQ/3HmZBSnaGexNEeJRnESbvUCdTYjD9IglxPu/mUzQ2k/RgKakykW
	G8NKkr8HF6ib+9gtxF5VTk4jRaMZxD8qNOUwBg+ofO44TxkqQXB089flrerMRdtsMim8vBfhuuvm1
	Yu/qx6+fSiImc0AH+4OsnVWx5vcV5iAy3L2LqDvZQprVo4PwPaHvJRCAvFKjHSOxVChqTt3878gJ3
	V/GKcyDWul0B7Ujhkam7P/SglXaHB1Jqxhr00WlsLQs7KjCjUVkVvqknG7GNYP5WQryDcVYaIObbg
	8J63vDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSG-00000003l8W-32RS;
	Fri, 17 Apr 2026 09:25:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRt-00000003kc6-1cJe;
	Fri, 17 Apr 2026 09:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417913;
	bh=rDeLASuf6S/38jdj7aN4u4jd/aPT+H0uZg6VSl5OLJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oNRkQAD16ZOokCkSZUBvSPJfobAw5NCe+t0VcZhVzAieoEP6q6Ptj9MS2RzzfSef5
	 1+PlEjKf/LKpneBV6TSqskkbT9HtZCTJxK+D/5Q1W3UAuBVj+y7mj9rnZ+6Dy4656E
	 xlWcsUK5VptG8QJ+HKQUqOMxuPFTJKGrWZvnGyU+5XgQmTb5/EsrLL7zJa8BVyVIWp
	 VmsSuCHUl2Wu7SyfZ0CHarS/0iTl9yZhHWBUfkJv47Rty4XtrPfuBRZ2I6cm/zoaMW
	 xXaspjYzMdZvaBTNloK8yPWVf6o1pmMwBXqfiYKwx+2qR071hvR37ZstjmfgDJbatS
	 meEUdfz0k3bvQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CE0417E1412;
	Fri, 17 Apr 2026 11:25:13 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:41 +0300
Subject: [PATCH 07/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-nanopi-r76s
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-7-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022517_626283_78979D59 
X-CRM114-Status: GOOD (  11.22  )
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

The board exposes the GPIO4_C6 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property and drop the line from the vcc5v_hdmi_tx regulator to allow
adjusting the bias when transitioning between TMDS and FRL operating
modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 7ec27b05ff10..21ef369c478c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -111,10 +111,7 @@ vcc5v_dcin: regulator-vcc5v-dcin {
 
 	vcc5v_hdmi_tx: regulator-vcc5v-hdmi-tx {
 		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_tx_on_h>;
+		regulator-always-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc5v_hdmi_tx";
@@ -252,6 +249,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -717,7 +716,7 @@ led2_h: led2-h {
 	};
 
 	hdmi {
-		hdmi_tx_on_h: hdmi-tx-on-h {
+		hdmi_frl_en: hdmi-frl-en {
 			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.53.0


