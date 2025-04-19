Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365DEC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 02:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z5xMW6JQzRFC3RypkMpl7HC+Ok1HS+DBoXUN4t3IzPg=; b=idW8RKlvegfyJkVtTty4lnIdDF
	OioQEPC4vqRAouHe7kGG6i7W8AWV93Hqlde+RRwPDegGLsJhEwzdm/YtrOg9r+Q7EeOxRDRVi4787
	F4/+CugeYo0ZnDixZm8RxNmUxw4kPjC8gaf/nc/IZ8lVlb29z7IKqOSVCLw9jnwMT79nIUXVXRIUE
	Zy12fA9wqZysE6+5nYA14tOYcQK0qIivGPOFQF6lPp01yU0f4rNgw1kUza6/BZ2ktftPjhbl0dNeG
	/q6VNYoT1MCrlql005zNuv8UbQbfIUYP7f8lAN3jgOK0i0WOEpEqzK3Q7LRBVStnpFKzeMEf+7lyO
	Pcu3/uKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5y6v-00000000izX-3Yif;
	Sat, 19 Apr 2025 02:39:17 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5y54-00000000isi-0JWx;
	Sat, 19 Apr 2025 02:37:23 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5c815f8efso211791385a.2;
        Fri, 18 Apr 2025 19:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745030240; x=1745635040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5xMW6JQzRFC3RypkMpl7HC+Ok1HS+DBoXUN4t3IzPg=;
        b=jcQSNzOq5NL67DyGwux9NWN+Q3OQ/tInykB+C1e+30dkJScYSIiE6+PlIbWNmrHvz6
         A9wC9tjIXk9+I3esrEQno5XPqnFopIVA97yAG+cHQpDs9qBgFAW9szCGGkMXu8vYITTt
         YJmYxD+2kX4OOTVtfCpTZFTEwNe+dqbrmHs+s4rzPmTyxQyEnGsQqBcFLxpqbhwUjaKF
         UVLokVzA4UJrolD8g+bBupXF7ST1Vecu8IvJslTejxKl0giS6fl9xFhige0H3Wfrdc1D
         BlNPPZ8FTmapxBsp7jGhTcmiH1xhWoKz1+Fi+2ZLgJdUnBZVsiBQOX0MGC6txPDuOmW0
         rP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745030240; x=1745635040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5xMW6JQzRFC3RypkMpl7HC+Ok1HS+DBoXUN4t3IzPg=;
        b=HVu7gO9+IzNaXRnpkOcQ1P0Xop5DLmoNABTFfor2phnRCY4ya6i2hU2W/24wqWrF7m
         ztwfRMrNqnNksNVaz1UVFuDYFmh0vOlrfM1tcRKWBoE282a0DfEhxLgfkURozVUaKpKa
         EgkE4/EVcgEigq6SUNDVz1F4OTq0F3IDaWVwPfcRheWNrqtgGtq/FJDzLuffWqJmbggT
         Ohq8SG/N+em1RcB9/2U36Nnzs3gQ6HbiVMH+2ffVc5MTNiQjeOle02YQkgZAH50+jAAE
         /UWZj2X3o+3ppE2XU2692aSKSIhhDIRRR9wLG7HM4l4N+jx3/hYWzQx50ozqe27Ycl7O
         5utA==
X-Forwarded-Encrypted: i=1; AJvYcCW3EaU4C6lud6NFTNul5qFztaydhHDnnAtOSaStkyHttCj4+leiFhypnP8BV4s54DTh70flYcpVtGXcul40IIw=@lists.infradead.org, AJvYcCWieN/Y4OsmRWQkBYr6SfT5FbDCMwmkrzby0vo6nzRCuJafAtMBYzB5OvvhQ+RyVWdOmwNQzlNNwq4CQaOZdMHT@lists.infradead.org
X-Gm-Message-State: AOJu0YzRemWoEcBroIJH+fOAi7SzvhQaKCvCvOJkZB7sQqYlhok3R9Xk
	zXfZGqlZQzYrcLZS6kRzsGbITxbrrwbgrFPx6s7nscEj0Opzyp0B
X-Gm-Gg: ASbGncu7ztT15zPgRiKjcxzRbj/B3UIBBz3Meilkf2DmBkF6EY1V5b3OQS/63FQiVwI
	WoUqpvNdFFppANeblN2CTlVjzud2d8LWkIwwQrkBm2pnk3q2OmfEiXgCu2kvGYBJr0vNhXsRv4L
	sPr6YV67SEUuqCU2alFhabECpX2mNfkbckLV7giIGLikE6mUjE0HzpQ5uv93a0vEwRpZqmnuklj
	2RMvk5JL4P3AFzCCUAZWpL9Xe8P4CK6MxynA9g50RKJ3GWkjmcXuxDlbk4uWMFouwaHVCLtjy3s
	WtbTDWYm75fQ/1kbv03ej/UVM1Z+PkhsZu00dDTELCzZvNZ/XRvj
X-Google-Smtp-Source: AGHT+IHye/ATWWxQYKG94Z32CtV6NgziY9q4KsfM+OTqg+TdECswRmqN026PmdK91mfchx0mVjT56Q==
X-Received: by 2002:a05:620a:4413:b0:7c5:5e9f:eb2d with SMTP id af79cd13be357-7c92803945fmr784446185a.44.1745030240096;
        Fri, 18 Apr 2025 19:37:20 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4ddb2sm169612985a.88.2025.04.18.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 19:37:19 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Marcin Juszkiewicz <mjuszkiewicz@redhat.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	John Clark <inindev@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
Date: Fri, 18 Apr 2025 22:37:15 -0400
Message-Id: <20250419023715.16811-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_193722_119041_7B0439C1 
X-CRM114-Status: GOOD (  15.03  )
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

The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
regulator disabled, gpio-58 out lo) due to misconfiguration. The
original setup with regulator-always-on and regulator-boot-on forced
the port on, masking the issue, but removing these properties revealed
that the fusb302 driver was not enabling the regulator dynamically.

Changes:
- Removed regulator-always-on and regulator-boot-on from vbus5v0_typec
  and vbus5v0_usb to allow driver control.
- Changed power-role from "source" to "dual" in the usb-c-connector
  to support OTG functionality.
- Add pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>; to the FUSB302MPX node
  to specify USB Power Delivery (PD) Revision 2.0, Version 1.2,
  ensuring the driver correctly advertises PD capabilities and
  negotiates power roles (source/sink) per the FUSB302MPX’s supported
  PD protocol.
- Added op-sink-microwatt and sink-pdos for proper sink mode
  configuration (1w min, 15w max).
- Add typec-power-opmode = "3.0A"; to enable 3.0A (15W) fallback for
  non-PD USB-C devices with the FUSB302MPX.
- Set try-power-role to "source" to prioritize VBUS enablement.
- Adjusted usb_host0_xhci dr_mode from "host" to "otg" and added
  usb-role-switch for dual-role support.

Testing:
- Verified VBUS (5V) delivery to a sink device (USB thumb drive).
- Confirmed USB host mode with lsusb detecting connected devices.
- Validated USB device mode with adb devices when connected to a PC.
- Tested dual-role (OTG) functionality with try-power-role set to
  "source" and "sink"; "source" prioritizes faster VBUS activation.
- Validated functionality with a mobile device, including USB Power
  Delivery, file transfer, USB tethering, MIDI, and image transfer.
- Tested USB-C Ethernet adapter compatibility, ensuring proper
  operation in host mode.
- Tested USB-C hub compatibility, ensuring proper operation in host mode.

Signed-off-by: John Clark <inindev@gmail.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cecfb788bf9e..8f2bd30786d9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
 		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&typec5v_pwren>;
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-name = "vbus5v0_typec";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -188,8 +186,6 @@ vbus5v0_usb: regulator-vbus5v0-usb {
 		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&usb5v_pwren>;
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-name = "vbus5v0_usb";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -465,24 +461,30 @@ regulator-state-mem {
 };
 
 &i2c6 {
-	clock-frequency = <200000>;
 	status = "okay";
 
-	fusb302: typec-portc@22 {
+	usbc0: usb-typec@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 		interrupt-parent = <&gpio0>;
 		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-0 = <&usbc0_int>;
 		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
 		vbus-supply = <&vbus5v0_typec>;
+		status = "okay";
 
 		connector {
 			compatible = "usb-c-connector";
 			data-role = "dual";
 			label = "USB-C";
-			power-role = "source";
+			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
+			power-role = "dual";
+			op-sink-microwatt = <1000000>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
 			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "source";
+			typec-power-opmode = "3.0A";
 
 			ports {
 				#address-cells = <1>;
@@ -1135,9 +1137,8 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "host";
-	status = "okay";
 	usb-role-switch;
+	status = "okay";
 
 	port {
 		usb_host0_xhci_drd_sw: endpoint {
-- 
2.39.5


