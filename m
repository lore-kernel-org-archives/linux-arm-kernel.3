Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AD9CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=; b=do8gMV9hbTbWpp4CqfnDPIRPLE
	FfGl7uxoTwEUlKjK3UPAow9x9WRL4erfwhLcOdeTnR14Me8uSyIfLxaO2aVUAqP44cBF0x6eC9qze
	TxmGWLDiuej+WPqADZNHruP4zGUki1mep0xDfE9HntENb1wHJIB3GBj5fQRgPHmpiLODSlvmi7eUN
	f7nrTIIXbGg19lkVXhr5m0CfwI30clkRgAaXBFZ6/ZxyUGGd/5J6q1NtzXQxSdOK9MZR/LqrQTAFd
	4zzsAJzYG5kWVXvy4O2nxmZ4Owb+IW2zxS+dRW/E486KXa1xN2qOJq8WrKamoiS3v1YrvGrLFxDXA
	6Ihnbi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasA-00000003jPq-1RQm;
	Mon, 08 Jun 2026 14:22:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas7-00000003jLZ-13BO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-bef8b97655eso859290366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928554; x=1781533354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=;
        b=gAZ/g1T9FT+aN+7Ie3T7QAHnRGQNcigeRsLPz36enqS5jL7v1BpIj6sg1e1xrEC147
         xlAWyKoKUzgSYhqvNJVHEUH7W9OTYTMilPaJpjgOYfrSPqM+JuAMOHAJdxauPtk8GzVc
         +ARIwSGIz2xWdZ69J/OZCEAn6+mVPE54HsZcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928554; x=1781533354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yc3m6zr0epBkIc8UOZHvvBVuU4YMP+mrPgxq2NBKnzg=;
        b=fxurSexiWZjlkN2jgnSEsuBL2IEuRxvpgrMfBtgFpT+8aAbd54tpXQ2jhQ4nsS5x+c
         AXsRgxwrMVZIX/3XHKsWkZYE3zrFyquJCYVp/K0hjFBBSpu3bi+rXNx7rftlfpIzx4eg
         bGoXAK0wDRZk0MUWSJlN3Dn3Lfh5GwRWcV5wpE0ao0Cx4nUrLgFowNbNfkP4MnAL1Ygm
         4O/dt9vADitqt9JSez+urPwU23ezvDOxQz6CRO3Xigre0ZuMrnbRanQ3/51wxii0pAbJ
         Tw6gw+uZ8g0A0YUXYKjgf7jM8mGVsx+0L7IPwJ4TX5RsogUyo0j3DPaEouuUK7NswIKK
         ZIaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dziK9KyCq44H7aLAK1hk3Mz4zp/81YiVV+GSOVajsohxT8QbpPdRrSlN1XZukz79g1ftc3/1Y9N/sn1Iyq1SK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv8K9c96Tvu5dWEPSC/bkfzlRlWtIpGzvWi0lPbGw4ZsJhqmfr
	XfljQUnpRxlLW0jMIl9WT+/rKl1T5ZtaGOOeOwoun6bT4OZ7znNL4KMCGxqNDkNKekg=
X-Gm-Gg: Acq92OGDaNgbYK3EJfoawa/dyEDgEDW/0JV+TFPg5QT0VpurEdA/U+r/3yZ57zlAW+s
	m0Tyk54GlYS4ndwxAjKXTWJPDwvZzbSZvgafVXydx/59JeuP1db3PjlllCRp/W9qKvDIuglkSbG
	8mkERphfId05GagFsaJ0gqbQ8ROfz2nlgPp4H46CQY5XQ/tvdwh/YDD5e6uF8I3DKhudko8l2pP
	eItVd5/pXg37C7XoAPGZEZ5fRuP+uYbNEi69DZZccIDvZR7Ao8Z9TT3P97A+EUgZHWIlN3b4Czk
	eQxaYBZmspE9zqi3ImiWS/+qLfn1Pn6E/x9VWG/0dO/3syW5tJcSx5qEObLmBJhPYhqh8Spz0PW
	07CcEUxWCeyIzyEwEAkz0di9tcGH8jog+xpCMG2rx/txoysOVOd4Lh8DuyQAxTHKGeA+NSPz38r
	mrLPoUcq/X27Yn4/bjpKVBp3Il8JK4EGBMePP7KJdSi71rPl5e1VXH6CD/2VnVZG8XLn8JDJva1
	KYwy3sKaqc7owj860WVtlTsD1Ft6TniQbvU7N7trfGeu+Q21n572fUe2zI=
X-Received: by 2002:a17:907:1c83:b0:bf0:e345:68b with SMTP id a640c23a62f3a-bf3a8f1269emr641900566b.18.1780928553442;
        Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 04/16] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Mon,  8 Jun 2026 16:20:21 +0200
Message-ID: <20260608142221.952245-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072235_324400_E9B176B7 
X-CRM114-Status: UNSURE (   9.82  )
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
index b3416c928c08..cd85527ec450 100644
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


