Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB71DCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WalOz8RKKxxgzpgOrvxEvhq9BVJ+Sxe5eWkisRQONQU=; b=p8QFP9LuNIdQdvFD8g57Rvy4H1
	0bmx+r/zg6eQ8Ot0b0UG5HgeS62YRxaCsQq38TV6pOcwlTQgH4WmECgkiCSdRJUcFwOlf0Mof46lq
	LJPR31lGpt4i6BuNoxJbvsUf+Pa7NZLL06Cwr2NdcIUTMTMkapdjW7BaXDVwhv37x+HCFbunYRTuh
	UoPe2D/MhQL22cQ5/EC5yFXt1suZ/UfGWba7te8pEkcrDf2qz8z6N0Gv9K3BeMiZ4bKa3WmFhrudN
	gow9mQYg/NyGP4qErRVKbB0oXqkTOS2d75rURCnM9sTYtSomLerJX65rSioHuI5iSD+8HrIupqCux
	ZlWNEcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1G7-00000006FEs-17Sq;
	Fri, 29 Aug 2025 15:43:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxR9-00000005VOp-2zaC;
	Fri, 29 Aug 2025 11:38:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3c854b6459fso1520288f8f.3;
        Fri, 29 Aug 2025 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756467510; x=1757072310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WalOz8RKKxxgzpgOrvxEvhq9BVJ+Sxe5eWkisRQONQU=;
        b=nWgh6M0J+Q7zcBocIlAsvyCfuR3m4Ze1fhEdoGyrGU3XiI7LHQLvx0vI42J3GpBYx2
         KrEz6DV15LQZPkQjXKZNDoOxlQ+aefueITd72G5oziF9XtLDDjepMXFqkMQeJytklPRO
         a5H6z3pbFrdTUALsE8+Zm0RRNI7A8ByiEVd7kGqUhla0wKE7DgFG6RSNzxxsNUzsUrR5
         vxRbSM0U3x6keHundOsjLasBemFU22NGsda3u+TM54l7rh/kWWSxONAefNXzsO47OKva
         AhbtVs099vVmObwXcDoWEnKleLtk14uUMiCOIJvp0WSBJsn7Nue5YiYkcudt7v6BKAGq
         Ep8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756467510; x=1757072310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WalOz8RKKxxgzpgOrvxEvhq9BVJ+Sxe5eWkisRQONQU=;
        b=dUj3yxr6pAVsSvjkL18Jqywa04iC9W0e+2EVplKZOrfeW5pH13Oy391YRbVbrWd+yP
         2pcLtqGVuZkQx1CZ5d1LAcEFasix9mLxy0pP561wPe51iKKI0U8Hph/iYuWZyG+vIY8o
         JGQKaKSzmWseyXfipMsz5GOWISAJUYmzCsq+z1ESQPskRuhqyA4B2l/mrkvGvyIM95lt
         YJIZEdYTGphlOrKLoLapv/UOdgWRssG5H0x/9g5q60Ii4D654u8oEzps3nRcZvJ9i+jZ
         qoV/60Pz3byvX4hOhRPYbXcd23+Erm7n0Gz2IIw9PLesGMQJLYIhKKgCCd3HMtODWaEi
         u74Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMJHG6Om8aHjpVQsxRWlubAcQq6Vp2R2GXi3xLe/x6DE0SsuTuwvMSroSEPlvVNRL0rjUDcaOQBxmepk6WDQ4=@lists.infradead.org, AJvYcCXgMt/YcWPyeY13HTzMif/86dY0LR3ClRVZHl99CSzOpC3CFeH7y/x0wCDyMJrks+IdbIJ/UqIqkCsEBNttSV21@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq2IsxEGddJ90A9LrPgGsKxRDzPGp2aLLWQA5hhSJRLW3vGhtY
	kd9bL1BO6YQ1qlFfJ1kfm8vqt0Z1DRgGiFW6Pn3elgnowjGwosn/YZPz
X-Gm-Gg: ASbGncsL5zWajwy3i1uRVYBzJKsDHJsrlnERbQk0Q8Y5Cd4XRkoDTySjhWT/pBWyTy5
	o7B/PiS1XMXUscOtq/3BcxE7W4C37fJrg7PmVm5N0LhNJJJEuR485Ik/LhLpZJjvKZE9uJHIsek
	Mhm0giUVzxCsRUTKzDn+NVCcIQo9QQn8HDftMbSsw6ZuhFYw+o1MjVOjYo+P9LflmclVjxXdIma
	VriR+wmExincqatlyKuDuUCfzucRbAfMZ7RZjBybsl2ioU/jLaVV+dRg7UthcuM1rKLQoCGHlPU
	RJp2YoLHKHSOrY1jm0k2TKeTEyEmcgIROghIAsIDB69blgsVV8H6UnwXwJV77DYiBii+Ugt2Sp4
	d4PqeKp3FqSWmBusQQSXMedaF5sQEfQHmxkceiJQryUHvCsyDZgDX4jRnl9fPEK+n6j+7Pp28Nj
	gg0jhsK3WcP6OMqyQNBbD9MyJ26I12YwNOHR/c0IeCNu1tUR9L0YAlIDqWXhwoKIg=
X-Google-Smtp-Source: AGHT+IFz5++0a2Ytw2U05mb8xEeZQEb3Km/PeFew6jY1NCh0K74stclFlzmeU6Bnti9FVxL5VY+dlQ==
X-Received: by 2002:a05:6000:4184:b0:3cc:19d3:8d78 with SMTP id ffacd0b85a97d-3cc19d39431mr7708668f8f.7.1756467509533;
        Fri, 29 Aug 2025 04:38:29 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3d0c344f6e3sm1874327f8f.35.2025.08.29.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:38:28 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Ondrej Jirman <megi@xff.cz>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro
Date: Fri, 29 Aug 2025 12:38:24 +0100
Message-ID: <20250829113826.2029755-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_043831_752258_704FB7E8 
X-CRM114-Status: GOOD (  10.56  )
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

Update the wake-up pin and associated interupt details for the
Pinephone Pro WiFi module. Details obtained from the published
PinephonePro-Schematic-V1.0-20211127.pdf page 19.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
v2:
- Update commit
- Drop alias

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 6f97e57f36f55..24e4365a2e588 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -689,6 +689,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
 		};
 	};
 
+	wifi {
+		wifi_host_wake_l: wifi-host-wake-l {
+			rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -715,7 +721,19 @@ &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
 	sd-uhs-sdr104;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_l>;
+	};
 };
 
 &pwm0 {
-- 
2.51.0


