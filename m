Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC7BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cipA0zbozY6QT98Voya9/YK5DDhe2fsqlIMhAxSJu8=; b=31RyQxmPG2F/y0gpFzmKsAmmYW
	mab1A3TPuJsUFQ5G+rHCySPHSTTigOSjCQMqiyarFu1HWR1ciB0otd+d9DrW2bp4wjGNtDoL2TykR
	Mxa3wzLRYL2ZnukQnHTQKymV2oZ9KbNmw8ZJJ7Ss7z1IGVC+ZrSQV/sqHLvTfwOFn6oAhopaA46DC
	ZWRW5LmyT7gRkJiPOGWgltZ2tKp7/xQ3iehxLdMWGAqJbLG1GhIf+bOCZms+uKetYRjEvm0HLuePU
	I9LZ8pIalxEKMWD0lMo755noTfIVCaTB0HH065x7QrZNG04S6lbt2EKC+JztVejsc6MRYZ5YMucSy
	2MjjiJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLYC-000000095ZN-4A7l;
	Wed, 12 Feb 2025 22:49:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSa-000000094ev-2Qy5;
	Wed, 12 Feb 2025 22:44:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so477593a12.0;
        Wed, 12 Feb 2025 14:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400239; x=1740005039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cipA0zbozY6QT98Voya9/YK5DDhe2fsqlIMhAxSJu8=;
        b=O1hNbYYQ3d3ohfFge6mq6/ThJuCiKBkSrikafAemm1gy0eH4OQTOXZWbh41qnLc6cV
         H6H2V+b934wGkZF9dawsLcwdD+uSzZjmOO0D22X5UPL2UX/N6EBJlwRzVBz/scPeuRx0
         w3b7fzPV7idjgPfe4//3BJMicHVGED6yeQnkr/aPJVF8HNG8+VCRDq7KQZlabiaDa6I5
         W9HOoRiAYL8x0f7xpQWEkgVPEvB4KFgEnTfd9hddkQ7iKHf6KeCJ9nw6gt11FIpmQFal
         T+RYJC/W+18pI1uFQlfr1LTEU0Jw8I824hQa9TDYumTNLJ7eoy5C8PjhPRtdxxIwsvUX
         5tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400239; x=1740005039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cipA0zbozY6QT98Voya9/YK5DDhe2fsqlIMhAxSJu8=;
        b=Mb7TYiOw4Nf+0SmeYID7QiJYB23bsA/EVysHF4KjgGPJ9lm+Pg2q+GCyjBeMb3er4C
         av0pSOAkX8+TxuBRM5ZQh6kd9p+VfUC9ykPJpndKNyxFl5iI1qPX285lwf+kbqNZuzXt
         qoP7CuUm2dTpQaG5CwfHG60P+fNVfOe6ZG+cd/hYWb5UZ61/Qb2BcYPDIbXxLpICPafr
         K2zhBwuFvxS1JQ049GA0Dy1D7k3YThahN2HdUM0Wkro0GlLV/CSorXBcLv5ebR8UlW5T
         +QKgjS6oEaNNZ/CGJJxjX4o/5smioR/f6oZDAwy8765s9zqoDI+zalcdGKd7bd/yybfV
         mJig==
X-Forwarded-Encrypted: i=1; AJvYcCUpzeXZaBbVS4vSSvT3RWdK5BpcsD91KZ6DXCf7XPe3TyAAsoRIjuQGV8GNSnVLZXvTwR2WxOPzlaLroVg=@lists.infradead.org, AJvYcCV7lW5Df8BDv1u7eDPChQIcsg27GT12YXEpTUqpR/3WhVIFUbjUckDnmmbGvBJiVz2rXgfWRqTnC5tMN0fhlZ/r@lists.infradead.org
X-Gm-Message-State: AOJu0YwndNmKwCp2zCYatTnKCfJg4XnvrfocqRrF6XMcQ5F0Z8LyyVWY
	YgpUI5X5S+ZVJ1wb8o0bmKhvRMiIpHGB/sUjmNgagf8jNrHIIIJ0
X-Gm-Gg: ASbGncuTRbnxUCGUV5/HjtbEW3ynkxJCfRFPtTAL8dxq7RScz481bBm+OFiFrXPTTLI
	SWCUrlYHS6lu4Nd0xRkf3HT7Bo/pg581Mlyvaj9fAuAIfvbOwD7QjSRA8gLwaHAMURXfhQCkpLY
	ashR7n63KDo42UjScyDHRc01gYXSY/dm14kdem4eDYGQm0V3m2jgwrUb4SMkDP8LK0iExA82R4P
	NFO3t7pr2KHYFAbRNPcm6uXCfGjgIXQytf/ueV/Jp0P0+TfsrgnraoDA9wtI5sws6AQETBdpggV
	Srl0vOgTkQmJM/ZpbOFCcwUY3Xs8
X-Google-Smtp-Source: AGHT+IFwthENllbmOrWic3eDqrN776nf1GeDspbhA+7bZKq2ojkemmpLX+XbKy5VdLrDB8EdIzbctw==
X-Received: by 2002:a05:6402:3806:b0:5dc:eb2:570d with SMTP id 4fb4d7f45d1cf-5decba35546mr666739a12.2.1739400238531;
        Wed, 12 Feb 2025 14:43:58 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:58 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 4/7] arm64: dts: sophgo: Add Duo Module 01
Date: Wed, 12 Feb 2025 23:43:36 +0100
Message-ID: <20250212224347.1767819-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144400_627743_3743F155 
X-CRM114-Status: GOOD (  12.40  )
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

The Duo Module 01 is a compact module with integrated SG2000,
WI-FI6/BTDM5.4, and eMMC.
Add only support for UART and SDHCI.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dtsi not to use underscores;
- added status = "okay" instead of deleting it;

 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
new file mode 100644
index 000000000000..bb52cdad990a
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01";
+	compatible = "milkv,duo-module-01", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+/* Wi-Fi */
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+};
-- 
2.48.1


