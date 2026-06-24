Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7989CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QoK/3UddXbmX1NE+eBlNwxX446SsnQUqEu7wWRxnQVw=; b=K8X4VRew84x6BqBFOA++I3X9Sz
	YH+y8HD4I08T7extD9HI3aavH9T6gURuR0i8WuJ4dVZn3OtOG13a4iBUbLYbjDHi9tRCsKHsBnFjb
	x8LM1b9gtXfBPBHcrQMaM1zXwJ2gziytlD7GCu8ouhquwodtCUPL3p6M+mJNGwp7WuMUQVA7uxk9C
	ENIr9dTjaoeUaXLv1wGcd9LyMUrun51qkKcsoNmUP6e5spaWAVUmbaP11msd5KEmSsBwSZ4zB4sru
	f9KLv+PcRNtG7Tik4+x7Ixc1PXLK/d0YEuKcBbVLc5T3TcHqZ99neQpARVrYaXB4qi6z0K6gpfM5k
	v41/82WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLzi-00000007hHW-26Ib;
	Wed, 24 Jun 2026 11:42:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLza-00000007hG4-2a3l;
	Wed, 24 Jun 2026 11:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DC9B43650;
	Wed, 24 Jun 2026 11:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6A46C2BCB4;
	Wed, 24 Jun 2026 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782301325;
	bh=LZ1C8rPlZ/X7S4iWJUKXT8UYdYECXgo5EWnaKAYpFo4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Cv+QZx9ic8CcDcyku8WSiFp6l1+02Wo432iHHq0rPl3wGrYcAKCE8bP9mI3rQ+fqk
	 dcJ9LNaPNpHuQ5pXKAYHFhcV7rE/hkUaBKOuq2JbDf5dyXJEeMCMU6MvLXmktAlXQj
	 OFu2fjqkVTtYJoMwZ++OZAgfbre3m0qevy8/et5DhrVomataDyRtSww5/nE3IXBj8a
	 DLBdb58Dtsckrswp+KDmGglSEtRX9JB6bvXydGHmMBRH0/A8l1qnqy/tRVEBfikDbf
	 Ppw8/WLugAzmdARbgh0ITNNpUPOk+8ze7o3WJO9rbQx9eb1FYgP9QKapYRSLZxxcn4
	 6lNEYAK4rv75g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8C5CDB47F;
	Wed, 24 Jun 2026 11:42:05 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 24 Jun 2026 13:41:50 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable I2C3 on
 40-pin header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-nio-12l-add-i2c-40-pin-v1-1-f6c11ed2184c@pardini.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQjFHUq5QuNBl1SomSVBHEu
 xt1+Rb/7xA5CEdosh0CrxJl8gn6lYEdWz8wiksGUlSqkgx6mVDTD1vnUMiiUTiLR12zMhX1rso
 LSPEcuJftHr8/j+PSfdn+rxscxwkHLTmbegAAAA==
X-Change-ID: 20260624-nio-12l-add-i2c-40-pin-19e0482fd835
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1939;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=bk5ea6cLdsnJpmBdpwgO3E/mbMZWo2izXGkJpWcYnGg=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqO8KM5gmzPvJ/rOmLT+qPMGepPIDKiCk8X5DBu
 5jAJoBZRaSJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCajvCjBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7eliKwf/RkZ83zDF2MFSMVYiVJmHI8+ZuRR4XYD
 nmdBGdJ1vpt7+H9f1xXNJr8MafhwauM1waRUw2x8cK2BgbUbNVvz7O+03KxR1dwP5xzYTP8N9Pa
 eG3rxMC81LILXsxmleoMnJ8TSbsvlxLJYTiZ/ZMmjncU0Sm4Dzx8Km8puNAYXGr/tDsgf0JPH/q
 0mOXv5YVPVwWJzWeH+JVtUgY4lnxUh0m61v6SXzQAfCnipWskgWmCnjNiskyTOtuMew3eJNzlX9
 Y1lA74GukTKRTFwLK+GI9SaNl3XFoKDvT1/l8i/YsztE6DWpmGaHDAg0EYvdurkCtLdGJQ4Jihm
 mm1jmx1rbYg==
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

I2C3 (SDA3/SCL3 on GPIO14/GPIO15) is routed to the 40-pin GPIO header,
exposed on the blue-colored pins 27 (SCL3) and 28 (SDA3). Enable the
controller, add the corresponding pin configuration in the pinctrl node
so users can use external I2C devices.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
The Radxa NIO 12L exposes I2C3 (SDA3/SCL3, GPIO14/GPIO15) on its 40-pin
GPIO header, on the blue-coloured pins 27 (SCL3) and 28 (SDA3).

Enable the I2C3 controller, add the matching pinctrl configuration and run
the bus at 400 kHz, matching the other I2C buses already enabled on this
board.

Tested using a SD1306 I2C OLED display.
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a5..03a2f2e746475 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -371,6 +371,14 @@ it5205_sbu_mux: endpoint {
 	};
 };
 
+/* Exposed on 40-pin header (blue-colored pins 27:SCL3 28:SDA3) */
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c4 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c4_pins>;
@@ -789,6 +797,16 @@ pins-bus {
 		};
 	};
 
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
+				 <PINMUX_GPIO15__FUNC_SCL3>;
+			bias-pull-up = <1000>;
+			drive-strength = <6>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
 	i2c4_pins: i2c4-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260624-nio-12l-add-i2c-40-pin-19e0482fd835

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



