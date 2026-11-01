Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12873606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uhFDR1Eg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr3xstVl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=; b=uhFDR1Eg9oEdud
	GAux3t8I7arhUTvepRYYMwrPNAL96VRatBGpVg/k4tjzFEj65ysXQWljFo4OwaxEedWug+Y8YrRNl
	tq7XiWiG/AD0n+DNmOqBAMO6dMiGUf0EPiuKLFfSxtoigPOWHMO1SY62iCpGF/YGjv6aiaBhRGxXB
	4HvEYfGCpdA3b4WCTjJUPTGwm3hlFZ88K4PXTLb8wuaqE58BKfcKIBWwBxmMqRqmvqCOiDutnBazu
	POhHWzNoNhduBPiIEv9gF8/uzkCpdzApT7/OLZEJ/fga60ADdrIpXF/wAG/ZWrOMg0ZUdMWAftVs9
	0hd7x8XMGZ2fVBRBey+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaki-0000000EmTD-1X4z;
	Sun, 01 Nov 2026 18:58:00 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNake-0000000EmPw-2j2Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 18:57:57 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b0a28a720aso21048837b3.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559475; x=1794164275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=dr3xstVldJoA6gK6daEvJ9LNpQxx8CQHkiYelm+Vqyhs3HFIMx+VfXePE02UlSMBvp
         T/vKkEjv0t1SHhrx3RhlOXkuYaOQQs4GlG5tDAaW07vOrl2arsP+poYVo4iZU5c8RAwy
         4cX6R7pZTVqbZMxKGoqh1BW38kdP5b/iZYqGBZ1AfHU5NuzDHRJ6myUrvtkzG0maTj7T
         IglgAN1WNLt61CDi4uqzWarCo4XWjNEQWsM9Qhqp1udhxm4MdoQWfmyH7vfnJKsc5pQD
         2HW1N4HCU6hZhnzYZ+pzGBgvIgAc0fYyrt4YrjDRwBkld86iwj5Vb2yKunoNLJC8umeD
         Z+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559475; x=1794164275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMZ3p8klhNcSbnVfVK6IB8YKNvjqcF62RjoXmPpSb6g=;
        b=oynDsfnQzsW7B5NAbi3k+eLwpGJfgvbd+mU4yVFqgo9ORkjgXvz2D9ZsqSjT58/kwB
         PyyI2NoTOxRGapXC9kLpDh1hJTiK+EcEKZCAo6w10rGx7nYu8EjI8QIAqUEV/pw9Yen2
         g0tz/cC826qrG5RVfX3DEhYreb5xyIfKJcmcPegL9+EpM1qAJ8yG4GQ/KIJj1VMkaQec
         CXgEMt7hDNFw3UmleENnfjVlwaRMwByQHaI3Dz4KFhOkfU+hNietD/Pc0/1Y3iqQpZPA
         76tJcpks9CnCVTq2/qrneGt3nH8JAC0UGFjG6/JUCVTgdWdOJOl6svk8r9sJvaSAVj2N
         8VpA==
X-Forwarded-Encrypted: i=1; AKwUvBweCMamp2aD05FBcv9GjkDBozVtuaZQ27ah8zeGcqG+cfJlo7V0sjw36hUsoCwE0aweLV4u7/8DjFBVITyaAGdT@lists.infradead.org
X-Gm-Message-State: APuU4Z/Gkvh3XeaysjyI7fru5s/7/ayqtfKaEELFnQv3q1VSHrT4O5f4
	lmIYlKwsoPFPtq7WiVi4Ptc9EUWE/l/GPlFb2JRVO2rUK3xoYSWpXtBW
X-Gm-Gg: AYBFou0orrpfBKN4ffdQMEMTWL93pOkYVqOzHeRfOs2nAbaPIX4asQD+RfvjsUq7dcM
	B3zaW9a7y/mX3uFiEzgDOIoZaAspXZlejOIEqbQYQ1OYPPNRUBSlxT7BngdgkBM3KcPwarbrQdq
	rRKbQVog51IROM3rH2u+my8zgmO6mfhAYaWTR8wPVRYr64tWxKqs349GPrpr9yjowzawGztHMIM
	snTmiWLMWbIUpW07BggDD02Px+6Q2eu7U8ERFKDoffmOvxuvXGF2NGDcq38V7g3SS3f1v1VbYX/
	yIApYl/6k758D0MHXXX8W0QUvZvn0ZWILE13Rik8eOTVj9bhJoVa4zmO5NQzTBrcGeNTfMnRFTw
	sP1ZuPgBIbFJ0+mFVgnZiEdOk8pCuAyL75LSqr7Qbqk4HAou1YdTHUvg2Uhxw+kWOhbJQWZXfkb
	1XCRP1/oF0vZy8jnxZ2KK4s3QxsMuq2twMU18P4c7rcnQSPLOz4XocpfRZDl1KduVvouSSh7u29
	NHJQuSSO8+11knlifZMxAd1za5ppJ7m4l8rYJISIaoFpAAnBNTPv1DFEz7FO2CguMRQkuC47H/6
	s9bFmzu8nzVFYxsdq6k1p+GRQ7vGyvEYgCDjRzDDJFqRPCGjs6fTn0DIPuzdBhM3Hu8=
X-Received: by 2002:a05:690c:1b:b0:8b0:dc77:6b29 with SMTP id 00721157ae682-8b2b6790179mr69509227b3.55.1793559475269;
        Sun, 01 Nov 2026 10:57:55 -0800 (PST)
Received: from hp ([71.12.40.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716d420sm40869397b3.33.2026.11.01.10.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:57:54 -0800 (PST)
From: Tim Michals <tcmichals@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: allwinner: a523: Add message box and remoteproc nodes
Date: Sun,  1 Nov 2026 12:57:33 -0600
Message-ID: <20261101185735.762559-6-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101185735.762559-1-tcmichals@gmail.com>
References: <20261101185735.762559-1-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_105756_701124_9EC96121 
X-CRM114-Status: GOOD (  10.77  )
X-Spam-Score: -2.1 (--)
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

Add the message box node, with its four register banks, bank clocks
and resets, bank interrupts, and the XuanTie E906 remoteproc node,
with the MCU CCU clocks and resets, the RISC-V and SRAM power domains
and message box channel 9.

The remoteproc node is disabled; a board enables it together with its
firmware name and reserved memory regions.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
Changes in v3:
- Message box: all four banks with their clocks and resets; the DSP and
  CPUS bank addresses were swapped in v2; remote bank interrupts
  corrected to SPI 181/174/205
- Message box: interrupt-names
- Remoteproc: debug reset, RISC-V and SRAM power domains, one message
  box channel; the message box clock and reset moved to the message box
  node; reg-names sram-a3-0 and sram-a3-1
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..316698b999c6 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -605,6 +605,31 @@ dma: dma-controller@3002000 {
 			#dma-cells = <1>;
 		};
 
+		msgbox: mailbox@3003000 {
+			compatible = "allwinner,sun55i-a523-msgbox";
+			reg = <0x03003000 0x1000>,
+			      <0x07120000 0x1000>,
+			      <0x07094000 0x1000>,
+			      <0x07136000 0x1000>;
+			reg-names = "arm", "dsp", "cpus", "rv";
+			clocks = <&ccu CLK_BUS_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu CLK_BUS_R_MSGBOX>,
+				 <&mcu_ccu CLK_BUS_MCU_RISCV_MSGBOX>;
+			clock-names = "arm", "dsp", "cpus", "rv";
+			resets = <&ccu RST_BUS_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_DSP_MSGBOX>,
+				 <&r_ccu RST_BUS_R_MSGBOX>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_MSGBOX>;
+			reset-names = "arm", "dsp", "cpus", "rv";
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "arm", "dsp", "cpus", "rv";
+			#mbox-cells = <1>;
+		};
+
 		sid: efuse@3006000 {
 			compatible = "allwinner,sun55i-a523-sid",
 				     "allwinner,sun50i-a64-sid";
@@ -1144,5 +1169,27 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		rproc: remoteproc@7130000 {
+			compatible = "allwinner,sun55i-a523-rproc";
+			reg = <0x07130000 0x1000>,
+			      <0x07280000 0x40000>,
+			      <0x072c0000 0x40000>,
+			      <0x07010364 0x4>;
+			reg-names = "cfg", "sram-a3-0", "sram-a3-1", "remap";
+			clocks = <&mcu_ccu CLK_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu CLK_MCU_RISCV>,
+				 <&mcu_ccu CLK_BUS_MCU_PUBSRAM>;
+			clock-names = "bus", "core", "sram";
+			resets = <&mcu_ccu RST_BUS_MCU_RISCV_CFG>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_CORE>,
+				 <&mcu_ccu RST_BUS_MCU_PUBSRAM>,
+				 <&mcu_ccu RST_BUS_MCU_RISCV_DEBUG>;
+			reset-names = "cfg", "core", "sram", "debug";
+			power-domains = <&ppu PD_RISCV>, <&ppu PD_SRAM>;
+			power-domain-names = "riscv", "sram";
+			mboxes = <&msgbox 9>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0


