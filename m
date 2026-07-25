Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C23C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v1XnvhuBoDG4y1lmMQbiSiZ7jqw05+luvbjxzkw9QGE=; b=bfxURQNgy/6vLv0FBn3tt3Antd
	mYV9CwpopzaLjtEDBnsklYWUN0bq2vzRxK5ebn8AkSBBe3ns/S530AO60dVFq2+KA9dWnbDGpAys9
	8GldiB8ChZiVsL1NqO9o+iW5BgVH27fVopIrt4jDTz9UyTlLbOh86N4ZDMHyy/0n0aZ0YCRYaKAK1
	X3zN/kUvZlvux7UA8Xri2kK4fUv/AERq6r8hywErAyH9JvU0+VapfQMCpYz6fnhNl1RuThWFNXOMe
	EV98D27854DN/bHRDJx8+/BKN6ZO63We4cLC4hB0IxsAlOouOiGsTOrTKe71IejYI5nPcVtHuhNFD
	becFBRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnaQZ-00000000HVl-205d;
	Sat, 25 Jul 2026 11:20:23 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnaQX-00000000HVI-2UiU;
	Sat, 25 Jul 2026 11:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1784978419; bh=nORByVcuztvWSuATQGRl/ZUN9+Z8frojPCDBSo1YEf0=;
	h=From:To:Cc:Subject:Date:From;
	b=VULL/qCzPH/BYeZC4/MwvXZnuH0QM/zmDMIs2Jw4ljG8TMgIIDQHRytybuNgP09gf
	 mD8+k9gqbN3WKoYWy287eRgfs7PNDxjJd4CDV1cbbLc4RSH2sUW0TIq2Kyyq9mvdQO
	 loerdwP7OFRfQ6zOPrJfO4XNYxYD+5DK3U28szyA=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support)
Subject: [PATCH] arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix
Date: Sat, 25 Jul 2026 13:19:34 +0200
Message-ID: <20260725111936.2245041-1-megi@xff.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_042021_771254_44B7C197 
X-CRM114-Status: GOOD (  11.06  )
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

From: Ondrej Jirman <megi@xff.cz>

The current mount matrix for mpu6050 is wrong. The mount matrix is a
simple transform from the sensor coordinate space to the device
coordinate space described in DT, where, looking at the screen, X
points to the right, Y to the top, and Z towards the user.

The mpu6050 is mounted like this (looking at the screen from the
front; the sensor is on the near side of the PCB, so its Z axis
points towards the user; o marks the pin 1 corner):

           +Xs
            ^
            |
         +------+
  +Ys <--|      |
         | o    |
         +------+

so this gives:

  Xd = -Ys  [0, -1, 0]
  Yd =  Xs  [1, 0, 0]
  Zd =  Zs  [0, 0, 1]

Fixes: 2496b2aaacf1 ("arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer")
Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 4bc6c1ef2cde..f958bdbb0d33 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -230,8 +230,8 @@ accelerometer@68 {
 		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
 		vdd-supply = <&reg_dldo1>;
 		vddio-supply = <&reg_dldo1>;
-		mount-matrix = "0", "1", "0",
-			       "-1", "0", "0",
+		mount-matrix = "0", "-1", "0",
+			       "1", "0", "0",
 			       "0", "0", "1";
 	};
 };
-- 
2.54.0


