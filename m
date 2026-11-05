Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC4606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 21:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=whBFsXcI;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRULhRKA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=; b=whBFsXcIikddIC
	fWRIasvF1JaJj8mqPcj73a2WeoIJmjsPUiZ5kCvOSDGhsi2UqZDkl6ZmXT6qnynu4g7L1lHKyawWK
	BE++q5e4q/GjqreS8EvsgQrWAgiWUc7sROH/uWRY4mOpvo94RE2OL565+sOoYFkdM2oT12N0VtRhQ
	UbeHf6KDNnJMlf13i4dxyp8OEI/k+WNbV0yGRczgy/j4pCOECcLKbJuG3lqMLHVSTTGfFoyqoOuTZ
	8/O4xS6crrsebMnr1AWh5PaeLrWMmGMYhJwBD1UZysD9BYN7oYDTc8Th/39zWKPnudWxzbwZqfXE1
	bEX/vK8lZmGD2SjIUuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4ga-0000000AgOk-1HkM;
	Thu, 05 Nov 2026 21:07:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP4gT-0000000AgFp-2WUC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 21:07:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2021814a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 13:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912864; x=1794517664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
        b=HRULhRKAcP5iRgyMqE1qNcHl5Ydj4tNBfHUT0Sn9tCo2875ORYmaiWFa1HGpEWMSz0
         woglza8dg0kodNGbkpP9XZ6bWQkNh1ktHdrchFgX+dKtY34Lba1Zqj020gYqPuetFTde
         HJic3cnNk3TsiMIaRlsI0g+ogYMPrsFNQzLaLom5cSEm3ev7Hhfyw3OJ/nJAf9lTF2Ci
         XNcPa9huAO9kZPznK3QZEbGzNxqQZGTzqYv35Oah8CVNiDESzHTXfuDyH3UEks1jqxCD
         IWhr1uOE6ijk2hxdpKMyMl+4JA4OwkWtzFygzQ7rivUFQUBKa4IYjLIw83aurAEN0Sd8
         EFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912864; x=1794517664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gHxePExHDGCUUw0dEUJ6/bp6SdmytffH6Zxb6AKWmo=;
        b=07YbNF4MuntVmufNy6BnxCp0PBqTjDs1dDxRbh2UG0lmcUPkELraJXnbZAy1kG8dfr
         DDITcLPh6i4bQSwX5AqeyNscHOlBBIEP0uSobYWcQ4qOnB0tziTx/eLhtxpK5axQpaM6
         JAitHrz6XQ16uKN1gCjWijdiyjogWrFuOv3niB1N6PyjVBd+1utMd9VAP3x9+20yxGMb
         TOCnb+HhY9lF3uLK48RmP7dEw5gdfq0DG2kQAKqcdNDaPBTxY9ATAsq/mayKKq7vFGWG
         wXFc10PX4hvISWrKh1BEQwBfDtMxlFwMdtAk8+zUU4LRBx0BUfhZ1xjdLHEfR4fJZYkZ
         vZZw==
X-Gm-Message-State: APuU4Z+D0xoYAr4Jnk6fqcbYQI3oLG0CWASKDdz6RQifuAKnVLInZJb9
	/dfPcIxYliibDTVqCbRB5reHERh/4aha2zBCWAJTAxNT/Y0d4fUZgCP+DgWq/vigvBpOjzYE
X-Gm-Gg: AYBFou3DadD5m42t68GYaJa13hMMAejNJK4qu+OagAfFEWx6fEFpTdvENZNFz4bapJ6
	wF3XfFU8Gpb9Y25ZuyWeNTRnLDl1AEHK/MPIOACM4tEpl3FcA6AzgM1tm8mJCodFbsqDgT2Rvpe
	k4KNXynclfT41tSTgSlf5C2cvyzLqbtqgVQzlcABo//TbbOg4at8/MhmIZkwkangsO6yzbYpDI2
	A8mvf6oaH8mXd5dg8ZTWWhpbCbbmFqI3jOPvigWM55q8VLlnIRRBzND51X88XmXLtjrrjBgYnbH
	5bupOeEYvBybNwTQQHrIZf0muJIB2uwOWJmLg/2FBKtPr26AuUvA15yg6T6iSDz1i4EbJ+pwR9A
	fsT1fPuzo3H+iow1nv0BGExafiVFR4jTptkwP67GqfLSb0hr1KbMtzrTo13eTvSErzT5cJK2/XB
	Pu9Ul0ElmyGRciAvDS2jMHkRzBgo7AuUJ3N+kuQJNz6WRAMbYAnErk0UhqN3j/84ZEaar/Tg6kq
	qz2sDBU8pXFY3IlkI7ZZclgLz1L6+/jGpyJLQYaga2zx/O672KCtMzVpqiLrtGbNpccCbQrUuXN
	S3GFgrs3wr6jSD/MeAJgaOcN45/l/9hJdOBAae47O12F0izjLQ==
X-Received: by 2002:a05:6402:1ecf:b0:6b5:6478:a9a5 with SMTP id 4fb4d7f45d1cf-6b5977d8c85mr324805a12.10.1793912863653;
        Thu, 05 Nov 2026 13:07:43 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:43 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: Add MT6895 SoC
Date: Fri,  6 Nov 2026 00:06:02 +0300
Message-ID: <20261105210622.523747-5-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_130745_774687_090DD313 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial support for the MediaTek MT6895 (Dimensity 8100) SoC, which
has four Cortex-A55 and four Cortex-A78 cores.

Describe the CPUs, PSCI, the GICv3 interrupt controller, the architected
timer, two UARTs and the watchdog. There is no clock controller driver
for this SoC yet, so both UART clocks use a fixed 26 MHz clock.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6895.dtsi | 166 +++++++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6895.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6895.dtsi b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
new file mode 100644
index 000000000000..c80f30da7bf9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895.dtsi
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt6895";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+				core6 {
+					cpu = <&cpu6>;
+				};
+
+				core7 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	clk26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			reg = <0 0x0c000000 0 0x40000>,
+			      <0 0x0c040000 0 0x200000>;
+			#interrupt-cells = <4>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		uart0: serial@11001000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001000 0 0x1000>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11002000 {
+			compatible = "mediatek,mt6895-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		watchdog: watchdog@1c007000 {
+			compatible = "mediatek,mt6895-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x1c007000 0 0x100>;
+		};
+	};
+};
-- 
2.56.0


