Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546FBD1681B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UANRrX2uOI183P1TP4dGLAul4uXE1CfFDoWOK5mNqo=; b=4j7o0czsdXmavVBbmS9RSspcJt
	7T9hSdu/Pb6Q4gidBclSGSzNte/2LsEFF9J/rK9/vu5+ZcC6rp9lDpWSYE8DIscmUSbOkk9RR/loV
	DEE+Zow4DLciXLzDrVsq5AHsoqXD3o+xe+woMrP4iLF68OAq+nasOsIkxCBcMupmGpl/t1g3yoqsw
	MyinQMHXvBnuwH6GSczGMkArWxyZ3IM3b619/11xggkwGeZzgPqCMWBvZfkAySTo6PoE0u3ljTwc2
	3jRvTtIm4DLH6jWGoq06WovFHj+srqiIxxRQgfoYOyOmKHM2YAnuxPoUPxyWsTpIzVi1FKwqEHr65
	rv4gqKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyP-00000002F4r-2LnA;
	Fri, 09 Jan 2026 11:48:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyI-00000002Eua-3iNc;
	Fri, 09 Jan 2026 11:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959279;
	bh=vXU6vQZw0NI2vmAmOn1U26+4VzWla83NiWQsK7QNa5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=plcizixgQKcatHtQE5FrFr9uvZvmKnXux0/0vVILVRD+xvZRJE6oLKSC2RnzKuVak
	 Wwekwc7cZMIf8drpLJx0GzXORRkmuxmr3XdzDf3Uq/J/KVQumEBrb3k8dfnKbmBubC
	 YshiV8Lln8sFiqiKc659SD+PLX7ltMfUE+vnWS2l7wQmnu1kx/AyfCG2ojmj3mjKlg
	 8Uebq6GYjcvCj3AsE7kBEXs7xrsKfr+3Yo5gYG3XgqEfrfOPXcOZ/OQpptK+iW9VOj
	 e3S/eMY7zxByzC1Ofhne0xYAX96R/61FArjdWZuyfR73YR/zHH0jjCnl4Aziv4G78X
	 oXDxmafKf+lfg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B6D717E151B;
	Fri,  9 Jan 2026 12:47:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 06/11] arm64: dts: mediatek: mt8183-pumpkin: Fix pinmux node names
Date: Fri,  9 Jan 2026 12:47:42 +0100
Message-ID: <20260109114747.37189-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034803_104714_D9E58851 
X-CRM114-Status: UNSURE (   8.48  )
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

Change all of the pinmux main nodes to have a "-pins" suffix to
satisfy devicetree bindings checks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index f60ef3e53a09..e47955602c83 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -241,7 +241,7 @@ &mt6358_vsram_gpu_reg {
 };
 
 &pio {
-	i2c_pins_0: i2c0 {
+	i2c_pins_0: i2c0-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO82__FUNC_SDA0>,
 				 <PINMUX_GPIO83__FUNC_SCL0>;
@@ -249,7 +249,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_1: i2c1 {
+	i2c_pins_1: i2c1-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO81__FUNC_SDA1>,
 				 <PINMUX_GPIO84__FUNC_SCL1>;
@@ -257,7 +257,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_2: i2c2 {
+	i2c_pins_2: i2c2-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO103__FUNC_SCL2>,
 				 <PINMUX_GPIO104__FUNC_SDA2>;
@@ -265,7 +265,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_3: i2c3 {
+	i2c_pins_3: i2c3-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
 				 <PINMUX_GPIO51__FUNC_SDA3>;
@@ -273,7 +273,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_4: i2c4 {
+	i2c_pins_4: i2c4-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO105__FUNC_SCL4>,
 				 <PINMUX_GPIO106__FUNC_SDA4>;
@@ -281,7 +281,7 @@ pins_i2c {
 		};
 	};
 
-	i2c_pins_5: i2c5 {
+	i2c_pins_5: i2c5-pins {
 		pins_i2c {
 			pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
 				 <PINMUX_GPIO49__FUNC_SDA5>;
@@ -289,7 +289,7 @@ pins_i2c {
 		};
 	};
 
-	i2c6_pins: i2c6 {
+	i2c6_pins: i2c6-pins {
 		pins_cmd_dat {
 			pinmux = <PINMUX_GPIO113__FUNC_SCL6>,
 				 <PINMUX_GPIO114__FUNC_SDA6>;
@@ -297,7 +297,7 @@ pins_cmd_dat {
 		};
 	};
 
-	keyboard_pins: keyboard {
+	keyboard_pins: keyboard-pins {
 		pins_keyboard {
 			pinmux = <PINMUX_GPIO91__FUNC_KPROW1>,
 				 <PINMUX_GPIO92__FUNC_KPROW0>,
-- 
2.52.0


