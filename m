Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A57CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEUGcAzc0Ch1s08Z8Jfy28MHZ4xdN9dOTEiGvcpN8vc=; b=YdpawMTgRXXhVOW+hn801wuAJV
	v6d+GRsGCpAfdaSb05bC1Gp8KPvrFoeaTFpg2MDV+QrihDAP3vUvmkPcka79ffCmsNOyJJPFB38P0
	tzKGVwa2EsBUm3v+vMNiLaFLk82zVfHyNm/nEq5Wxg/zH3Sqz2CTt22D3D++rhhFZ9/IXYqZEmsm+
	kX9r+kTA5CYAi5ROAYabP7eYKpWW4GVjGTm9oYUdITwqk/aUQ8ITOkaP3b9yMTiZHK+224hl8jkTT
	pSAjP2fa4WM9ElfFtvA7OZdtwjMs+u/fAlpbPtXUZjBkJoEKaidGntyQtyt/aEcKPKzJW0HmuP5Am
	16ux3BtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyKm-00000009IRp-0wno;
	Sun, 11 Oct 2026 18:31:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyKk-00000009IQH-1oG5;
	Sun, 11 Oct 2026 18:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6608744044;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D3B0C2BCFF;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791743501;
	bh=EnrtUgMZak3dNHMxblUywFdD5dZea2Y3SQfFyIrdgXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hUb6v8cnyJ21kucOhNlczSWsCz93/UdI3VkyqkvvmNrJH7i4Y1kQRke/nSwu58BYP
	 E3AIx40UEt2mw3T/aZB+oTD4jC82hcsOlBKIABchBdjBxToPXnwXwNKLWWa2MtsjO4
	 WCKQ89yRbN5i8Dz1f/+J0lehN6s+oSbIWdzW2xbzTuNKDnCVdZCalV6jAbf0e59XHK
	 EGUXHP6Iw6REzO4XdHNRSqKtZk+KuPCvAUt5A0wVaVoufMctUNxn2EBGioLYpKc5X0
	 RAmwTctUsfsuJM+oJgUGuSnY6Nf3IxfVVarHM7kUCqhOAd+HUzSfTeUuL/SZZ3rvNs
	 DuQVlnH4n611g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F33BCA9ED0;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 21:31:41 +0300
Subject: [PATCH v2 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v2-2-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791743499; l=1222;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=Hz95Iy8nIc6uFv4KH+mxgM+RktM0NZGoY9tzMOzVYjw=;
 b=piMSgDud16tR23/aforCb+aarsQE65WEYEn8Q/Yr1GvvoXd4aL0k0CZxaDKKPhuHUoPp4P0wM
 hE0AF05Kh9cAhJ2QI0xEhCnCikwphs+8bqw9WTHvzqpjNAjUbVkL2jD
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Replace the legacy label on the blue status LED with the standard
color and function properties, following what the other Amlogic boards
already do.  The LED then shows up with a generic blue:status name
instead of the board-specific c2:blue:alive.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 3b74528ef..722dc906d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -9,6 +9,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/meson-aiu.h>
 
 / {
@@ -51,7 +52,8 @@ usb_otg_pwr: regulator-usb-pwrs {
 	leds {
 		compatible = "gpio-leds";
 		led-blue {
-			label = "c2:blue:alive";
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 			default-state = "off";

-- 
2.53.0



