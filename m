Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A81CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SwcRmJEpAdsIjXtM8gO5g337Luht7EqqgA9HVxaMN/w=; b=lvgxQNBDzqOEWKJhxkyKdjIvsQ
	LOsXPPAtQsA9cFwGSjxBh1ZOKRqXyse2ejGTxV7ISMm3H32Fai+1pkvDXuo+5qFKtoWkMwzxSOGzG
	LuQ2jpLc+ZqQYCatDJ9YZFuBIrZIQ57Q256VFpbtigS6Wbo9ppiQXE//OwORys+TmMDeZGOeTgbhV
	1+xMpmuvXdLr/P6WvaGab6grRDPKD/XNaRI+ltgHbOCYDm0yfNzF8UrVuX5DuGIk7YelAs349GDw5
	/FZepuQRgc/e3GOd4b92r2ui/VsNXIfKcmGnjxYYFjiZGCW0Kz8X+NK1LsksI3UtYIs26tZwuGSxI
	mAB395Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3BS-00000009SmN-33AG;
	Tue, 09 Sep 2025 18:35:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3BQ-00000009SkM-1Lbu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:35:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-61d1fe6f160so1185480a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757442910; x=1758047710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwcRmJEpAdsIjXtM8gO5g337Luht7EqqgA9HVxaMN/w=;
        b=QGg1KiqDlVcV8eOAct5SAEntT3H7QZR1+wsB3fyUl7g7GcG/Es4tl1iU7q3XDdsqui
         ZLXbavlGzLFu/ZLQfNacpjNuTaXQ3tinanr5ey+75fm8890xnqSQYKrtTk0q/YWQkA9L
         RjcBF/PSdJYXPfRiMicRwwk0OVFwWr4MhdM4JfCXmpK9GYKXEqEUakvIdpNJr1rbms8x
         D7eaprkH/SuLhhs4LqqyKquMAhPHkgtJRv2qVfJQXsP2GEpAofFr+IzRH+1sOMUUj/p6
         Ie1QTZvrX+SIorgQiqYgx+CwR7DJETNzG+NWtNU/o6zVCgwD/XFVZv9YbhPOehDZ6ha1
         wXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442910; x=1758047710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwcRmJEpAdsIjXtM8gO5g337Luht7EqqgA9HVxaMN/w=;
        b=Wo4V02vGdoo+H2RM9gz6938ioZ6BocaecGch3nWrlHIekk0WaCN/qVt1+MpCOI1vuC
         Iw9vPeu37zZpsassrW1odVsgsDykrxR3f7le73x0cS3eO2WP2uBkIjxjwIqlNnQEb864
         sjoRV2OFMdNJLGYfM6UvWmaWFfQDuHKbtRLD32KfN7i08GtTbnFGiWhof3fXsKED5teC
         TLnVoWU0OvRtt638OeVuDdo+Wn2qwrHbFeJSfsS2u4KblTElS/KEr6TnrpCxICnCSOTF
         l1H+V4VoR19Lq0m2VhzU/DFFEgZtqrPAKadoInhVH/zdioDRMFNmAq5yTGfYSXemd72Y
         KiFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD7A5aeRKS8Bw2lHHyv3ackfQB3Nd2MRvazyJ7P9TfNcjLilzbLIK1LH2J7OcpgPIbcJD03yXYEAylWllLei0L@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq+ZLn1SsA5vCTzcQzcMW0R+8pe8ZOCm/IvXvG+X4IMkjsaJV3
	dfyAdywg2wpWNgeRI+8pic3svZJqFXMmIKjCEk8zdo0+GEE7cLYLg/SAIFbEUzts0OU=
X-Gm-Gg: ASbGnctCX9h5kKErWtj4MxQgaQeyZwC5/HQ+0gy5EyPoEyEXgfeLimLhIml4e1NMpYh
	jeWCoRPRuWpcyT9TmRxsPmC4YnkuZD/KjAJMBkn0KY7kpvJUTKGks12aFNOl5VPVQdgCdVOyAUU
	wAQMmrLpz4NkapHbHUxB30Trv7mJTMkTLfT6yUPbHLbMB38eEQ6AV8HVRbb+a3XmrBMTzFV52Tf
	UgnOB/rs56wpxETT5FIFLya7UPPqMzbPrGLGUpK77KgtTflw/+tU2EXe3uv4vYukk3FcAPWSxD6
	Vpp/TWGJcaXsdDU5VkKxsjXwE/wQnPGXOMcWXsDjCCYe6Tw3coAJ9z3gQZTaJTR0pYzNd0iLst/
	yyqOQL5HlOb8Zmf4KNjQ6IxEIM+iCZ1xG1Q==
X-Google-Smtp-Source: AGHT+IEtJecmV/jjQmnrF4shDa6h9ku/souQrmOu0T5Vo6piPtCO7DvbXGp5/2Tji0sGHNxwh00KNw==
X-Received: by 2002:a05:6402:1e92:b0:627:6281:e432 with SMTP id 4fb4d7f45d1cf-6276281e7c1mr4700848a12.6.1757442910428;
        Tue, 09 Sep 2025 11:35:10 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c0123f08esm1707282a12.33.2025.09.09.11.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:35:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.18
Date: Tue,  9 Sep 2025 20:35:04 +0200
Message-ID: <20250909183504.104261-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3592; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=SP/f/OHmyENYFgXEHOPc8/Rf7ucWnwCMfoZXoYcF+Ug=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowHNYyTMtXdgVINSVVMUfHhVmyZrZSKfFw9c6L
 Pz+Jl63/jeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMBzWAAKCRDBN2bmhouD
 18jGD/9/DW7x7Gnncm+III6OLPIJRggeJ3ahi+ZOIbPAcqzETQjteI+PC1+r+WVnJR4LgRTjnfy
 nh99rONItP2xQpqCUvO78IyTJlg55fci64+pL/81Zy0VuFeCNxKhzfudG3mVs8C3fmGO1v2V5SH
 mdpHObusWdByV49x327xv2Gdt/WR//yjaPLKQH4ALm/XaX8CqB7fEVqULhcBXoJw1gwffBkYPVE
 2O2jXhQ6WnmvQb04PLoizDRtfAJ5FkemhjCuuvkDRxBlycZR5P+8dEH3v+R8CKUI6XcFV/KUW3M
 loomE0efVKlueZz/d+cG3v5aGtLfpCPnCTXjWbEW2ey8aqtJSZO27Jd34CkP4+Q6BnIUv4vqlGU
 NgJFFQc7IcgMicy2YaqUM1mAj5U99y13U+Ec7w52T9R4sts0SYZoQjuNd2/jCkIM/kLZLAs7PiN
 IbpQXdtUQe6OqfSS8ixhQ/UM3Gu6P1tmRukxzTt5+7thjhbYz5N5Yt67ixKFq+t+MpNhDMIRdQJ
 68ZKfAxI7Pw1F0S2Vj/qj0oNKMO/qIhlaCjKseMfTmysXUjKYKsiZu2Xyd+WoMnAY5z0ziCEsVK
 KtI81ktQne6TXowGhZTHLfCmfvBIKdBxRcArVAz245DgcLmUnOBj9tJiX38qUjO2ib9M+UJQbgK ki7dl0vi6BLGViQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_113512_402553_22DADC3E 
X-CRM114-Status: GOOD (  13.03  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.18

for you to fetch changes up to b3b314ef13e46dce1cdd97a856bd0250dac8feb9:

  clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support (2025-09-07 11:12:45 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.18

1. Tesla FSD: Expose CSI clocks to consumers (DTS).

2. Exynos990:
   - Few fixes for fixed factor clocks, register widths and proper PLL
     parents.
   - Add four more clocks for the DPU and HSI0 clock for USB.
   - Add PERIC0 and PERIC1 clock controllers (CMU), responsible for
     providing clocks to serial engines.

3. Add seven clock controllers for the new Axis ARTPEC-8 SoC.  The SoC
   shares all main blocks, including the clock controllers, with Samsung
   SoC, so same drivers and bindings are used.

4. Cleanups: switch to determine_rate().

----------------------------------------------------------------
Brian Masney (2):
      clk: samsung: cpu: convert from round_rate() to determine_rate()
      clk: samsung: pll: convert from round_rate() to determine_rate()

Denzeel Oliva (10):
      clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP
      dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      clk: samsung: exynos990: Add missing USB clock registers to HSI0
      dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support

Hakyeong Kim (3):
      dt-bindings: clock: Add ARTPEC-8 clock controller
      clk: samsung: Add clock PLL support for ARTPEC-8 SoC
      clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC

Inbaraj E (2):
      dt-bindings: clock: Add CAM_CSI clock macro for FSD
      clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.18/dt-bindings-clk' into next/clk

 .../bindings/clock/axis,artpec8-clock.yaml         |  213 ++++
 .../bindings/clock/samsung,exynos990-clock.yaml    |   24 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-artpec8.c                  | 1044 ++++++++++++++++
 drivers/clk/samsung/clk-cpu.c                      |   12 +-
 drivers/clk/samsung/clk-exynos990.c                | 1240 +++++++++++++++++++-
 drivers/clk/samsung/clk-fsd.c                      |   28 +-
 drivers/clk/samsung/clk-pll.c                      |  161 ++-
 drivers/clk/samsung/clk-pll.h                      |    2 +
 include/dt-bindings/clock/axis,artpec8-clk.h       |  169 +++
 include/dt-bindings/clock/fsd-clk.h                |   13 +
 include/dt-bindings/clock/samsung,exynos990.h      |  181 +++
 12 files changed, 3032 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-artpec8.c
 create mode 100644 include/dt-bindings/clock/axis,artpec8-clk.h

