Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C82EC4450D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=; b=K8vanQ0C6N/niCM9fLNWqQMVU/
	tomkcArYFAbHHjX8TKW+6jIhckFN60i9+8/aAld7me5/LiGacXF57g4HgV8ICG8w+oDp0jjMKexHP
	QF1syPtqQoMWEZ1rKTkn+9K1/27kR8DABd/SLtjTjHUpNn7DZbFWyDbVA6BGOXihFDvnjrEyFQXUr
	lxNV4O5Ff730V6cpupMCxSroPIBialnipTqTt6TYraaBmZowephjv9ujdLjCHZlE76y2Sr+5LNdoK
	rZsxFA0Tb1mc/gby8m3xac/woFeC7I2m1PDoJOWoqV3p8iNESGl96JH6GoKjJjMvYSkuFX7UCuWyG
	KaCjEaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt16-0000000DsgO-0Ez4;
	Wed, 15 Jul 2026 06:22:48 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0z-0000000DsXi-18Qk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15dd4b9132so719622166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096559; x=1784701359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=UtYyZDeVQFCCqlGK3xH/SYu+EydR/wK8KgiFaZkwMEL5Yjn1bUw8LKnYSPcwA6fq9d
         lrfrmMiSo+SlInILeww8Wib3E11hRyuIWwjlMfXVa8PkAS4A4GOkVByLHGFVFCJOUekD
         cwdvTQjde8dTA4Ked4b643jdBeK8R+pYfs4FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096559; x=1784701359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=GirjvTdDycdoMk2C1F5kaJ7li8SHg2zKFZRq8DHceNRiwnN63uGIcOkdWpyI2SxanI
         yQvWW+rGPK9gu2RCoP0T8TaD10CGBH6nvTFT1qj789yGQAGTkRSHNje2VZHiatNkqF6r
         AoLDyl4E0yDOp0MiJbQyFrcJHxAg9ExVPl3tVPeejBi9bMxm9YolUU7GA2CNMb2T85qJ
         Ut/iIKuZXq5Frt/0baMLBE7FJNcYVqNT9EFNkN/3o6bTU2nfnUa5JdzLOJKEPPTy1SVf
         ecWGQF8lqYLXUFAeiYF3/k4HWdr0Wh+bF4ZMhQkzO5UmFJ5iEJFaFZFui819Y0T7SO+X
         86CQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMIVerSHL2TeYfe+S7feWd8w3cFmaEH7/oTEVSTN0GwT0gbXbOTmMjoTH7+uoofi24tU21P/c9gXFBYq22CAyF@lists.infradead.org
X-Gm-Message-State: AOJu0YzfHu8VGt2z/y8AQpoq94eUbmwdO/L3q5uLLNaQM4+wMPUCSlcH
	pz9qh+p9h+l6fBtIOlEbbtz2pnqzGPil3k1ncHMQKenXmHAcVjRt0C9x5tswDRfQ1T8=
X-Gm-Gg: AfdE7cmedfLagi+0GRMczJR/QygQi+zdujox3AB73qwkaNlHarWbhnmL0MPjiocoH2p
	DaoEH3vcdkxTSS6ByUELu4fN+nyQxXSuGExbcIdkfUMQuOJhabHa2jtdSu4Mb97llVWkVMI/aH/
	srMZG+kSrqPeAn4LwB3KdEcZ3A5nqO4DhwE/aw8G3u9yYdAU7SG/rx2+rK0+L1FuSsUjCE7wWWy
	fOeEx56vOTaIOdUJDRK8nOAHrmDfto6YZYjlKv5J4U+GUUR6NEFWfMxAfvaVYU3Q+mrW/yN1Sm+
	6cBq28J2yB3MHIVs/Q7i/JPyC1c3Jcx1PdjTkc4rp9YTAIEEj8ZRVQsTnFZQtYJBR3EqIOB2gLa
	LLIW/tokLxPBMT+Ay2v8DgRNNJXgBPLqZmUP4I3BrNR36fDraLYuB3yucDX5US2uL6NoDvkzV4u
	x8LlBq5COIV+W2cUdNcEKk2Il46wWBoa5ixAF5hVh4thp3fGtbmRBwEkrUOkkyQ0Oihe9iSjacN
	hpgzfrgI+MeH+OT6r398NE=
X-Received: by 2002:a17:907:7242:b0:c15:b68a:5e16 with SMTP id a640c23a62f3a-c1667b4f80cmr304878366b.60.1784096559477;
        Tue, 14 Jul 2026 23:22:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:30 +0200
Message-ID: <20260715062201.3599458-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232241_410412_3D377703 
X-CRM114-Status: GOOD (  10.60  )
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


