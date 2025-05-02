Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D2AC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rwAjIo5Lh5M2Q0rNiBTOLYKehD+GC52HGXX9wMhyRRA=; b=AGMedg/JdeuamhS5nJtGqzrBPL
	IkCIl98guXj1MvhSWPhr71eozQ03NDgBAFfJFLBaSGYOumn9Tk8WTRbNG7Px0v7X5xbZUEw0faUC0
	/c55zqiGbGqG/thA4bSwPhVK+O1ZXIK7lAV9KzMhcpsakZE/V47n2XKm8WI3JHtm8UWdaK53q/If2
	N7tRCJi2IKhD+Jfysc5u8wVG5dfdS6msoBCnU43Pl/uMCcbAIDIzfvI4AEZrMkasWvQuVuCWK0cMZ
	hv5kIUYDT8i5QrLjHkahi86XA1N/0iyC96ay5pX9dB26Rz/OBeKLWT8AliuxuPCdx1Ae6kvXJiAVJ
	XJ5lXGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqIk-000000021dX-0afm;
	Fri, 02 May 2025 13:19:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqGm-000000021Kx-1Q81;
	Fri, 02 May 2025 13:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746191854;
	bh=Zz5tEQSp2nyOEYwbhv7kdI9iSPvJ55sNnhWZna4qC2w=;
	h=From:Date:Subject:To:Cc:From;
	b=hCDXlrcmQCqkshuy5FbnW+qRrOFZcVDu6heaJSZluW0SfEA6nVRnwRupgEfTwLdvR
	 RiEMt3lZ6jBB2kN4j2PEuWn+FRBPmf7r/iGqbGWVn6/paZ2GGQDUo9jhzG/n4L9SCp
	 CsVXjrI5qNc4EOWAAZoI1mRA1PXLD9r0TCiI2abgvunQte40Wr7+bYB5sco/REv2gR
	 RkI3RGB0syVPa3SvjGVHiCZ3Oh50yjscHWJAoUDTnVFOtSw6Yj1YoCniYHeAFrj/zS
	 CR19i3tuKEJragLwX3lH/eBEE4NNqSO4Of1J7PVIKJ+A0uKopB6ki28Lxx1YOc/dtI
	 bOmSmt/IrjbMA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D16117E05D9;
	Fri,  2 May 2025 15:17:33 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 02 May 2025 15:17:19 +0200
Subject: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: Set ssusb2
 default dual role mode to host
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-mtk-genio-510-700-fix-bt-detection-v2-1-870aa2145480@collabora.com>
X-B4-Tracking: v=1; b=H4sIAN7FFGgC/42OTQ6CMBCFr0Jm7Zj+QDCuvIdh0ZYBGoFqWwmGc
 HdruYDLN5nvfW+DQN5SgGuxgafFBuvmFMSpADOouSe0bcogmKiYFBec4gN7mq3DijOsGcPOrqg
 jthTJxISjqDk32mgtqIRU9PSUfrLk3hzZ0+udXPE4glaB0LhpsvFazLRGzL6KCfgBgw3R+U8eu
 fBMHHsk/2fPwpGjLEkJ03FZd/Jm3Dgq7bw6Jyk0+75/AbbVXZsJAQAA
X-Change-ID: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191853; l=3055;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Zz5tEQSp2nyOEYwbhv7kdI9iSPvJ55sNnhWZna4qC2w=;
 b=qvb9qzrAn2vsXJAvQj69b8+UXVaTVio8Hm708kWHhI+mQMfO873wEv5CANPz4boCtv+vMqzJe
 NQj6VshybcQBcF7urOCeUk+8teXSTkam9xVVHVUA68fS/MkMnCa3y7e
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_061736_575069_7C13F993 
X-CRM114-Status: GOOD (  21.04  )
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

On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
one but has two ports: one is routed to the M.2 slot, the other is on
the RPi header who does support full OTG.
Since Mediatek Genio 700-EVK USB support was added, dual role mode
property is set to otg for ssusb2. This config prevents the M.2
Wifi/Bluetooth module, present on those boards and exposing Bluetooth
as an USB device to be properly detected at startup as the default role
is device.
To keep the OTG functionality and make the M.2 module be detected at
the same time, add role-switch-default-mode property set to host and
also fix the polarity of GPIO associated to the USB connector, so the
ssusb2 controller role is properly set to host when the other port is
unused.

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
I've tested this patch on Mediatek Genio 510-EVK board with a kernel
based on linux-next (tag: next-20250502).
---
Changes in v2:
- Remove dr_mode property change and add role-switch-default-mode one
  instead, as suggested by AngeloGioacchino Del Regno
- Fix USB connector GPIO polarity
- Reword comment in ssusb2 node to match v2 fix
- Reword commit message and title
- Rebase on linux-next (tag: next-20250502)
- Link to v1: https://lore.kernel.org/r/20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 127764c4d6be81767ef534a7cb228989f471b3bd..aa8dd12a84ea9d8e0e879067c45f59563455b077 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1333,8 +1333,18 @@ xhci_ss_ep: endpoint {
 };
 
 &ssusb2 {
+	/*
+	 * the ssusb2 controller is one but we got two ports : one is routed
+	 * to the M.2 slot, the other is on the RPi header who does support
+	 * full OTG.
+	 * As the controller is shared between them, the role switch default
+	 * mode is set to host to make any peripheral inserted in the M.2
+	 * slot (i.e BT/WIFI module) be detected when the other port is
+	 * unused.
+	 */
 	dr_mode = "otg";
 	maximum-speed = "high-speed";
+	role-switch-default-mode = "host";
 	usb-role-switch;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	wakeup-source;
@@ -1345,7 +1355,7 @@ &ssusb2 {
 	connector {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		type = "micro";
-		id-gpios = <&pio 89 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&pio 89 GPIO_ACTIVE_LOW>;
 		vbus-supply = <&usb_p2_vbus>;
 	};
 };

---
base-commit: 1c51b1ba38c07e4f999802eb708bf798dd5f5d1b
change-id: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


