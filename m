Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA12BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYZnRiqYA/3AuJOPS8/sXM1oAhH2+rwBgg6UvDiejPo=; b=3q/oZ6VwrQPGQTK+SmKwREvywj
	bImupUB+VBR/YRIvlfO0fPTZgvOZ+nLAUIvG8Tf9f58DK0ZJlJX5SoyEIbELm7lEdvm2n5h18hTir
	fISxxJ0JAIknvF4jmwqv1RCwf8gNuOVtkvMBnj6TRIlavpLrVbM/u8V88nap150ZrYE+zOF5tCiVO
	DFP2sR6X59P9a7LtRX4OhwqLTgvbbDTa/gDzzyg0Fbb9EVqbAToJKMU3lmmRT9EjEPknnUPY18OQU
	aSJBQ73covwH2MQDFbjPvNqw3nbeVQgKPvtbJo7HRoEUJwMO0aQ7hNX+aEzoBeTTKxOY+Aj8WBGNc
	eM41I77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFXk-0000000FfYZ-31nf;
	Sun, 09 Feb 2025 22:12:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSH-0000000FefQ-05fV;
	Sun, 09 Feb 2025 22:07:10 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1010673f8f.2;
        Sun, 09 Feb 2025 14:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138827; x=1739743627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYZnRiqYA/3AuJOPS8/sXM1oAhH2+rwBgg6UvDiejPo=;
        b=W7fFYjRl2jgygF+oAQXajprrM0MC41iwLwARTGVVJGrnSElxGZCjWcJqD0GBhmYNrT
         aHE9CBIghb0U2HAWKssXNMwhxiIybmv8fZXpyoZZSx2Ute8CWtNvK8+nkR58I7od0055
         Rue8QInrg363gct96OkKb+ZZje5YbBlsoxJh3KsSCjUXAkRom3Ag3I+gmeefT6h3Mj5a
         rPvTQ17RbpnnnB1zWBD7VklQBnITngXlUuUON6gYzPQoy6GowMrsyAWyrJwf1adlGZCN
         MTRQK1zUAvVM6g0QvQKtZEhYe+Q36z5C0OEXqzQlrErxtpzZzdoMHTBzS8w5qV+jafMd
         T8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138827; x=1739743627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYZnRiqYA/3AuJOPS8/sXM1oAhH2+rwBgg6UvDiejPo=;
        b=VIHoHTB/5H3lc6QuG7QnW1L5a+fEiWlamT/f0dZMRmb+ourXehmkS0D4PF9c+q4c/4
         +LWkEOnT1ZIQx/30Rarz+vcfo80TYP+n/WMa5KbU1S6UOLWP2uQlH5ZTug9saJnidulE
         OSZKChM7TkT+pfjSwA3r6SfrhgIDR6d0HzjVbRQdgnd5t9kDWzdL7KjAwdsDw1nMhqan
         b7bihcU5qYrjZQa3ZJhI4TCBcUMoesKgITWtNkyYHd5O6CCOsPzeXa+wHrazDKhvmjQ6
         ngncWW+dOouHziead8hDTSmsz7RabJPAKECQmPAm6F116pqfO67HKSC/5tAc0zQcNWFG
         J+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV+5ASzLuQ2U6y8XNsgT3SJa+R+9sgN1KXnx3TScEeB/ze53M9PnEb+adWfhSROf7c4qKiNTgRmdRWhp0o=@lists.infradead.org, AJvYcCW30LzVBInscOpV+ubH26OkyjoX5VdEKJE44LZkFYR2VoxG2BPMInjQE8jrSbjh9fZWbaVzBDGmefqAC9x2VKxW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu5OC8v1LKk10skiXW/mxmLzJtUjy1fR4n8b9ZX6Y9fKKFa0yh
	UKceWNXAuG8j58fWhMorx47wJae/gIF+ugyhjXfDS4grO1S0yy+E
X-Gm-Gg: ASbGnct6UyVr11El3kUjWehUDJk00w2yUhNtLgPfsbjSlWdDz90SFnQC1HBfNKW7lpN
	tCMyWyQBfXkPkj599th0eLOausI+Trza/WKHhxPoFv3rTdb1UccoQuGhBoRJvb77vVD13eM0yKr
	1jm/amt1gd0zfTD1Cp9o9HXLl/OzKWvUASUnZdHm2Io3zEaIkwW2TQsgtj/SgEmjZQXhIbd4JAn
	SjngUiqKl9jl5uWudfLxbiE5AZLgkJ8UiOTHlVeKVt/DuWUNoA3+7qI2CLww7QbjVkmL5gYim2V
	5bEwpJ1vPY3Mxb7TqCqkPMrAjR++
X-Google-Smtp-Source: AGHT+IEyqgIT9wueUucI24s6gIrK7u3iqKOPSnxaAF3USSSpsBx/UxeCNnH9MSQjBJFg2UsKqEJFsQ==
X-Received: by 2002:a5d:6a85:0:b0:38d:c75e:b208 with SMTP id ffacd0b85a97d-38dc9375829mr6730578f8f.54.1739138827272;
        Sun, 09 Feb 2025 14:07:07 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:06 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
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
Subject: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Sun,  9 Feb 2025 23:06:28 +0100
Message-ID: <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140709_060472_01D88528 
X-CRM114-Status: GOOD (  12.39  )
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
 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..4e520486cbe5
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <riscv/sophgo/cv18xx-periph.dtsi>
+#include <riscv/sophgo/cv181x.dtsi>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "sophgo,sg2000";
+	interrupt-parent = <&gic>;
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;	/* 512MiB */
+	};
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
+			cache-level= <2>;
+			cache-size = <0x20000>;
+		};
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
+
+	gic: interrupt-controller@1f01000 {
+		compatible = "arm,cortex-a15-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		reg = <0x01f01000 0x1000>,
+		      <0x01f02000 0x2000>;
+	};
+
+	soc {
+		ranges;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
+};
+
+
+&clk {
+	compatible = "sophgo,sg2000-clk";
+};
-- 
2.48.1


