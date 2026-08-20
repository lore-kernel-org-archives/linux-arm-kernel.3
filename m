Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D464C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/TgA1ms5o1kz/OHwnBtI4m8pkTBDPOZtX/J4iEGrn8=; b=Bf5xZWI02Yq5G7aIV4O/Eqj2Gw
	uenPbq5UoX0cc5F6hA+tfZP4kkiM6uFYWMKnCRStzGvKHlCsM04o4fiayeBLk/IzhghSFCTSDth4w
	dwc4dVNXc7wvDsfKkUUP2rkmg7cKeRP0R/07Ldk7sRfdSxtEPqiiN+JS0N77mL2NVuvgWiM1x0KGx
	A+AfW3tQcrBcGZMFrUo9foBlnpw1yPWDvmE/K1qkyVrMNmJujTIJByzhMuOpJMylStyk26GMkliDF
	g9GQZh1G6epfE1VRuZBgyC7pnEM5+iOcqFyLVQaeaQzDSF3iRwEjH3H+EsX2JRtKc7OfgIONL+h1p
	zucrrBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu6-0000000BF8u-0aMq;
	Thu, 20 Aug 2026 09:17:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyty-0000000BF2q-3PLZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1359940f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217453; x=1787822253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/TgA1ms5o1kz/OHwnBtI4m8pkTBDPOZtX/J4iEGrn8=;
        b=YooJeOEsdBEKNakEnX15Qq3OHSE0swqYgLiwVnlHHc5drDBhDQ2kFoUs0KVrcvY7RL
         Gry6G3YrScCua/knyo1jcht/MsKwyjIDbr5bd7AAexTzNLTTttitSzdn+7ZS5a5NNv2o
         Deqo1J+nlnq0ic3DabKRsXBdOyifCWgxYk1P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217453; x=1787822253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/TgA1ms5o1kz/OHwnBtI4m8pkTBDPOZtX/J4iEGrn8=;
        b=pa7XjuD3Enduy0niyj66V3vFb3cLQp6VC0UxF8k1OJVT5bU17S6sGV5OxN/FWfXwFE
         qriFcN1+sWyPGDOsUEXzyefNyy+yKiqSuSZfjvMeeGNk86uumrlZxLU0PjRQprALdT9j
         sUxykEWglNgge0OA7JqIX5yzBgDis4xFrp69ZcTl1X7TL6hYsjRxofkLnRgNZwYhRbUD
         RfW6Twm3rwk/Q+Xsq/tRfNzUh3IBdR1JxvHeOFVckIHe/fqBMpWzl8TEK1i3PCxdvmrx
         RROHfd3IRQBM1B5fuf5xY+xoq8Zzu5YPsW8iX6vC0OLAeWMfEt57Lxl0n/U2ndGbpF8r
         H7aw==
X-Forwarded-Encrypted: i=1; AHgh+Rp64C3Ym7DE7NbOZ/ELGnlAlO9iIKQ+i2u+h2b4w62Euv4PWHHX+SQ9VAxnz84DBuiLXoOx7s5gvXb6NVEXzNkX@lists.infradead.org
X-Gm-Message-State: AFuF++ljGh9yos5XDiCDGj3cDQwZa1G4fQAC9xJucyUtcXIWFcCnIsJP
	8yHqtyHMXYt7OuwoLFDOUo1dDlzJdt0LHOXxLxsl1iUMf6Lt3A+MQzvlvOEyiR8M2bY=
X-Gm-Gg: AR+sD11yMJLBNm8ZQs/1EWmu6A83Fvs0uS6X52o8ud14Nbje5ORSAQytoEqXlBlNsS+
	ZBYi7PdhojRIf3W2W3h03VW8n5QHluBzUXArxOa49Uxaw9VoWyPSTTg/EH47Lzs2GMuwss7uej9
	u1yTNR+v4Tie58pcdLCspR3/cplGbtRDzsiarxoEIQPRY75a+WUKFkIzWomurFrCStjEHgRaOHa
	gXLuI0ultlAMzv+fUPk0SXTBAXJyiB0TvEy0ypRyP45QHvgvaW0HTvl1TyQlhShcNTFhxTMSqVi
	0/z6rDW1ipy7O52350TybCU0rXOhxGAF4KyqPP3QMNOgE9uQJZspNFqxidpomNhSThVJfbyRlU+
	VFyEgjqFyPQdXF3YscICqSdI4iBh9NHlqQV1M+o9OdNuiUmORR6NZMh5PQZ6FjmqVGWTrsCWDiC
	eadRK1ZNWRydeUpV0iF72NncocTTDeQDzHiLxPNUBClbKEIkvdb2Cz7E75sf9ee0DHLRohUoDZu
	r0tXHRUDA8cDb1giCitmxPh52YZ6dEShDCuQO5NoT5BEEPHUJ+UWLOd2u8/R5pMVEcGPPsgIpwB
	VVnNUagTcFhPZ/HwMHDvCS/ZsJ/0H5CgbQgQh7+Y4Q1BklFDms30YnScD8Ez1g==
X-Received: by 2002:a5d:6f1c:0:b0:481:bb82:3f31 with SMTP id ffacd0b85a97d-482b1e9cd64mr19985456f8f.10.1787217452857;
        Thu, 20 Aug 2026 02:17:32 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:32 -0700 (PDT)
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
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:18 +0200
Message-ID: <20260820091652.43541-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021734_868184_CBBE3607 
X-CRM114-Status: GOOD (  10.94  )
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

Add the sai1 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

---

(no changes since v7)

Changes in v7:
- Add Reviewed-by tag of Olivier Moysan

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 695c9d771853..002fbc724b9d 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -520,6 +520,51 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sai1a_pins_a: sai1a-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 9, AF3)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, AF3)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, AF3)>; /* SAI1_SCK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 11, AF3)>; /* SAI1_MCLK_A */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1a_sleep_pins_a: sai1a-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 9, ANALOG)>, /* SAI1_SD_A */
+				 <STM32_PINMUX('D', 8, ANALOG)>, /* SAI1_FS_A */
+				 <STM32_PINMUX('D', 10, ANALOG)>, /* SAI1_SCK_A */
+				 <STM32_PINMUX('D', 11, ANALOG)>; /* SAI1_MCLK_A */
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_pins_a: sai1b-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, AF4)>; /* SAI1_SD_B */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	sai1b_sleep_pins_a: sai1b-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 4, ANALOG)>; /* SAI1_SD_B */
+		};
+	};
+
 	/omit-if-no-ref/
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
-- 
2.43.0


