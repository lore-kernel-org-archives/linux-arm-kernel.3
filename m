Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B98C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Qtk8Mk+yAsi8PZKvvAnkX80B7hGezKFi6PNqm4vw3o=; b=XgHfn6xF/z9IUnZDWPqqR90m97
	4GYTiVGtuIZ4++mBZPLZtOq+ydMbLI8ZmEnTNQFmJOzY8GxJUlTjjUI/BbdYH+PhONAwvGWJMHlfT
	WFFW/l+SN7+qtl9SKJGJmuitSmNwcny7rTiZg/8Fmk4YJqfRtb8LnS9bet4bUr9N0sA8RrYdbkwkx
	Iwo1JK45+q55RMW0MEaxSzgkC09XvBH4Yj2QCl4jQKwuVF+61gxbYR9M+tgBIZImtZNQ4JCGgGZZl
	/KeZ2emNymePF82wG9B5xZHz95oGh11dmDhPj3gj9FbHzP7/VKGQfcgJD/BA5sdA1S6tPBwxsdG5Q
	tLNmu/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mq9-0000000GSmP-2vFi;
	Fri, 18 Apr 2025 14:37:13 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5mmI-0000000GRu4-33DV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 14:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744986793; x=1745591593; i=wahrenst@gmx.net;
	bh=8Qtk8Mk+yAsi8PZKvvAnkX80B7hGezKFi6PNqm4vw3o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OkUchrQkqVGf8/RPv7hgmkVju6B5dS6Ncnpo++cVUMl9cEM196nZYtioWyLEDmtj
	 CyAkqimhAMtIny7addl1i80qoUnfzm3FSU1tRuo3lgpKZr7tLyCSrhcqmypAnexC3
	 ElqQrgMariw0IbwJp0HTBkwPR7xcV5d4/meujj69wTyNESz8yRfM52WS09zR8X4P3
	 cKl/RoDtEdLG5x+NKbuGbVnVaeyke5RV0FsVtH5OT8qHrl8U235UCEpVWrHoOGyzz
	 y128P78ZP/0N9ToiZz22rYl/z7DaqZvpkaeTXMPdT4OabEa22hkcu1fkaPUePkySE
	 UMinDZP2lPiLsD55jA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1uqMzY0bs1-00duv0; Fri, 18
 Apr 2025 16:33:13 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/3] ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd rev)
Date: Fri, 18 Apr 2025 16:33:06 +0200
Message-Id: <20250418143307.59235-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418143307.59235-1-wahrenst@gmx.net>
References: <20250418143307.59235-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y7O0Rfo7jqg1Ebhhoh7HemSlghKyfXuVVnlWJbi/I8o2cIlQF8x
 eGjUg1GT4Bfu9G9LJ6U74tC42PRD221Pwz/WC1IjAwfr4d5XcNS5lCmtWIYA7YwB+Y5LjhG
 vggRQgIvK7Jr0bj0LFDxhBwSVtiNgY+miokf/nmtJBM+ncLbssQIWcDd3hcJZkSFepsi4wP
 iYCowWFZQtUPgTRBPAt2Q==
UI-OutboundReport: notjunk:1;M01:P0:cTbzaFQmCfk=;M67bwDXNpd39b6ZF9GRQ4hgpBIL
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_073315_059228_5D4EDEA5 
X-CRM114-Status: GOOD (  15.56  )
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

The Raspberry Pi 2 (2nd rev) has the BCM2837 SoC instead of the
BCM2836. Except of this the configuration of the board is same
as the predecessor (no WLAN, no BT).

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/boot/dts/broadcom/Makefile           |   2 +
 .../arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts | 130 ++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts

diff --git a/arch/arm/boot/dts/broadcom/Makefile b/arch/arm/boot/dts/broad=
com/Makefile
index d23cf466127b..71062ff9adbe 100644
=2D-- a/arch/arm/boot/dts/broadcom/Makefile
+++ b/arch/arm/boot/dts/broadcom/Makefile
@@ -7,6 +7,7 @@ DTC_FLAGS_bcm2835-rpi-b-plus :=3D -@
 DTC_FLAGS_bcm2835-rpi-a-plus :=3D -@
 DTC_FLAGS_bcm2835-rpi-cm1-io1 :=3D -@
 DTC_FLAGS_bcm2836-rpi-2-b :=3D -@
+DTC_FLAGS_bcm2837-rpi-2-b :=3D -@
 DTC_FLAGS_bcm2837-rpi-3-a-plus :=3D -@
 DTC_FLAGS_bcm2837-rpi-3-b :=3D -@
 DTC_FLAGS_bcm2837-rpi-3-b-plus :=3D -@
@@ -25,6 +26,7 @@ dtb-$(CONFIG_ARCH_BCM2835) +=3D \
 	bcm2835-rpi-a-plus.dtb \
 	bcm2835-rpi-cm1-io1.dtb \
 	bcm2836-rpi-2-b.dtb \
+	bcm2837-rpi-2-b.dtb \
 	bcm2837-rpi-3-a-plus.dtb \
 	bcm2837-rpi-3-b.dtb \
 	bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts b/arch/arm/boo=
t/dts/broadcom/bcm2837-rpi-2-b.dts
new file mode 100644
index 000000000000..1868cee05853
=2D-- /dev/null
+++ b/arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2837.dtsi"
+#include "bcm2836-rpi.dtsi"
+#include "bcm283x-rpi-led-deprecated.dtsi"
+#include "bcm283x-rpi-smsc9514.dtsi"
+#include "bcm283x-rpi-usb-host.dtsi"
+
+/ {
+	compatible =3D "raspberrypi,2-model-b-rev2", "brcm,bcm2837";
+	model =3D "Raspberry Pi 2 Model B rev 1.2";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x40000000>;
+	};
+};
+
+&gpio {
+	/*
+	 * Taken from rpi_SCH_2b_1p2_reduced.pdf and
+	 * the official GPU firmware DT blob.
+	 *
+	 * Legend:
+	 * "FOO" =3D GPIO line named "FOO" on the schematic
+	 * "FOO_N" =3D GPIO line named "FOO" on schematic, active low
+	 */
+	gpio-line-names =3D "ID_SDA",
+			  "ID_SCL",
+			  "GPIO2",
+			  "GPIO3",
+			  "GPIO4",
+			  "GPIO5",
+			  "GPIO6",
+			  "GPIO7",
+			  "GPIO8",
+			  "GPIO9",
+			  "GPIO10",
+			  "GPIO11",
+			  "GPIO12",
+			  "GPIO13",
+			  "GPIO14",
+			  "GPIO15",
+			  "GPIO16",
+			  "GPIO17",
+			  "GPIO18",
+			  "GPIO19",
+			  "GPIO20",
+			  "GPIO21",
+			  "GPIO22",
+			  "GPIO23",
+			  "GPIO24",
+			  "GPIO25",
+			  "GPIO26",
+			  "GPIO27",
+			  "SDA0",
+			  "SCL0",
+			  "", /* GPIO30 */
+			  "LAN_RUN",
+			  "CAM_GPIO1",
+			  "", /* GPIO33 */
+			  "", /* GPIO34 */
+			  "PWR_LOW_N",
+			  "", /* GPIO36 */
+			  "", /* GPIO37 */
+			  "USB_LIMIT",
+			  "", /* GPIO39 */
+			  "PWM0_OUT",
+			  "CAM_GPIO0",
+			  "SMPS_SCL",
+			  "SMPS_SDA",
+			  "ETH_CLK",
+			  "PWM1_OUT",
+			  "HDMI_HPD_N",
+			  "STATUS_LED",
+			  /* Used by SD Card */
+			  "SD_CLK_R",
+			  "SD_CMD_R",
+			  "SD_DATA0_R",
+			  "SD_DATA1_R",
+			  "SD_DATA2_R",
+			  "SD_DATA3_R";
+
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&gpioout &alt0 &i2s_alt0>;
+
+	/* I2S interface */
+	i2s_alt0: i2s_alt0 {
+		brcm,pins =3D <18 19 20 21>;
+		brcm,function =3D <BCM2835_FSEL_ALT0>;
+	};
+};
+
+&hdmi {
+	hpd-gpios =3D <&gpio 46 GPIO_ACTIVE_LOW>;
+	power-domains =3D <&power RPI_POWER_DOMAIN_HDMI>;
+	status =3D "okay";
+};
+
+&led_act {
+	gpios =3D <&gpio 47 GPIO_ACTIVE_HIGH>;
+};
+
+&leds {
+	led-pwr {
+		label =3D "PWR";
+		gpios =3D <&gpio 35 GPIO_ACTIVE_HIGH>;
+		default-state =3D "keep";
+		linux,default-trigger =3D "default-on";
+	};
+};
+
+&pwm {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pwm0_gpio40 &pwm1_gpio45>;
+	status =3D "okay";
+};
+
+&sdhost {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&sdhost_gpio48>;
+	bus-width =3D <4>;
+	status =3D "okay";
+};
+
+&uart0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&uart0_gpio14>;
+	status =3D "okay";
+};
=2D-=20
2.34.1


