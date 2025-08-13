Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC45C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3kL1xnjqe2uzC0tVKSkm6SdseVayTEiArpVj+WQ0yDk=; b=YlJ9z8ZC3p5Xke
	h7lPHAQN8E53RtlswTj/Vac2IPS5JIODBdiBfMG8DmmW4X7Mfg/T2jYtTIoeHDApmLTB7rIW/vuR5
	Lvdpx1UCwBrP2jxiRyCpfKfKShVv5i1fLVyyIaq26HVwGshDFx5nxi3WmOoT8UgL/wMxTVUxRxh1y
	Gcxq5Hd251zALLErqigcjX+Ag9z544an3oUO6DPpBofKVWeRJ7Mos0COJZnWhbzEyWiYxkmqXFomF
	UNZ339zbO6hfdkeyRUMJYfDpcuClRF/uBViZuvpy/IVHegRcj/paGQGkYeTWTvQE3HsngO77GZ/ix
	swaIuwpf2DTq24/P+yoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9rZ-0000000DXhY-26i6;
	Wed, 13 Aug 2025 11:41:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um9DO-0000000DS6z-3C9h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:00:20 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-af96fba3b37so1203000566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755082817; x=1755687617; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kL1xnjqe2uzC0tVKSkm6SdseVayTEiArpVj+WQ0yDk=;
        b=gFwSTspIhaMvFbLEwzZJ95NvAiSwOu44F0cmJBHCuEauzIWNAv57UYmpurSMjFePIk
         OBT3bBqM4Z41mvvb6PSgPfqVId01ikiIWOAqDUYD1ixRsh8FG0zaUWJ1Zr/t1k1TF1As
         f91Ng53IfKbO7seh9fEuGDBSuMc9cixqFUPi2lteoFkQrSKlBXrtvj0lGDe+6v38oLAP
         WGEQ80Ph1ThFni2iXMU/ppB0G3g1YJmbbteD5vqqEAGxQze4q+uG8QdiP9gblD3kN4BT
         Rk31WIdPRPOylvI2UKpumpfOrEZ5ifi7b0nY40AcAwSgVLaLFK6PIGisa0tpBww8md0f
         ONbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755082817; x=1755687617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kL1xnjqe2uzC0tVKSkm6SdseVayTEiArpVj+WQ0yDk=;
        b=Ta+YZ/VPczXdxT8vdzYdF/rspfmYUtPnXfD/R2s/Qi3OKa9m76Sm0gpDU6E4u6jwEh
         FgkA/x6qJv4OWyIeQCG0OCQ/PWykmgy7bvk3AjWgLD3JnQfy6qJHlwrGDPqoS4C5CpwE
         ighluNd7AXssAzbJyUE0whbOwIBWa5deS6J/Y/F11Kr8rgM/uyfwf/tm4DnOtsMzOrMg
         PVgrTS0Xlu4ybyQP85mZBGlE13p96sMFdZUaqkCfKlkhRVjw9sBL0Ac1AGsez5zxST6p
         nCqG/2xu++xulSZIQSaBnte9lLH+1A32Tg5aF8D9JohoB8Kno74bPJ0RnZLWCzHj2mbz
         F7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW8zgdS8Af2OCpM+w/hfsQkIDfQpWI2RPiVkkto2ggSvefEOH6xjOr0XRAep74IaCle5U/g1MUb+rwA+ujkG8dB@lists.infradead.org
X-Gm-Message-State: AOJu0YzybZJFkkrFOwGkN6BcGDDG/tsoqHw4evTAbZVIl8bnEV1cJ2gC
	qtwWcPTFHZeS/v1u1dtMwkTJFqTOtFp3JBViY4Ze1ZKwnGP0DeJLVWOy9YbdTeab
X-Gm-Gg: ASbGncs2nHRCPQTM3K5qX2d/DMfnB9bZXtTb3AJt8rruiUQfRKNHSlmemcuAB//SJxy
	nZjuYD42th7r4VPCIcyntLjn1dTmT/RhP1X/uMpoSlDaTTfoqdqB8exVLTEgWUH+LnZa2M56ZO5
	m3vygP8Hx46E10cSCErfrHThJ2QDe0H0U2BXJ7ZOkvlv0+gJ3RT3fXGBbzjcjUgzd2JSl2itsWC
	9d1kCAtnWNuPl3zIy2lw/HSvTW48o8CiWAeb4/HwDPH7JE+pubp3KPUpBZAhDH+xTKn48X7n5QR
	peh+6jgxdWD4VHkIbrWtYHSuVLLYFXjCeUwr4aLvGwWKAzJJAZXCJGFpz8fR9zNc0VYhb6eegAf
	5arbpUlHM97UNI2gnoNFq1gY8md4ddfWctqbPfbB9oT6cW1lXGI1Od1hUkCTu2g+UwYJSlIjGBa
	2EyDGU
X-Google-Smtp-Source: AGHT+IFoEKaitmZozrkaIV2lMO9akto5+yC9M/iP5+uw8oBSm22duN29iN/S3y04sK2bfwHVNKAamQ==
X-Received: by 2002:a17:907:7f9f:b0:ae0:df46:abd1 with SMTP id a640c23a62f3a-afca4e3f98amr247549266b.45.1755082816613;
        Wed, 13 Aug 2025 04:00:16 -0700 (PDT)
Received: from tablet.my.domain (ip-31-0-121-4.multi.internet.cyfrowypolsat.pl. [31.0.121.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2377046966b.59.2025.08.13.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 04:00:16 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v6 0/9] clk: bcm: kona: Add bus clock support, bus clocks
 for BCM21664/BCM281xx
Date: Wed, 13 Aug 2025 13:00:06 +0200
Message-Id: <20250813-kona-bus-clock-v6-0-f5a63d4920a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZwnGgC/2XMQW7DIBCF4atErEMFAx5wV71H1AXgIUFJTGUaq
 5Hlu4dEqmLZy/ek759YoSFRYZ+7iQ00ppJyXwfudyycXH8knrq6GQhoBEjg59w77m+Fh0sOZ66
 hNUTRUasFq+hnoJj+XsHDd92nVH7zcH/1R/l8/1O4To2SC07WmLYzxmGEr+PVpctHyFf2TI3w5
 kqoDYfKnUIV0KE3rV1zteR2w1XlHUbf+BiUR7PmesHlluvKY6O1RLIKbFzyeZ4f3wH9YGkBAAA
 =
X-Change-ID: 20250212-kona-bus-clock-4297eefae940
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
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=me8EWh422YPo3cERqnPRxnV9qzRXPkVz2TeOOkHXTbc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBonHA8O6A2pkp8j9hGUKYkuQ/MG/naw+/K46WAl
 1fvHeefl62JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaJxwPAAKCRCzu/ihE6BR
 aI2AD/9prGAajhmB12IaeM+1QVgtX+yglvCsBau0vEnAQZdHlXUv1rS9vdQOhk/Gfx7Pm+TWoKT
 k4Rwe3nRoOsdxUaPq6c2RqcY6J/5RmzT7op4pzH+5Blkv93ttFD/Mng0aje/OnZfJU/k9KUDyE4
 0Blgk8xkO+4RporUvcQ7LGtwooYt5XoMpsraUYRQ3NvIwyGB+dV1PayawYcGX4PgseRl81q5E5H
 3cRvvr4ttwj+Wsc2Ac1bBUojXx4kVSz+rEYg3smTHviam/TJaaKx9fz+2ogpX/rfBDkUa9i9yIM
 lu5hDAQwLdXpSxexuUTiUXqKsWHPiWfZqWGSCsQkTX+5FWibZCo8taGrnJ2QyED5n4B6necBJab
 cjT2nukhlODxEigxQ0AP2AGL6JAck3KKJ8k+7vk7l4Nvq67e466DpDZqrDIyEQuZGrgEv4BRm6+
 HRMuKkPoxx8RT5gFeIsN2DiF1f4YMrvOdbqg/tP0lPovNi9ebQXpR3txft4PXuPSj9IS6DXb6S8
 0FjEISVa4q6P56CfRsED6gwO+envY6oUO+YgsxUPTuJ+nW8IfuS+rsKhFVE6BeucnwjH/hEhM89
 8KFLWHywA4Fd0FvByEaIJtsRCOQjFXrO5KFJOLAi/M4nQaLqZ+qJnAoET5OKCEZgdVuM5tDwBGD
 VPHGgP9jEZpU7ww==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_040018_812410_9A22506B 
X-CRM114-Status: GOOD (  13.05  )
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
Artur Weber (9):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks
      ARM: dts: bcm2166x-common: Add matching bus clocks for peripheral clocks
      ARM: dts: bcm11351: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 arch/arm/boot/dts/broadcom/bcm11351.dtsi           |  33 +++--
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |  28 ++--
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 10 files changed, 540 insertions(+), 45 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


