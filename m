Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCF3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=xE7wRQ2fORU7rcg1a1SJhPk70t
	uoYUWfCNiobmkdAKVA0NGRoaMr2F6LKAjBpv3nmE98gKHvJOnjCUszDo22bDju0uU8ghF7MF9HswC
	8TvL2G5mcH/0Sj4zC4hsr7x5+iWH94Wq7C9KH2Rc4267AtHPPNLrtm/l4t7KHNe/1gRnqONFe13x4
	Xn5i9IkLaYYKh4vGnvER5ltCcLtZtFQkLcvXTb53UsnBDf9tHl2MIKDYKjX5/Pr4T5LMTlQa4EyTI
	Iz3+WRaMkfKJ261auQJmK0icS5BuSBONVQzwjdjl1ubrlEhxn8PfOsKhyHXnKdhTdgjnqwkfvHqSV
	//53lPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytq-0000000BEwH-1Lhh;
	Thu, 20 Aug 2026 09:17:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytk-0000000BEt3-2Sp5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1153600f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217438; x=1787822238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=oHVhvxNHFq+NwK+ibdIZ11+kBGtjh0eL8skiyaej1PCdPQTYbD7UHy1quOyQqJWkuH
         qv2rA5uBbrHb5KFQQpSxsq9b7XhN7JLEZAX4u4dxjU7RWmVJW93vym6I+5+9+OghvmwR
         l1JARjYphcf+WKkhd7G3tuw48I79TM+3aWs/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217438; x=1787822238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=XdoICWCEsip88mH5A86ZiqoS5+Pv+XLdcC84Ahu5j9vOR34UPf9bONvI80Zh0170dh
         lYWCX13Ha4/aITeUDx5Zk8WpD0QFWjCE5CnxoVTOWeqSoAGrjETpEAkQlAJ4yq5DfTfG
         pxoQ5KWxLBYLCIygQUvwTYpjvNSUFwmpXwGV8UnsvJ+D+w6nOgyeU1KyYpKrQMk/GEDU
         8xNdw8FtiTr6WOmpiEERg14BMC26+93LPbtOYgx2zWeVkcgHh6Hf/Wh07MI+93bnOJkX
         ZDA5260Z33DMwibNU3/Q7vW1OBMyjqvRcTAEulV970HVUSOrx+ESeVbJhna2N4lWdvNT
         /HPA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7unvPLd3jTuIfsEcTDgoTp1p9LPWVfug4gX1pMTydOFC8vp19UTb8M7h6Zhu24BDD9iu17Gs7v79bl+qHmCED@lists.infradead.org
X-Gm-Message-State: AFuF++k6/wLjAbVxFkIsGiWd7SNhrh79HSEvEe0QP706g1CvIuOZZCtY
	DexMVlbVzhh4lGVf49sZuDE+r1iBc/cVvUZc8eJwKIRgHv1rwCuYcmILN62IYzfwbIk=
X-Gm-Gg: AR+sD12MrbQTOMzZ0PBiYZ5Gh+ncaS/TwrUFGjNYnpJ1Gb943461NG1r/fBQ3yaMIRd
	ZwwmpVD4P/tu+oah7MmS1okX6MwafdmJLuo9HUN//evQFKBRQQZYQfYmal/Y1U1sbe0/8n5gEWa
	RoForE1PhwPDOtSF747LeWhIv34t//mGMeAh2lNf7Dgf0DLfbbvQdYgFk5qSOCDYNgPl7BTH2cH
	vVOa2YHP/nI9jHUzvbMQ2+oBSzsUWKPXDuT3IW0pBoeatHkEesHAv2LBFgZg8X1tNQYk9y6vITS
	EF7GmdtOwrWKpvXQL5vKJ9t3EEPaxsuGTLaHxScwHGCnjsB1uXQGTewQcVxlGVdyPijq6FK4/Ez
	B8UHc3HzhEbZBUFp6Q9cIc011yiciRIfpheoHvowcimH29/grxdX2W2dT9910WfLRLVXIfkTJNo
	bZDXjzYnFb3Yz3E5gZMqABg1fvM7BfSTMnojWL1JkS5QUApJ7DUsNJb40WHdfZ27q6gmUDdB3kn
	/KSMHnGjQVPsDyjrYJ04SCs+eJX88ORTfL2UnUcPGKsEWRjx33/K2xQeS7juVk3qSjExwCj1k99
	cfu6LRRKUPSQtHtdPCEZ2zftBDgu8f0sPZIHa9/eaLZSOodeiXS9N7tvlin9eg==
X-Received: by 2002:a5d:5e91:0:b0:47f:7b75:9dfe with SMTP id ffacd0b85a97d-482b1e958ddmr19929009f8f.8.1787217438610;
        Thu, 20 Aug 2026 02:17:18 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Thu, 20 Aug 2026 11:12:13 +0200
Message-ID: <20260820091652.43541-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021720_648103_5E29A72D 
X-CRM114-Status: GOOD (  10.14  )
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0


