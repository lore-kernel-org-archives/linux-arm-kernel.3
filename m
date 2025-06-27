Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B499C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgOdRzeLiUyb+th+vZ8OE4pKfRDS2CiYAzgM2DeadJs=; b=amKvSCJ2IDmluIGYFVk0blXvSF
	Wl+F0hY8OkY60aLo223U3yAhDmBUi8GjCRXzrNiECag1W2UD77g1rmF2Qi3Y/9Q43gm5WcLt1Y0cw
	abxOGMN26AfNr6WrX6Xaq9RmTIQblg2yOMrSbXCRs5L82WubNSU12/gPBwKkZFNG9xlV3R7T734bX
	WQpdomVwxvzXIGDc00dX1vNAsqvyHh9yCWzMALbmQJJcgd5CMm9SimY6Q10P03mKdYC4iQoFLdQMV
	sbQ0PipmLZ/kJm6ZiRTr2z/ebpmPYmcXjjZSJbnEY+4BYjxxD1hFDW5bQiJAkxW1t3MSl74q2M21B
	qcZpEjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9UD-0000000EpT6-2kDO;
	Fri, 27 Jun 2025 13:51:25 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8xd-0000000EkdE-1ela;
	Fri, 27 Jun 2025 13:17:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so4614933a12.2;
        Fri, 27 Jun 2025 06:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751030263; x=1751635063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgOdRzeLiUyb+th+vZ8OE4pKfRDS2CiYAzgM2DeadJs=;
        b=Vy6ZNeCHEkoKB1/q4/tERY3Ec2K5XFhcfz2s0o2VSKg4YxLwNM+wQ7/4t2a+IHTX91
         9Nq1j5SBsv59M0+CIyi/ncRObTH8wW/TjEjBApoFf29PQ33rDXjcorywu46IGs2DWf4M
         dL2HL68XNpApBZDgNc/gDGrYUkumKFBmhnJypTZy/zFTsfvFRQZSCkYOanc7txwzEIb7
         /o7iL1KtGODmzmKK1pAaYsT6OanuvS8/7Wg4J0T3c+hylAUrStdAqKUXTLctQCOuInyV
         TEj2vzoVb642ZTXrhR5aDqNrRbsymcf6Rt+ncrmOAa/Q4/W3Xx0JfhEjP23gmXRnhNda
         La4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030263; x=1751635063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgOdRzeLiUyb+th+vZ8OE4pKfRDS2CiYAzgM2DeadJs=;
        b=UiVzS2DH+LJya8CckDndlscnswvmKA9gAYWbMsCvAx0I90NY6OxN30dZ9IirhCwfG9
         RDezBC5kbOdNGkLaDF5UahMMrPKfjWXyScYemlFBZKAlmAJuj+V6MpASLrI/QjjZiUyW
         du1QjOgHeTrGHYfSNgV4p9uRa/SmzcojqRpvvlkGD70rHc1DXV/oaxMPfJg8wm98DSH6
         vb1gbpqA191TeDvneqFZRvuzZOrJQFzBwG/oGBA7RU+whQdDBTvWE+/TNWRUNjLTzt3D
         voFPUQNSaFJvoNo3+OdAFnDD2FoRXqHRosB7s2c23mZCo1owxByjSiiCljXg+RRP21jO
         EQDw==
X-Forwarded-Encrypted: i=1; AJvYcCVfbJ93H7I7o5C02Z/VTWjs9GXi7WafahvSIyulPjEGIxWTHnVJ5ieV9xYcw84CxAxWClIM1/fI/swVuFOTyi3f@lists.infradead.org, AJvYcCXUdUol48yzhiMD112CoT3FWH5InC7Z/kDWnvj0X1HwdNYYIhx/tGyC404SCYDh54AAbH/IPSZ7/ouSn8aa9N8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpr73PbIDb4xF+cUSMRjXQXaBXzIWD7J5ewh+ienHGq5XrCcyi
	KSl6NpuEGrXf+p1/ZrOVjaHocTGCV8cMKTjQXaXMIwZrhbDI8obJ0jD6
X-Gm-Gg: ASbGncufNycBh8mYh5QZnm6C32j91n9YiqrmjtfDQ+ntFfVqq+Z6TaxG1aRTNFLpmY6
	qcIkoed5wOPgH5oxJoO2Njg/YcMZHctx8REutSyFNMZs2hCM4PYXIkDyMDqBUY5TQw8hSuGnL5v
	uD4y6EKA+N7iQfBTNrK3R9hk8IWX/HASfEtr7cFL2hwD0HFoJSE2c7LJ7B/aAZ+8Uj+nzRiSVGb
	wy5kCsev6aB+EbMvtHaHAiqYw5fZfZZjBvQ7Wmd6OvMP/zzlS75k6fyVCuwoXnGyBqWcs9sBF5h
	tXFJVpCicvHiHZclDOL3UvNMn/abd0vinjLS1iPsYO2qSvMnEzetr49zrULvIF7v97Gk2c5GROh
	xHg7KykXemFD3rYqPgFMJymGkoxtjvrb3b0kkQPly
X-Google-Smtp-Source: AGHT+IFeDwRVWmFdmXrateAqMmllYMK2zntwA1WZ2gBdjY3aP4MNxSK4Z7UA17+I+Adl/DbaSrC1jg==
X-Received: by 2002:a05:6402:84e:b0:60c:79de:1c59 with SMTP id 4fb4d7f45d1cf-60c88b3e392mr2714318a12.7.1751030263064;
        Fri, 27 Jun 2025 06:17:43 -0700 (PDT)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c83205eb0sm1471143a12.72.2025.06.27.06.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:17:42 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: use cs-gpios for spi1 on ringneck
Date: Fri, 27 Jun 2025 15:17:12 +0200
Message-Id: <20250627131715.1074308-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_061745_435355_A241AF59 
X-CRM114-Status: GOOD (  15.48  )
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

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Hardware CS has a very slow rise time of about 6us,
causing transmission errors when CS does not reach
high between transaction.

It looks like it's not driven actively when transitioning
from low to high but switched to input, so only the CPU
pull-up pulls it high, slowly. Transitions from high to low
are fast. On the oscilloscope, CS looks like an irregular sawtooth
pattern like this:
                         _____
              ^         /     |
      ^      /|        /      |
     /|     / |       /       |
    / |    /  |      /        |
___/  |___/   |_____/         |___

With cs-gpios we have a CS rise time of about 20ns, as it should be,
and CS looks rectangular.

This fixes the data errors when running a flashcp loop against a
m25p40 spi flash.

With the Rockchip 6.1 kernel we see the same slow rise time, but
for some reason CS is always high for long enough to reach a solid
high.

The RK3399 and RK3588 SoCs use the same SPI driver, so we also
checked our "Puma" (RK3399) and "Tiger" (RK3588) boards.
They do not have this problem. Hardware CS rise time is good.

Fixes: c484cf93f61b ("arm64: dts: rockchip: add PX30-µQ7 (Ringneck) SoM with Haikou baseboard")
Cc: stable@vger.kernel.org
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
v2:
* Rename spi1_csn0_gpio -> spi1_csn0_gpio_pin to make CHECK_DTBS=y happy
* Add pinctrl-names = "default";

v1: https://lore.kernel.org/all/20250620113549.2900285-1-jakob.unterwurzacher@cherry.de/

 .../boot/dts/rockchip/px30-ringneck.dtsi      | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index ab232e5c7ad6..4203b335a263 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -379,6 +379,18 @@ pmic_int: pmic-int {
 				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 	};
+
+	spi1 {
+		spi1_csn0_gpio_pin: spi1-csn0-gpio-pin {
+			rockchip,pins =
+				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up_4ma>;
+		};
+
+		spi1_csn1_gpio_pin: spi1-csn1-gpio-pin {
+			rockchip,pins =
+				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up_4ma>;
+		};
+	};
 };
 
 &pmu_io_domains {
@@ -396,6 +408,17 @@ &sdmmc {
 	vqmmc-supply = <&vccio_sd>;
 };
 
+&spi1 {
+	/*
+	 * Hardware CS has a very slow rise time of about 6us,
+	 * causing transmission errors.
+	 * With cs-gpios we have a rise time of about 20ns.
+	 */
+	cs-gpios = <&gpio3 RK_PB1 GPIO_ACTIVE_LOW>, <&gpio3 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_clk &spi1_csn0_gpio_pin &spi1_csn1_gpio_pin &spi1_miso &spi1_mosi>;
+};
+
 &tsadc {
 	status = "okay";
 };
-- 
2.39.5


