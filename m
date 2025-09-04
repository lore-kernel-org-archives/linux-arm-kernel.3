Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A85CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQbUui2bkGKG7EBeLpHjxdTepdI99tueiIT2G5JOAB0=; b=3qBEOJY6518rhx2pkzZ/qVy/2U
	zLzuBJgenjoqwFMg7gfsUP/5nGNF6RAGc7iwEVUej9Fkh6q3L3K1Z0fxgzpJ8VqjkV0Y+bvp9rkh9
	8kB08ucn2NJxH/mjxycqUkBc/SSrAIqw3pUhzFyVqVczpzEQlP66BOM/Lyvj+o3pmRo877picZXwP
	AuYS1yIDXlbB2GPMLzBt9Sg1Z3/TTDqo37BD7JIsiWbrwRCqtou2F7WeCNLTo4hlYqFndSxc5rVjX
	i2bZS3ZqXrznnfjFP2o6ix9PiaQNN7KHsvhGociYhWgVK69YSQLrwa5ZBLuepqfkHTHSXEuCGco7h
	J3pVib3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEl9-0000000DbZY-18jp;
	Thu, 04 Sep 2025 18:32:35 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAcQ-0000000C5hI-14f6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:07:19 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-80e2c52703bso99802385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994837; x=1757599637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQbUui2bkGKG7EBeLpHjxdTepdI99tueiIT2G5JOAB0=;
        b=dt+VyJ1welvokU7JePkJ6xP0uLcSiCkrlWgmmmia6l8WjF6CFBEjToU9ijrqKh5TIa
         OGn2yZHng2UYcQCQvIrIl1+97NvOh+zb+yyY93zFmQnZBEg9PGbue7QAFDjovytL4afd
         0IOOFx8PGiUBkqiz9c5ICySo60zhM1AhertmNmoaGiNhp1ub8QHCkQreR2ICRr7u0ILs
         EpqSB+S2C3bH641WMsi2ai0/MrIkmszP1/8vviYGyFAsxVMMF/F7g0qr6mvC3aFKiQJY
         XWF/+ipbaXxFJU1g96aD5wsoZgWw2PwRMyjfQnYqicOzj3csQMNc4JbeeFllBt9W1T/Y
         jQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994837; x=1757599637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQbUui2bkGKG7EBeLpHjxdTepdI99tueiIT2G5JOAB0=;
        b=ilbJl/+M71byotxCphIn7mfCdrmUGGVt5szzdC6qorXkLpCLBZYtzQ8AhGbmridE1t
         /x5IWothJoiRugPVOs9OjIdbycZ57svCsXmScYFbesGDzY08abGHLkoT0vnpihMDk+98
         6Qg5EBAPqqf7+DECFmau1Qu+H/S0WKUW1oaGv2qCdzQP3xfvFkAMskplGvohyAfGzsyh
         +H1+Wyer3RB40oc7s2/PEL8JyfSbtwNWGUblAdJ51JH3u5xG+9YIF6MUCx+OtimGtFh6
         VShQTVHH5yQsljS4pz+NJqmWOBq4awCDRQiL6E6HoxgsDA+khdHyx0N0YRFJ+vmJGdjN
         hyJw==
X-Forwarded-Encrypted: i=1; AJvYcCUUueR+W/oLpoxkIduTtg27btaEbM+drGrrxfuQlh8apaYnFOlFci8fIYV3PLkauK1Dl9QgIbxoJhtMLr4FH/H+@lists.infradead.org
X-Gm-Message-State: AOJu0YyZKPTrLUHr15ERjtdPEyg2YW3boDdIfhELKrsiHJB0NzdT9mcj
	nTMDwDF7nBMdtZBQeCbUqIH3qHOvVpNb6K9xb7aNO/rV3qcTId6oFTk5
X-Gm-Gg: ASbGncuFkzC8z6l2joqLjhbn6agBzMA40pPmka78Wha4eX2OGgg2OEOxXohJFJO9K3g
	RlHFPIVrBLczpDU16kR/Ae0wsv9gPNfT3nRJh2GKVZ4gz2oxBMChtwV6J+iIlmlBlbPuQnq4e05
	RfXC7n9IbHkrua2qgOHoGsaCI/+jp5gTlIkOcjoQtjv64QCIf6HvS9l1uZKrob3/61QElgvk0M+
	ahSTtMGhrRQjaK9g6SyINj1ZXvUpuiM3WFevYUKZ3MI3PkJMTvOy7Riv20VwalXO23GUbZtmSLm
	MOh/3cvn3p+G68OaHHia/1sHNkvIuU0vuVNsXqD66K3nYUD1Iw9jVjI5Hqdc5upY2MrS8tbJy6D
	dk5wTRsn/z33qH8beUW/ND2qQx3ZHKIH/Mt7aUMWQ2IaBxWVOmQ==
X-Google-Smtp-Source: AGHT+IHq/xxFdWJlU+2WryWLfgdKbagbPMPj9QUjM/EX0bmWcPN2dNhctsEDsJoaBCr6UBfUzIFnyg==
X-Received: by 2002:a05:620a:4621:b0:809:e8aa:aa89 with SMTP id af79cd13be357-809e8aaab57mr909452685a.14.1756994836809;
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:14 +0000
Subject: [PATCH v3 4/4] arm64: dts: exynos990: Enable PERIC0 and PERIC1
 clock controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
In-Reply-To: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=1581;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=2QadQ6p8DLVRx/cTe7HdT6hSMdg6XZNjMfLKvG2yQww=;
 b=lhQ28jDDQdtdqkS4uzcvkeiUDTYYHpnSRGBbH3JSREg1X9aSx2b7oxOVidB1+ag+Id/8EocOy
 SdDO4lDJsJnBk0iZx1BQW2zDy23X5do+OlT4DHo+XBt+zMPTK8f3W3R
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_070718_297739_5637C8AF 
X-CRM114-Status: GOOD (  10.71  )
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

Add clock controller nodes for PERIC0 and PERIC1 blocks for USI nodes.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index dd7f99f51a75412f5c3b91c3425a63652546fa5e..418fc59fd9e9122f3059482276d3388920fab382 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -225,12 +225,34 @@ gic: interrupt-controller@10101000 {
 			#size-cells = <1>;
 		};
 
+		cmu_peric0: clock-controller@10400000 {
+			compatible = "samsung,exynos990-cmu-peric0";
+			reg = <0x10400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_peric1: clock-controller@10700000 {
+			compatible = "samsung,exynos990-cmu-peric1";
+			reg = <0x10700000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1


