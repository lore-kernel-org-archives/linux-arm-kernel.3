Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B786E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yrdc/z05k/upAzsdqogJM3gllKumubBPodOdXjB/my0=; b=TOHwU63/vrUguSAW65099ZMQUz
	qVUMke6OQE2+CqC11ur9T93BkvmT4bQ9whmgaJQj0JgS++49fc1L0tSnKUaVOPnSScaZyIBk+a4EJ
	YFCVLZOFyU/6HDK0F8IdNUK08HIQQxReTzbsnsuHo6SNQlcPtfXmeC+LJ38LcDO840fQrvfPY4G5f
	dfC7CsfBQlZ4Ct19zp/bwsbqs/efONT7IoVtRMY0HrpxM03r1gOZLDnrOuYBlYjeN0BQVGruv5zDF
	OPGaWGbeGOvSyi4R8AQUM6XLrvIXaWy5SCALSZljg+qWrlezf3ygavggqWk98CIJkqAAIFE12oAxq
	GxTaje6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmhQ-00000001JTl-0QQa;
	Mon, 06 Jan 2025 12:59:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmDp-00000001Duz-354w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:28:43 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2156e078563so176901975ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 04:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166521; x=1736771321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yrdc/z05k/upAzsdqogJM3gllKumubBPodOdXjB/my0=;
        b=hYJT3NHbAVMSWKVE2urK+ySWB3lMRd7HRf4UxN5TyvX/NPQGw//18pIgz2UDUzioXX
         F+qYrxT+65PyIvba33LkUds+kB/uO/iRgno6dGJiuJiiT0qPVqk900+w1NBt0a2Z9Ge+
         tHxBl2kt/XWh0DhybT0YhzoznBzq0z21pcRfkB5AmyDgCi/97xcNsZtj2JJhnw4zo/cn
         waw8J/EfGKfwDa9kqRXdVS++7FWvoPsn7vDSIFCYHFJscQPnDdcWy62iblCXR46ChoaG
         qVjZU8Xunw5BsMBzzwilzCoM9bLl2oJv4KhSvGE8YyeCaGyY1JBFh+MJRj87/s0L6H0c
         Pl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166521; x=1736771321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yrdc/z05k/upAzsdqogJM3gllKumubBPodOdXjB/my0=;
        b=hirKk3YcIc9TfDyng5a4wye33MZf/Ysav02DorkEZfTeO6mmuU972yRSugRaGqYTZn
         +y+4JXpk6Vdcv4sWWprYGCGhD2HD0gjHmTm3Ljhd8OhciDLv81Jq2xL+aLayTfqPcAr0
         hXATVFDDxWbc56ErHsrcUhd9AsXPLAeOi0SvcxwIdNeBb7k5zofOJGeEsgmokGeUOPNn
         kRkLOYRXfbMJvZvbKefyFCat/DAUnyAeQU3qb/msqpBrbXmPKJEX0mufcJQJALsnwS0G
         yBcknRiBkYEZIzmCjOjyP00WowWF5I2eNLMfXiRWmpNaDsaAkFYKLfTmOsczvka9ilGL
         Iwag==
X-Forwarded-Encrypted: i=1; AJvYcCX7/a6ANTthSBNxzpLhJ+ru+O1z7bQfw7y9Gwi+sAlMTX07LiU5a7jVPRWxg4uu12zXjleOtc0xbQ9zeO86rQp2@lists.infradead.org
X-Gm-Message-State: AOJu0YxWtkFBWU0mDNZ6JMGyDtjodmzvNxXCORxjLSqiRgK5cjQOATpI
	rsld1GUwbuTVIodUfPizMQRTHlTga2emB0PBLN2So5rrkWU8e1pP
X-Gm-Gg: ASbGncsuw9oy7q9x8n7Jp5wnXQXTnFhKJyoD1qSCRLhXCY47GOICRReAjxaBVTdgLTp
	IpBI5Iw47YrTqJ5GhTrN6nXLAVmUk4if1ALG5ym9MQCXsgwEOLSpbSOq4NKzZu5kCTpAGqK8+Nb
	F2NgrodMEjfUL5q2hh4q44ueYdq8spA3ipAwDWcLCbSDQqX9EbBdyRZr7pQp6dXtOva6LWfWnNp
	EEAAbM+hYqM4F+EU5uWSyzT6+Egy54zuzMJjgdcOS3F06aj2OFSTkD7CQ==
X-Google-Smtp-Source: AGHT+IG4+v/Sdqnq42NB0jngVVb91QpWgfgjMi3iQiAFcX06SUlOV2VKDk/ID6OPXx8H/PaeG0TTug==
X-Received: by 2002:a17:902:f643:b0:216:2dc5:2310 with SMTP id d9443c01a7336-219e6f26088mr858049335ad.48.1736166520663;
        Mon, 06 Jan 2025 04:28:40 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:40 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 06/11] arm64: dts: apple: s800-0-3: Add PMGR nodes
Date: Mon,  6 Jan 2025 20:26:23 +0800
Message-ID: <20250106122805.31688-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106122805.31688-1-towinchenmi@gmail.com>
References: <20250106122805.31688-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042841_779857_57758177 
X-CRM114-Status: GOOD (  13.02  )
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

Add the two PMGR nodes and all known power state subnodes. Since there
are a large number of them, put them in a separate file to include.

Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi | 757 +++++++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi      |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi      |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi   |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi      |   4 +
 5 files changed, 791 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi

diff --git a/arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi b/arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
new file mode 100644
index 000000000000..196b8e745a95
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
@@ -0,0 +1,757 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * PMGR Power domains for the Apple S8000/3 "A9" SoC
+ *
+ * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
+ */
+
+&pmgr {
+	ps_cpu0: power-controller@80000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu0";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpu1: power-controller@80008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpu1";
+		apple,always-on; /* Core device */
+	};
+
+	ps_cpm: power-controller@80040 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "cpm";
+		apple,always-on; /* Core device */
+	};
+
+	ps_sio_busif: power-controller@80150 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80150 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_busif";
+	};
+
+	ps_sio_p: power-controller@80158 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80158 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio_p";
+		power-domains = <&ps_sio_busif>;
+	};
+
+	ps_sbr: power-controller@80100 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80100 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sbr";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_aic: power-controller@80108 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80108 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aic";
+		apple,always-on; /* Core device */
+	};
+
+	ps_dwi: power-controller@80110 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80110 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dwi";
+	};
+
+	ps_gpio: power-controller@80118 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80118 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gpio";
+	};
+
+	ps_pms: power-controller@80120 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80120 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms";
+		apple,always-on; /* Core device */
+	};
+
+	ps_pcie_ref: power-controller@80148 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80148 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_ref";
+	};
+
+	ps_mca0: power-controller@80168 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80168 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca1: power-controller@80170 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80170 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca2: power-controller@80178 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80178 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca3: power-controller@80180 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80180 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mca4: power-controller@80188 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80188 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mca4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_pwm0: power-controller@80190 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80190 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pwm0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c0: power-controller@80198 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80198 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c1: power-controller@801a0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c2: power-controller@801a8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_i2c3: power-controller@801b0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "i2c3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi0: power-controller@801b8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi1: power-controller@801c0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi2: power-controller@801c8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_spi3: power-controller@801d0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "spi3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart0: power-controller@801d8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart1: power-controller@801e0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart1";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart2: power-controller@801e8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart2";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart3: power-controller@801f0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart3";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart4: power-controller@801f8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x801f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart4";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_sio: power-controller@80160 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80160 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sio";
+		power-domains = <&ps_sio_p>;
+		apple,always-on; /* Core device */
+	};
+
+	ps_hsic0_phy: power-controller@80128 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80128 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic0_phy";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_hsic1_phy: power-controller@80130 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80130 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "hsic1_phy";
+		power-domains = <&ps_usb2host2>;
+	};
+
+	ps_isp_sens0: power-controller@80138 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80138 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens0";
+	};
+
+	ps_isp_sens1: power-controller@80140 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80140 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp_sens1";
+	};
+
+	ps_usb: power-controller@80250 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80250 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb";
+	};
+
+	ps_usbctrl: power-controller@80258 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80258 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbctrl";
+		power-domains = <&ps_usb>;
+	};
+
+	ps_usb2host0: power-controller@80260 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80260 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host1: power-controller@80270 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80270 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_usb2host2: power-controller@80280 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80280 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host2";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_rtmux: power-controller@802a8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "rtmux";
+	};
+
+	ps_media: power-controller@802d0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "media";
+	};
+
+	ps_isp: power-controller@802c8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "isp";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_msr: power-controller@802e0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "msr";
+		power-domains = <&ps_media>;
+	};
+
+	ps_jpg: power-controller@802d8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802d8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "jpg";
+		power-domains = <&ps_media>;
+	};
+
+	ps_disp0: power-controller@802b0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "disp0";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_pmp: power-controller@802e8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802e8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pmp";
+	};
+
+	ps_pms_sram: power-controller@802f0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pms_sram";
+	};
+
+	ps_uart5: power-controller@80200 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80200 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart5";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart6: power-controller@80208 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80208 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart6";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart7: power-controller@80210 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80210 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart7";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_uart8: power-controller@80218 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80218 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "uart8";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_aes0: power-controller@80220 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80220 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aes0";
+		power-domains = <&ps_sio_p>;
+	};
+
+	ps_mcc: power-controller@80228 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80228 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mcc";
+		apple,always-on; /* Memory cache controller */
+	};
+
+	ps_dcs0: power-controller@80230 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80230 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs0";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs1: power-controller@80238 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80238 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs1";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs2: power-controller@80240 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80240 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs2";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_dcs3: power-controller@80248 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80248 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dcs3";
+		apple,always-on; /* LPDDR4 interface */
+	};
+
+	ps_usb2host0_ohci: power-controller@80268 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80268 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host0_ohci";
+		power-domains = <&ps_usb2host0>;
+	};
+
+	ps_usb2host1_ohci: power-controller@80278 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80278 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host1_ohci";
+		power-domains = <&ps_usb2host1>;
+	};
+
+	ps_usb2host2_ohci: power-controller@80288 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80288 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usb2host2_ohci";
+		power-domains = <&ps_usb2host2>;
+	};
+
+	ps_usbotg: power-controller@80290 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80290 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "usbotg";
+		power-domains = <&ps_usbctrl>;
+	};
+
+	ps_smx: power-controller@80298 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80298 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "smx";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_sf: power-controller@802a0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802a0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sf";
+		apple,always-on; /* Apple fabric, critical block */
+	};
+
+	ps_mipi_dsi: power-controller@802b8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802b8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "mipi_dsi";
+		power-domains = <&ps_rtmux>;
+	};
+
+	ps_dp: power-controller@802c0 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802c0 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "dp";
+		power-domains = <&ps_disp0>;
+	};
+
+	ps_vdec: power-controller@802f8 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x802f8 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "vdec";
+		power-domains = <&ps_media>;
+	};
+
+	ps_venc: power-controller@80308 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80308 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc";
+		power-domains = <&ps_media>;
+	};
+
+	ps_pcie: power-controller@80310 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80310 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie";
+	};
+
+	ps_pcie_aux: power-controller@80318 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80318 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_aux";
+	};
+
+	ps_pcie_link0: power-controller@80320 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80320 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link0";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link1: power-controller@80328 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80328 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link1";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link2: power-controller@80330 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80330 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link2";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_pcie_link3: power-controller@80338 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80338 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "pcie_link3";
+		power-domains = <&ps_pcie>;
+	};
+
+	ps_gfx: power-controller@80340 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80340 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "gfx";
+	};
+
+	ps_sep: power-controller@80400 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80400 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "sep";
+		apple,always-on; /* Locked on */
+	};
+
+	ps_venc_pipe: power-controller@88000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_pipe";
+		power-domains = <&ps_venc>;
+	};
+
+	ps_venc_me0: power-controller@88008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me0";
+	};
+
+	ps_venc_me1: power-controller@88010 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x88010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "venc_me1";
+	};
+};
+
+&pmgr_mini {
+	ps_aop: power-controller@80000 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80000 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop";
+		power-domains = <&ps_aop_busif &ps_aop_cpu &ps_aop_filter>;
+		apple,always-on; /* Always on processor */
+	};
+
+	ps_debug: power-controller@80008 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80008 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "debug";
+	};
+
+	ps_aop_gpio: power-controller@80010 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80010 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_gpio";
+		power-domains = <&ps_aop>;
+	};
+
+	ps_aop_cpu: power-controller@80040 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80040 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_cpu";
+	};
+
+	ps_aop_filter: power-controller@80048 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80048 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_filter";
+	};
+
+	ps_aop_busif: power-controller@80050 {
+		compatible = "apple,s8000-pmgr-pwrstate", "apple,pmgr-pwrstate";
+		reg = <0x80050 4>;
+		#power-domain-cells = <0>;
+		#reset-cells = <0>;
+		label = "aop_busif";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 082e5b1733d0..1e0b8f631ac0 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -61,19 +61,30 @@ serial0: serial@20a0c0000 {
 			/* Use the bootloader-enabled clocks for now. */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			power-domains = <&ps_uart0>;
 			status = "disabled";
 		};
 
+		pmgr: power-management@20e000000 {
+			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0xe000000 0 0x8c000>;
+		};
+
 		aic: interrupt-controller@20e100000 {
 			compatible = "apple,s8000-aic", "apple,aic";
 			reg = <0x2 0x0e100000 0x0 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
+			power-domains = <&ps_aic>;
 		};
 
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;
+			power-domains = <&ps_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -95,6 +106,7 @@ pinctrl_ap: pinctrl@20f100000 {
 		pinctrl_aop: pinctrl@2100f0000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x100f0000 0x0 0x100000>;
+			power-domains = <&ps_aop_gpio>;
 
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -113,6 +125,14 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 119 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		pmgr_mini: power-management@210200000 {
+			compatible = "apple,s8000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			reg = <0x2 0x10200000 0 0x84000>;
+		};
+
 		wdt: watchdog@2102b0000 {
 			compatible = "apple,s8000-wdt", "apple,wdt";
 			reg = <0x2 0x102b0000 0x0 0x4000>;
@@ -132,6 +152,8 @@ timer {
 	};
 };
 
+#include "s800-0-3-pmgr.dtsi"
+
 /*
  * The A9 was made by two separate fabs on two different process
  * nodes: Samsung made the S8000 (APL0898) on 14nm and TSMC made
diff --git a/arch/arm64/boot/dts/apple/s800x-6s.dtsi b/arch/arm64/boot/dts/apple/s800x-6s.dtsi
index 49b04db310c6..1dcf80cc2920 100644
--- a/arch/arm64/boot/dts/apple/s800x-6s.dtsi
+++ b/arch/arm64/boot/dts/apple/s800x-6s.dtsi
@@ -47,3 +47,7 @@ switch-mute {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0 &ps_mipi_dsi>;
+};
diff --git a/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi b/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
index 32570ed3cdf0..c1701e81f0c1 100644
--- a/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
+++ b/arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
@@ -41,3 +41,7 @@ button-volup {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0 &ps_dp>;
+};
diff --git a/arch/arm64/boot/dts/apple/s800x-se.dtsi b/arch/arm64/boot/dts/apple/s800x-se.dtsi
index a1a5690e8371..deb7c7cc90f6 100644
--- a/arch/arm64/boot/dts/apple/s800x-se.dtsi
+++ b/arch/arm64/boot/dts/apple/s800x-se.dtsi
@@ -47,3 +47,7 @@ switch-mute {
 		};
 	};
 };
+
+&framebuffer0 {
+	power-domains = <&ps_disp0 &ps_mipi_dsi>;
+};
-- 
2.47.1


