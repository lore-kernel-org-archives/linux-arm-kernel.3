Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6BDCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZPQQwJEuIBEb7AOMkGtrmGwbl8jcfnXX69u/8UEp98=; b=TBPoBKXxQHb0GxkgWDXM8jdyX5
	F+5FwQ74kku7Eup7JKzMsLkxxwMKFKsnlGCVss/LvNd6azp76r8QAFXSWiFIo7Hb5MbK49O8/a0om
	fRhCpkpWmdqryM0ZF1TYMhdcKUOQYGclxqHI/KKddjJLMN9kkhxri+2iK+Ffpy80e28PpsgUZjpFd
	OZZzke0D4p6QUW5QaU7O2m81WzmxCkVrCeOaaJrJzh5C434xTo6OwPDpIhYrLS6dh7J9/ZzVX4Kj4
	5DzpLJiWkMTGIBnnlX3mwrn61dRFC72fOrYuIl+tZEprkvgmiDFF7D1sxGw7Y4MyM32od/GQyNvMo
	4zAWLmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upndu-00000004lRY-2OBv;
	Sat, 23 Aug 2025 12:46:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upnbH-00000004l3X-06dr;
	Sat, 23 Aug 2025 12:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B02F4A58C61;
	Sat, 23 Aug 2025 12:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4745EC4FDFB;
	Sat, 23 Aug 2025 12:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755953034;
	bh=VQ1GUY2EiTPu4SjJoDzd70Xf1RpVnGqds8+QtYq8Q9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p7/iZwHO+4c0Qb0P+5QUQ5TA0wgDTP6G2rce5VQdCw/C9BTLr8MbCQv3VmGD2OT7F
	 eF2WVrgS4taBP2KxAdbbDmHT5APfPx8+llqBe2tsMpld+j/MDpTDNLl2ntMFpHbRuY
	 XbTkIZUpFDFYRxDrT5uVoHkV8qsn8k0dX1nF01g+HqAjHxeNdmd9jQhTDy5bT+GkwW
	 GCLtSyOLSFKjrkeY92RkCrXVofhX+14xoRoru6JKw2CIZpK9GeVrZXQax/z/FXl64S
	 goXmyALOWC87O78hJKMIzwGiTSHZ7aQrmy6Av/DX7TbxWtE+7lD1tSEobVKonOP8oy
	 1axpz28O0lhXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB2ACA0EFA;
	Sat, 23 Aug 2025 12:43:54 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 23 Aug 2025 14:43:51 +0200
Subject: [PATCH 2/3] arm64: dts: rockchip: Enable HDMI receiver on orangepi
 5 plus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-orangepi5-v1-2-ae77dd0e06d7@hotmail.com>
References: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
In-Reply-To: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ondrej Jirman <megi@xff.cz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755953033; l=1303;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=cqF8f43yoVXcmOBW/qzowTAQoqelusXMIpBTqWyFkKQ=;
 b=e5rk5j157Pc110tlG1qPb/JIPQGiDbO9A+GNioTHi5dwaS+OTK54zQBnVy9QTWCrJJXChDbbE
 zB+wprfpaOrDegEQmj7y2Tx7xMASdUtj1wQKs+BD9xCTVGonas1o07P
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_054403_134026_6863570A 
X-CRM114-Status: UNSURE (   9.72  )
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
Reply-To: maud_spierings@hotmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maud_spierings@hotmail.com>

Enable support for the HDMI input port found on the orangepi 5 plus.

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 8222f1fae8fadc5cbb4ef16b3db5ed975ed43915..9950d1147e129dc866cfde62ddd636b082ae1926 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -160,6 +160,17 @@ &hdmi1_sound {
 	status = "okay";
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -279,6 +290,12 @@ blue_led_pin: blue-led {
 		};
 	};
 
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	ir-receiver {
 		ir_receiver_pin: ir-receiver-pin {
 			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.50.1



