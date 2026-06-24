Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E148CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fk/Z8OE+ChiAP78iz+VA+TzWEbs4aCOhKWxII5xeA38=; b=2bswg4QqNx75Z0pXZDheH8uLzk
	FrfLnxErN8QqF7V7AVz6QvyDYvFsJtn/ZeUzBpMIwW2otgZ1N0Z4BxJTTgObAw/uXbFSFK9VNJE6L
	hFcy6L22HKKTRw/Fj6KwQmbE1T6j8L+OlALqL9VSLWHnfLDnU+kcBETnlZROtE6ssDsIgfSSvS+X6
	5BBj1TgZSiSK+tUaE2YO0Uv0fZl+veGN81Eo7gCUkcyQKP6TUiQXIiGqJ2qnyICLVL9CpO62/r3bc
	HMBI9A6/i+y4Zynv7GUoahHMueR1E5UH8PhbtQLDNVNsy22vKQsDzgIT4Rt6qXgB4nP5Qk5BFxg3G
	B3+QNEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPnc-000000082Cq-0is8;
	Wed, 24 Jun 2026 15:46:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPna-000000082Bj-2Stz;
	Wed, 24 Jun 2026 15:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 115CE44161;
	Wed, 24 Jun 2026 15:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2CB5C2BCC9;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782315957;
	bh=gq7SZQMCqoWdcgKCYD6222wJceoyTVBlco/WMG2UIaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hTfCzKA8p6wQRw2Fy+Io6dWME5BdP0NdDOhFFz8HyJha37eybesuNfVZpGHN8YZNO
	 A/E92MSe8Diy+wELrAdhAjTCUiu7oQLbPa3Ge/nNzTjGyn35ICpfTltV2Qxkgna3Jc
	 Gn54fezRt7oYzn0uclrOZz0aZ/MHNYMxePJeCFmpEXVnl4HF73eJKndwxVa9U5y4zm
	 TnM8WQ54o7ClJF78tCdmiNp7ovnGAYCgY8FHjj3OWWk8LLxHjeEQVW+0C74ei2EorU
	 z+aZeEqgw6XUcbqmXZ19FMHJ2vOAQsZmD1/h/ldsb2JnETO6PI6oZRCODdON1yfAwM
	 ejv9dICwWs1mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4AFCDB479;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 24 Jun 2026 17:45:54 +0200
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable
 i2c3 on 40-pin header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-nio-12l-add-i2c-40-pin-v2-2-cf3707a6aaf1@pardini.net>
References: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
In-Reply-To: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=hIyBf7strNNA+Ox0sJe1DQ4Wou2BwNHnavbyLGWV3fE=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWRZ/95csKVZmzf5k99/+4o/Lx9p3fyxT6zsosX7Q2q1S
 2Y9ZXCq7GT0Z2Fg5GCwFFNkWSOhzPNt/atTdzw6JsMMYmUCmSIt0sAABCwMfLmJeaVGOkZ6ptqG
 eoZGOgY6xgxcnAIw1YKL2P/wdlhtu1evdcBOR/yhalTtabllBoV3JepeNbqLtQcxOzW/auBadt8
 osKLqy/e2w4+3TYqzk/zYK1eaotW4Xug7u3a0tejGzrm6G4Ilmo03KEqLZDyOubOCv/+MRu320B
 +a6mcr96cr/lVQieMM0PsUes7BprHBY97BT/kPlnqfu/9tB3NMpJjxa9vZSi/yaz13T4zXn2r8d
 MPWtQuSq3QuzvzCr+V/pXDa4uTigObEs06Pi6dX6K780C6/3rnpX5L7O4E7M9j/vJCfpmb0wuVD
 Rm/D1OtXBILC6tuzn5oxZm9ZEV0W6NvpxrNOLW1yepk5U17GS7PpVyW/XLnSeL7514VXs+6bJE6
 vvVn+FQA=
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

i2c3 (SDA3/SCL3 on GPIO14/GPIO15) is routed to the 40-pin GPIO header,
exposed on the blue-colored pins 27 (SCL3) and 28 (SDA3). Enable the
controller and add the corresponding pin configuration in the pinctrl
node so users can use external I2C devices.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 589a5f07d5dde..9b0966c271cb5 100644
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
@@ -788,6 +796,15 @@ pins-bus {
 		};
 	};
 
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO14__FUNC_SDA3>,
+				 <PINMUX_GPIO15__FUNC_SCL3>;
+			bias-pull-up = <1000>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
 	i2c4_pins: i2c4-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,

-- 
2.54.0



