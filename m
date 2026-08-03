Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207C6C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=; b=eCrdSb128vk0XASqQ15sO+W7db
	vbFbSQ3h27Dd9wMSdWyiQBzcjffS+twrdLErpMp2RaUMBGwi/HP8hYPrmsZJvHuAHGjn+V36hOe6k
	63tYJK/ePGWx/tN3uosCX/UZyMGLgXSiChI3cpYXTei0wK8ps1G6jzXTqQ+ORBc4CfmE14viRKamo
	ZFmKoOltNMBYvrEYzFU6T5BuKsaWpml+4pzgS9kkw1Aj0+8f34QZ29O9Nc7XZNQePFHgLwZGWabiD
	TLLhnxtbX6IUJFW9CxHT//D+LpqB/MgxrwvFb7J4jGdn9LiC675U/fZN00vwS9a+tk97uaiLacJqe
	t6hQXPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKH-0000000GXcU-2utI;
	Mon, 03 Aug 2026 07:43:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKF-0000000GXZs-0zc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47f84023916so3069994f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742985; x=1786347785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=CWuvuxKwW5Y5kkcqWjbRs7Ye5vZukigfLvJn939F8zNjvNbkBuYyefoGAHjlRGzYpf
         tShr5AVex3n1ubKCMU+hfGyXpvNGSZkxaYVDWQ23Db/CQmFKojjOwJBiBSYyFZLIXiHE
         PJIG4d7wK6fw9rYrvDGqW3y9WRJfxXb1YHmfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742985; x=1786347785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfOZA6iVrDUHFVdgseSiT/wEZUNJjAsJQt2ibv2Z8NQ=;
        b=lAXasTa7+ZdPFsOFOG7y5OFo8jVa21XNAFlP750jV2tIADeG6Gssh65xrMXw1jt9nz
         fxpf0PJzZB5iSmlaQDxX6YaNPd0sfjzhnRG2Q6wNznVJJMhrYXV3UHepd2Mt2LgC9LOs
         h1s5LVbwTNpOvZe8PQDKu8VV8uvC4poKniCe9SjeMHIDMGdHWBeZro3zbixcGxGPnfpI
         EcOlnej9a5eFBRMNOqF+TcDJ/hq49npdCkU47X75JZ0PEBP5ph7U/f9OUTkSsPKim0YC
         TEu8NsC7HfcKYvH/YaEOvOD93190b6nkMq5N3OWpC3DQKwR943kINaC/02QrXq6fz3B9
         m9RA==
X-Forwarded-Encrypted: i=1; AHgh+RoEHlw2k/7neuHL6e42wu0LUlj31/6MDygQvlPSaIY9nFfY+5vWnR1ZzFy5jsvqYqhng9tPuZW9/WU6ByBYR9mj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaq2yigMSg2w0gu1SuJVKwKZTpwzlZ/gqK+KxnHyNzROLDNE6F
	BnKiE+qePD9u9hgIaPSmi8BU70xR2ithIQ5/aaGkV49vypO7dLDBspUQ2BKuGEReWus=
X-Gm-Gg: AR+sD10e54NNU5RdKzavvx7GGSDyPtpTz1sUz9Cte/smCgM2BgwLMlBQW7QzO88l0YU
	2jUnSewSLLki1lFKz2+80M7fM/8+ZztXsXqdBFyZ92lw75BAIG1YiTcuNKd8FR3/Oc6ua3O0T6V
	tQH5DjV3IT4CaQyb4byri3FZ5twzT0A8M2WCiFLQ+Sh7Kx6NMlQ872CctuHt7vnEHaDNytB1VmK
	bHBhGyv3/kEWm+sFyrj6PTtrL1FP2seh+IzLl+JZwv+Ft2jg11nyee8+NC5JNHgIAoewN4E/ZAh
	yesl9OS1ww83OCRB48YSfweFitAH4QL2956DWrjHl2wQsJJB3zdNBwQRXPf7LcmPyUeEV4TLksK
	sDKfbNlJapBT7Y0LQCi/nK5cCAIOQkD8qENUu6FKYPyqBGM4Eo01R/XoP9zbYmeecWBNRuGAA1m
	UdBhPBkPgJNvlc2QCyf/3B9Khv1E3eKrmEFIHeCqDe6nz3xOeOokwjJ1Ksnb8HY2kKeV/ZLLl7h
	qm0Jhy70mqUY+OhNa4hVRhzET9inSEzI5IqKkn0e7RqDOd40b3FfV28x9+w1k3j4SpwPWhfn8Dk
	4Nc5JiK412p8VXwcGdRaT9xxgRY7QqK25ollL8dBeiuXn2PhDw7d/jvJLiUUR7aG
X-Received: by 2002:a05:6000:c90:b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-47fd72db353mr18775887f8f.21.1785742985580;
        Mon, 03 Aug 2026 00:43:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 10/16] arm64: dts: st: add sai1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:05 +0200
Message-ID: <20260803074224.3821911-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004307_292844_C717D916 
X-CRM114-Status: GOOD (  11.10  )
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
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

---

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


