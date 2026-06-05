Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C23CCD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=yjDQ8OBgx6Ok0OGTGc+S2Y7G/B
	GgBgfcQ9GRQcM2ucWPYHEKBMpIQ2WjHg6J8Z71BkorRAxNKtI3/ARP4p8m+p+8WbYVOrSvh1MG1V9
	pV8VIvBxiD8NhndiS/S+5IJjVxpuNt01ddrVCxsMC9EWZ4AVStJrHsurcNseUvuiewfTvELL4KiQx
	gyWvwINqt6g8kxudOz49LDFny5C/uT7sjPya6Y3n2GZP33PwQAO4p7q6IjCsYuChE7sGNrrtu6Ic4
	2/fN1Ps+JaKzLzmvCQfO2rvthjFOcfJDEtOD76+64aSjpUrLQFwa8dTrQLppkidCTWQr0XqAudiHy
	GF6gnI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX6-00000000baR-33zL;
	Fri, 05 Jun 2026 12:20:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTX2-00000000bX5-3AEA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so20413155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662011; x=1781266811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=amjQtAw+R62dXB8DzFdQ0XV6g+R9hNE8s5pNgCIG+AFB2swzFvpufypz9ZZRnVPFci
         S8DDNqXFn01erNCTv3/RJk9rybAOAIBQY7yQFNk9pFKSD1UP9M7WgTBIqiyMngCa9zac
         NTENA4dP5yaGSyFXPnsUdEDlT4R8YEvgBtj7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662011; x=1781266811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=g4nMQTs9ooiHDlycNwEg4L0/mZRy3izaDqjD05B8qw+UYCLZJZglQVP/DhQSfxn/74
         nVwwsh/p3rIfvR672VXSfJxN1ibsoPheSjDzTZmoZO5evSY28zCoMqB4RExkK7tq1cSl
         UP+0Hl4ZGWmEwm0Mpj7O77hICgOztno1UV2Md2yn2wRelbbj33jzfhUkrUjW15+PiZ1F
         Am1Mlz6/wBYzJ0kQRaiYxCcZWYUwVttd7x8HOt/pqT8R7Aj2AmBJDYKgIu3E+qs8+5w3
         /zF3wI+zYwcELMuKi9mTTI58l91y9s2GZiTeR7NwnuHNy7HRFi/n98TQrslBX1OAfTsR
         PWxA==
X-Forwarded-Encrypted: i=1; AFNElJ9gKWsuIh/GdXfsMV1HP5MYTnQPPGw/9jixiiDHyBRUl8KhWiIjrSbx7BpeeIDZnEdkDrzRzbjdcPkboCZp7JaX@lists.infradead.org
X-Gm-Message-State: AOJu0YzC0/aUmrQdzAPhcx557Cg0YYlqR21+4PZJLKIEbL1ZZjxIyFUH
	Dp6SbQ1PBkHFy5IODWwgEhY7jW4c+cmW4THn7edl/yJormpgO2mpfRVH04YHw8Zc6S4=
X-Gm-Gg: Acq92OHVLjUJeuAlOEqjHL0odh0lZAK8WjsE6x/IMAa4UqwgGR+L7R8PSfd4gkhqN77
	CmmGTBuZCu5y8SlmboC+tNsojSvJ6gJHx/dPs7QuVkmh+1hfnJHpbWDf5jpfO1P6ifTsF7f9nH0
	kOler7lB9XoajYU0/iB1BFJ+n/M+Eeardjc24AHZL8mMCL86IFEU3HVpjLdKYgq3sy9BCiI7Hwg
	PfhCvoU8dsYdSR0I446olrmB8iKngA102CpDF6umb1x0oi6fh/t2IE62nuVKwXLTQbsXrOigM9d
	6uNFXQbc+3TPvXKMwTrQpfwfqpUn7l6qFu3wmn2oidya7bj0Gg5tAlPKW7SOufFHIqD9PbjfKHU
	CHKUT2NnGKI81SDigXEM/7nXTqCS1L7rH8IU1/liibZLVqNPx93tHeOeplX2FZ+oaf8VeNfzMrR
	CmCYuoE3CbUgWvnsauqF6Vw8/BlepP2S3hW8QY4MMaiUtqGVOHv0gGA1YhiUcmPzWEpJ6Al4jOl
	ow/m/G4AGvc7JPwtm/rKuGNIE5PdzNChgY+vEBSjdbrhu5ZOfOFtlHf9HrPNaXh6yCEjXvqE9wp
	SAGoxrjZnk2l/fChOJzCScDpID9scctH1WY=
X-Received: by 2002:a05:600c:4e13:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-490c25eea3bmr56648835e9.23.1780662011047;
        Fri, 05 Jun 2026 05:20:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v4 04/14] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:15 +0200
Message-ID: <20260605121957.78409-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052012_824567_1EE67D3F 
X-CRM114-Status: GOOD (  10.08  )
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


