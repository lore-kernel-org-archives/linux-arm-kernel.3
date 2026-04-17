Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D570F4368B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yD2jApekOaHET07HxpU8YjWdfJWuCZV9WvhR8P+CVM=; b=3YEciyDBkpyJTO7cYJAwacQy+O
	11m8c1AcJcWn14KQa9vpjvNQ+43N2R7YBda44ENUMMAw61FNi9rrYnFFSXvHIqAV1uIEbC5x0xjN4
	5ro7/On2+bML1r/l27nfUZH1p/fQKgw3utxgyvApbVHZJMf4gfTwjqlqZ6F7Jk4IEevSbNMl7XXlP
	gULH3HVtD3rIA7unIt+tDOsrD83l5yfgmzYEPse1Wx8ZNEjX6/LtvL4+Qul2OOb/VwzXy60m99Av7
	M0URJ7sqHs+qqqYOYr4s74buVgYZTl01laKIgHUWfBc9udHSPFsdCyp6q9mIeG5Iui19x7oSYbX5B
	+uWcfloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSa-00000003lfJ-451O;
	Fri, 17 Apr 2026 09:26:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfRz-00000003kie-2kHi;
	Fri, 17 Apr 2026 09:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417921;
	bh=vkwXOlO6bQNK5dcmAj8eeyqpdGR9PrIdehkj24W1xq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mZKvP7BDt+jhOAl+sHqS2KZhi0pZ9SZFOVpiP64bIvbEpQ7ST9fDb0OP2JTOuULTx
	 w8aA0xmKWx1QM3e6Z22AlpkVmVJ+tov/5IYkMlPVEN5uYLyUT7y5W1CJLT3unb8Oqx
	 pV8WClajg9rX4BJ+7qxLlTw1xUaDnd6Q0LZ1xObH7O0cLeO0mVDL5N5fynlu44PP+q
	 Z3ewbmJo25k5L4gCxAaMtu/xU21BQ7haSCT6or7TGJF4hTa4I4uorMKVsKBwCnpEUS
	 4OKandBGwumMo53QNNLUbYLQQN1YPauTh4bvB/H7AHwVWvqb/5jcYkHOX7o017s6FJ
	 tK0LXaF2jY14A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD57617E0CA9;
	Fri, 17 Apr 2026 11:25:21 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:51 +0300
Subject: [PATCH 17/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-friendlyelec-cm3588-nas
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-17-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022523_881597_3AE2A1CA 
X-CRM114-Status: UNSURE (   9.13  )
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

The board exposes the GPIO4_B1 and GPIO4_B2 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 10a7d3691a26..2d17c77e9e5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -331,6 +331,9 @@ &gpio4 {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -347,6 +350,9 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -520,6 +526,16 @@ key1_pin: key1-pin {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
 			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0


