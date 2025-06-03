Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C99C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+Y2+/5bQj+UyWYgF6XPRVH1n6sz9KuKz5tspqNX/HA=; b=dCNEc9PomrYBfD/Q6keiwnd8EP
	9CkN/koW7jS/E6xwuBd78JPVNDXWpGZ4WtUjmuwneY5XUauCC6uyetNTH5OWEJ3p0ms4R3J8IKedc
	LcYp7rm+q/e86v2W1eCPMjTAGUgFBHBUcdjgNxqN5xJ0KXUvtBQdPlRg8nBPuPmQI+flfYa9+byir
	bJwaqrSyEVm9iWQeXuR0WGHBmgtJ2mag8BAzXq0zdoThxuQ3RL3lb284DiLUgMWa3XtGoADXdoYmp
	0AKRvz5kytnu443m5oQ0R0o0nZOfqswz5D74NgHymb39zU+tZWqnMCTvG+2VMrdvi3mr6uQ6HYxD5
	+flBtBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV7P-0000000BRsi-12Mg;
	Tue, 03 Jun 2025 17:08:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMV0x-0000000BR1c-46n4;
	Tue, 03 Jun 2025 17:01:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a5058d46ceso1624954f8f.0;
        Tue, 03 Jun 2025 10:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970086; x=1749574886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+Y2+/5bQj+UyWYgF6XPRVH1n6sz9KuKz5tspqNX/HA=;
        b=Er1hZ3908fnQpnQxy159wQyRZa2frce9NpnYRWNfQL1Yf4uPO9oPewzjqPlUIIZndK
         NNZq+SadafB6DJN7zihJBOfw2HBXuPHAc9SHXJNYqwQFIlj8dtE6QYpI86OTKFmzdMXC
         Ya4EZ2dOQB/lkvlz1MFVk6UqN1ryjrzJJBHIyw1GZM9rOACaq/rsJsP7Tv16EMG3kxPw
         5mr+evnpThYvXEtJnTVzhGDgMTC7Rfbmcr+yzfa6hs2bN90sSK2W83apnswKse7BDg2F
         6PJAe1GSh/CRtH3YU4IgQ22AGSr5PZS7wb5RkU04VKXcsyGsY78hTHqC7leDvhL/LDOc
         x6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970086; x=1749574886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Y2+/5bQj+UyWYgF6XPRVH1n6sz9KuKz5tspqNX/HA=;
        b=F0IMa8LWC3zhdzOfJaHxDQtdlurhPaHn4uLD2pMdt5DaPynDe947ytT4ULPLaB2/u9
         ER9ktecdlnMWzocehMG4dQq8PMdMfevsRre978ijyqBVF2/Hlt7J+rNBgyfx5S85UkBJ
         2cfxn7RIgJl9b8h9oXfhDg3k6qpOD0SJKNm03aqPc96syZDEzF0o7W+CNIW4mGTiERYE
         IKciSgcFTxCYxzmijuEgHylMI3urEz5bdnhO9QYZZwbhgzjd5fuJ3iyDdm9UAq4RL1vF
         mV4CeoQvTt11O2YDOkI5N7KpwqQ4uTHEIKC0VQOk14SR112srIGu24bEaml0Bjjo0ID5
         7GAA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgGImgBO9YL/Sygwz4htzIA9xWZOJrKQYJec/8j5gvZXYPxgRoxzlc3W3ssX8JAyru9XovB720m36KQ7fXI1u@lists.infradead.org, AJvYcCX+oIzXvFfLNHnhngZlbL76pLMMF4dy0xhQPKIhBPGOw2XWaIkL8aa90Lm317MKbA6E28hsR4z98CdKo07sctg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpxnbZb+XISEfig3+vXFPhNMVCDm+8gD6LogWaFllpoJnYwmmP
	2lJgdpSvDtPZmOU0cVeIR2LgKe3rJxPatVnQG3E/E/MdtfoXejrHTkmK
X-Gm-Gg: ASbGncs/Q4OhE7SHCmUdML1JoS3zZMeUlq+3PUf7KSa0SOriMh+VvtGs3Znib5gr41n
	41/IGklVo5M/BYvNx+QkC572nFekYwYnkQ+bxOU6t71yqdPNqo6JqjlirkniKpL/bd2aVtbywpx
	5llS2jIknp01CBdp1M6t0kplNgnJJt9apvkbDu44lhjtS7oqjdU5jt32r/1JG1KJ52lYUc7DyNl
	zOCjUtj4EbTD380/XvmrPm9XfENUJndeDdxZ9Cb/gPZFAn/CxByhzeK7OJZ3HTrZX1QaLCGY7nf
	F5ERD2TmtnFgHlB71ZjwDIT/aNdrV3aUsLQdOSMZsYm45t1LzWxQAKOEL5GAKHvVDbL4Fms5fgn
	qBxMe/6VMjswzrTmNOfwJMjKjGg==
X-Google-Smtp-Source: AGHT+IEd7niGDk209e3NNIRllNpceyj2oXoBqCcB0+aBdqpp3KWCFcGQ39RE+qgrAghnytpTslgwAw==
X-Received: by 2002:a05:6000:178e:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3a4f89dee77mr14367562f8f.36.1748970085470;
        Tue, 03 Jun 2025 10:01:25 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:25 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:14 +0400
Subject: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM
 Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-2-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=2102;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=/jxBFaE9CUNBmVgOuhhenfDlDH8KFQDwg+N7a0wwgYU=;
 b=+XtNr+B1DUYIB9wG66JOoiJYYOzk9WZbXMt5Xzp3KR2kUPEVA7/v7pGuOJEbTcwg2ZHehAxRZ
 EGLg8ZQX4V2CoMknzSdSaUy3I7XFmFOzUvZWC1+iv5j3F0QJWZs0wLl
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_100128_023824_70024168 
X-CRM114-Status: GOOD (  10.80  )
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

Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
Sige5 board.

Both ports use just one xHCI controller, with the USB 2.0 signals fed
off the same USB OTG PHY through an onboard hub. VBUS of both ports is
controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
toggled by GPIO4 RK_PA6).

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index d9c129be55a0d997e04e6d677cdc98fb50353418..7ce1fb1380b0863c902fdd9cbc7454ee6011cf92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -205,6 +205,24 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v0_sys>;
 	};
+
+	vcc_5v0_host: regulator-vcc-5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_5v0_device>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_pwren>;
+	};
+};
+
+&combphy1_psu {
+	status = "okay";
 };
 
 &cpu_b0 {
@@ -757,6 +775,12 @@ pcie_reset: pcie-reset {
 			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sai1 {
@@ -798,11 +822,25 @@ &sdmmc {
 	status = "okay";
 };
 
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc_5v0_host>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
 
+&usb_drd1_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };

-- 
2.49.0


