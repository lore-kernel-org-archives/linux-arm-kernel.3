Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F8EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=; b=KNMAh9OwK6CIvUkGLyGxApTFNt
	APp4F50xKp91CJtiaPIlPflKb5sNqnAnQQN2ex3yOQcyrxZZzrF5YMO+BO85kvYFe9Q7tKwczrqjp
	av3cuIIy5UG8BYvks2/XKG5pz1eTb1lF42/bGHqYlvOOTKX6MfTYHL3iZia7WU6N19tvnWJPQ73BW
	upoKABaYt5rS/Wlsz4X6Ov9PupMJ556MbJG1AFEhQN3SKuOME0F90P4PaxyxoXQVfvcyavzEBGqaF
	Xn/8Ah7yt+eqS/QJkNz5KKwXzNXnFBbh6/Te4a/VqpQu/zPl+HvRpdwPnS+/N8swci/HoWAFqb4ww
	ZtY7lZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkj-00000006D5a-3uVu;
	Fri, 03 Jul 2026 06:51:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkh-00000006D2V-48Nl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c0e124d2a21so19812266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061514; x=1783666314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=UF519eH3LlQ5bnAL6S+i2DyJQakB8KFZnrfM0vqvx7LSt4vObPTnbnzgYXrnLBe8sm
         zBmoJiD0/ht5xhFXx8ZXEnO2UMyssIBdBgeBIMg3zyKnxhwFeNgu/95GVLiVJz3KyFDj
         KMpm05ubP6CErr/Eu7Ba+QnIv2VSSdKYxwFwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061514; x=1783666314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=LOWZMtDcCcxgMkHTHj8elWlTdpG+nxfUOQEdBNbIv9Xzf+7mQYTbK2Qa8ptQumbBUL
         qD6zubQ01m/5hC2XHxeJEHHfseRF/JKyCmd7/3z4aMkYkcrZDuBfhU+BKU3XPLoZUFX8
         eg2hjn4l2gf9uXdl6jo7Q+3GLt+6xwDNEnCf6iUVoG8wdVEQDfNne0GFeMGLnfUi4Agc
         9etMVpSKWO/NArK16Hy+/IVVh1NcH3q8H6UEVmz2i/Uby8Z1m79VELvbwNRgDM+eM9/Z
         iN0sQrMKTwXAxoAynV8y0KqKVQERmr0uNk0c/ltMwrtsp03vORrhyncLbj1IBMzuO2VH
         fBwA==
X-Forwarded-Encrypted: i=1; AHgh+RqlWU5iB/Ubms/8LeGLokQHHxR7l52dXUk48UPgpUp+mB6nMFLQgV9brSPvLb9zKW2XZkckWr97D891uAZvfkze@lists.infradead.org
X-Gm-Message-State: AOJu0YwvqJjPQAVa6EuVFp1gqa0eNtehUh1vqE3Dh5D7gHEcBc904uqI
	hzWBMoBo2/dj803RdLl2yyb5uxOfecOcdQaJOYLjSLJEr1EhBLtw6wgXIBBRdupAGyo=
X-Gm-Gg: AfdE7cnK39xIeTom9Dy4q489/7PBmQ/oyemah1kpU/0aic6J6SqwUiKIlLbWT2qCKXU
	tuIi8rPsNR/Npd3gAl/yLoi6MCUFmFx/ZjO7zge6xi1Gu5MphcqR7fHhfFFyVCHGgEx9Ewlagrc
	SY5avzvpxB+eApOQWvhsbNd88iogm3vWMewGqWcIzBAFe8SUbSfNyP0Q9Eik6EYJpiHYXSuHBC4
	bMBb5kbqqKADMXzF/1oz6UrZDNwzBWoTl7Nk4/d/IKv4KuAr5Jp6oCZpdoh35aebNjKqYm5CGIm
	hAbJlJvzmhnuvc2PUgr9+Hee2+WU3RvgBtZ+xTLvyeVVILwEftxvgs3V5jSH4xbujoCQXuX/RWg
	8dsovIYkC4M2onb/o+iYw/J8c1WyTuFVfYzwXiRu2IJJc/rjwYbcHgeBR2hZdYXreaECFXEL7sh
	K0whZTjjsVrce53EZmyuWrZJE+TfHnvk6fxbY43wuAFEmRNU0IFnYQyj6UZDvTt1FlOJUh+sCue
	rodrc3FyTs=
X-Received: by 2002:a17:907:6eac:b0:c0c:bc4d:77e1 with SMTP id a640c23a62f3a-c12ae7af191mr400864966b.37.1783061511326;
        Thu, 02 Jul 2026 23:51:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:50 -0700 (PDT)
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
Subject: [PATCH v7 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:48:59 +0200
Message-ID: <20260703065110.1433283-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235156_039362_AB973EB7 
X-CRM114-Status: GOOD (  10.29  )
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0


