Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772ADD44D5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AkhTqMAEy+wfKt4c1zlkHxKZoS9y22psXlk3N9SJC2I=; b=Nrnql2Lw2DOPXL7JRsesxtnL2/
	fKX7sNOotJYGnqP6qKxl571B4RDM2AzVejl0E3wbp/9rqB1yVfZ1eZVPEj6twEgokbJxp8yXMbUyi
	3ZqQx8vqcrnV49hQAcxmF4sa1oYURAj0YXlwUiBeFlkY1DcZDQgK2WoiEicfKL1VApE+pl3Z3ryaw
	cYREVkfMRV9wTKkDCVr1yH/7P66f5xgFx5EIV/eypjV5o8y7V+k5wnOLGeLyLkUUMWBwBt4zVw6h5
	KMbXWinayu0cwHDDoq7/vcWgkdiO/4gcB1E920nALOGs2yl7FwzhLf21D2SYSN5qO5H0oFMkBhl+U
	zlpnbUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gC8-00000003RD1-48Z5;
	Wed, 06 Nov 2024 13:35:37 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fh6-00000003LZr-1i7U;
	Wed, 06 Nov 2024 13:03:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so5327582a12.0;
        Wed, 06 Nov 2024 05:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730898210; x=1731503010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AkhTqMAEy+wfKt4c1zlkHxKZoS9y22psXlk3N9SJC2I=;
        b=DIfSSzsW5nz6nyjE9LxqlpmEXnud6zKajLlhoyYHcRjfP/q1WDqnY90/4O1YwR33rM
         KCoG3Mki/px65+qx4cefMkZ5HhcN8Xmln5aWzoo9jsOpI/SKZyHwwNBf1TEn4iP8J3hu
         wmK8xqJ6XzcRJVePVVMBBdam6WleHq8PoO7K2fKQJHNojMzavNU83JUPfhf709l24CY2
         RbCKQdnfwCMVquQKU+7gKpUJny5d4zOWtZxqZeiEzV3cpnYh2TIBqBrSDx+T+IqYsiga
         Kyo6RFkDm/cbA8ph5PsFEKeU7XgTJNFLMHHEsD4ITXf1G7p6Jpe/46+mm7hMBRF8XRQO
         2ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730898210; x=1731503010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkhTqMAEy+wfKt4c1zlkHxKZoS9y22psXlk3N9SJC2I=;
        b=v7RAdzlzmLVtarux7nZ/UC5a+QUf7k3KzIWcEs2ShfNiZFKskno0pmH2IU2rVSp2gf
         lfd6ZYAuBETYZ7Zyd3chGKlN+sDduI5v7WQidFXkvX6CwfJnaoY7A0Gxjm2i2dURxFhx
         wkdp07dQ6wsSTorM4cWIJqDE6XsTinCJCKvJAoFP5NjL+dZZ7IOO3dBRmX8y0ez0/CjS
         xS+E4vQijSVPDltavXe9UGmMmI6DM1p1d9rSMBMrzAw9eqNcCeSrEN/qhRD4IyxE4j+3
         Q1eFONposRkfZ/9UeQfyrT159vAoN+YSrWTJoMKcjceNFU89M9Jpg1mhygy6B5ynCdcG
         UneQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ00Hw7Ii5mZAYV7OoxpIf2YghEpz1Ru0xwK/O/hKtWAG2AMkvCGOT1inAhgyCOiB2t2DLnchXd61vALagvmY=@lists.infradead.org, AJvYcCXswguXQ1tMgLP4dsae1oDAD7s4XDesa/w+mnBNcEmO0JvQhqUzv4BKuCneN5K/7/5n0ZZZpQMUkm8vF1UbLs1l@lists.infradead.org
X-Gm-Message-State: AOJu0YxOUNbYIFF9EPIEnqeRCUqv/AddHqu4Ks29a2UCmstGFcfwp341
	PSEO1Ou2JIlk6sVkj9L31Z7NueqtTgxCRMMFsdA5OuttUgyRpgXM
X-Google-Smtp-Source: AGHT+IEqBTEWgsrzkfZOna1FwJf1E2BQ8X3eInejzxvLIxEo2OwtK5vRIp0mlLmeUW8b3wBaksf0Kg==
X-Received: by 2002:a17:906:db0d:b0:a9a:129a:1862 with SMTP id a640c23a62f3a-a9de61a17cemr4108748466b.60.1730898209309;
        Wed, 06 Nov 2024 05:03:29 -0800 (PST)
Received: from A13PC04R.einet.ad.eivd.ch ([193.134.219.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a4836sm279603666b.11.2024.11.06.05.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:03:28 -0800 (PST)
From: Rick Wertenbroek <rick.wertenbroek@gmail.com>
To: 
Cc: rick.wertenbroek@heig-vd.ch,
	Rick Wertenbroek <rick.wertenbroek@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	John Clark <inindev@gmail.com>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: enable USB3 on NanoPC-T6
Date: Wed,  6 Nov 2024 14:03:13 +0100
Message-Id: <20241106130314.1289055-1-rick.wertenbroek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_050332_471758_CB241073 
X-CRM114-Status: GOOD (  10.09  )
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

Enable the USB3 port on FriendlyELEC NanoPC-T6.

Signed-off-by: Rick Wertenbroek <rick.wertenbroek@gmail.com>
---
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index bf8e1f1116d1..b93c2590feb5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -171,6 +171,20 @@ vbus5v0_typec: vbus5v0-typec-regulator {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
+	vbus5v0_usb: vbus5v0-usb-regulator {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb5v_pwren>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-name = "vbus5v0_usb";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vcc3v3_pcie2x1l0: vcc3v3-pcie2x1l0-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -607,6 +621,10 @@ typec5v_pwren: typec5v-pwren {
 			rockchip,pins = <1 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
+		usb5v_pwren: usb5v_pwren {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
 		usbc0_int: usbc0-int {
 			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
@@ -1005,6 +1023,14 @@ &u2phy0_otg {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
 &u2phy2_host {
 	status = "okay";
 };
@@ -1044,6 +1070,11 @@ usbdp_phy0_typec_sbu: endpoint@1 {
 	};
 };
 
+&usbdp_phy1 {
+	phy-supply = <&vbus5v0_usb>;
+	status = "okay";
+};
+
 &usb_host0_ehci {
 	status = "okay";
 };
@@ -1064,6 +1095,11 @@ usb_host0_xhci_drd_sw: endpoint {
 	};
 };
 
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usb_host1_ehci {
 	status = "okay";
 };
-- 
2.25.1


