Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A5D715F1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=; b=zTAKJZYvYmLp5y
	0zXJDYmWwwjJ9B7Kyc11xKeTh7BBmEPGe1QiwjJvlg3piUjI1DLQ3iTY4I8UWOOkcjTcuMJXmnfmQ
	52ZRi0Q2CcR0hjF+f89MuzOKbGl37g7Xww3kgUforHhXZNpsUlVH32hrVtGonBH3fNKyrQL4XEMNF
	ayv96EyLFgDocYFJ84Dl10BwkkBilinHLA8p2ssH7Th6hI1Lif92drZlm04asRU6300xmfrbIDTe7
	G6njt0Uyk3kZRRP1N3bSTRKB1Fq7N84dCnYj7PahGtbu2a1I1QPtdcQVmBWRQ5wsEKEOE0lMnliob
	MRBTCM9G4q+uwI8UPnkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9H-0000000AO54-1gPF;
	Sat, 24 Jan 2026 17:10:11 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjh9F-0000000AO40-0eN6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 17:10:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b87f00ec06aso519322866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274606; x=1769879406; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=OwAWh1IMSTwDQ5GyQYwx/hQrG9smRxev1VsshoffjUDuKAOubc7EOg9hiXW2oLFRLB
         Gd6m2iXIMTPP8wdboCJwMExna73BJcCVNZWiDqcd4ktuNQHeSjyOo/inuiNK427WPdxY
         JVuxJt6uVG65DoVrQJAnq1J73NI38x27mhpoz6eyy6EbbzNCxlpLgU71zkTNxhLsn000
         BCTLVZZEoyDBpwsCZ9MRWI5CK44nbv79cB7ziW5EqDVJy5q2zpWYJjnajeSqdKs7YTnf
         BXrhUGZIlJANVS6HK1EBNkTqnMTUnEdvrCqSFYDNvIuJGmGq/2TmPZKg7LDiGaAQQlmk
         lKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274606; x=1769879406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pEYynqLlf97tqquz7gBzDn5fbpmeV4yt44zAz5u1qM=;
        b=BVDVMe56W+2TAbDy2Iaxz9OzP/mzIifxFxQSogljISsOf3hzHhtssrUOPhy+EMg5bo
         vKTT443pas61UPcH82dXlQ9RDF2DfGvyIjVXF3cWah/HC1cnTVFzxgYQk/+EXncB4Bsq
         lnKfugB2cmpFdrdFxUORLOnOXvMXBhlQHCZjeB57MewGgj+01b9WWqNmrTkmGfcgsgC4
         /KwSGO5pS8HmbbmFgGJteY1NdzhdaArW71TwwgZ279O9mnP0hlalB+kthYU8DBwbebVm
         cOfavFCDK4JOzoG38yhKXWMmspdX/2jrkyn4BLxmAlGB7KBtwtNGUkj44Cb+n8dI83tW
         D6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEAgTP9fAsRf5Axx3j/s+iLv2xY0g8V/mjRK/18W/5siAj7+WyBLl6zLQ5yRzwe35rCsOKHQkXvUH3sH+LQu3+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb61rm6+GhEJlHV+1K1kl5E2eDYj/zw2Rz7NqRn+IEgQqLCjK3
	C7Da7yzUSCAVSlCSt7Ds7xukOXDLDD5u6C+aHsobDc2v3Y/s+hFEDXC2
X-Gm-Gg: AZuq6aIl3mGYErgPXOU8nmCGYhNoXMco55l3udWh9C3h5f8Ge4EHjNDwxGWsdSCpYcC
	Zb2QFyw+LvvhFxiK4TvIBLDAN5BtcIB3/cBVMCBfOIFDFppHRWQ6g3ESKULkeP2bOR83dI+/5Zv
	+GL6YkVTHYjFr9OC0loHnzLsIztOVUg8KfRvSNMooNtkpHYtyypGP+FwqVRgLp8OAo6+jcFY95M
	8GCcHs6gTkRaCPguiNZ6x6xS2grmWp8fG+P3iVxQLBIG6mpg8cM74BRsr1aAQg5MZkbaKntwoKd
	Xp30VwpwAjVf6kxjCA827WNXpWXDjNylGgXO/ba0n6CsFcWAtpUF8PYUN+RVjKLsvN9YQMSnfmX
	ZWU2USIGDqAHaH9bb25KaVGjPf9pZ8+gzKrd9lKcDDpPTRoC+fEWyymmqNO9cAcyGn+GMmFdAEq
	+AQDW7iKMuhiLwg36fUsHaqPQJDfQbennZFNjym1aVkzupkUObgOK+lInE7cWCsqkhCqoNOsYjy
	gdVGK9WyP6QhUnVHpap5evPteZxPlTSLqE=
X-Received: by 2002:a17:907:841:b0:b88:6dd4:9c92 with SMTP id a640c23a62f3a-b886dd4c7abmr307707966b.62.1769274606124;
        Sat, 24 Jan 2026 09:10:06 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:05 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH RESEND v7 0/7] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
Date: Sat, 24 Jan 2026 18:10:00 +0100
Message-Id: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=jofWWnwmoG4Nrm+u2R6rEX8xNv7yEnOjBBXdOGfBxTY=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzq+wj4PJy/Z2WSDzD16fqcy0N8pnAAj1rHj
 9Xrxk2eusqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86gAKCRCzu/ihE6BR
 aKhtD/4lUst05I/73muK6zgkgetXnLj7dE8mutbAdPu3v8GfvQWoAmdQq1rUvrXZVLRSfVOqTnF
 nEQ8VBfM0vatX7oN9UOA4MBUPGXh/Ed5+qSFyCF0ZnRW5b0TpBlECq8IQFd+30kDYnc3YTFGnYy
 dvklvIXD9T31YWqc5zaEJPydlpC66lmPVe0HRSy18yi60xbCg0T7TV2kS/YYxYz8pmn+tqgwSfS
 bQ/dInrqjixoYTn+DUxcnggrJSPi1x4NcoX10hEbcJaHsEm/3oSiiUlII5HT3xY8sk3Eh3NcvDc
 ENiP4ZqX1Oy5m4f+hGGlkQ+03aRJwKXpKrgN345wDk6G/SIxmuIfCWf5L2MQ/WIALw0xsJV+k4Z
 U0hQ14wM9xoopOeIgauE0B98/Tq+zaFCu+fQ1az91FhyZQuDFpTqcqCBVlfpX3XwLaoG9pclSTy
 fvPjHAFOH+VtM/pCBtG/BQ0R3fFhu3vLBbVje621umjhv/5Bvi5IoIjEmdJc6k/fihFBB84L0jz
 JbcLZz6LNg94PHSoVqAZCm30hoLCQdnfFHcOcNkHvGVAdou6ZrzEDemuWqbcLQgMRJivriAFciw
 IkI82aLDu+P5SQ1H9ym+ncBvuCtI/kdFkxNb6JBgOGfRcqRXBYDDYqC3znHXjrhgfRKuzBB7lDD
 ns1Iorf+0MZiidw==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_091009_262376_FDFF2A62 
X-CRM114-Status: GOOD (  12.32  )
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

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v7:
- Drop DTS patches to make merging into the clock tree easier. They will be re-sent
  in a subsequent patchset.
- Link to v6: https://lore.kernel.org/r/20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com

Changes in v6:
- Rebase on v6.16
- Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
- Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/

Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (7):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 8 files changed, 499 insertions(+), 25 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


