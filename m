Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10D8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/2GgcNYkOiYojFQ72oTmVxvuHHu3lXCYixOz90bVko=; b=sWJLuakWlRidTDxSVKpq0NXO27
	oFtWjVUyUZikOWPYQnNwuWjyji+fwnYA8a2RmoEDdquGT66QZu9FA2Clv1GoV3Jw0uFsbrWSxNr+1
	SXh9HdYQKh6D+7XJX/kWW4cl1mifeBCz9czVNH6ZWpyU1DAaEYT8OeYfXkMFOlmXczK/B+EViEjOk
	z5DkJOGAdv1MH8PIpEX0iVmOqgrkC2T5M9+dyTbX3OlDRVx7+1k9eU//Z1A1ruINb/wf9gfBY0hu0
	nPK7dTMxfrAw35lIe61R/tQ3XE7MUB2l7jYNeg1UaHSmgiPxWx3aN1qJ3WSxs4S0b3MZ8aNrgqC+t
	P2fmyTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyu5-0000000BF8V-3iPc;
	Thu, 20 Aug 2026 09:17:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwytr-0000000BEvx-1uI8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5991845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217445; x=1787822245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/2GgcNYkOiYojFQ72oTmVxvuHHu3lXCYixOz90bVko=;
        b=khklGf8ww95Y/JlO6lJkbZyy75aq3BKxzH5xvgd5hbu8NKfROK7FBSpGSHzvl1oM+O
         RcjD4HpbBP3GXvw2JlAxTS+ykZVwJn5PVpjZ2lM3hevRQX+/zMKKBP+N5lzOU6RZZwYe
         pi8+nnB6RDb6pOkGlVrZQD3fl1G30U69UsS4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217445; x=1787822245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/2GgcNYkOiYojFQ72oTmVxvuHHu3lXCYixOz90bVko=;
        b=MwccBXdN++g7YKo+1ND89Aqq+wZOskdfQC1ONPO1OjD27sRIgn1Udc37ovfRo6PZeA
         91X6MOWgqBVsfFyGhran3g5M7NBNRDqJIEbDRwTEdhHbzVKyvHwyp27LsHF6Zr0Yodbd
         lGedob5TmwPzoQooHKKd6iJuP/R3z3RmVwF2n1b0F+uMVwraoKnbX4YSQCCV8wtlLZRF
         YK1RqlVP1LQiO7aM7Mbf43RbihnI28ubjqIsZ+7fDBhj8wioLWZN1DUtmS/xPTsziV3Z
         XA2Ml7bYjC6V03Lr/6wYaLIm30evSIqYRV2CH9lm5uAX6Tl2icXUQTm+4ovcB5tCFGXF
         VozA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2cu/C6dwA+vf/pIycsiTHckTtmMDw87l5ZudrBQBVFHJPlDWjOjkhhWIP/QRTVPUQHaG7dxSf7nYsqrk/QIWm@lists.infradead.org
X-Gm-Message-State: AOJu0YwpDhkZRJ2g7Z9+CjNs1aenkZYRCpkunHBS7YIuzzx1kPqR3dW3
	7wyi9omfUF0YOzwczEv3tNqOQrM/NZnfax7J9A7A1P1SCcd4go06YxqZ8T+Yw6ytA9M=
X-Gm-Gg: AR+sD12UYkKGy5dCqNCPBInJyUSBwjxYAKAYq0PbTCwDOYe06kE6RL4rXTmOjWWNSF/
	RgJh/8Ekc2oNChjdGkfjgx6eDYhb26rVk963MEYVBmV9Su5VK9qHgt93yJJeV6WuNxzpmPXwHJ3
	B42GcpRMvHQGbty7dCF5aKqJdueorVfrMkKQbjIsaa7Z1s9BmPfOqBznPLaQXppAeZUp5IA1FV4
	BXCE3J33FO48AyFRnZ7brbf9gPG5cgAbSK8HK/GeYscbGxtziARvPSEMGI+cCLeyZjUe5J/PHoj
	LAyge1wVm6Jniz4Y7hebHVeWcz2ZtYKrwTjjKodzsEr9g/Iz9teL2jRQn6tV4pVu6bqFskg+U+A
	NnaH44zTakEVhh+XshTvUUxuhC+OPECZINZ6kaIkJ5u9SDUAyp5iwLFHK70oL3vpULpMKVrxApK
	IM21Ocln+NG4wV/wz6GY5eCYX3cSeCGWMVtaQDCOp/h1Lkg9UFTVegG4yYfxtAyLK1pGDNdUbmD
	PjtuNyxoG6tJvRo1pekIKQMCqxjQ8//iIJ/V67lfCJ7Qi66+lYSBcLQGyhT2trTTdL8R1azgiTu
	T/3FJJg1qI/3GwhLxHYdQ0OaKA0GXmrE+k0fZrUxDw2kWJVOVxZvQ9aF8G+pCQ==
X-Received: by 2002:a05:600c:3e06:b0:499:8d9b:832c with SMTP id 5b1f17b1804b1-499b06adf9amr45860805e9.4.1787217445426;
        Thu, 20 Aug 2026 02:17:25 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:24 -0700 (PDT)
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
Subject: [PATCH v8 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:16 +0200
Message-ID: <20260820091652.43541-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021727_515528_1BA49434 
X-CRM114-Status: GOOD (  10.40  )
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

Add the can1 pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 50f454630cf2..6482dd47e977 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0


