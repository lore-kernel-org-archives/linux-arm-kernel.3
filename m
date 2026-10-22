Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZU/N3gA/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=O/STfAkw;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jdA5dC7i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=; b=ZU/N3gA/eZrvhO
	MRcGW6NRKbwfu06C/5aolxwHbxQomKvjUhvJh8vFbu9yjgAjlgodTb3IwUZuPGC2EgQa8i9274Iwp
	T3RE1gbD+UGMf/o7D+3BaaMhvDp14wPy7vB0eP1O2+cjg8W9zKElpP0XieUDsRzfZg3cY4ijh+oPz
	iTguBtvZHX+jEC7Q0ik/M7x1QMfazZyrfyW0m2HhMkLmeY27DkDfcO6o9iuPxjpCC8mEEpdPf7idp
	3emr459Uly6FPxYvmM8kRJscF/NIWwN4J6JD93cIeI8OuKGHj6rSKaA8JHACQpSmUGsK6Rn0fBO8e
	QES+Abc4Onv+1Jla2wHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4h-0000000ELGo-3ydj;
	Thu, 22 Oct 2026 14:47:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4e-0000000ELFh-2vsF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 14:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=; b=O/STfAkw44bxSOjnu4VW43I0DB
	ceRPOza4KbUF8NiFD2lkGJW265H0qXO8Af30HK7q8QR/IEQD44+h09NWOI+QlWeJNgNozCI/Ikiq5
	LESJgF3dG3MxaJR5dT5+nywjNuDmLikQ4Sd7wjn0sPwFVJVdCuVLBcDJ5JM6jmJWoAURzXp2Wz8IV
	dMZ6EzTN/uswjCQG0VvXLmZQ6DzFSjKkJvJkNjXsNym+PvOVG0V9chdUVsu4xMom5pB+2LXOPjj4d
	LqPRuve0yeRTbSsgjo8PjINCXXxVt2mJtWpAEX5lCVqUF+r1FvTYkX+yiQBeAPez+i3CdEklrqYU/
	dUJJAzrA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4D-00000007Kpa-2I2E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:47:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1383068f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680412; x=1793285212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=jdA5dC7ifY52zQV5vhQAtb6QXQYrd6ZVYKA+aArmE+Uq5kq0vlhg9hi7jfkwQoeGsL
         mfygzaJM9/XYpB3LSGMoougXKr5t8UxYu0E8UZ6lIpwGdzF6RLVsBHoIqTb16PUKq8Sb
         726Q99wZeGBWenqVuZnPtHppmyGpbAzynYfO5UkeFTt7NoasTjaUlvEOVRWBwzwosDzA
         0dP7KbtVxw++H42qkp9LQ22KrRxssKregV31mFWaITOXV24QbiMhWVvnlaoMjsY63IHj
         zxkE1MGWr7zY39YZ5H1TSw4BDispED3k7wxK6Anx4E8QvEnW2lERSaKhylzCGXc1wzSQ
         kSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680412; x=1793285212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=NTSP1rPZxIkGw73T7OUxJAADTXOVX3U9NhFXf+QFKCusxCvC286wXPZy0SCWC9dLvA
         GDBoNMBuNLGByGBDrWkmdG35S33Dbo/dissHMX0eRA+SO1McLUHWGi8BtqCIyNP7fwyb
         1cze4fn3vTQxOAtGSlil7vNPhwSPWN/t9eT4jCMf6YNeTNO+ilmZb+Rno7QYV+z9PpBR
         8rn7+WgQ0D1izU6K8s/qdMD5+FjxSQbZRA6WF+aT8XeeGlLz9DreMMgtvxKC+iCXSwjr
         XQ0mVxRNJTTurTICB9TYOBUraFOq1RHmDrkije5qCn25syCPnlXXor1jafZUEDJiR1xR
         jwhg==
X-Forwarded-Encrypted: i=1; AKwUvBzHMqtndJnRkmxlBwPfVJsw/abzSNAnck++piUTDxYS5X1w6/MR2l1MZZnv+ApDhozxa5x6Dh6ZfvSOc9+0w8qe@lists.infradead.org
X-Gm-Message-State: AFq9FYIvwuUA6l6oHNnYMFfiqGnbtcmUUTlmOspFAcDp50me3p//pHLb
	GnhKggBHos+FWJud2gKlP1A9IgYsE/d0KTKolWjWkoOwjRVmDymvwmBeca0t8709
X-Gm-Gg: AYBFou2COELdQngvyQDONKZZipRADUr93GkXRKMG+XMkx3SMk0U7ObUzs9HbGILaBOY
	yvZ/y4uFh2UIqzTx7RisQasGbGUKjEVm79VtJL+Tj8WyFauRJM+Uk3+XWR9AkqIPKa0JgNra0F2
	PmVvx0e9Pry+fWSpsYsZm3Cazi60XibpgjQ0zU1cSLA+SmxBwb08P6F7hIrohwyJ7T2aDN1Bifw
	QKgmlNQqQlV3F64ggW5Y1ukblR7kL5T9kdvAGmsofBzM67bs//LdO61u+BWVH2HrMnJSeRFnAw6
	9tWCcXNXi8OTu4m8SFQ/Rn2Sb+nZfzouFLM2pECywsGIESetFhhS7XGR8i0hqGwqF+3EwV69sQ0
	vP6271tROHOOPx/VKfgBKQYiTmgoUXATcjD9YC4OFRpGKn7XlhCgWGDTBcr0s+u8SN5YTBuEKZZ
	cT0fMXChzKD1T/7DI8MxnPHxY3Xnw1pOpzyNy5flDSO6ZXTit3wMQ9QPYRGtO9e8upvlbkkVxyl
	bkLOS5A6XgGT+4Mvhn1oBcYFNUKPvmITNlo59fjmzQ65TvzKUkNRMIQUlas1W3ZI25q5uQkIvyA
	+g+qqi9yzwnnVxmSnSAnLsuRPN9KvnmDuF9Q84UnMk9YQ01wIhzxXHBB
X-Received: by 2002:a05:6000:4b0a:b0:48e:1080:3a92 with SMTP id ffacd0b85a97d-48e264c9785mr11826653f8f.32.1792680411774;
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:45 +0200
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-2-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_154654_371759_20E3633B 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The SMARC Development Board exposes two 24-pin camera connectors with
reset and power-control signals routed through the SoM GPIO expander.

Describe the connectors as GPIO nexuses and add stable labels for the
camera buses and CSI receivers, so accessory overlays can use the
carrier's interfaces without embedding its GPIO routing.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 +++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index c28d63293149..e0096388fbfe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -13,6 +13,32 @@ / {
 		     "toradex,smarc-imx8mp",
 		     "fsl,imx8mp";
 
+	smarc_csi0: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_0_CON_RST     (pin 11) - SMARC GPIO2 (P110)
+		 * CAM_0_CON_PWRCTRL (pin 24) - SMARC GPIO0 (P108)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 2 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
+	smarc_csi1: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST     (pin 11) - SMARC GPIO3 (P111)
+		 * CAM_1_CON_PWRCTRL (pin 24) - SMARC GPIO1 (P109)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "J64";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..e8e718ef7822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -587,7 +587,7 @@ &i2c2 {
 };
 
 /* SMARC I2C_CAM0 */
-&i2c3 {
+smarc_csi0_i2c: &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
@@ -616,7 +616,7 @@ eeprom@50 {
 };
 
 /* SMARC I2C_CAM1 */
-&i2c5 {
+smarc_csi1_i2c: &i2c5 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c5>;
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
@@ -655,6 +655,12 @@ fec_phy: ethernet-phy@2 {
 	};
 };
 
+/* SMARC CSI1 */
+smarc_csi1_rx: &mipi_csi_0 {};
+
+/* SMARC CSI0 */
+smarc_csi0_rx: &mipi_csi_1 {};
+
 /* SMARC PCIE_A */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0


