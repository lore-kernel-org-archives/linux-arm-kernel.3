Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ACD606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 06:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sy8k8Bmz;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DOSuxZ60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7EJsMCWEqKKGcSspnc55D/y+wcj1XBvUuvUKTfXAjUw=; b=sy8k8Bmz9PEE7D
	GW7b3eX8+fxzlohMcVv7pysmSfHJIUB0Weq4Td6v84TxjDs12UIkI8jDwvRvZ/p5hKnOj0GnVSvwc
	wWvzXFU0a8kieEQ1mki2d+JtimkRotirCVcUp1T7OjE2anTYyeeq0G6zJighyNXTdiOUs9NiihcOw
	uhEMIXtTqc0x5L59A9fKLPbd8ysXzHjNiHilMAtcOIUmdZ7B9TVljm8zh8VTyuOZD3dRE09P0eePu
	qzDO4UpL1S51n6jqVBGB8CVVBWoxVhg3zMrq7fBrAD8aFdzeVZbt/ciB/bIAjZFeRxnANWjYeFTe1
	wRf4VSVX8d8h0Mu9Ct7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD60-0000000BJc8-3ksX;
	Fri, 06 Nov 2026 06:06:40 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD5v-0000000BJXe-3G0D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 06:06:37 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1aefd1bf74aso331688c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 22:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793945195; x=1794549995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EJsMCWEqKKGcSspnc55D/y+wcj1XBvUuvUKTfXAjUw=;
        b=DOSuxZ60Xo62mH4nOxEj4/HQJNmtlzi1KyjG1wDkjw7yuy7ElWF1cbnIpPycwN3tmh
         YC35xRHin1gIh5br6cnYSWeZCDhNpw7XthoQ2adkmwJ1ve2RGM3Y0U1wOwl/o8j01hNT
         NAng5UJad5+pn7UwioNs4oqmcxOshr21xvsk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945195; x=1794549995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EJsMCWEqKKGcSspnc55D/y+wcj1XBvUuvUKTfXAjUw=;
        b=sYR1A6GXGBdcjea/9Nu0VDvgjAZM00kjfp5dfKyF3n//WZHDyglJiAVARMJQ0zVqeu
         9iYCkYDukG3gL1gtiokJ4DDbXRkbcEFN0nBuXRSidL2J1FXKaSCAbAsGkYAyLYXWUse5
         OBVZJRt4EMjfyYavodu0EMAIEWWY0oJuWJbJYoxbXXrOmH66+Xbd/gMn/30YQVVGoCrs
         FOgJO5iBietZNOKlgf8fCmr/LT5jKDAMDxU4WOvL/mtPIBXuwUkYi97AsCpoLYjrMFTV
         W16eOqxmL26sqq1yYMWaJgVDrSDmGuSsO+HPeD5nb3RKW2U6OS0eMqO6AIJSwUBAMYQr
         tchg==
X-Forwarded-Encrypted: i=1; AKwUvBywo4ypwuJvexhJpudMgCmKpUfUQJWc92mYjNwXJH5idDD42sg1DbqG2dU/yYAg5t7dW9BaGONFNLmyaeJgVIJU@lists.infradead.org
X-Gm-Message-State: APuU4Z8DDLxE/h478QvWnYnI8mnqGR6zxFhJ2ura3JRzwKZSok3TQoLp
	56eywVC91WWmf3NmuegKIztKXldD+waxzNHs/CGe2o/pqLVkTGA8HOw/E63yPpCwhQ==
X-Gm-Gg: AYBFou1h54r7C01HzM2ZSWDMVTwyTF/3NAWF22Blp2bUg7i35bTFsDUZxCOj/5TgiMg
	jR9+nGDW0x7NBWhD5QpeUYgoLpuXm3y+9RLjNUXaT2xA1DNor6NHP0/T+Rh5jCeKpFviqNzLbDF
	kZ0L0PNoHDv9oeZ6n+zQ9fvTxH6nnZ2MLKBBerAZ5C0h0ZGFqLeMhFHtKGzqMKeH0/RmpS8fG7v
	a2R7CvrR+6742utoo5kQySd8uYORhYZADQzb0wbB95ET6BK7F2CKMX3A12rrvFt+UMu57R4Tagz
	HacIKoibbMcN7cJthoF/tGtfoOJS02+HfYo3e8uejSUUN7nrC9yjJ1u2yN1dHyQ5jSphDsAxfi9
	nYoeWRqt3/PSG3T0svk9i41KZX6Db24aozVl8xm1koEUPVTGXkKckngiwcVpE+tBsupGAldRs36
	6j5BBLUTW0jwkMC37UOD5lXrYMZb2thSJhP3kxM4WqHmR6zOTINRQ01L2GOX3+cj0TC8j8I5yMI
	QYPOsajgSfmHXOrruVs22sRSM6MpESFMlgXmjTClN+yzfqxyVI0QAXlxQEy1ypFoUmAEYtEhJHW
	q6mzDWuiiyCPVwpfl+gfpeXhnWKx2YhcTr9RIEbTRHm2EBmSY6lJGWxK/f1PR90a/2ep9gmczEX
	0Wkm/+i2HPbqA
X-Received: by 2002:a05:7022:29c:20b0:148:ece:8cc3 with SMTP id a92af1059eb24-1b24f4e2176mr6321128c88.24.1793945194629;
        Thu, 05 Nov 2026 22:06:34 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:f73e:d73b:c0da:5b05])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3821809eec.6.2026.11.05.22.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:06:34 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
Date: Fri,  6 Nov 2026 14:06:18 +0800
Message-ID: <20261106060621.2706658-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261106060621.2706658-1-wenst@chromium.org>
References: <20261106060621.2706658-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220635_835300_F890B703 
X-CRM114-Status: GOOD (  20.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB controller complex ssusb1 and xhci1 operate in host mode only,
as it is immediately connected to a USB hub. The user manual has a block
diagram showing this, and a USB usage table showing port 1 as "host
only".

The block diagrams for both the Genio 700 EVK and the Genio 510 EVK
show that the type C port's USB 2.0 data lines are connected to the
USB hub's second downstream port directly, while its USB 3.x data lines
go through the USB 3.1 / DP mux to the same hub port. The type C port's
VBUS is supplied by a 5V 1A boost converter and current limiter. The
port cannot sink power; the charger input is on a separate type C
connector.

Change the controller's operating mode to "host", and drop the USB role
switch property. Fix the USB type C port data line connections to go
through the USB hub. The TI TUSB8020B's USB 3.0 hub uses PID 0x8025,
and the USB 2.0 hub uses PID 0x8027, so the SuperSpeed lines connect to
the former and the HighSpeed lines to the latter.

Change the type C port to a source-only, host-only port. Drop the sink
related properties, and limit the source PDO to 5V 1A, matching the
hardware. Also drop the dual role and data swap flags from the source
PDO, since the port supports neither.

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Switched type C port to source-only, and dropped sink related
  properties (Sashiko)
- Limited source PDO to 5V 1A, matching the hardware, and dropped dual
  role and data swap flags
- Fixed swapped SuperSpeed / HighSpeed connections to the USB hubs
- Expanded commit message with details from the Genio 700 / 510 EVK
  block diagrams

Compile tested only.

The v2 changes were done with the help of an LLM coding assistant:
the source-only connector and PDO changes, the swapped hub endpoint
fix, most of the expanded commit message, and these notes. The input
was Sashiko's review, the TI USB8020B datasheet and the Genio 510 / 700
EVK block diagrams. The PIDs in the datasheet and the block diagrams
were checked by hand.

This patch depends on "dt-bindings: usb: ti,usb8041: Fold in TI
USB8020B" [1] to allow graph ports under the TI USB8020B hub nodes.

The downstream port number of the USB hub is based on the order shown
in the block diagram. I don't have a board or the schematics to confirm
this.

The hub_2_0 and hub_3_0 labels are swapped relative to the actual hubs
(usb451,8025 is the USB 3.0 hub). This is fixed in a separate patch.

[1] https://lore.kernel.org/all/20261103095425.3097720-1-wenst@chromium.org/
---
 .../dts/mediatek/mt8390-genio-common.dtsi     | 54 ++++++++++---------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..d10ee1603103 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -512,18 +512,11 @@ rt1715@4e {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			data-role = "dual";
-			op-sink-microwatt = <10000000>;
-			power-role = "dual";
-			try-power-role  = "sink";
+			data-role = "host";
+			power-role = "source";
 			pd-revision = /bits/ 8 <0x03 0x00 0x01 0x08>;
 
-			sink-pdos = <PDO_FIXED(5000, 2000,
-					       PDO_FIXED_DUAL_ROLE |
-					       PDO_FIXED_DATA_SWAP)>;
-			source-pdos = <PDO_FIXED(5000, 2000,
-						 PDO_FIXED_DUAL_ROLE |
-						 PDO_FIXED_DATA_SWAP)>;
+			source-pdos = <PDO_FIXED(5000, 1000, 0)>;
 
 			altmodes {
 				displayport {
@@ -539,14 +532,14 @@ ports {
 				port@0 {
 					reg = <0>;
 					typec_con_hs: endpoint {
-						remote-endpoint = <&mtu3_hs1_role_sw>;
+						remote-endpoint = <&usb_2_0_p2>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					typec_con_ss: endpoint {
-						remote-endpoint = <&xhci_ss_ep>;
+						remote-endpoint = <&usb_3_0_p2>;
 					};
 				};
 
@@ -1528,19 +1521,12 @@ &xhci0 {
 };
 
 &ssusb1 {
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "host";
 	wakeup-source;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	pinctrl-0 = <&usb1_default_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	port {
-		mtu3_hs1_role_sw: endpoint {
-			remote-endpoint = <&typec_con_hs>;
-		};
-	};
 };
 
 &xhci1 {
@@ -1555,6 +1541,19 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_3_0_p2: endpoint {
+					remote-endpoint = <&typec_con_ss>;
+				};
+			};
+		};
 	};
 
 	hub_3_0: hub@2 {
@@ -1563,11 +1562,18 @@ hub_3_0: hub@2 {
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
-	};
 
-	port {
-		xhci_ss_ep: endpoint {
-			remote-endpoint = <&typec_con_ss>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_2_0_p2: endpoint {
+					remote-endpoint = <&typec_con_hs>;
+				};
+			};
 		};
 	};
 };
-- 
2.56.0.455.g6c5a503b38-goog


