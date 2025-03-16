Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13854C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoyZXAvqNe6CuejKxIry7Yi6oQs7DU4ZtubzPJeO22A=; b=Df0YUedMTboLC9p8jpEJitRpYO
	O91VWNDeKXXX4cs7ODlq5I1ClE1RB5+OiKHP1TroSvjqqJUtJctuZ0EZiDQbPIIhyv55toZce4vcQ
	Nx7ApjOWpj+kOIkAILvPafxiDog2AgsUdwfOKsNiEua6HKRH4yuHxyvc9bmm9PplSeWeCUgobX7tg
	PnghipjKZpRlvnp/mBQ6VGoYrLeWS4Ct/hG78J6gUrH9y2mHkY5JUOmtiDogzmpYNwUnEgNS7UgoS
	/YyxVajxCHLcGreS/3cPomOz+q7TCVF8K9WjZH5Mn9yvGIl+VOgwv7P7ZB1KflubQF41tGSQiT4jA
	g3nvATOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttGs-00000000Vfg-3KQO;
	Sun, 16 Mar 2025 19:03:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAG-00000000UNT-1t6M;
	Sun, 16 Mar 2025 18:56:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso8156105e9.3;
        Sun, 16 Mar 2025 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151407; x=1742756207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoyZXAvqNe6CuejKxIry7Yi6oQs7DU4ZtubzPJeO22A=;
        b=cnNEjsF0NRhXCZlPOGO7yDvFGMNt3JNdva4t7WgLPcCyvie2oxfbPXlSLLyZMkkjOy
         OGTNj6nA18iSvVj++a2SCE7yv1f2la8EPgNhrHIQZTTy9fJESkqahrOCVRkw58crKttY
         XyqyU85eCr0URhii41v25tAgMKWfVIiZzVUj3l/RSeXPFM2NPzm0/H610yc/gljU/oY6
         6rRakJSt8Vy18JqEvGqm7TLy8qb9W944syDaJgB+3/sQVnWYoYGZ87t0yIzzk2H71dfP
         L0LgSfp5eiv9wvqJgrV9RCy5Wy7ensweiEBEc5PQ3Yj1B9FdrkXstFyfhJmYIRMzChor
         LcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151407; x=1742756207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoyZXAvqNe6CuejKxIry7Yi6oQs7DU4ZtubzPJeO22A=;
        b=I4zbnlM3XPgQcz274zuDLDF+tH5qMzbbKRzflf5zSBmWYUfmJbutWMFa2cX74qXpzi
         gcSzEcoqqn6VAZt86IHH7i8LI67fWcgfBBmVU40+x36/6YlEBiWX865UNrDMwE7ABaQ3
         8Y3D72SFFM7J7dSSIhY5ppboz73tATY3nChiIwSQ/b1aJxw1yxEKYLT0LkgiiypulpkV
         2TfGVJQdvmQG/1TdTJG2mwMfHH5FHYBCihHQMcgndqS2DPkxLNbHbgIx9RdDPRpEAP4p
         rFjoxxcaj29HxKgA1TXaLgNtoa7jHlhIm12FxfIzcaX44SHMbyWrnpIw97Dfcxcp1Jib
         A7rA==
X-Forwarded-Encrypted: i=1; AJvYcCWIA5N2oQfeN3+wTWCoulzsk3tZDcZ1nl+IKXt8byL4Bg0Axkc7t2qwgg9+RAhxBHV28ikr21FHbbwzkfU=@lists.infradead.org, AJvYcCXAYZGRH0zq0ji5OjtNGYUhVu9ccIjvMfVYmlIhgSVhYRPCHB6v4hOmX8xd87Pw99pKq7Z0fCgSsqq//ONfi9Vf@lists.infradead.org
X-Gm-Message-State: AOJu0YxEyuK5AZTqqyUl3bWvFgYRMIia3YLOtvKvJH0hhFlp/5h2S4Cz
	7KK3pouZBxr7mbb6GdRf5OkOrOADjNp3A4LK9YmDj6HsFCIn5hg4
X-Gm-Gg: ASbGnctrEI/3egTMI3sMO5ZvRE5uC5Yk/WB74i8BebVgeMuxold4vrc6hBARAJ7k0dm
	tbefcu7KwK+0tyr+EVx3A+Ipe/7Ec8YAFYoaJefwuCUzdnmIbMaoKhqvFVMQANjsB7wkIyFNEA6
	Ywg7nCwHoJjeGhb84FuQ6PWGVOVf9zv0LwQdRrWe6Ff2ErGkBHPFwGg82KJsi5vtJu+24eEF+LL
	/seTRQYrdOlueZpjQ6HWDKO/Ixwf32lFiJD0aEr3px5UgIwb0JicIwYzkRdJkf0WShee4l5SFQz
	CYWfP9fSkV72+SS2KImmiJSeLfc3wg0j8eCLgJZYs1p/IlWhkcyisKOiCSFk3EYv2oeV
X-Google-Smtp-Source: AGHT+IFMni+9tePO5dcXTTurbNOrImHaypczvIJOW+fllny49duz6UAc34isNuZiUTsLUl0JT/kiSg==
X-Received: by 2002:a05:600c:1553:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43d264bfeb9mr56204255e9.29.1742151406643;
        Sun, 16 Mar 2025 11:56:46 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:46 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/7] arm64: dts: sophgo: Add initial SG2000 SoC device tree
Date: Sun, 16 Mar 2025 19:56:33 +0100
Message-ID: <20250316185640.3750873-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115648_498891_3AF79DDF 
X-CRM114-Status: GOOD (  12.95  )
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
v5:
- PSCI node and enable-method
v4:
v3:
v2:
- relocated "memory" node according to DT coding style;
- moved GIC node into "soc";
- referring "soc" by label;

 arch/arm64/boot/dts/sophgo/sg2000.dtsi | 81 ++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..7051007ec7ea
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,81 @@
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
+			enable-method = "psci";
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
+	psci {
+		compatible = "arm,psci-0.2", "arm,psci";
+		method = "smc";
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


