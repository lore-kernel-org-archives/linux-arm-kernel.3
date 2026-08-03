Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F68C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=; b=jWNkOPQYwVrzX/sCEIG5BdWdw7
	B2yTEO1wJHlxBKktL6Zv8c1dWDbdkyXwAZk3cVcwMWmHmiHVwe1He2fGfkhOyMcP51vBrZvsm3eG/
	BrewSnK02uih7cXJZeVE/9FdxjzfrmDJ3ibMmLiAXOvyVX8cjN8QLzw8bATg7C1GpbDRo/TUjzsSE
	UqlIsdd1fiRFgM+CgzDEzElLfIN3OWf4BNhM4fj7a02Ck8j8NesKIlivXWYBQsAlamUmLZrpHB7f0
	i3YiLnKEAqv902dZZXSMOdqzqGuvZrSsc4bZLeDBiCmaCmpvyggrTiGdHYs+NvAzX/vCAPZsA1O31
	z7x+FXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnK4-0000000GXPz-1fbA;
	Mon, 03 Aug 2026 07:42:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnK2-0000000GXMb-2IDF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so16286095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742973; x=1786347773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=NiSFcefqEEmpgEN8EDQqK9WMkiivlBGr7xR9D4CVKGi4AlKlXRrvcMa0jfvRZMiTZ+
         KYC//zW168SuT3tANqLrMDoBwKWRYZ0pcl/T6uFgrmpXYdA5Q++KxvCz/MYVHJEXExgr
         8nCLblmGtsNSvXwo4+Wpz+eL+FnrCPJ9s0l6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742973; x=1786347773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=VfOupKIchTaRr/QkvYxnnrvVsbpSiZSoIxl0H9TefRWmufbY1KThrVfW2R0AhnFOlP
         LlHaGANhWsjRrJ3rsjz/JwIF6cYC0U4+0eKYNOTzlnFnkE9B+jyF3/8fSGR1g5qm07Z3
         C+oRSLUrhwXROS5UgFEbtrhVTcSbiDV4mlifhVZ4o3PLkM0EZpNW9U2YIUltQhqxPQNV
         c0UemNrznNxKUkFGEVz5NUQYu7sQgvYz3OUKdK77bbvwhmytCa/d/n/kD0nPTsrGN8SE
         SpTs0o3sJrDhuK5gFiBzw7zdxO23YIPB/AxQXv1UClM9f0u3cZmv5T6EjnS8Z4il2yyd
         eq+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpYV9DIqDXVlSLxcPdz0u3B7i1xvp/CTWUmCNFSOqJxnlTRIX3S/5zM3QyBiINA16d/QtaNYUtaJFlsL8vtDKKK@lists.infradead.org
X-Gm-Message-State: AOJu0YybYSE0wI9KXXCrJ+3NAdpNWbNB+CLNLnDgzSXLIXiOSx0mW/YD
	dCSWJtDJVNetoObAweGrD89mfniUmv0zQ6BOOJ2UtDMjhbgiJd3NpEUOOIPX9sZjkiw=
X-Gm-Gg: AR+sD12QvraU/GT+zyg0lxGZ5+OBR0Tq4/GDIthCFRciQMF8dFQ5lBFJEU1+eNe27Tj
	OfvtYhew7delFuu6H7u5d9XBCf45MmyIkuvStjHZ9yWxeo6IZtNYPBgcEYCmC1XXK4nGXtbtNQn
	Y5twv3pBZ34L+hvuq3eb3zEu/sN4FTCy25N+OuHI7u4iDQzI0DLC2ZLgOPBngDK6QBF00Nd763G
	12ThiuUQCcsQxhb78ZqAQeb4WrVDNFVTmeae4ARBpbz3Fuo/iaPfYu3sVtCo5TCTl5xsns1dzFb
	SKqrQe1awajeEWONlVXu15QviIHBaRAaPNT3VICUWMr/hPyVAc3jwoxtxIUCl5TRcdXu+RVE1gT
	At+/DdmZBcqbowvMqd+dboUGbq12ZBSy6NJcmkl/PppeaW/uZZdebVnK7UzMq11TPNaVOoWp5kH
	5IbvxWbfOOT1kJYtUTbYO6NmGaG+9CwnZus8NHr0eSVBN4FgiGrmOrM8CdfBAbBuPaIhY3XzM31
	Xh58tBmpTy7vCpjU9RuOQK272AuCSfSiJhXAWkLcxUl89wtnyIfbbk8stQ+hLyE0NNmD24H49UN
	0jWewshzhbwBszwnv0S0jtFmWcM2Ml/e5z++JuX9jnxw5oWdvQdcPRT3SUSbiqJv
X-Received: by 2002:a05:600c:c113:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4980c674e51mr154429905e9.13.1785742972896;
        Mon, 03 Aug 2026 00:42:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [RESEND PATCH v7 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:03 +0200
Message-ID: <20260803074224.3821911-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004254_598381_8F4CB1CC 
X-CRM114-Status: GOOD (  10.55  )
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

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


