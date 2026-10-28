Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2164260A262C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2Wxqhk4;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=lprU5EUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=; b=i2Wxqhk4s7Va+v6xGa2brCFmOu
	xvCJiKBv74C0sd6IAzqVaxLLxP0f/5TQKX1YI5Yu4I4CPKMe1HfZO/JY80cNtanaE3NGthW3X292f
	rVh/nQ91Na0amNxv8om4e4m6wZ1b481jWDk3jRQ7wt0XDcSR09Jf469gw6IrF+tst2v5DH8ppExQA
	zuwFgfMwq2dqtKVDfjE9wmoKyXmjz9VWOzPbn715YjbmR8j27NTzwoU6Y8z025Wg2bEa4e4lC4hGf
	uBoN128p+inwHl49x3Hx/xvMT5bUGMTlzwP9pXrgSiz77GLFILK5hKsnSEjY/JbDsy/OOZ3emgDEq
	n4KdyPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4BX-0000000790D-2MT6;
	Wed, 28 Oct 2026 13:59:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4BV-000000078z6-0eUn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:59:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7647675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195959; x=1793800759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=lprU5EUcQyU5CVFVgBMIF0dyiIqeVoVThp9yICYAY2TqRCKaytTTve0pEzEUVxdhR1
         1y04wO7utQOXqyltgsmHeBbnn1sfKzXzJWxSTgLLFc2qKEi8tJtDbUihnZHFCk8OsetC
         IBsEjZ+PY1QlSlJUZKPfSkz1iVxLLQ2FglbOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195959; x=1793800759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=byadOrFXvxo+g0k5TRQAf+2CxEFqDjXDEDuUoMHjTxusatXsZ5o/BDMrsKIuiBxlcs
         /8dn7we1sdABH0jaDUcr3BLchHSKc1EMgr9SjuQE+y/j+98OwomAt5cf3VvQOXDMoZ/0
         DRJY+5V8BaUctkACWoiYwhsSUNDJfdo6/KvsmDdDu9TIMMyA1f2cZORYgNUGdrBEAIKk
         aJ/yY1ISf0aIkyfEY6xIYRlg/711XBEddTrKS0TLcz0I+55J8ZPHGX+wXw0gRplxbHYd
         wGAFCMoBjFXIW2il9YOjrc7BN9i+0UTePhVdjO5CSvHq1qyiXeUnY2z/3RzybES3jGru
         f3Og==
X-Forwarded-Encrypted: i=1; AKwUvBzoyvgqpZsY9eGOPsnleG2PVU6OWpg0RK5wdZd6oqk67ejJ3BCDTZuEOYmxTS4LU3dpBmWzeHeeXju0cQDzTiGf@lists.infradead.org
X-Gm-Message-State: AFq9FYKKPjwRrHiqD+x7nT270lHvIXNbwvbzUlsoOlmuFXcJprqoYzNE
	KA491iOr6O+8U74z/LqdgoYKLWZhATxaZP7YGd7RLcTRaIIBI0cFMF3kLFqOty7H7Os=
X-Gm-Gg: AYBFou2DvoayOPzk1hOkx9AAa+Xo/CoApMR/rEQsHhEVv3uCvodXwS6ky9zbgniRpma
	8jBPx+9O8sOIuR8JQ8r5eAM5uL2ZugyMiBiBZcEqiDttKfuduX6zQqzECbnGMuASl0dR+8UD3So
	xO3Vc0z3ok6wFDQCoVEnYGePqNmXsOINcjFN17fkUiO4TnMj9Z3N/u2glzHgN29wCDTDOWVQub0
	lccnOMfNZwijm7rdXmTtQInC7oolFsz7N4crgobWFpzKmBIAMm1opwOhm+5VV52xlTjpZMUMkoB
	R7te2QKMt/imgQclTzGc7rSx9h8ofO/EW/vKLG8H9h/hBMnNCSZvDSpm2iIwmc0lZXlquXIBTvY
	xXRpqlQZEhVTRTKJZd6QPyHlyiMAR4gTPV72GPXK9gfF6xRD9GZA3vCI892/DtQoGVbaETxfKj4
	5Ngym0HuQHKP7lDmFPB2I51SgqE3tFqIBZvzBKhMV2ngBYinSzO+bmt132qtFYjyKFAD5HtmChP
	kOlprjhNyPgmJOrCizzloNo68YVlf12GaniLhEPdmmyCWk06dPEkf+dZIYJIfLRGUDwqOP12P/f
	QW1Pmz9PIXg98W+hbiDes4y4kmO8s4Fwi+i8kRMHYTzRgDBhEp7lnWh0C7ijr0mcgdf6j9kD1E9
	O07WtpU9V6zPaHdXG5C3GUmU2Q6ccqsocT+qyu/TFXDd3gFy1I9Jzy2hVb22d9sXkkcZesg==
X-Received: by 2002:a05:600c:3510:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4a966774dc4mr52485205e9.18.1793195959170;
        Wed, 28 Oct 2026 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:18 -0700 (PDT)
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
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for the RGB output
Date: Wed, 28 Oct 2026 14:59:04 +0100
Message-ID: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065921_271269_AA98B997 
X-CRM114-Status: GOOD (  14.94  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
clock (reset value) and the LTDC kernel clock. The SYSCFG node is
already described as provider of this clock, which the LTDC references
as "ref" clock, but no driver registers it, so the RGB (DPI) output
can't work.

This series adds a driver for this mux, probed as an auxiliary device
of the STM32MP2 SYSCFG driver, and selects the pixel clock source on the
Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
independent fix for the RGB display overlay.

Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
(Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H)
displays.

I am sending it as RFC since I am not sure about:

- the mux parents are referenced by their global names. Should they
  rather be described by clocks/clock-names in the SYSCFG binding?
  Moreover, no driver registers "txbyteclk" yet.

- the pixel clock source is selected in the board devicetree by
  assigned-clock-parents. Should the LTDC driver rather select it
  according to its output (RGB, LVDS or DSI)?


Dario Binacchi (4):
  arm64: dts: st: fix the Engicam RMM RGB display pixel clock
  clk: stm32: add STM32MP25 SYSCFG clock driver
  soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
  arm64: dts: st: select the Engicam RMM display pixel clock source

 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
 drivers/clk/stm32/Kconfig                     |  12 ++
 drivers/clk/stm32/Makefile                    |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 ++++++++++++++++++
 drivers/soc/st/Kconfig                        |   1 +
 drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
 7 files changed, 159 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp25-ltdc-pixclk

-- 
2.43.0


