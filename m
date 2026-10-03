Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A6DCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKQvMc8/mTLRPG1Kp5VBsc/OygCqDeG9AghhS1OUefc=; b=I8vsIVQyPibaF6XiNUZT32uxZ/
	5kzr731Ue2YSKajV3JXCJFQHWxiAWsJiA7wSxThuCxgwa2YkDIKWo3CEX2+cFSz9pLHNyfdpHPe+R
	CXo3r9AyJ/a0dxxEfguI3QrkWiqPPTT5ol/rim1TFPzct8Q+6YnGJdxeVpAB3mBwwW4ObpcVebC0D
	fugIJVVmj01mttqijVPeerJgoQajCiMLu/kJlKowygNITIhA5EUAOt/ca8nv9Jq89VEAum8lPzHh/
	GO+waL1HLHvruZjsO9VIwChdLOfu1Z3jWR0w404XmHTvMQNugzOL8SDcKnyENlLyLxkgKAT39Df8k
	6sCFUSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5S7-0000000DwOA-3d2M;
	Sat, 03 Oct 2026 19:31:23 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5S0-0000000DwL3-2XYG;
	Sat, 03 Oct 2026 19:31:21 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKQvMc8/mTLRPG1Kp5VBsc/OygCqDeG9AghhS1OUefc=;
	b=k0xdnR9pU/icwwEkxAo90QC+I8f45hCOmjb0zbcsePfl8blkHKQ/5JaifRy1qWxCn8Rd/H
	ZQkA1vKL9M+bRihOkeZoDpHOsHOwXJNPbKJxanG/Pu188wTVH/IuZv/ZFnAQFlhlNurGYu
	IzS5JaZwFM+C2mQXUS1Tf9arw0GdX+VVKVXoSlfTVFMjxHBkkh6dxtPLzkCMOocQW2hQvK
	j9NE5TjPxzDgLPzWiy6Mw/WPuy+HHQSq2mA7p3eDpaXqOLQEYMpOrgfArV6owX+wD5+mbQ
	uLwT+nKLx4DkYMoZ88qM/eCTBUSss6MNl9iFW738XjYlO9E4nT6RPQ5ijjXtig==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188-geralt: Add the detachable base touchpad
Date: Sat,  3 Oct 2026 21:31:08 +0200
Message-ID: <20261003193108.789939-4-michal@nozomi.space>
In-Reply-To: <20261003193108.789939-1-michal@nozomi.space>
References: <20261003193108.789939-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_123118_909785_CFE3D2F3 
X-CRM114-Status: UNSURE (   8.21  )
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

The touchpad of the detachable keyboard base is a HID over I2C device
at address 0x56 on I2C4, with its interrupt on GPIO148. Describe it as
the ChromeOS device tree does.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index d8edbde6ee4ac..3bc15fd132149 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -494,6 +494,16 @@ &i2c4 {
 	pinctrl-0 = <&i2c4_pins>;
 	clock-frequency = <400000>;
 	status = "okay";
+
+	touchpad@56 {
+		compatible = "hid-over-i2c";
+		reg = <0x56>;
+		hid-descr-addr = <0x0001>;
+		interrupts-extended = <&pio 148 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hid_int>;
+		wakeup-source;
+	};
 };
 
 &i2c5 {
@@ -959,6 +969,14 @@ pins-gsc-ap-int-odl {
 		};
 	};
 
+	hid_int: hid-int-pins {
+		pins-ec-ap-hid-int-odl {
+			pinmux = <PINMUX_GPIO148__FUNC_B_GPIO148>;
+			input-enable;
+			bias-disable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO56__FUNC_B1_SDA0>,
-- 
2.55.0


