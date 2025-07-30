Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A09C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sz6eddCfDwzrey2Pd9gsm6USefudsi6UDSY1qIrWHdY=; b=aBnuJtpTt/h9Dw+r2e9pKWCUXU
	foztGAqsm83d0G3+xLoQKTzkPbhCxQCfVj5i7SToMgXwE1adneyd+fgeGeFYtLYi8hW2LJgx1SyzD
	htXDzrsaIfADOK6g8blM17/FifOW2UBNd0R/HEU0EWQE3Ki1+iSsQxxgWUs5mgqWjkzmtRBH+2qcO
	ce7XY5Yt58wSPl08PNumJxxtXKoBRHE0RmUaLXjPItK0kerLevL40+a3zwfVL8w41rT3oe5qh+yI5
	n59n+3AnLelFjohD1kCCfTJ7vI2TeLCHij/zukLh1ufqlShKO+UmQZTYo4o6E0KNl1MSEEKHmwEGQ
	LXFMZYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhD16-00000002L83-0K5z;
	Wed, 30 Jul 2025 20:03:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrK-00000002JZl-2mZu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3b78315ff04so137049f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905185; x=1754509985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz6eddCfDwzrey2Pd9gsm6USefudsi6UDSY1qIrWHdY=;
        b=qvalrd3PqEauaSuBaXss+HB8GnZ7VSUxLndrwF9MOisO9/te0VoszerDrxi7/bF2AP
         oEAIDENJZqZHtZ9VReLf7MN90iE8IyCuwBAbP+4UoHxEGBZb/6mDYUlhFlJCwuOur38a
         tdUhO3zLPRv453ha5FcMux3MjGyNLltDFxwEImeXST/TNgJUryDCm4q/k1rxKJNG+gas
         9FMipXDj9Cx9eZT0wxvvitAE2UNOnLwMtvFAyNS9qFP35IStaXkEctZn2/OoEHUapeyc
         CB4SW354nSSogWkfgBc0DRhqKIjQjlGgy7PImxHV+nIpxATEupze1oHD38ucsrxrgy7s
         /jmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905185; x=1754509985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sz6eddCfDwzrey2Pd9gsm6USefudsi6UDSY1qIrWHdY=;
        b=OsFJAg74IqsL2qqz3NjzmpHUUucrLAOf4RE1ANQeFgy4EakmLelNV78F9n+1l7da2e
         qOyvncP992ENP1NTk1gjm7aJnWrnIKvIBblKSrNgQFE87KDAfxVxfkEPFRWZjM1KVmge
         s3GFNN+Rwsmd62GkLlHL8hjxLtEHgtO1+byNV3IbasxDyNA3RfQhuyaAI7Bog1dxJXYx
         D/p2K2/1gYczMTSWtbtiYAw7hth5ZGjy7yg4uNwXT9v0noUQ5Z9uHyJpUzLmYQgaZN/c
         9N0ISbw8i8TBaFKc2+/imxDQMjzJahZYaZY68cTOD2cwBV0bzlLUM0NLbHLJTgMSCruN
         /t8A==
X-Forwarded-Encrypted: i=1; AJvYcCUthKdM9PEfaQT2fCWZauBXw5iETA9OTUupAlfY+NdrYAF7OT4FYLLKzITqY+211wu9r0esbAETpVDfRkfcbTpy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8paYGgTeEOZUw/Rp6Qlw7Qpxt/vmsbXDHJAPnTDJFR3zGHO1/
	PO28iKpg5IFO03NSB1t31EXcmi0hGySMKLVdzlr8kMZWG1AF0pOwiQBSEJ1zKXgJnMbNoBS9t5K
	wkNQ4
X-Gm-Gg: ASbGncsPEk9pWW2O/rwMUV5z++OSXJk96sY/SPHxQ/K06+kA7x31NUeB7Flfw0KshPg
	2VCH/9uhcaHrEd1bDy0Th2FLnpZlv8HhIJo66XXdiUeRMe758ydNi6zHBqOgw7ubbd+Z9FMxBST
	wfedGzD9LfdTIJkgW5n+PJOXl73nkUOYViZ0Y0oSwilc1ukWR+OQCqXJckd5Migr785LXaolo2Y
	qggEMAMywj1dnXho4gPE7gWmLzyOGd/uErOxjRR8/7VCqf9pj4uwK7tTWAvTtTCGRMeoNXiOqzs
	yYTiXkLJNEjNuTkr6oWIcMv3ykgNR9AwD2xK4HJUx7Hn1s5lbdPK2xc+U43b9KiuIaYnV6MQvut
	AQN1FsY5Rp63v7GBletQHjGGKoSZt1Li7lzKaYqhBBP1WEiQprfY93DG76ww=
X-Google-Smtp-Source: AGHT+IHzIiy/Kjn2fq5Cd9OViC1/oll8LjWMCbcWSd+u4kL6fJDbI8sMyWN0hXhAmzSyYRVPnfnyGw==
X-Received: by 2002:a05:6000:230a:b0:3b7:6205:25c7 with SMTP id ffacd0b85a97d-3b794fed24amr3712859f8f.13.1753905185056;
        Wed, 30 Jul 2025 12:53:05 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:04 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 3/8] arm64: dts: s32g3: Add the STM descriptions
Date: Wed, 30 Jul 2025 21:50:16 +0200
Message-ID: <20250730195022.449894-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125306_699927_39924571 
X-CRM114-Status: GOOD (  11.48  )
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

The s32g3 has a STM module containing 12 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the STM0->STM11 description for the s32g3 SoC. The STM7 is not
added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..77ef75bad4be 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -571,6 +571,105 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm8: timer@40520000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40520000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm9: timer@40524000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40524000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm10: timer@40528000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40528000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm11: timer@4052c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4052c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.43.0


