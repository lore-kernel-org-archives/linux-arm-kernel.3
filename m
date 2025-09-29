Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE62CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knrLUhXeoiOlB4nnqjnw/1cMO8Rc0qOwfxrKrTkleEg=; b=jB+7H4UnGoRwHShqPTKkxxgJnY
	tMawp48tFXJ/iM/y/pyFGSisfF1s9vSdOe4Jk9ERzmO/J4QG7brYtLF+UOzG2i1Roj6Q2nwi3a827
	+Fj17Qt3XluLbe5uUDuWaEBideDe/1DSkPzz8cMTwBJQ0XrSosoiS1GZchO/98YJz27D7sKEpjat2
	gSQwcdMYUbi81d9Khy9OhDWwVfzrdrsG7AEjwNwiE3qNBfIq2xgwG7aKsK7RuSuOh0r8DfCyR1uma
	SyFw6H9+CTAuMaqeHeP8HUTe04diIZb/ajg11Tl1bIEV92oZI6AWzAHRPuXAD9R8eeUhfR078gm2r
	osuAb1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Pt-00000001cec-26CF;
	Mon, 29 Sep 2025 07:35:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38Pn-00000001cag-2RDU;
	Mon, 29 Sep 2025 07:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1998E62319;
	Mon, 29 Sep 2025 07:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DFE7C4AF0B;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759131313;
	bh=Bay7gvRD8WEKKONQKFBF0O+fwmVm+YlEq+tKHT0KRKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CaAg0DaBk5igaM4TpFf1Au1liTovydHaKRSmeHMjrQndyPaQw//SrhK55m5PfGPFT
	 Y75bhR+ulDCix/+e3cjFIVBgyA2kbATTNzy3Y88lLyyHBzU1KzM0HAVhmH2DiLRj1+
	 rKIcE+yKlSGYg5K8mEYBKrqrRboZ2XsALfrL9mEzDn4omnmMNRjWiLbt/2YcFxn2bf
	 PuNUTZodimMQ/ssoCXIg/K+5+ruIhXOFR8qVHdx/oycZZ6aXiYpFxv4jtJFFG741pS
	 D6IqXKMDKTXjlvHPiW67gabuuZlBmV063n7LPTQ3ZhUzxx8ihDWb/3czQQvdch8VZt
	 SOkrtRiPAFoyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A4CAC5B5;
	Mon, 29 Sep 2025 07:35:13 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 29 Sep 2025 00:35:13 -0700
Subject: [PATCH v4 2/4] arm64: dts: rk3399-pinephone-pro: Add accelerometer
 sensor support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250929-ppp_light_accel_mag_vol-down-v4-2-6598f22d3451@gmail.com>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
 Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759131312; l=1864;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=BRZsP1UdL6OFWqM2mRykWAS8dysAco3k6Kyv3eBDv+E=;
 b=qUkXHOgkg9QDIAccXCuh9iCn8uQ3DvTVFAEX5pjOxmDyP/Lb8YzSzOTQ9g1e2KPPpd/59qbKB
 g0enuB+eYi2Cnr3VE6toJhAopuGqneFWjEEu9KY9/XFj1TSugfTHMNz
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ondrej Jirman <megi@xff.cz>

Pinephone Pro uses mpu6500 according to the schematic.

Tests:
// Setup: This watches the raw values from the device. The variable with
// the biggest magnitude and its sign will be recorded
$ sudo systemctl stop iio-sensor-proxy
$ cat /sys/bus/iio/devices/iio:device3/in_accel_{x,y,z}_raw

// Let's start with phone screen facing up to the sky and the charger
// port closer to you than the front camera.
z: -16000

// Tilt the phone onto it's left edge
x: -16000

// Tilt the phone onto it's right edge
x: 16000

// Tilt the phone so that the charger port is pointing straight up to
// the sky
y: -16000

// Tilt the phone so that the top of the phone is pointing straight up
// to the sky
y: 16000

// Put the phone face down so the screen is touching the table
z: 16000

Co-developed-by: Martijn Braam <martijn@brixit.nl>
Signed-off-by: Martijn Braam <martijn@brixit.nl>
Co-developed-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 71d32c4bae0d0336ac0c912043618fc9b94919ef..d9f18a8005f15f3ec26e086e5b451bf1bbdc21c0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -542,7 +542,13 @@ mpu6500@68 {
 		reg = <0x68>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <RK_PC6 IRQ_TYPE_LEVEL_LOW>;
+		vdd-supply = <&vcc_1v8>;
 		vddio-supply = <&vcc_1v8>;
+
+		mount-matrix =
+			"1", "0", "0",
+			"0", "1", "0",
+			"0", "0", "-1";
 	};
 };
 

-- 
2.51.0



