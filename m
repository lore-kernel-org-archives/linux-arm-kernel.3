Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01342EFCE3B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgxQleZUPevow7Us1RXMsET49QdHaS2egowsDR9kpnw=; b=lM9U8Ft7hGzLT4lKNqSMVtg3rC
	XdYc9BF1rEpoxgWU8DFISU07MF2xch7AQQcw/hpCOQNQXuv+PT/CO3ytQn4RvGckO7mp3+FO4u35P
	8ubw7DyLz5xSWi2KJ2MMGH/tFEpe71V5IfnnFzWFYPI+GbZSlfpgG7b9lbGy98F3Za5kCa1aTZIZf
	zi9/Y8tzCAzTT4WiBuUtvldvf28sTjaxHL7FU/1aP3eFexuC4moVKE+0yLTZ44sDUkJfg0rJ1js7G
	RhghP2+l3lIYdMg0GQc8qseyauxffDQaZaUUsHrIsqCQoxHKO5fP1XODeSP75ry04Pv7DASXqW3y3
	LWbAmSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxreP-00000000NpH-2wKj;
	Wed, 04 Mar 2026 19:12:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxreN-00000000Nos-0pLh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:12:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-483770e0b25so61849775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 11:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772651569; x=1773256369; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgxQleZUPevow7Us1RXMsET49QdHaS2egowsDR9kpnw=;
        b=LN35tk+YHo2zgEU4kDzieklKU6CSI8bW3JsvGyA/Nd6UIzajuPX6rlsH5Ut91hTfIb
         beLm5hXT06OIZ/5NZruZRtLWKjj2G0b1fGfWRdR3qEfQ5De7AoVNxPSNkbDkAkkPcdOp
         cV8X/GpV1eYKUPLaEGf8CElanovjqTt1PMs+bS+KealBZAcyq2qRrW2u9/V/WV2fnbUs
         lGYDZyl0ll7bEEsySx5yTCloKt6bv5WbF6vNEg8EPe6D7RyIyn28fDnOlFASr6CN7+rH
         0kHZEbSifWx3aIiJH8sjFAHOueIulomWM4CPi3sxMxato03Hd3dnAGmtj/egRsNEbGi2
         r5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651569; x=1773256369;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgxQleZUPevow7Us1RXMsET49QdHaS2egowsDR9kpnw=;
        b=nDxarxfSRukcQ8XZ/lUj3DswBbVtV3vMEKXDMHkT1O+aACXqWcIqaddvc0iworJjGn
         SDhGMdKNssN1x+kYNszrNl/LAXZxfiNnzaRJ+Mg6zSr1mTTyhwISLXqWMnOlClDFvxHQ
         SMMPDIhvhjd9covC8fAeFs9dybIf02lBnuo8iyAWvz176GzS2birmXnschg8WhdytbKx
         PnTa89DVYUSJHoclaCn8rmhBa1WRvQTOrz3e6N88csxMb7oLgC0ODPQhP40eAdj6vWBS
         Xl7Je5+STHxUubL3ADOR4PcxWgqyYwoMjKeHUtzIQjYdV1vVNqFxvb5TbOX3taD7m0RC
         Ffzw==
X-Gm-Message-State: AOJu0YyvSnbBGDO1IuWHcpP6iUZFXRQ/d6BOseP7TQgMzqI+ZvgwOuyr
	Sb6C4amBuJtT0MwXEPnbejQEPMXBb6noq4f7P4pPjRIkflfnIjHSHaA4qiKfCg==
X-Gm-Gg: ATEYQzx9B1SKxUyOF+aqJIXovJI8FswmfiUn23fHlASgmDZRfuZRUzniWbZumz7Z5rL
	DL9bfpD2POG6bCd3EcvImPTIqXnBSKzY2pI8gUZE9KuBSRoMbk9WY8OC7N6W2JML5C2svArh56g
	Hr4iKis38nf8WMrIGenrOvVhU+jn656W27wwen6f65igYs4sDG2k3gzBywuicGSmycyDtWAYN52
	GC0xdJCyvR5bmWrUzcT1Xy2LTVIjQY2aliIELDS6DTHsGxpefDQyUNEk+b99M3mHSPDWovhLeUd
	HzvKaeJZNISU+kY5S8htbGPoGLTmnlA4hgnyE8BSW2mfa/iZhY3CpW3Yxr30v1xojWU5F82ZygK
	6ANi6jagIDokDEYzEnUkMSu/3WmRRKZx/kXYslzUQ3hiveuqLOqUo0PKREZWEeEbzO6NPCwHF+9
	DzWCnHSQBRFXcTmK+U3ilrdScYoca9Oh85Xabv3uXBRood0VumE8uT
X-Received: by 2002:a05:600c:8b02:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-48519888e54mr52891945e9.21.1772651568664;
        Wed, 04 Mar 2026 11:12:48 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851c907a08sm11575825e9.0.2026.03.04.11.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:12:48 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 04 Mar 2026 20:12:43 +0100
Subject: [PATCH] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOw6DMAwA0Ksgz7WUEhpKr4I6mMQFD3xkCxQJc
 fdGjG95JxirsMGnOkH5EJN1KXg+KogTLSOjpGKoXR2cdw2SzpQIfZszJl033G3AWSyi8ojcBf9
 qunckDlCOTfkn+f7773X9AS94PJJvAAAA
X-Change-ID: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_111251_283964_B5014447 
X-CRM114-Status: GOOD (  15.18  )
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

The 'marvell,usb-misc-reg' property is present both in the EHCI and
in the XHCI USB host device nodes, however it is not documented. Thus
'make dtbs_check' produces warnings like these:

  /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
  /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
          from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

Apart from the fact that the properties are not documented, those are
not even used by any USB host drivers. At least 'git grep' says this:

  $ git grep -n 'marvell.usb-misc-reg' v7.0-rc2
  v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:30:  marvell,usb-misc-reg:
  v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:41:  - marvell,usb-misc-reg
  v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:50:      marvell,usb-misc-reg = <&usb2_syscon>;
  v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:372:                              marvell,usb-misc-reg = <&usb32_syscon>;
  v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:383:                              marvell,usb-misc-reg = <&usb32_syscon>;
  v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:396:                              marvell,usb-misc-reg = <&usb2_syscon>;
  v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:406:                              marvell,usb-misc-reg = <&usb2_syscon>;
  v7.0-rc2:drivers/phy/marvell/phy-mvebu-a3700-utmi.c:231:                                                         "marvell,usb-misc-reg");

Due to this, drop the properties for now in order to get rid of the
warnings.

Given that the platform is quite old, and its support is mature enough,
it is highly unlikely that the properties will be used in the future.
Even, if that is not the case and the properties will be needed later
by any chance, those can be added back along with the supporting code
and with a proper documentation.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index ea1824f5321fbb32fc4373c08a0d94bca1dc793b..44c47409f8793ae1266303607812ef481edbfbc5 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -369,7 +369,6 @@ usb3: usb@58000 {
 				compatible = "marvell,armada3700-xhci",
 				"generic-xhci";
 				reg = <0x58000 0x4000>;
-				marvell,usb-misc-reg = <&usb32_syscon>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&sb_periph_clk 12>;
 				phys = <&comphy0 0>, <&usb2_utmi_otg_phy>;
@@ -393,7 +392,6 @@ usb32_syscon: system-controller@5d800 {
 			usb2: usb@5e000 {
 				compatible = "marvell,armada-3700-ehci";
 				reg = <0x5e000 0x1000>;
-				marvell,usb-misc-reg = <&usb2_syscon>;
 				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&usb2_utmi_host_phy>;
 				phy-names = "usb";

---
base-commit: 98226a594f313442fcba38cefc1df0b6c1691c7e
change-id: 20260304-armada-37xx-drop-usb-misc-reg-e9635498cae6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


