Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E555DC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRBLPmx92VoSXdxagzqJ2+naqi+PaAYwGcy9TRSqAhs=; b=XZgbuymfES97W0yrFI9y2ZTiq7
	nCmkgXSYHjUVelcmx5Rc7Q5lPXtEyJRoAApjdaQQ1Rt1TN2Myv4nU9tFBRCDFJuUnbm04QB4Sqr4g
	zQfpnK8Z0rAaiyrf/MKklRFoHQp47JzKo5AcU2Snom4+NQ6eeaT8UZ6SIRa7ek96CjK/kJ4cDY60h
	UiKgy1Dy/kEtRlgseJYBnbTRvZhC9HFknIWCmHzwRJOo0lfuVtzggQYLR/MjVE1tIHG+rNOIkzgwj
	65HFGJ0cUemvPqRGmEj/ZjdRxEG4Um84fQ9H1P+eRNKssggEA6CwD7roP+cMRNvR5fXhRyBBvQ/DK
	1AR3BxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyuP-0000000BFOW-263l;
	Thu, 20 Aug 2026 09:18:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu3-0000000BF69-2xTF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fd66a094eso714647f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217458; x=1787822258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRBLPmx92VoSXdxagzqJ2+naqi+PaAYwGcy9TRSqAhs=;
        b=VDKtZcyFzfJNiNBGJSRGHqp17Dpm+Mz9NobN/pCk5qToSXx0Yv8xqU3hWLTeuEhyxa
         rIp6bMnuW60rrkAjMwxJEub/MOkhPnYOjEtqFbLoXw9Q+G3Yh7wFSkXGvwijWtf3G5Eb
         iapdKkpHLP/0KPXppqdw0seSHAmsPmBkUmv5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217458; x=1787822258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mRBLPmx92VoSXdxagzqJ2+naqi+PaAYwGcy9TRSqAhs=;
        b=UBjS3FJli+5r2eS5ylvhs76aBOygIYwGMzD3ASvxSloR3s4HTXeO9GtfPc2nFWE0/z
         h8u+oJMLhqRMY1l6fbAvBAFho7RYKuKECOACIBbLikshOXQGHk1mHaXZPoAasJETlMtY
         IZHdKrhJf0Isv4DZxE0ALRART+Ef4R2Nj8XJjJmKjBs/dYqT6i3eMLf5MJ+7qkioD+Xs
         By9aLeXS0EsdWhsh4LxfUJtbdbdIDByLGknfy6NCLOVDdT5VNJUbup3aqqESKY/REG2d
         B1aVKhZI0hKCLHkPIHiaGHfEeoqzg+XbdeAdmb5TghpsnO66o5dTfMFnRWzX8uLSJxia
         7uLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM/9bzAT3bS7bVJez5MlxuoLifK7DsbXn6wUBeyFPv1Yf6w6hQMtR97joAlMkXFnZds0j/2VkuLoWmlvI1hNHq@lists.infradead.org
X-Gm-Message-State: AFuF++nVowvOpke8IrVU25JC+Z1bq6SStvf5H0EMARapveWmrMLB9+pv
	Lky1sMGLL8uD3ylID0+1EUubTlTZDeHl1rIYR/9SNmlW0GmluYS1siEMSlooccsvZpU=
X-Gm-Gg: AR+sD13vJF/PfjHGe05dEpCRPs4gW8J3O77tUsqpWQnly7otI7Lc1bMy5KKSJtCPJRl
	EHA4pLD5Lb9QT8RWqKUP2ZOVngjjUdMiT4YN4fKamd9S0s8bJvxqNGc8cNEc6SDjWP5CYgLpYwZ
	vle2ZwapNvY51O3Jq+p82Qa9nTS+FIihe+Xrdp/bmZjYJ8qmx2leGUH0ax9TGNheKYRfoQmGCrq
	UvwxrW5mlsFqHHt0eWDKztbexcwM+K7/BQKqm2/Z9YtGL/CX5HJpqaoEGAwJ2zEvLQoaGz23FXM
	hSCtfyyjkHetelPl1SUljnmzWXBzXy3CGKezuk2uHb5ZOlyoaQSeA1NKG5qEu3XUuX+lOyy3O/3
	YFNsxVDP8zxPmeidXrO9l+fI3Uh67BCfGRCL62eAUHH/4LEikQeBz6FOvviT26fj4gxy1e8n8U+
	UOHi77EZiK1Zh2Bx6VEAb5iitES1PKcKDf4QGlJnNJ/7hofa9fbz31z96Nc/mETX0Cj6zV+aKW4
	Ytrd6qIAqWrLKoOZ47p4bUuqAXRjOA7VBn3ZnDPw7xcWjEXEw4R66o3ng458TO8QlQu9ukAZgq8
	6Jfzwde2xYZoYko+itVrLTqCjDjvLEUpR84HPq8u/4b+6WLFgIQ9hMQI37INpA==
X-Received: by 2002:a05:6000:454e:b0:482:b886:4ce7 with SMTP id ffacd0b85a97d-482b88654b7mr5730485f8f.12.1787217457904;
        Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
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
Subject: [PATCH v8 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:20 +0200
Message-ID: <20260820091652.43541-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021739_774209_974F1F2C 
X-CRM114-Status: GOOD (  10.59  )
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

Add the spi1 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c816a6aece47..4e570e2e5157 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0


