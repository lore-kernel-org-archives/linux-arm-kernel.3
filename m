Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A67C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teeyow5eVGVjGM37A5+PQzdOV80gZB9oDObtjbukIpk=; b=iBe4UTSZ0BBLXgIEGUg50rnjsg
	22WXb7j6rd94sMmNwLZ5knKayHLo5c78KujktymsZsxzV2imNjrfwpSOIrADZfO4MBCdCcAeMgqJx
	Yzs+kQUsrWgZsJ5Dcxzj8zyqR3cOeDRLdxLqQNfM3GyKfqg6R5LeA4j8ieu0vnnl1QW85XDu4bJki
	H08FTR95VhCSMC+SI/v9ikZAgbBJmIc3wpYm52VfH+ix0+sNjDOi39LABzJGpvkdp6kmN79KQHOv7
	at2znSfeSEpFnYzCXGytRPmZKmFUoKMKCnZbTfPqjVmC+l8nDgSO2A3YM/D8pATIF54TXKCIj898q
	FZKgmXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU9u-00000005VGA-3PNJ;
	Tue, 18 Mar 2025 10:26:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU6Z-00000005UKt-0yRH;
	Tue, 18 Mar 2025 10:23:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742293405;
	bh=MXp/aYEgJIRz1h77NEm+oyEhJoefXLGLbsCnRTPjoSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZgirUvtvTJlzz8+DjhuOddBdW2GY6kD/5YNW/T2N9njNVVEfkdvf6BgIXKhnNG/8m
	 Bsuw7tbiBkcG9Ah7XL2rsIzs9mBlSSzGK4/1bLbRD/Twlzo6xOO6u06m0cX776sU4N
	 f3Tmt9Va+AzoJtTcOZZVRCaSGiXdTKH7+mZmI+cg4W/SPhnZmniHUQCYnh13DiNVKl
	 pAhOTXgUTwn7iAV+mUKa4qevGHg2WxV5aVPfbvuewmPSC3EJntNk0XOlEKIidrFrNl
	 aJ5lzp5REDeSAKqS9rzXVbAIp09TS2q1M2bL8CZa0y0WLrBW8DwxwQPs6RBTl69RnK
	 Y8uyxymn+WuWw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:79a1:e959:3816:993])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 073CC17E0B25;
	Tue, 18 Mar 2025 11:23:24 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bleung@chromium.org,
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	nfraprado@collabora.com,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as fail-needs-probe
Date: Tue, 18 Mar 2025 11:22:59 +0100
Message-Id: <20250318102259.189289-3-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032327_469669_EC33DEEE 
X-CRM114-Status: GOOD (  10.47  )
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

Different Spherion variants use different trackpads on the same I2C2
bus. Instead of enabling all of them by default, mark them as
"fail-needs-probe" and let the implementation determine which one is
actually present.

Additionally, move the trackpad pinctrl entry back to the individual
trackpad nodes.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 .../arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 7 +++++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi           | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 8c485c3ced2c..163960f58db5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -85,8 +85,15 @@ &i2c2 {
 	trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		status = "fail-needs-probe";
 	};
 };
+
+&trackpad {
+	status = "fail-needs-probe";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index dd0d07fbe61a..b11b32a63bbc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -335,11 +335,13 @@ &i2c2 {
 	clock-frequency = <400000>;
 	clock-stretch-ns = <12600>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2c2_pins>, <&trackpad_pins>;
+	pinctrl-0 = <&i2c2_pins>;
 
-	trackpad@15 {
+	trackpad: trackpad@15 {
 		compatible = "elan,ekth3000";
 		reg = <0x15>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		vcc-supply = <&pp3300_u>;
 		wakeup-source;
-- 
2.39.5


