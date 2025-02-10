Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DDCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J36P/705noaRfrv1RgfEgcaXBGl51BJjTj6/wIyO+Bk=; b=m7E4rXl4sT/0sfkpGkrjNNbftG
	R/CYWTIpAhBu5XVXQFOih3KV6xhPUNFSZG1wuoF1VRDDg+ZeZHmz/K9/LPwxQJsFV8H1Iv0s4hp/+
	CCi9j+TCHBBh7NJ815lavcIK2NcGPf+QyEgiZl45GJp0QFfa0cr3/QMCNdeywwnV83qNLHmOs+sWi
	UQrVEtIuRzVaNoTmyaZVpwyeQ6vjr7PJ6gmGkRnX27viMacbn29kKEAzqTiTw+Nv/Z1T5F/97AZ30
	K/a7tCysMVWuJck+tpJR12hROZ20NHudprtqJXn33VpeAQhGZDnroZoWXKSWIChRahTT1TKzNG5Dr
	zO6ozDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdA5-00000001q5a-1kJQ;
	Mon, 10 Feb 2025 23:25:57 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyh-00000001bLx-1dzj;
	Mon, 10 Feb 2025 22:10:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc6d9b292so1986014f8f.2;
        Mon, 10 Feb 2025 14:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225406; x=1739830206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J36P/705noaRfrv1RgfEgcaXBGl51BJjTj6/wIyO+Bk=;
        b=athuxNeXMhotVmk7dIKLrXAnIJ58UFRLZXvQ/hC5/1df47K1PtMaEavaHfy9Xw2JXS
         J458zdOe2dRlzGOVU5AqhEAKMI9+ZSqiEzEkyGDKmtmA1GSHjGX64RREf4qTU69tlr7r
         PNdGkpCLgmGTW+2AnCxSBksy5PTHe2P8QKaSLAqD9fLctqZg5EmpD10gPkG45OK6tsL/
         OKKjnbfGmn4DFn0r6DdCkqNSC+ljTddt5022lodY/daEUwF+zhnOcCRPStqRqp0ZOIzD
         iegsS+pQnHRSAZzx6RtAGVxqoqxRQkgi+T2Tios6rKYsln6BDU9Uip1aU96oZPDNud8p
         CM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225406; x=1739830206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J36P/705noaRfrv1RgfEgcaXBGl51BJjTj6/wIyO+Bk=;
        b=GPGghR0wlXsx98/kLYMYQUQpXAkYraTJQI2RUFW82GLIglTb8bohf1h7mBOR2W8gmR
         1f4a1jp8MZcHgPzpnAXPqAXe7ODq9HWTkLeyFSesANbILyxp6eVgdM5/zhT3e6ZiBuEE
         U+XPGzhaso7wfT0T1V5d2K+lnfJfKBN2s6g2JXzbBH+5/JUBgQGqxrNEluO6i4OvN7Kj
         G4OLcRI/lmln5d7mlm4NzpLJrDJtiH9CkJ+po9aAXsAGQVe6bnJtwIeNYMczSNPNohc2
         objlc7kFIQFiudMtUA+XXTA+SxoNPueKMKcBNiAtSnl9oKypYSTZKOX7RaibSQPwJyYi
         f3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIDV2ID1rzYrp692++8mnEbNAmkwLCyqVk7kCBVUdlWOGNUMFSXuzyjB7iq0UUY+g4HEa5Uyyc5QmWbm0=@lists.infradead.org, AJvYcCXW60LA2j1yM1pxhIiRwR/EvYm1bmwNNSsxugKF1QhcyRvKHTNjKdGzsMpNdUz6bcjUSf0n+kQ8Mkr6Y7mpIEhc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5OoyfuyweS8YSM6wiOQIR6NUcHCRFFQoU66xUDw7epRFQGbxE
	dZn3Wf5Hf+stEbB7VA//Apq15T9yFUQYIKcAWHR31/SpnGBn8fdG
X-Gm-Gg: ASbGncvf4zwzNd+8N95Uz6Hg//G4zHL2QbOWedGwNy4FbVpkMfDhzQzvauyzl6ZTyAA
	2cbqWw6ELhD6c+NgN+QUSpn+gM5/P1W75aT+vO1/pumpYUdBPwcix29Z69Cn0KBoHaKal+i6Rbs
	3F98AbqAgbdlDN+eM+FWWWKHGjZjo0Q9IQrm6XskmGOXhiOKkZPecD0cufQDMiFyGLOF8QPrFqQ
	W/PvgLl2b2YZKc5Sy/wSgHH4fDnVEuKJtecDyGEIS4MIC72wicfeP5zrs16+btxnd+em3OjVY+D
	jC97Dn08cWlJd2lOasQUYVWFMY+o
X-Google-Smtp-Source: AGHT+IHBDwcw5Xs+bILjkSfD8+rtXz+yAOQWjKW4OdKB8dlh8ebuM1gV/rgcmvZDg9zfJqcclIe0vw==
X-Received: by 2002:a05:6000:1862:b0:38d:de34:32ed with SMTP id ffacd0b85a97d-38de41be586mr1051887f8f.34.1739225405394;
        Mon, 10 Feb 2025 14:10:05 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:05 -0800 (PST)
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
Subject: [PATCH v2 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Mon, 10 Feb 2025 23:09:43 +0100
Message-ID: <20250210220951.1248533-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141007_433102_9C7E3C45 
X-CRM114-Status: GOOD (  12.58  )
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

Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- relocated "memory" node according to DT coding style;
- moved GIC node into "soc";
- referring "soc" by label;

 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..98c8d300347c
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			i-cache-size = <32768>;
+			d-cache-size = <32768>;
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x20000>;
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		always-on;
+		clock-frequency = <25000000>;
+	};
+};
+
+&soc {
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2000-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+};
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1


