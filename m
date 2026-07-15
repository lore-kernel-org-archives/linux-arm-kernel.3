Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D5C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=GPRhzyRiwAL8m3FLbAHyAQfW3Q
	FSFcIi2jwxll5Mn4o/NewOnt1J7kLT+ekPzEpwhRp4RaOpaRoP05cHe2rWjYH7bfihGRHUjooxQg8
	pIjQNS+oSIuqasRU7q/oEYaETZTRyk9A/riOMpSyagdKtkeYg+Jm296anNHyu5DYdKw3PhOChHvMv
	sOzAyFpvinB4/ahU4G5qICZexNabtzqhQHDk+spe4zbqyXyplvs4GkNBIUhNfstW/R5S9tzFd2Yb4
	hVWKiY4FVRV9v1+Qry8yln136mePUat/NRK/sQ3wOQcZxfbm75NsW9bzxUthA+dTupS3SaM5l/l5r
	9YJs4jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0o-0000000DsP1-2AyP;
	Wed, 15 Jul 2026 06:22:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0k-0000000DsLZ-11ub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:27 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c15f6d667bcso639274966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096544; x=1784701344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=WNNYdi9lcWg4BimkDjFP+0EvhK7nuV6ZhwfpBWiV292x3kSRlrTFXsKW8LYmcG/MKL
         +C12EW2cRVidAcnGDZfJkvNsWUFEURymB7Esab32KLPDphz3xGwTR8LMkSnZNHltmOcg
         BqwXBklaspl8DOx/zhWWsmKAe2OfnIx3SxmhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096544; x=1784701344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=iddJZoj67C2FixuZqqtsy2ZrhGnBv1ORV66gdQGg9ZIfnXhziSj/JPAiqLsWlF4fyc
         LunCrVrZy4gsPJx0wKGgSooyjge92k4YO4DrgVtO60BGQSPeu6VGV0Id9G4Wsl4d92mb
         5gEypPvS5liSuKa6pvJC/OrXkMU6KQkTVcALyz7k/Y+QV7gw5fyxDSB7Ah72zrsGH6TW
         VZj2IQKR9Hnr4HEIUsdVIQ/eD8h+nvAwDVe5NVTljHQgdb4dAuaYw7H86FFTfmL0n9/x
         r4c0YAk0dxUiG8OB5Q4pMnZr3faDai9TrQIwPRY4b6u0TeSXz+y/x5tNw1s3bTLcnUMO
         QMug==
X-Forwarded-Encrypted: i=1; AHgh+RqSiwT0b+vB+0jHsxpAT3iltrLrV75axS57b5JqjfWmPOhAc/Bb6OEZH1BO8Rf6je60uGlVjTbOERa3HKcDmO9m@lists.infradead.org
X-Gm-Message-State: AOJu0YxUzytSQYdfJEt+PuZi04llxtIGAuQIsugz03gR7cT+zccvHQBL
	k+AS/vYW8RyQQmSKFQ7HHr1BXVS0NZ1pHlhN4R7mHc6uX1HUe+OAQtaVn5jh0swIwvI=
X-Gm-Gg: AfdE7ckUt8xfxHvungiEgzD21wPQfosoiZ9gU4LIl0T3XZLNVOX2F5xCtu+J+OgyhNm
	a7+24iVElLVtxySpE9o36aoDK7tLkb6XizHcXwx4C5/zXsEk6rmWZ2bqdjMPqt5nChAT52EScOo
	yWHta3UTWM4i7LQKMZN4A+TzE3+ZsxHrS2IQTgiS6CAE0V024HY4km5G8Pv+7b6RKNMAfwpyZfI
	7ejDzw9HyYVpqcyjry0qNt9em/WBcA16rDmRXh0/Ed7apExU4oPOq05VtCv+PZbuioNPRfUWFlI
	t5KOvU3YYg5MkS2Nn1Mmss1AF5y3BYg6JdJAUx/Gz5kssVimmOFVtU35Q/HRU3q0pGwpafEZY+3
	LwM1Xx3GLPv4urYhbtbTuXz1G0+OG1t6r1j4UPEgI/eefLsj420oPT5leIOw+76RMPOFR3LWKXN
	5oEniep2cV99kbtLI+IEvg6Wfshg2DDCi1mvNKL1vU1VfxB2Bjkim9f8nz+FecjjwImywpY87Bw
	eNBF6h+r2km
X-Received: by 2002:a17:907:7242:b0:c16:6e57:9444 with SMTP id a640c23a62f3a-c1679453361mr95304566b.39.1784096544317;
        Tue, 14 Jul 2026 23:22:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:23 -0700 (PDT)
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
Subject: [RESEND PATCH v7 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:23 +0200
Message-ID: <20260715062201.3599458-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232226_292721_D5408206 
X-CRM114-Status: GOOD (  10.50  )
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

Add the i2c1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 456ece7f8ebc..db485b9ed904 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -203,6 +203,25 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_pins_a: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, AF9)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, AF10)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	i2c1_sleep_pins_a: i2c1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('A', 2, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_pins_a: i2c2-0 {
 		pins {
-- 
2.43.0


