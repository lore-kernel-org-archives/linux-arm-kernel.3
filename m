Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFFACD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=; b=enVwStaNM3xARIjNbApxGtBY8N
	at6QvJNdzsEAOBacs0MKVKkyLdYD5QDTlkYNPk4/pGXHIDwWBWCP6V7bvhCKlxFT7/MWADZfQ0SAa
	f9owUlMknuOQNJBNizKUpi+oXPFbne6HEVikbdnXgqjnx4OoKh74rOgyIuxuITHoEXbrzF6IQVm2n
	eJ8515wwVWeUhQJa6r/Z+KECiEGS6I5XMfz5iQtpQGKMvdj9UI9K+QhA/O0J4af3NvRAVOUL9v3MK
	nDPPvAWCM0NfwwcvgrxNJ26noq2jAQCHeBw3tOeR0PfH4gGaDd1a2jVcqSI8YMYcKIyafHTkMFdwq
	gPPhQ+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyVC-00000007Ysi-2fPy;
	Fri, 29 May 2026 14:47:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUp-00000007YUS-0wxl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so99239055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066053; x=1780670853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=jaJmd51e0+wrURFuhDjwuyTieF02IlryMhCRx1xX5PD8LqxDe9sFnhq8lWCpE0z+b2
         qktSnpRkSoTzNgKLdtIPeTCxuL2Kfy1ktmrKT/DbSGot90YPJXVcpo9NSI+xdqSK4XgV
         OgC3ZAOjOQ2sEtxHYV2nG3xoHRaOwmZdqmR9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066053; x=1780670853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=M4HlmGq3CjunylGE8Hml5vZPw32Z/sseLjzG9gIKQ9mjFoZ5y6M0Cs4LGWOAt6J0FT
         9x8c6c4UYUOuTtiry9ILrV+iFlFU9spkDTLracikr2D3c6HxgLFuz19iNzmkz3jKhHAi
         vZQ5ZMeTcYiiYVC7ijB1D/ve2H33ZXEt3L/c3apXXuaXk4xZeK1nUaLUUs91/AZSWM66
         FvSqMWYqxrMlOgqPhiw8EbyYx+GlM4ovaDowNkTBgqShBNYpCY01HBnmvjdBRUp0wytI
         JIJDz+USspYgIBBG9ZavOwkgmIFxRCftVMl2JMbkBEqLPpJRKUT2tsuD50bFyWApi0L7
         Pigg==
X-Forwarded-Encrypted: i=1; AFNElJ/CYoL8TXV0Rf2dWoiCnSbGdZJahTpRJjbeMOyxt5Hd7/bUXIQy/7tslL/O0jpX+cghd/3PB4v6MornKLsD1eSQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwuJCmTSN0fTK81aPwsRrEarsShHYexhM9R+77PoKIH7FHe5Eet
	vNFFkdP1h9ptXO/RCnvWMYQIadY2GtWTAPUu7cUHxKCyihc31LprQJmA0dfyNfhhRCA=
X-Gm-Gg: Acq92OFF6GwIh/yYrsi/S/p2k8JztBXxBANn5JHaEG29qgkGxZrx0vgri79aKZJPhei
	mcVtI/TSK281Eg2DMIvz1Cvxd6GagkujytXBIAIgCGzhc1fuCeSp5aRbUYAOSPixeW3+Q6Y3WFj
	jY4UwlelYSH24iPiBPIY7/H2+GCCjCfrmwtNr6TZVJWbOzZeLIPS9eaAEkF74G47Xwm1RZaU5+3
	2WQItzUL/N7a4l76e9dnKfqzNIY0B3z68Mva+Pl0KdX8oGc4fORR1l9bruNXq+QnGjNyt/Tduz5
	rIKfVTK/pAIF+n5NxeKejpgSXMjLI4Dw47y5oqKJw3HNEsk8jXyOQHQ/DU9GbkD6Hs++E/E5HQm
	OSrf+KyPyQkq4Y/syK5MctqDxWsc8BlSGAo97UuUnpm4jDae/maM266VIX5c0OVoHB/WtCez+XP
	SuQmhjb98laRxpjL1m7Q/U0tDcP2qiwH3AbKDGB9lMKMUxchEplKRSboxZNE+WuNXYmBDKss6Cw
	u13ya7x6tomOOoUkNAeFXptRatuEUwkYfBy5VbmhywJy8njmRgWebtahi8=
X-Received: by 2002:a05:600c:5298:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-4909c072254mr59473585e9.4.1780066053568;
        Fri, 29 May 2026 07:47:33 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:33 -0700 (PDT)
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
Subject: [PATCH v2 10/15] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:24 +0200
Message-ID: <20260529144707.3931919-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074735_306189_4AD943F7 
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

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 62f898a55d45..46c5197dcd63 100644
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


