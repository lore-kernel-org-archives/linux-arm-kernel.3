Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025BFC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=; b=2moUfJgnW4ljblk2iyk1Twgpmg
	ptIToXOgO6nsSGVW0fprWprAlfiI0suSbFHYrow/DulcENYOTS+JeESBSW7ocTV9fy/zeL4a/k8rk
	yPqxmAhXQ6p5+4uN4610/C44jy3dIUqA06ggmXl7IFMkqupYAQtL1uUfe2XEfmSeBglR5ArJosI/d
	Ex8YnW7DkEWMYXCuYno4jagEpHB/aV4ci5XZryVDk+1wlZJ6motVhxoOnX5D7HJLQfczDQNOrXWP3
	VeNqttn0T4YpEy02TiFHwYnbJZ4yfxGR52nt1wBGmE+BrCQX6feXqtL0wYX9s0Ii+QNWfh5V7Xc9Y
	ZXK/rXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkZ-00000006Cts-2Yqk;
	Fri, 03 Jul 2026 06:51:47 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkX-00000006Cqr-3i56
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-698aa75d15dso375429a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061504; x=1783666304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=qZTFaW7Fz5FATSw+/XMFE8BTnG8DuxW4Yt7h3Sx+9tXsXvn4EonSK9sXG5EqkvFyca
         eyh031Ol0PZzIMzJX3DBhi4vNlV5QklYStNNwyMi4D+lmFt52/JbOW1I2yHYUDuKy9FS
         kmCRVD5nSWqmZ6M1oJfN1EmjD0K8nc8qp6NdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061504; x=1783666304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6RQlMNeIE75J/aKW5bH4o7BGOBdS+5uo3qC0b6eFZs=;
        b=IR4GegwrGjWC529+eKp5YapoIVA2w1JV00Lkt2FvwDReQtyiI3wbY5u9FGCJJJFnaQ
         Z4eFZork4LwAOBS6Vac0ML7odXfJWgfpmTlD6xzbHaMicSA8WRiFpauzuaUhHqKdds0R
         k9xPs4isABC9u0JoevwJLJDNN+51gF6ldLSJAWv/W57e4UrCfWViYYdfhEYQIMd577Qm
         vsJrkz76j2tdcj/REtAV6qi7SPEQMOWNFY3z/Euq3QCioUL95xEseOPa6vEQ+pRbiIhm
         9xBp1CQzWD+Fkj4dEVn5Lw0UZeMdDsadd69EDOqsV7l61ur5dk5mHYOqH/3amVok7PSE
         3gjg==
X-Forwarded-Encrypted: i=1; AHgh+RqqipkGW00gTwRH2LBkFMf7se7KGRArMJLUzEDCDnkGAARYZBTtIZ0q3E0gkvyIumzBGAbg5wVuhqGcF/gmdiSE@lists.infradead.org
X-Gm-Message-State: AOJu0YxFZcPQm6RCo0gf7SlWh0Ow2Kp4US4DEcPSrfy5lILXo7LtxKhk
	GiaCND4U4pmWe3E5oCDNBSdQ1Rf0e3+WwO5kq2cDvlhcRXoX6ABSlyy+xRHTCv4nsP0=
X-Gm-Gg: AfdE7ckSMrJnFJs03KxeAe2M5ULfQR+RleDCfEYwfZjvyn8Kqk4Y3u8LKn6bYmQRCy5
	vVNBpDVgA6PUUYZL3TyzieXAMFYwyEEwgNWjfvgRy7Dex09PlWmDXJR8KO9K0SLypenk23BszPv
	JwfOyAL5i74BScD+aBgUVN58vk7yVai/8PyobzdGZiaW52yYIY2Mx4iFQjr2JMH0NqiUKrC0HqW
	P54+XaryDVPzWwHVVg8xbMa+jt5aOiHjey3EpqfbjOIxqhE42u15pXTzvSGGk+hIMhuy67TAd49
	Gr2LtVgbS5gkAr3JVLqqKNhyTkPrNshh+yzL3r/8eXpsYomYhGopwvhFedRQS+BhZvWxEIFvuqH
	hdVpDylss0FoKYzreXZzVLHLsMyCAFutaDA5YOE42DF7J3J2xhJIgxhcguQE1x2ORqQ/om3zaxu
	wGJ5S3wJqZs+i2P9dpB8KsVQFxoWbLeWaPB0aXBrK3G9RmahjOEqrj4YSFL8ftSwUJwa7V6nQLD
	azkFnC5U2M=
X-Received: by 2002:a17:906:dd1:b0:c0f:cbe8:7830 with SMTP id a640c23a62f3a-c12aa13733dmr276973166b.38.1783061504135;
        Thu, 02 Jul 2026 23:51:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:43 -0700 (PDT)
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
Subject: [PATCH v7 06/16] arm64: dts: st: add i2c1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:48:56 +0200
Message-ID: <20260703065110.1433283-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235145_938319_9F85F134 
X-CRM114-Status: GOOD (  10.00  )
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


