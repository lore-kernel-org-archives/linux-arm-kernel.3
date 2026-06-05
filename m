Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE83CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=; b=SbfodwKxwRHLh0JczCJiW9e1tD
	fR6h7wlxpFeVEorYAmSBO2gfrm4OD7pRNUgsrW2TDd0is09PTCFUNmjclGeCWnXEZOuBJSoV3OiUp
	oBVVMMlf/ISnjVdDDMbl3HFq8ZKTSLwP6J3+09OoD0Ooq8FpZoiWMTNVmP2e1/54rqMye0C2SJ3zF
	jC83QXKJCEp09uEYk7luwA9F/HvceGNTr8Mtx7DV44YcQAHRHEY5lhdNZh85gJCLy40LsGT24JyVm
	+L4fRFCfLJeUKGs28JphDfWd7ZbRHxP7DVkoJwNXSV9lfkJMb5scHi8S3HXU+uV9gEmPE4KsPiuAn
	HzkOHDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXG-00000000blw-3kHY;
	Fri, 05 Jun 2026 12:20:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTXD-00000000bgf-3SSL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1901845f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662022; x=1781266822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=JiVSxvi+WwQ4irFIwzaf7oWwDiGdEXROE1Ouh7MJOkjBGyParnM7v1IVbOoDksEPe9
         l8SZ58MsaXwBUP6Mpt7LcfhMny+0CPnD6oudJr7kaFLU11nyoykErpdHiLU6qPAZOUYd
         JZklCq1nfGjN37MpjSY83MwFeqDy7K7NupJEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662022; x=1781266822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=l3Tj2vKSqu3qfdcU/qgigmYBrvl82VuiflWI09xgEHISmkN3aOiq+Rd694/9h0RB1Z
         J2Bqkb69Cs6LiMSROFHs/FRa4OPCNhI4T14KCMSqrEZT2ZVIBBsvW8/d2NBjLF5DrjPh
         1cgAMM++xJrX0CW5uGypFr4uNL0yyTK5h2vr1hXNK6bPckRlD2xKAW2zac1uv+6BfocN
         5puIEL+8BKLZWrk7UAXbmVQ1o1RujtMINNkfuf5S9kcNlRzBQce0PJ44g/iwfep63EtW
         HX69k3//Xj5WwI1dnWSZTCQ+eCnrKTAOeukCPogjmBl5vhmehUeSipi04q6j81+ImQe9
         OBIA==
X-Forwarded-Encrypted: i=1; AFNElJ9LSVi/W/7ihzTkiwEyEoJv0QP+ruFIOX5Yy/1FU6S/yGOrGUly7fS8BANsL5XBdMKUWHxtxFJ41nvqrnaqtUPk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5BGvaEUWza+Wn1Z1IA99fw9mEzAF32ohEzf8qCMj/hL/ZXKoZ
	NEoTzttGP5kxbaD4WHqRZ59auYx0+cPYheHJDq8yVllk6OZXOn545H8dm+b6geMttJI=
X-Gm-Gg: Acq92OGKIQO8xEPXJM5z3bPctnGL7iEJHX+qoeDZqMwd0FjRFz9m5kH9m8wRUrgKi55
	CyM9RDSY9lDXfOxWMTGk3ALkQDLyIYn86q790j/T80zWngfq5D9gJh8aCs9sr9IML0td4q7Zl0X
	T7C8Mb2ntD3TvSyNw0iPMNbPsWxjvtbOQglaP6oBMMi7EePJy9RFpaCabZZlvm/iTOt6N9GXn9t
	DXmRLpd1Muryhxtsqt3bIDGqkrw3bw0eufMQkn2GXJRToXyGc9WRssMm93tY4LJ3exBMNZDbMr/
	zyQMfXnbvWqKooqFd0cDNLFLQa2UYJETL/lRUXgOk4Qjdf+7W/1Edr3agEiWxT1XsM8Ze/N+R6R
	IT3BGaBk8BB8POMBlntNr2WXnucmh0tybz1Q0Javoj/G52kPFadqCtnwc3rJ6D6keWjseD0Hlrw
	5ERnG83QiWgQ3JJVJbgKhWWjTm7f7WnrAxEbZdpVzpJcQXElv9su9WRPyut5w9Z/Iwuuy8k9P19
	BBhJjox9KWFqK4UZiMAgAI/wc+LvI1NOjdCWqrCaNBghAA8qmpk1AcXx0SgcFblqKw5i+OMhgDJ
	0TrQGtd9lNCrNAUP0k57gm0n67yNEUJfEzw=
X-Received: by 2002:a05:6000:240e:b0:45e:e936:5e30 with SMTP id ffacd0b85a97d-46032b71108mr3975460f8f.6.1780662022224;
        Fri, 05 Jun 2026 05:20:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:21 -0700 (PDT)
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
Subject: [PATCH v4 11/14] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:22 +0200
Message-ID: <20260605121957.78409-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052024_003194_964AB97E 
X-CRM114-Status: GOOD (  10.13  )
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0


