Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6285C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=; b=cF8fZjBrWBzFpIzKfQicyv8S5q
	DBJr5KD0O0VXab8kK8N/g8nqs8pxRH+gB/qkZM4/ARtajpaQ9rzsG48KpWRqTVmrxIJUyRYli5UI/
	+KkaT1fXZOA1imV/2HXsUO0QxfaVMrbPE+jJnpbgLgQ4QftddG0WlcZzM2vhp8S4Wt9kksB5dAU0n
	5Q45g7AKLqiJasWzjRnnIYOTzYQCz0JnR7NSamlMl1qqPTbdKCJhgCHlHj4Mlwj1hxNg//LNDPZ6y
	FXn+cMPaZbmPu+Xw/Qdcdhf0a5TEF7NmGALwEttYL+/yHfr8yWE7Z+8wN/CwT6i7NNWOg0yiLYj8O
	QcnZATuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkW-00000006CqB-1LEx;
	Fri, 03 Jul 2026 06:51:44 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkT-00000006CnC-1hYA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:42 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso484663a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061499; x=1783666299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=cpnz4ee3A6s5gJrI685oacBwsy/IqbIprAd1QksTvx3QCv+WX0s+HA7OTs11aBeR7w
         Wi2iUo2dfSCVJncrLRq/o8W8bmwdMhSXE9LzVcEgKswi7bECM6Ea2p8L4+XtIUx41sfH
         cOZop94YIQ2GfG+drdfD1/pVW7w3Z01JKpy3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061499; x=1783666299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fAmctwTyX9ptfNTsOcFrY+BzuI2WSByIHEJFFIRpN/Y=;
        b=KQctf+z5rJsWCW6/dpw+FnuA2rCgJEqM6QY1mEYcp3XnrnOlEFicofmClMkXAmur7z
         vg87AMwkd2c8rRnT+n90lNeI9fE8mJlV4B/J+ItFi3lX9k3mfJ1H5f80kWp78L6xk0Ja
         Yf1KjTj2O7SLr9QtS2F3BHS9nLVadughhwjb2yGSIOakBYKlauUH+rebL/+kfeRjmONE
         1diJ/r9+6RFJwdReAQ3NahqL397dDqxuQ0MP4Ra0Ec/Mi33T7Q5+lAvVW3n/RlNBMaLl
         Tdjt9hX6x2zcVXNjp1bzflYCsS5nW5A+Sh9MEf2zXWNsSjY6KnYReMdDUTBi/5fFdWek
         Fvxg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7SMS2mb1u+ZSEs1qGrdtiiWENiHoek2Pmdgdxm1Qz6koeoJi97XkzkqtbfTej/dd1XWJ3iCp9RouZqgHluOoI@lists.infradead.org
X-Gm-Message-State: AOJu0YzP5sEv+A9IQqk1kdvOw7cN21zYyPhR4vR7/EwSniGQl/7Cqb31
	np7Y1s1SaS1dtjirTqxQrKPXf64FSoMU0VpV3iCQxh1hX2FDlYJyw5h4S2NKHZGT7pY=
X-Gm-Gg: AfdE7ck7/ug3WyWAmcH5dDCzrHKmk4qpP0E1fZGaTbljds6z1QNN+5xJpdVWypThbIm
	kZqrek7BajrU9/1YPNYqGktaaY6xPtA722qNw7YhksGvzLkXEQC8B6MWLhRbmCoyst3fRQNn43G
	tNhcg8guf+2C7PL420SB1lUIl90mBOtvSOIJfntz4jIGmKUNIusbL0CXcDVgCcgXlhIrdQ8usSX
	RwdBkV9g/g2wxT28XhT9wu9eXxbVzL+1roOrb1QuAznHhWqzNfLzNqVxAcanbYZ59Yq23jlLEVT
	FgAfxaiQOKZXELiFImxxPjrKU1tLs3A0Fulxk8hR7K1uemLA0VYR8uwAY9dm0xhmZixRfH+syGV
	2RZVh0E9eyK5Uxv3za6Io49kfv57IUmZBnGlFdleBItam/xdwEJwJplk6X+JOGO8h1QQ0JYSNC2
	3Mc7Ci4Hq7hjv1OdjmR4jQ2V6ScQkt2vcFwJBPEC/go+67LNRTFkMc2Hf9T64dfRbxq0rfH/yGp
	keT5j7hThQ=
X-Received: by 2002:a17:906:bc81:b0:c12:9eb2:8093 with SMTP id a640c23a62f3a-c12aa175d30mr282735066b.53.1783061499463;
        Thu, 02 Jul 2026 23:51:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Fri,  3 Jul 2026 08:48:54 +0200
Message-ID: <20260703065110.1433283-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235141_460267_A8C2B143 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index ae36d703532c..44938c036e30 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1668,6 +1668,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


