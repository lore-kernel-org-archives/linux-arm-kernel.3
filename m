Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA860A2608
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cnn/zCHZ;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=WuYtvxvZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=; b=cnn/zCHZjdFuwx
	lhxntNbtsPrG7i/hgymvJFf3EtT8+PAgOJhxFnm4yj5gZGFOJ/eiBQFsW9EK6u4/Re+Ptioa3mNxJ
	KfA40hx1ThpRetEpi92O1HWchTxYElUh0HMNWy5vQGyUOL2c+twaNeDgHoTMQRgDYDQeg0bmXHL/F
	6NdKqvIFRo8fkXG4wkE1NTZ1zFBqTGivFdwhhwzYaxvMJwQ0+Ousa8j1FKnxDqmb09rBRqIZDnTK3
	qtgRPBTLPJ+J+EDEsFZR6yV4R2RIu0/pCl8cP8Ock/HGh7UXx0D7htvmb/+0hyQfwZBWH8qqzlFT5
	fZh+mW+aPkB5ocKDsglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4Bd-0000000794h-45Bc;
	Wed, 28 Oct 2026 13:59:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4BX-000000078zZ-0EvX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:59:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so12455635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195961; x=1793800761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
        b=WuYtvxvZcNKXqo3M51ZyJ1tkXQU593i7O25h/rn8zoWkDn0Gbu3pHCwYLZnMC55no2
         sXShPRgN1elxoBTUzwUHcsLJKHqi0pLE+hEJT6UwiRxOVtf61rGRS/ymWi9wyBfJZw9+
         974qae/hrYoaCg9sJGJlBko45MbQr/CuPnxNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195961; x=1793800761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z4XBdpqyVTDx7Yqi6vugAln2ZDQbNUBV/V/PeOlv9P0=;
        b=yS+WcFStBLzbeiZ+w8kFQD3VFoIdT3o5/WhHtRJKPFrMHUhRXbHluvbMw8UyLQxXDq
         X4yojxlc+uIP8pVS7j2dxxfnga64otjoAFWzjgwhJHQkYYaAZ0COAk/F7c7z/x56zQHS
         pch51K+t76+18AyMG+VtG/+i7bBNkE2Boaomyd/tDqUrmh865nHCnAXk1ss5ew+0ACjS
         HEuZ0eWGI1Aa65pB1zjNdxUIwxX8HWKb8V0MK/T3s2W5wbCoo/y8PlTPS1XfuMbpM9MK
         PnhUsyuHK8dU5pd8j1X0bG+51xlKMyF7JC613z+a3FqF9kDKL/rSN83yt+c1Wk/cGnJB
         AReA==
X-Forwarded-Encrypted: i=1; AKwUvBw1pc66DGS0tiw6Ouy4+AqknafR/84DA1gS6GkBUhjR4a+CDZK0C+30IxqKKyhMpWshB05TComNrQ3X7ZmRMlCa@lists.infradead.org
X-Gm-Message-State: AFq9FYIOiQwhME3hgMBhvkpGFBfc6W/zpymrASMj4B5N/uahCoMrs0VT
	Z15cGUG2HFQLF/2IBMHIjqQ+JAk0faqpTWc5iW2gq4e1TRuHVX1F2O1Wf6goF+TswRk=
X-Gm-Gg: AYBFou3eUeyqAJAPNnrXhL658Ro6LHzR8Z6XtL0eiVWTUG51YlvlIlTSpeQ1JRrh9V6
	6xqB+Krt03vjJn/d5t7hWvipoJFJ9ZN/mdpFJcMSF3roDW78YknyfoPgUQim8V+XBDJS5BxeIVw
	huryn7iTfCWOxhkd54Wc+MhdcQt+ek9/pUfJ211sjTukvFjTBliF7r9aFPy+SyY6la2J7o/uq2v
	sPJg3uqfnv/XM0tHII/aTqu6VDiIu+ekd0RDnLGRTsJrSPaXDykaVDSwQk2U4LPW9GW0Bx0zswP
	tkR0i7eA1RClUVcgtSlejSDN/3wJxKmABlO7P4kgYIHBZVbKb5fJGi3C4U8wTC0oJ5PLSPG8CvD
	Y0o/3E2qk+eGuHVAZ9jrCl5Frb9fI9RzlAFiia05jNQ7RHJIRnVgxwN6MXz4ZGerN8jjCcB6FJf
	ypkXtF9RfIm8rMn764mpZ1tEDXLnc+5rdqBF9Xba9GvPPwSDJ1ai5WdtsaE0JjMyVdfZYasLtn8
	JBI2/0pMdDWsnEzQrbGRbgsSv1YnwO+jB5MuvQR4dNy54UM6aacZRhZnEOriEIdJt0swBlpFs8x
	JsWfrXsCJmJVNmH8t1Lvx4R56STmS9hhMMzhbVvfwz8gEJM9Nbo0BB6f9soz+HPjeLLTMvMe+xg
	W8HklnY44XmG94gBPOP6iXEGLYYpZa5PpotezazUa/1iP4igLBg==
X-Received: by 2002:a05:600c:8b05:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4a965ec95ebmr53037705e9.9.1793195961149;
        Wed, 28 Oct 2026 06:59:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 1/4] arm64: dts: st: fix the Engicam RMM RGB display pixel clock
Date: Wed, 28 Oct 2026 14:59:05 +0100
Message-ID: <20261028135915.2665857-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065923_108775_FD85CE9F 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On STM32MP255/257 the LTDC "lcd" clock is a fixed placeholder, since
with the LVDS output the pixel clock comes from the LVDS PHY. With the
RGB output the pixel clock is instead the LTDC kernel clock
(ck_ker_ltdc). Since no consumer references it, the clock is turned off
by clk_disable_unused() and its rate is never set. As a result, the LTDC
does not run and every commit times out:

  [CRTC:42:crtc-0] vblank wait timed out
  [drm] *ERROR* flip_done timed out

Use ck_ker_ltdc as "lcd" clock for the RGB panel overlay.

Fixes: bc7b07bda4e0 ("arm64: dts: st: support Engicam MicroGEA-STM32MP257D-RMM board")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 ...2mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
index f89641bdb23b..7be955be58ed 100644
--- a/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
+++ b/arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
@@ -10,6 +10,7 @@
 /dts-v1/;
 /plugin/;
 
+#include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -35,6 +36,8 @@ touchscreen@38 {
 };
 
 &ltdc {
+	/* RGB output: the pixel clock is the LTDC kernel clock */
+	clocks = <&rcc CK_KER_LTDC>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
-- 
2.43.0


