Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8795CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=DwcbTzA6E4Kwl6pAASlCspQUw7
	pCrIKNUNy0sQCyGMUlLDfmun2Z2ab/x4McG5bA4dLrTFee5mDCLsu8Sw8rwdATGtkp7wj7tkhdd3g
	1GDZuLkLCL8LXktFndCiOMtWEIvSmcbHtLoiHrucPVc3pwppgG1fz5lCNzS0+y06Gij3EFxzTMsXi
	I7KZ9tfGGPtkEfi/hTNVDqIYIqnh+HfGX+m5kTyV3jn3VAhf7VEJfwklh/+QdJ6VFKZcFP0DQU95r
	2UwFcQsI02PeQzVHqqHDK6qqePDZWvQMvFjOsjGm7qV/o0BgXuD2WYhc9zA63W/iYV0DlsjPej3fQ
	yZi7nwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3S-000000009Yh-2BM8;
	Fri, 05 Jun 2026 06:29:18 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3P-000000009WQ-2Sss
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-46019b190b6so1157622f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640954; x=1781245754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=k4fi94nLvTOk+eJ1tlQOg7ws/TKYvwhII0G4gAQ19mQ5bVvlmdZPXzGSymLhYv6WpU
         s73bJUj6/l3qt3HVX/72wEMmZYnufj1RLLYC9rC1UCS4RQRTL0XM8FjMlKj9e6I9krVw
         4S7wCo/QNee0c4Et4JcsocZJ9HZ9d+oczNGoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640954; x=1781245754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=ST6RcbCd7qkSmY2mpcPwAmrqIVOd9IF6WBjb0OCkbIuK5fYplPLyey5rWL+D9HEad3
         IeT+8HpM1/SWkUKr8wDLhD7gVoDeo+5JZugU9gEXdnDJXCfYNE22Qrw9VRbaJ/qKDGni
         JPjwx2iUPXY2gzxWQpiOT4cvW+WRG150+0rJLmOl/CJWHk1oA49i96lHvYQOh4H7DHS2
         Jr+6CyorJpHKHyuVvnehBdR0A5o5KltQebnky3tTYyOlW+m+6giV0onxeC9BbXOFLJxa
         Qbe93iF2NBRS5GsaYQkTzLbKFsefGeZum/PaBMTXNtC38Fxc6NC3rg1YpuwRzox+nHOc
         vkEw==
X-Forwarded-Encrypted: i=1; AFNElJ9epq0BpfkFM3v2MVopTBQO8z4yXdrVNuwFTiNEW0LalUOyVW9WKDHScq2t5GpA4KuXJ/Ez9qwH9h34edARUyHd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9R575t92fqSHiyJV4Cv48sO0GdHu1jK5tQ/ezpHaR4oaac/NB
	VEaB2FinPYDZHVO1Q3TaufcN4zbX5C4lH9TvhnEsf4SuXqIgXNAaACL1JBpF8wiZMMA=
X-Gm-Gg: Acq92OEhU8qAUcNHH/raoty2RI4VO+1v2OQed75Xxo8tjAhvY6hCZihSLkoBboZ0RpQ
	xgrtXmcZBJ04nm+NUXzpiwnNeD0KW8LSQPvIasmRks24Cuoxywc9VyWOVY/hplcPR8bfNm1FTWE
	6wbeu/HrjcpEJbc/7aL0AepKg60v5n3o09u9Dpf+QXM6q+/FnFwliOAr8fbc0mdEKv5CjnN7v5n
	/VBNh7vDFm0a0xX2LoDCwAoVarAJP2w9hQ8OZE0GRzatPYHet68IIp8q3VYnqLqYAJi3UcwAZmw
	t7vMoUMv7kUJuxQaPGjEmxrjc8zFA0syJZuavl6woD/evyK59d/UeiwsnbjWAD8pCxayEh6v0qV
	wPK2ZARw4M61DxbFIMmr79aLHxN3gEpOAA3vGLIKsNamNQrDbQd2C+biVK9ME0wiyYiuxYgwwhe
	7bmP65gnWc5e+K7rJvZPdQCoeiMSVaWMP633vNhScFd0KN1/NN0IU+a2TAUcAxcHgJ6WCZ2BozU
	UqFL0ACHBBAkPaz5L7UrLWmHJmTGoHay2T1y+NPDSLgV3n7o2XpZjjvFRUjd+u2pKwJurFEP6/r
	gOXq0PCoa7rjL3238obJ8WTtVeWlKsSsfr8=
X-Received: by 2002:a05:600c:4444:b0:490:b9c3:6c59 with SMTP id 5b1f17b1804b1-490c260579fmr26752135e9.29.1780640953655;
        Thu, 04 Jun 2026 23:29:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:13 -0700 (PDT)
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
Subject: [PATCH v3 04/14] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:32 +0200
Message-ID: <20260605062900.368376-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232915_645698_5120CFF1 
X-CRM114-Status: GOOD (  10.16  )
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


