Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E658C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=; b=WU4of6pw3pmV3+WROr6uP8T+Np
	TAzmZKftJu844ml8VbgMvKKge6KoWzt0G59DkIE8S1D+SncTRiixpNAdB7NnpEJcESin1ic6UcTSJ
	F3AMbNp7GksuiWW0HoQ0EteTGEQyKK31bd4qaEtAiOdcesVHjJv7b8RoY0pfYH26pIQBIi0v2i537
	MBHLAe7syXY4HAflJVqNQZrgT4pZm4atQELJB90ObHvTTZHunFLretQ+sE3LMGhbW6tpNo+xwLwgi
	EE12gO84aW3AJiSpl7lDKZLSZXm/K3PvLw8YzSTdF+MqwzibAiRYmA7B+aaT72P/1l4Yf1Sh4lcaG
	1/uqhoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUkB-0000000GPlp-1UsD;
	Tue, 30 Jun 2026 09:27:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUjz-0000000GPXV-1VoS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:26:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso331457f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811609; x=1783416409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=PmqFgC3VVPn5CBMXIbBW9d+DfBdSD93m62Vo6Q8ZXhePSArcrqfAg89/bo6WwYTjwA
         9IzFjL3TRgcGVD8IpngZHY4Vu2BldWG8YKBDVQSCo3Lj64pCKU/bTPQcxxZ5GXLgD/Hr
         kKzWr8YyYP6TE1dc9hPqGgWXuDvahbMxZLRoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811609; x=1783416409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=T9etyQPqxQ84lGhCpx4c5P/IBzfkeDE16dFLQNVK7E+A1dduhKZoabDp2ZyhaNPy0O
         MV3yPndcqaqOfFYWBsLAsQ1EuB3BP6t2EnQd3H5KIRY0baV9ZdWQqQtoIFIMjIdlLNRG
         rHHROM/4zOrV9hPXKtjq3EZXwww6Ywp6lhNjqhkMtZcjP5yivC7OuYNPhNR2Gj7lWbr/
         voxfsQkUbTjIbXe747gsnHcthAZlxb0+g8Ds4oCfe/bz5G1yOP6LFiQXwN+3IGcYiQp+
         yREsXkXHqd54OE4HeQr+ZmF2win03Mz/tQ48/Z/VjBdDO7SjfmRvqCtnKIVbAJJgaYM2
         rekg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4hq0YKGQZ+DNbkJpnnciTzD04GzH57UHAPl39pX5zinm9iKQsDAB+fLtIibcKGi5m5mG5G9n26Pqv3/ICjVH+@lists.infradead.org
X-Gm-Message-State: AOJu0YznFUtNDm4+IIxVQt6zO7y+p5EaZk605AcZGDWCjFwxexOtHEj5
	QjamTHbT+uQk3xuyoUJe7lj9yJg/segn5DmWVHHPBz3LKWnOvFN+cb/AbObTafHVUKo=
X-Gm-Gg: AfdE7cn+ssEXp2fCXf3T5fuTL2t5ghE8x3IShHYqxwAtOijPHsTZ+HZqoVKwyUZ1uwF
	Vy8MkPrq0FnrrFa4x8ruNY+u3plvUF3D55ariWLxSBcXTMbum1ofGDWrD/62rngYuefZwi8WhDG
	xNHaq2FIaXru35fk6jU6/86awYwDTEodSHQ/IimlRPoQm0s4w++ADhflQjbEb4yg8qTUfHuAUeK
	EFI3KqMiYt7ga/uubrJPZJoDd2cjli5IpL8w+QvHhABKwYiEjWM5ambEykYVPHbjS+HXaxi0nLN
	p6t2snS2M6CgxXgABL94dnmlDS3UQjeaojLyQxYnlDK1Cfcfzi5wBr2ydtrqAcJuCplFc+M+2n/
	Yg4b1p6shVGzN9hxuRlz8xDLRp0iJmdem8D8pVW5FQEhGgmAKNt13XOiISchQMGtFyliTSlSx3D
	kWzBeYqp3YmMMYhW191Fw61ycWAqly2ZPtVF6tzANSn5VbE+61XFsummQDWu/1xFVqDKbdWyb9F
	M1iDZk5JMOCmbQ0SZCCU7mWxp2HLcmIuNdZc9oOyvXEGCttix5RoCn7vZ4lzvvxYt0OObyxWZOp
	X8HG7eqeRgxY3w==
X-Received: by 2002:a05:6000:41d2:b0:475:a05c:c642 with SMTP id ffacd0b85a97d-475a05cc8d4mr2460726f8f.19.1782811609470;
        Tue, 30 Jun 2026 02:26:49 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v6 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:37 +0200
Message-ID: <20260630092628.1695560-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_022651_421189_41F318CD 
X-CRM114-Status: GOOD (  10.15  )
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


