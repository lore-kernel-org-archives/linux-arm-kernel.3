Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5898C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MbZtBYfPPawE8o+lOlR32EHg0wh4Zt+mD8hZTHKftD0=; b=nlnrAwkakrzXULdLcSh6y+Dgyp
	EvdBIPGf39q+VsI04GKo5FzoN4O6Yh9uhspkCXpUDoJOxozVWUSBifZB4ho2k0zMJ0QN+U5EIZbI1
	e9c2qJw5N8IlyipatRaBaBXW/2iP36yXfOxi02sUE+423ZQMDBO+NLTI02XjoQqw5aQTp/jqeAzf5
	QTTZz1i/qO0AEG0rziYo/JAa8ZTzmqUTNNgCZe3jQyblJFLlOusyHT9Isj2u7hhhx9yuY+t53r/QA
	PcYxxSujYm97juBckey1eP0qHgcKO+wB6iQD9XwZWUga2KGM6Gu0qNRtrwQU8iXGc95Y3ktWwSEcZ
	oWv+7boA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjK5F-00000000KF1-23py;
	Sat, 15 Feb 2025 15:27:57 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjK3M-00000000JtM-3gT3;
	Sat, 15 Feb 2025 15:26:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2162b5d2e1fso7061725ad.3;
        Sat, 15 Feb 2025 07:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739633159; x=1740237959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbZtBYfPPawE8o+lOlR32EHg0wh4Zt+mD8hZTHKftD0=;
        b=SeFkrVaKe4WB01NCeCEopgX/QzOvj8vhStStSA2PZYn1/E750kRZ2pYJH38pUbYQjU
         H+tK+gaRJUAeC2o0CfEpKbpmrqDTy0T7y0KIonSZtuIrsAUtvAYE0yIkoiJZYoECRrGP
         kRLMjoiaTqVancpRe8I11uIGKjew/zl9Wku/oWwpuPvU3tC6OK4kZFN0q9eHfIRjjb8Y
         1pIvG7B2d/hNJkuXL134FkEzIaxtSiPjXrkKc5AkYM7+ToF0JXfd3UWYA1RlApWCxGzF
         EEDNOmINp4y06BKp1b7CbZznVnZsiP5ySEz/J27g1ppOUt3X23NVDAhECdzTpKdURHcf
         1ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739633159; x=1740237959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbZtBYfPPawE8o+lOlR32EHg0wh4Zt+mD8hZTHKftD0=;
        b=kWCdwhtKfqudtQEYdPeMTFM4/7G1LyiBzYjgMpg1uLBpRJ27F2AwRu/+V/03Q9bAbA
         ypVr2SALzBJ/tGRzUNE8H/fisao32DesFoWv0EmrAHiBAJ61uuZnpSmuc/zGiTjTy+3F
         GCGn92P34kBJnjysin+FxJdh+zHkiq3ty/xeMogdbBqroKN7/PCQhrL4ry90+uzFyNoQ
         rgjOw+k+LWI7hPwnxS3mA1jH1amkFJG3yu5NnYTg2NwA7RzNUDZxwE+ic6m/eWKiBuhN
         PInvPVfPPr3RAtqsT4ta3tXfr6bSznx9YyY1mri0Smtgcm32Nvwp+QdbNQMnXxoiiGej
         X60g==
X-Forwarded-Encrypted: i=1; AJvYcCWmUJ+0JRffB//YdI20sDoYojVLtrBmUaiV8iiYLvFYB1aCJqSN0LJdo2oiEGWdqBTHzyMC+GrwyTyD7TLO0I+7@lists.infradead.org
X-Gm-Message-State: AOJu0YwmBxM+wsE0EjSYvu78ns05aTzsScqIge8pHHe5x7oDVRzlKVrn
	mt1ctcJIJtbUoXI0ejjupmMKh7GXdGQxGSrGHMLTaVNSQW1dcdpG8MsytSbO
X-Gm-Gg: ASbGnctPuZRvmeePp3oB+i//Ari/byXwqyt+VmsplwYVmJB+h1Co5XU8VN8pGguXMIZ
	6PyiGgdA5H4+so9xgsXdMqKFIDaBFrePkxAF119Y7Ap2ggJTMaOWWiFM8YL+q1DKLd2GwR/MKci
	KelnGYj6UKwBKgOYTt580YtLbWypQpCYhEJO+bOl1zBk17q5xbzMbh0ecnfoja40Vy4ZgThAclR
	nu8qHTb1nX58Ktti44kYjugNzhAqtx9raVV/vxAPXvQBhC3RCaLiSbzuqxr1v7EIogwKOk8COVp
	jqTpSezjZsUAwsQ/fKrv
X-Google-Smtp-Source: AGHT+IEvXhWy6/gs2I2nQXXUem/BKTSxc+vCPMgz6fxtKjGYy29KOuDEBVg/Uyb7DlOuXSsE0vui7Q==
X-Received: by 2002:a17:902:da8c:b0:220:dae5:34b5 with SMTP id d9443c01a7336-22104042218mr19131705ad.7.1739633159298;
        Sat, 15 Feb 2025 07:25:59 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d558fe3asm44747405ad.234.2025.02.15.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 07:25:58 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: add hdmi1 support to ROCK 5 ITX
Date: Sat, 15 Feb 2025 23:25:45 +0800
Message-ID: <20250215152550.3975614-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_072600_917401_EEBD284F 
X-CRM114-Status: GOOD (  10.70  )
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

Enable the HDMI port next to ethernet port.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index 6d68f70284e..a4fdced052c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "dt-bindings/usb/pd.h"
 #include "rk3588.dtsi"
 
@@ -89,6 +90,17 @@ fan0: pwm-fan {
 		pwms = <&pwm14 0 10000 0>;
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&hdmi1_out_con>;
+			};
+		};
+	};
+
 	/* M.2 E-KEY */
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
@@ -261,6 +273,32 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi1 {
+	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	status = "okay";
+};
+
+&hdmi1_in {
+	hdmi1_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_hdmi1>;
+	};
+};
+
+&hdmi1_out {
+	hdmi1_out_con: endpoint {
+		remote-endpoint = <&hdmi1_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
+&hdptxphy1 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -1209,3 +1247,18 @@ &usbdp_phy1 {
 	rockchip,dp-lane-mux = <2 3>;
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp1 {
+	vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI1>;
+		remote-endpoint = <&hdmi1_in_vp1>;
+	};
+};
-- 
2.43.0


