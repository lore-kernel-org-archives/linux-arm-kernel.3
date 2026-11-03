Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB388606A948
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rOUl9ujt;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VAGUGW6Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=; b=rOUl9ujt160LYf
	Y0IzgAOQ5dyDZDUmEMEsuW3sAyAJkxROjeENT0HbXhwBWvhwp7v21XVk0Itvb987edr8NSuThTuq+
	xBDucqozJJVIQE/1VfoDi8EGwuUTN26TyItpEegixIztQ6ShZLH4TDZWzo130KBTUFQWFDxkIeLpx
	vsQgnOk7geT2eu/DGvLFPSxHmzeNVfPnloBeHx4nWfV1eoCCFyk+qiSAk+gAHD/vVYHFNLIdSXTu3
	GTbWxQp1Wa5ExP9jnjwuMryYC5EMRTj+VDq6JwafQ+xoxlo6GPOPrwf6629bks688T+oXwSdJrUH8
	XrtXSPinf+4uNAZYZLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xl-00000001Z2f-2A0B;
	Tue, 03 Nov 2026 08:33:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xi-00000001Yzg-30N4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:33:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cd3310348d2so206528a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694826; x=1794299626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
        b=VAGUGW6ZxHBt5891nQxD9nLsYDs0rj8d0PpFw0QIx5fXG+20WaBh//ROp3HhnVk92L
         HChDWKilYYRYOjrYwJVjkHHl+hg5D7Hiyk47F3Lfwt6o/4dxKNVkKxnJtS0cvPWq28a7
         MZGHY/24PAA8tiYOoW+oXIl4CDTYrk3zaIJiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694826; x=1794299626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
        b=Tyw1y4jY2n7QScmoSSYUAd2E3tm4snQ/+r4wC1xGA0fUp9EOAIOV2yXLTHrRX8Zied
         A6Ujr0XmeMqlv+vTacX0rMNMGH8arvW1wlQCdNuUl+DWQUm5uCgHEjpdkmE8hj7FCoup
         Upr615kjbohIZ+vaxhGbcmLRh1pDgl32u6+i1nYP/zKiHb6QfHk11jeKDLeKs54BRyJg
         fY6PQ3dGPFbRlnyUkaitK+wB9/THvM//7KQBE7nhNNAjS7DWm0kIYeqO5MvIMu/uIMlU
         E/L1qt9ZQA85xX2gHUrPmfYvLc6yWTYCS9nkUp8A8XiQzPrU3HZggUQrt41SlMhlhhnA
         YvLA==
X-Forwarded-Encrypted: i=1; AKwUvBxr8WpWds7N9esm8tede4hE2FtYh9Ju9NgYRdrgKCxHuCCJmMZiHTdnU1JIfqliIMMtua6hO5rRn8t60UXZpk5B@lists.infradead.org
X-Gm-Message-State: APuU4Z/J6C9J5UiqFV6A+af5gHjLTOJdcSsZGJImnoHyjKcrw/zRDfNF
	Kv6GdYmhGnPymLIKW8GQc/rzJjAdv+iqIW4xT53KQtPNJMEJLXihStd9akGkWERpUg==
X-Gm-Gg: AYBFou1Babihhvn94ms4DnK169bMiZUIfe30VEl4XK9bpgw+Yb3TLAtwJRwBVbAe74G
	pmOh9Ks/xmrTaDaXOh5UawoomOHfIoP9HCqjIiJDPTLScxweV8Zdjb/aZ1xPuGVxGpV+jEwOamh
	tVQ7VyblgNGVBnm4OOXQF7LfOdwLHwm29bqDULSXIEtzaXi2keBiZVigg7lqQBHSezAN7BPgs6M
	QKwd7tOsWh1U9npx9Ik2eRbuvCxsTWpFtrLDu9lPLynDduDenbg9/S3jXaA3uT+ZriL1NlI3YQB
	5DjqfoY20S8j6Ejvv+S7ni42B77LaOzpapquSrN0xo6+ixXVIlPHOOL0REuU3XGpBVcmUhOOzd+
	L0owOgrUYHlwAZpmpy6rhCAqIMT1agoBdlOmwYc6BKTPLy3/Ga7/Th6kLOb81sKhdiwH+IxpCZG
	ZlqfaathfdJGE/BebWoLG7XY3ftjZQ1PdNjccdeEpmq0aZ0BfRpZBfNZYWYcu4AkxaNwVfytA95
	cT3z4h4NoS53yCGyg5gPh+IIJ9/A/9XQbnDoPU5zOidwANgPkm/U9gUl3kDR969g/QbCM+/GxhB
	djWdr4fKWDxPmqM/B3Wb2yRe7iNX3kEdC4KmRvdymrZOnmQ97Q0Sn0/KnLiEE+15isodyp9s4b5
	dGxPcGgU5tVUv
X-Received: by 2002:a17:90b:528d:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ae896d8027mr6639826a91.13.1793694825657;
        Tue, 03 Nov 2026 00:33:45 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:45 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
Date: Tue,  3 Nov 2026 16:33:32 +0800
Message-ID: <20261103083335.2944847-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103083335.2944847-1-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003346_776737_CC172345 
X-CRM114-Status: GOOD (  17.38  )
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

Change the controller's operating mode to "host", and drop the USB role
switch property. Fix the USB type C port data line connections to go
through the USB hub, as shown in the block diagram. Change the data-role
on the type C port to "host".

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.

Unfortunately I don't have a board or the schematics to check which of
the USB hub downstream ports the type C port is connected to.

Also, the order of the USB hubs might be reversed. In my previous
experience, port 1 on the XHCI is SuperSpeed, and port 2 is HighSpeed.
---
 .../dts/mediatek/mt8390-genio-common.dtsi     | 43 ++++++++++++-------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..821dbf9d3fc5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -512,7 +512,7 @@ rt1715@4e {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			data-role = "dual";
+			data-role = "host";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
 			try-power-role  = "sink";
@@ -539,14 +539,14 @@ ports {
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
 
@@ -1528,19 +1528,12 @@ &xhci0 {
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
@@ -1555,6 +1548,19 @@ hub_2_0: hub@1 {
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
+				usb_2_0_p2: endpoint {
+					remote-endpoint = <&typec_con_hs>;
+				};
+			};
+		};
 	};
 
 	hub_3_0: hub@2 {
@@ -1563,11 +1569,18 @@ hub_3_0: hub@2 {
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
+				usb_3_0_p2: endpoint {
+					remote-endpoint = <&typec_con_ss>;
+				};
+			};
 		};
 	};
 };
-- 
2.56.0.385.gac671c819a-goog


