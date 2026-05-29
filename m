Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC9CCD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=; b=UVJfMqRYurAgxA7uug9yMqP1LT
	Y782BIvYfQ+svJIVY9+bgRMg8beRgJWHoAj5UUSc39pu2vqgOL8t6BULDYGKwGJ4Ub7K2cYCccdrL
	1qNKxSZkJ7OplufuP51MrFd7K3MS13nA6xtGxtgIzahaF3DxTLW8rpCaj2Vp4aD3lKLAJW17+jdnM
	sWa8mmUVb0Fn0HtB4enBIOPGv8c5jUk/o+MNQFea2edQ4fOsT3UjFm4N/k0IGLUQa4u2bsIYykH5Z
	kffqracMKEdyIBctTVaMHDqTKo38A297F+xaxWSmGIGF0/DF96a/fxpLczTLuGPb192qpZ017UdFW
	OYl5KpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUp-00000007YXA-3ZAv;
	Fri, 29 May 2026 14:47:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUl-00000007YSx-2VGQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso50915745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066050; x=1780670850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=eEOD/hoTKVkJi6mvAke7h+6/csm1Muj920i4i36Nr1r2XHGMpn0XBoLkn+UGfdZWEI
         +tUxh1qlMm+iFP8QpiaBZhBYJrwV+/5a11Iu+1J1SXxROMLtFW11nA/31N5xggYP1/la
         ++1WysDsqXCdDJaErnxbDYkGz3d4Kk1/gvZ8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066050; x=1780670850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRVbzjeKV1ymytOpSDZJEn1esg8I6P0sJ/LROeeCjqc=;
        b=dL+1j5rvcdnLxzhGjtZuM8OiSLkotHYSnDt9LhKFABbvXT0S1bAcg9dJp+vE1FYlNh
         4juYkELzD0V+HmQdHCr7vna1MD7o9eZ1MVPnUhsHS+XDzkEizObB9vCMHlbsHDBVFIFb
         aCl8NDFgkl3Q4JtVTCHxpvlV4tSwinQDZ61HXPQ/BqhNraHQx4/CGtfRwbM7GyymWwdd
         AEAuGz9quxT/vxkZ/0QZl5cBSOwpNu6vjh3rOd8Po47xuhn9ysgMFtASlUVysiPeIvUN
         aidEk+/V4V/QjITBpzlvOOENIxTPYb7U2c30hc0INwQjq3Au4W7PPPhBvv1Wg9Wecr7N
         w2xw==
X-Forwarded-Encrypted: i=1; AFNElJ8mcwDX1NSCKnwEnoLB6D1PhVutY0S55gbccfZR+QDlBcwmqA28w9GGLMHwz1v7zhxX9FrChN9FUuLycaIbbYjD@lists.infradead.org
X-Gm-Message-State: AOJu0YxeS+WTicb6bUh1ZbBPsq6cOWfubeSVSk8zr8kQK7cV48/W4PHo
	yiFpR8a2d98aGMDOnZvMwA0nGK4pc90pNO8e8hx4KAgdlo0niJdUG1Sxq4JLmo41QdA=
X-Gm-Gg: Acq92OGJ8zrKyuidN0YkWEaLAyF1cTEcxwHtSlb8Sm0SHCVtLcEWd4SILd8KSY83bN+
	34nRq9k9t+2Kiy0XEHStiUfWrYK4zGsRX4XfPT/ZDuDZ/vN4CKMopY1p3By/le4shxUahWjyWu0
	AMT4mEl6oNjTjRdlBNIJ1yXWJRM0WjH1b0CDhYfHWbLQjl8L3/WJiBTbYQnV9S+pWayvIFV+wEP
	locdqr4eQGRI7as5fdVpAV+78zy39p5vSfzKk474JNiwnenZcxcPRAgVN/XFN50EEjv0otgOT6k
	e27Ipwi2nLgycK2LUGHM8G/peXYIIkz2n3J7XN+3HuCyyyUCEDveOMK6WYH+iQRrYquMQPlSQYK
	zGNHGdIWCetdHh/h7LgYWXVWwt46FYuP0e6SEj1ARwaT3meAZ2Ped8Etc+Pz1E4pRoKUMdCxIOH
	IhN0PWQ44Lt70ucXv43prLoMzO9A7kCtKT7ynzGMKXgwKDVNIUoypda6r3Gm5jntdXgJzZQYIrG
	LXKglObZaiqF7O1TaWpQf5F8GAJtuw7IweuPz/UPCqAA61q3fU7BSbTAZuvI73xaZmQjA==
X-Received: by 2002:a05:600c:1d18:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-4909c0c7ad7mr58250095e9.27.1780066050002;
        Fri, 29 May 2026 07:47:30 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v2 08/15] arm64: dts: st: add sai1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:22 +0200
Message-ID: <20260529144707.3931919-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074731_903313_B984D738 
X-CRM114-Status: GOOD (  10.45  )
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

Add the sai1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index eab8ebe71660..ab1e62cf2bfc 100644
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


