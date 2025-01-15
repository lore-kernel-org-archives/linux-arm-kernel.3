Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA522E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4acl8v4X7Xc6vcnsDKKEEdZ9ptXjvdjq4rSlCL1DJg=; b=OgyVFC7fHpj+2grinCQhmTuw35
	lovrk1kW/h6S8LtZUCsQEudjcSinGqBA176/w0++V9o2qBRrBhuH0mdnMPX5uuBQKOY7Po2UBcFre
	eUhf5FDJL4Am7EBZQxxIeUSBYZxWSXPxgtjkqvR4hEVnAXJzbQsqdb/4gkW3zQ3S1yiYyCEyGmHmo
	iENRhBLASuAHJXXnzRsuCrQoWafWbyOPFRDvtqRFdqxyO8sYU+wPq2nw5aCgXSr9j8TPp1XJh6gnk
	StJeDG+WAPLK2IJZaQIJBomoeFIo0maElQllfCeU9waEMrHugcm0L9bTC52T9lZi/h9BfCKsDqPRX
	2hKZ/4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtFB-0000000AQI3-0TtN;
	Wed, 15 Jan 2025 02:34:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtDu-0000000AQ3M-2jVi;
	Wed, 15 Jan 2025 02:33:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so1260714a91.1;
        Tue, 14 Jan 2025 18:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736908417; x=1737513217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4acl8v4X7Xc6vcnsDKKEEdZ9ptXjvdjq4rSlCL1DJg=;
        b=e/9rzd0KDaTuce0FGuxj+b9DmgWmzhN/yxqArUtafAH0O4cbMT4Nfu88oO4N5Rkb6+
         jPlnXwjo3d1Wp8He6XJaP61umkOsyxP7oxs6bz1WDPqtASFp/KkaTAzB/Aps7Dhrzt0x
         QtS8j8/vLCk8K0zyqfQoFuSV0zX9U1Fiu2juPBwgHk9k2KknO5YhdY1g95MYhzvpJO6e
         4g8CVmFCApJx1oaqx15+BA6iMmcQMLXZhEvtXRp0tZ2X+4c1MRlJ0C/3VsnpSikY6Xe+
         Zspu7+We30sMEZMTzumvqR/n2ruNqQOg44U5jPFXvjglcA16A6bPthkMXQXsrRnU+TG9
         5X6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908417; x=1737513217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4acl8v4X7Xc6vcnsDKKEEdZ9ptXjvdjq4rSlCL1DJg=;
        b=No8M8hxxhqEFZgkXc012IDDA2/GX0jgwqWvysNX7XW3HNq2jrFazxf+XpDLTCY6DVT
         hBPXxnJIrleNWjW5ajn3LSzcbMSNNbgn/g6pdU9wWUHoqt08tCwGVOHymIcHVPjSSls2
         +O/o4NSVUpaZmhBPtnEqo+X81IAAlTNLU+Y8jxC6uLchTqbOOPIqMYBnyo8Huwu61goC
         k4sfOgG9i+wZJ2rBpcrENvFGpAH1MihS8ret9Oh8N6jDDSbhFc8AaC32+aknBo8aTFxo
         9yqmbdAsBTlJjwVKNM1T4mCvDRQiZRv4/hATZ6Dl+9CgulmACaK/bOOcIEhUVJTWRP/4
         3Nyw==
X-Forwarded-Encrypted: i=1; AJvYcCUZS8LUR+HzkSc5LtNwu3wctTmIG3SRjDp/BxWYVRS95933gcGr7QTnG51d2iON+3MkzSb93NuqJ3PgKy/zhdpC@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQVY3zJQq7/egvX6m4zZrM4cOfISG8B6Y9OFQuwJPmRDtloh8
	fFskb8VEp+94Reg/0YYASt9F9jtITm5e0YLbr1UwW8L/ECjzpevCnLfdJl6V
X-Gm-Gg: ASbGncv0SMN62BrWYfKYAzzO+IXU5hhgI4lETs4lW5WVmmGgBTm+z5PJXXyUD6vePaf
	xa8kZTPzrhLarEENSJLFQMMM+ljmk99DNtbgjCZBVmCBL4aegM2PRGevhfdc2PQM740DUuFBIVh
	LqRKtv7i9V/5qxNB3PsqD2U/onk5MxPHt+vDWZlfNU2EL5/exdyhgKYvArLO90Qw9rmtgmbdcVo
	SH/m1yoa+GV8MtQXiF0kwjgu6JwbAseJUT6f0ZauKNgg6Zw+ZDdp5o3QcHhRQ==
X-Google-Smtp-Source: AGHT+IGcZ/eXHZZprBGPqA6wCsk3LShy21GEt+Ojmd21JLtYOCZyvRcvCqbnL+v/Y8N8VwkHv+a1Eg==
X-Received: by 2002:a17:90b:2e03:b0:2ee:e518:c1d4 with SMTP id 98e67ed59e1d1-2f548f1a2cemr15584055a91.1.1736908417140;
        Tue, 14 Jan 2025 18:33:37 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f256fd8sm72902215ad.242.2025.01.14.18.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 18:33:36 -0800 (PST)
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
Subject: [PATCH v2] arm64: dts: rockchip: Enable HDMI on armsom-sige7
Date: Wed, 15 Jan 2025 10:33:21 +0800
Message-ID: <20250115023327.2881820-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_183338_693202_8584739C 
X-CRM114-Status: GOOD (  11.82  )
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

Add the necessary DT changes to enable HDMI on ArmSoM Sige7.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

Changes in v2:
- Only send patch for armsom sige7, and I will send patch for armsom w3
  when hdmi1 support is landed.
- Change HDMI0 to HDMI in commit msg because the board only has one hdmi
  port.
https://lore.kernel.org/all/20241111165026.60805-1-liujianfeng1994@gmail.com/

 .../boot/dts/rockchip/rk3588-armsom-sige7.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
index 08f09053a06..b3e9ffe5234 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dts
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3588.dtsi"
 
 / {
@@ -33,6 +34,17 @@ analog-sound {
 			  "Headphone", "Headphones";
 	};
 
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -164,6 +176,26 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -723,3 +755,18 @@ &usb_host1_xhci {
 	dr_mode = "host";
 	status = "okay";
 };
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};
-- 
2.43.0


