Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB0CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoOJKVjcja+pZfFrIKEYfKv+zueerFYrO1gT2duocao=; b=x6BEAz+knq/albWik7jPC2ExBa
	KfT6ACvLlctUDTskE0THdpLox7YTAwAUC9d0PqXwq2N3JSNljwFD3bxOFfK2ZpUnm7qejPPq8Vvdt
	HHcLzzjofIVs7rI/6DKJO85ZPf6DujiVkkE9PvObdvk8QrPyChNXCK4I5IQHUQK1OPtfHNpV0+he5
	RH48ebtvNN86WTH/G+TnH7yI/MMduSbpdWVSrndgvSWgSwzM2Gw7q+raotkonFCPoddoZlV8V9y0Y
	ZHpV+forIpLn6KIB+IMb2E9o92OLcz2spbGD2iHTE4+UCE16gkj/z35RxK54x4/juFy8EPlDU/BDc
	DFXYG3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWp-00000007efb-2ZsG;
	Fri, 17 Oct 2025 11:21:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iWn-00000007eeZ-2PPr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:21:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b50645ecfbbso361079666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700103; x=1761304903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoOJKVjcja+pZfFrIKEYfKv+zueerFYrO1gT2duocao=;
        b=N0c/bXnpevxxQpkkHQhp/xhuWcwRSJY+NtIafm5y7xycF6aPo0BhHPzu/WiIg/HCB1
         36xR/r0No/9Y/NrANi9O6xreG7XrdgVOmIazUuuLpPu/5QtKLk8WKYI6BNnQ+7JYTTOi
         ns8aLy9kh3f13W982A0CzdNrByKxGS+eEVooUejB/iP1n9RgDCEUYhaoMNfqOLLTkJB5
         L9xjh1w29DUhrLE18K1vQwR40tT/vMqO7uJo3rqW9fv5+lb8d5x2b8osd9ixhkJ9pbig
         84IvEg088c4JSA12dbkLMlYGupaWc51RYcKib9ikaSgTl4Ww4GGkPSsFWrBadAewLmcR
         /rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700103; x=1761304903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoOJKVjcja+pZfFrIKEYfKv+zueerFYrO1gT2duocao=;
        b=uraPUuCWJqOBbfOkzl9TqMv51Sla7X+AySP0hyEbW5r/fprgfWUKocRQOicwsAkBaw
         za1uPJ7sj+/Ul1UBdHshBVYAAlIFtxbIj6tRpsEU6uyN7QNM80nYFLLZGA+oyJw/riHd
         56zNf2Vw0KcJYdRtS3IySRx805sZ2pfyp6AKOyenMsNw62pv/FLbnhivTNV9zhxw1NOo
         8UixMjPMPCt2ky/RRwjI1O7tM4QorgJ4EL5bZHgZfoom01vDeRBhxbci6RliREeLUptj
         jO9O36HfNq5heN0cyYv9iHCRo0YO0749IH6dbjSCyOPxemLzGSgMoshW4Q62ijRib1/U
         W51w==
X-Forwarded-Encrypted: i=1; AJvYcCUBwxPgVg8v6ZBJAmg1Pa1X9WMakGZYOv4nJzpl1kv3TVkqMjQtEcsU+K+UUxTV8M2SsIN2G1qcQadF1YQyfkPt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy7lnJ9NblDtpj2V2sOI9xFLqL+fOLfJpAErxdnHno64qAyXt/
	PlFaT/Q1GBJXbmiEW4zFfMkOkr39ZaEuB88EBBw43Z9WEvmJgRQfPxh6
X-Gm-Gg: ASbGncsa6wUOghOcB8OAjACqf9cMxA64Izmk5AgTZnJzzTmwJSd3DLJUNhqisv8DaUU
	S8igDcDOkNlknxV7Fn2QIk8h/48Ja7+Nx5y7Djl1+uCJpFvkWnhplvTuwBYJ+eFW+glvI6k33iO
	y6sOOyYUmqcVWFVBiRf7jjX9OX88gQCU2pyRTTS3TEuqcQoaVu9z7EFqbZMCF4dvWx0su7RLux5
	IeXaMWLgll6eG20tLep6L4ptbtqfOyExRcvAe1Ww2/9k0DXoHbYNSUi/jr2rZYtL995DRkk7zUQ
	KiWJGlRp89+ovaVh2reAnuh2ZAZxeXf2ww4ocfh7iPfeo/xaoPSuC9ug0aolAOVYzEXDYxOImm7
	SQb2Z+ZVl3/sm5KwxoZ9oqPZIlDysXQBxuRUpmM5hQ2Ca0K1HiHyGGfgOLWkIrIGSMqTOtom+zT
	pLxkEeADwPq70nL3aWUc/T7tZRh1a28kz5DesFo1y5bp0oihFu
X-Google-Smtp-Source: AGHT+IGFhQUxhV6SF10u6CZSFFpi31Ect63oJZfFFTLF//BzPbI6yY/eC/VY0xS8OHwPwrYiIx73tg==
X-Received: by 2002:a17:907:2d88:b0:b40:33ec:51de with SMTP id a640c23a62f3a-b6472b60651mr339169666b.8.1760700103306;
        Fri, 17 Oct 2025 04:21:43 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:42 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/8] Add support for i.MX8ULP's SIM LPAV
Date: Fri, 17 Oct 2025 04:20:17 -0700
Message-ID: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042145_628556_C3B13DB2 
X-CRM114-Status: GOOD (  16.41  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
LPAV subsystem, which offers clock gating, reset line
assertion/de-assertion, and various other misc. options.

This series adds support for the IP by introducing a new clock HW provider
driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
allow it to be used for i.MX8ULP's SIM LPAV as well.

This series is a spin-off from [1].

[1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/

---
Changes in v2:

* drop redundant description for "#clock-cells"/"#reset-cells" properties
  from binding
* make "mux-controller" and "#reset-cells" properties mandatory
* add "mux-controller" child to binding example node
* drop the compatiblity with syscon - this was never actually needed and
  it was done to allow using "mmio-mux", which requires a syscon parent
* modify the auxiliary reset driver to use regmap - this will allow the
  mux controller, clock control and reset control APIs to use the same
  spinlock
* rename "imx8ulp-reset-sim-lpav.h" to "fsl,imx8ulp-sim-lpav.h"
* drop the "IMX8ULP_CLK_SIM_LPAV_END" macro, which doesn't belong to the
  binding headers
* fix the values of "IMX8MP_AUDIOMIX_EARC_RESET_MASK" and
  "IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK", which were previously incorrect
* drop redundant macros from auxiliary reset driver - replace their
  occurrences with their values
* squash the binding-related macro additions into the binding patch
* add mux-controller child node to the sim_lpav node
* make the "gates" array static
* link to v1: https://lore.kernel.org/lkml/20250804155407.285353-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (8):
  reset: imx8mp-audiomix: Fix bad mask values
  dt-bindings: clock: document 8ULP's SIM LPAV
  clk: imx: add driver for imx8ulp's sim lpav
  reset: imx8mp-audiomix: Drop unneeded macros
  reset: imx8mp-audiomix: Switch to using regmap API
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  |  72 ++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  17 ++
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 211 ++++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         | 174 +++++++++++----
 include/dt-bindings/clock/imx8ulp-clock.h     |   5 +
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  |  16 ++
 7 files changed, 453 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

-- 
2.43.0


