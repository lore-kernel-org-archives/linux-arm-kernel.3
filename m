Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C598C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZhOnOs3JzDC/c26qPk+IYrYmiO8/esxJoqOId1pTR8=; b=3SFTyS03Ei2Lm1TNbbrVgprN3k
	AQE8fNXpJ6HYELXSC5MPfwlhBkDv8alj0t3xBSIR04Kxk27gC9ucf+7g7BYXug3OF5un2vMVpjByS
	Ch0BOSACDmv6SVlMCOb3JNAkzQjBDcarl61dp7R9gmBPfX15w54YbaRHf/eQ2K1Npa20dJ/XX0we1
	ZYsWNeZv2a7dtq9Gpo/T3JdRT7bQY/qII0olhpvRlj3RXFzOARZDAjM7ru6OYuD/L7nYm3u0s8qj+
	/I8pNoYXyeFq8rZUqbGsuSlK9ftVYO65w12nZWdIy5L2sYzr1w6wG9usREqbgpEXPjOMPROMRGFv2
	hGTB2PJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thc70-00000001d6K-0XOQ;
	Mon, 10 Feb 2025 22:18:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyj-00000001bMY-13CH;
	Mon, 10 Feb 2025 22:10:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38de1a5f039so1051166f8f.2;
        Mon, 10 Feb 2025 14:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225407; x=1739830207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZhOnOs3JzDC/c26qPk+IYrYmiO8/esxJoqOId1pTR8=;
        b=ONbegUcSLujH0vXgUnGSQKxopzRWWV8C/7TJF1sTO8aR2T+1uiPVT/fmRYB1+UJdW8
         nujMesCbmasRqeAr2QfRAiqP0M7J45DCW6jYkIkL2ftyAQTxiaDBKXyBpjwzCGJD3taQ
         dih/xnks5s7I5tgfEPbqjdDl8QoxlMH9enUV7W04MTAffY7VOHmL57JCsQpj09VR65WJ
         BOpy4m6nVtOrepmps8AAOUIUJIMUuVpSSHItoVb2lpIMbk03m381atgTRkS+4z1fKyI/
         SKixLV0+9q2BMwH3VTPWhyZpe5Thdi1T41uWFNA1N8PNAzhPCC8MHt8ESOpdMyOQCrYq
         3asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225407; x=1739830207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZhOnOs3JzDC/c26qPk+IYrYmiO8/esxJoqOId1pTR8=;
        b=F+5JGdaUoqEpeLX5yfYyTmYhz2ZC/UOLbYPkb2vtn1CZkFPYWjy6QobIc1DEVhs7+N
         9RsgBn8W2Dr1JG755TiJM1qQ/mkIW1KcqxDLwKkX6VooM/mmG9FELKX4HoCC2nS0RvrT
         +VG2Luvb8B7dbX4iMRXcykv71DDWb4J6xhzgrzN9Mct4W7iVMw6RLGTX5/EPaOTQzmEw
         7LVPvbFsbcjMwDC4TKAgucNxTBf7OKAEZ0Zm6tkXQsDTZ8ArOQ4Ml9rGCOWMwn8mTc0p
         VteVK5wHtp+BV2gvWZ2xYpfstb0qk3E8nItC/iouCRIQUtMIIg6LCCbd3jGFWP446uLd
         yBXA==
X-Forwarded-Encrypted: i=1; AJvYcCV3KN3WIAeqzqqyCEN1vyrI8lvWb3OONUGbizpKunUh+7GFmOKUBG+XuBx1rdW3Tqj9WC0QuJk6CnKvcpo=@lists.infradead.org, AJvYcCXlM+8vrrzY4cArkmk11T9VM4gkj+R9A8Dka4Yj0OtGqINDzK4EPUDylxdSEmITNdAUKvA/CcQU1HLP8uRsjxn3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/EYqhOIrObjPOtF98dqX/GQSWQqldKmStI45GHWxwrbwMkiWL
	Nt9Lra1fiQ+N5s2i6+6FwtPx3LQRXTlfMqhvqp6OZLID922RQGa4
X-Gm-Gg: ASbGncuuLK0g6Dw/+Kqx60o17YmJ5xy2PYVYd5tK2va4b2eKR0eu6M/zI/mWYmEH9cf
	dTyweQK+3bTBJptHK6+tEIsMOpAzGZKAm0anHrzBjLPASe5AH9wgg5B6lqEpmSqeuRfutixcId9
	4eUXoVi8aNxaIo2GOKss2Jashqe0Tl7hj+b6uUqHXWtwl1fUxIwaOb7EfCpUEIsPFQynoPiA2iq
	hQhAhd8Mw0XdVcnLyZ8hUQT0V2Zlc2iMDyfdiPTkFyc4eIy6ukOJXjlB4gbnsL5DZsfU6BEio3s
	dAhiOgev3xO9j4ZXYI6QsngAcRXB
X-Google-Smtp-Source: AGHT+IHwNH6hgR8oTQ3a1y0apV2p0yZ49mWYWJA1q/BXd9mTz6QrzTQvriO0UNbrNrMx/g4JSHPQzw==
X-Received: by 2002:a5d:6c66:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38dc8da6393mr12235260f8f.11.1739225407504;
        Mon, 10 Feb 2025 14:10:07 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:07 -0800 (PST)
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
Subject: [PATCH v2 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Mon, 10 Feb 2025 23:09:45 +0100
Message-ID: <20250210220951.1248533-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141009_288598_505DEBC0 
X-CRM114-Status: GOOD (  14.11  )
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

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dts not to use underscores;
- added status = "okay" instead of deleting it;

 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.48.1


