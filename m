Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F5DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kSUVW6GTWKF2wmefWyE0vBf4Q6ZRM8bA9zeRcXh2pts=; b=X9D6lVjIvpTPFY0jMm0CqhUF6I
	jXLxxWuy1wqeRRy8fKql/mWILo4BWoWVJZwiYe4bLyohBZOQvFcWOYZVATe2DLIwOzPJJvNvGyS8i
	sC64gIKxnlFpVvRyRRPINnQgKlorE5Gijo1BPaWz9QypOf+SKHyRsdq0HDd2MKKAnmu4uDJm1g+lN
	ZTzHF2+WaN9IkTHlgXuNFaNbNY+LPeiXIneFwOeyVtu5nLqGKH2Dl9w95p2g4ZPR8vdbRs1pvxTXn
	Nq2FKrA0gGB02VtwDP/8bD3Z0iny2sKbgDBNRbbWbOrhVpaTqdz0YE8Zeh6NK7vX9BT5SNhW8Zjjr
	nNcaDLKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV86B-00000004dQg-2VvU;
	Tue, 07 Jan 2025 11:50:15 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7rn-00000004a1m-3iEc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:35:26 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d8c1950da7so15330692a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736249722; x=1736854522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSUVW6GTWKF2wmefWyE0vBf4Q6ZRM8bA9zeRcXh2pts=;
        b=T3OfsxgEIV4WaCjzO1yCClBlkDPJ8XsDx6BCvEcJoa8WRD1AE+aIrekuon4P3TRk/C
         pBV2dZ576ypx+1XGR0slE82miqsbA8zJDOwOHaNL58z9QhRewu4M8jvR2hd0d4tp5E3O
         d225ZbAAUL2DCHcCtB9PUnErVn5ePPuehQQJ7BGjnckSJnXZaguGvJr1iDw73nKlZsEr
         lHK8mErIVxBsUiIu0wL1zwfcPmb3ffgXyyGbFsqlZ7Nq4yKxMAnrck/ChfACUXUix6nq
         Apq8/VmKyOTIAvXWIyk9LvjhWUO10jKUOCU73ZBydDkR63yx52xhECZBI6hmnSW6aoyk
         2gGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249722; x=1736854522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSUVW6GTWKF2wmefWyE0vBf4Q6ZRM8bA9zeRcXh2pts=;
        b=t2a209LOjZxrcrkGgGpVIdvP+mSLMvmzHA1/VzFeERLIe12tn59e3WWpwf/goxY9CB
         ql8PT3FbGVa95XCAKy8mprhgLGwq1F24b73SwI7gDQZ46Iws6S9sZuJqvkoZMPIMMHLT
         dxnKFzaw3PZXppW+Z0IDoebcqOkURtvCc5TbzbuBk4EkCfH4UwLn2hKS0rr87tMH+o3f
         MOpb0QtvfBHRitY/vdpysurzD450FbPtVpxguDyJUUCEim4fhJf4KEzt1tcNMVmkN9/M
         GXx4CF3ciNS1zinUEv0SDPNEmY8hzKvktI05TJOP0zZjjHUwam/RjSQe0oiUoXhrK/ix
         RwcA==
X-Forwarded-Encrypted: i=1; AJvYcCXs3iSU0dwWrJkSI1w3BjevHaXClJ6pYFPVJxi2m/d20e3gdXrUYdjtnjmEsBYZNj2JiTxBek0dGNCbasL+uM5K@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5zJldbtlAb8EN0I8EyOJTqXCvpcWpxzOytvM2I41D8ttpt05W
	iCG3Z5DO0lFyMLJPhR5VK7FCP6wvaussH+9yXHBDAYQHqcfWXHzz
X-Gm-Gg: ASbGncucdug3kFigEq6X/Nm+Uu2K93aXtPoTA+6W27CUysyspZ+N9sKLFhSXO6WsCs0
	hckDrj393anP6yQz8KSKv4j4gth/UriMq8wsOWH0tkgBb0XKxDIepgNQtEezZaNT7GWI+peXF4g
	yDID6DzssP2D1mqG+iaFDLMP/H1BlZ9Eyo0BvhD60ULOUsao8bSOHiGmiTQH72dlzcNr0Pjz45Z
	6bJfSBYXCgQzl/ptUZneA7kn3Y3eeqbEHQp4zmoj4x9CzbmElvpF6JK/j1sr/34d98FzmVcKZ7i
	erRrwDv0vPDXNV/xuIk=
X-Google-Smtp-Source: AGHT+IHEUFxp4/hMM1hTgoqPNCWtPeLIRmmE8wRnP2ztgECUmYD8HSLD0/dfczewjo4gowWcJZ0aRQ==
X-Received: by 2002:a05:6402:430c:b0:5d2:fa65:c5e2 with SMTP id 4fb4d7f45d1cf-5d81de1fd2amr59121007a12.22.1736249721526;
        Tue, 07 Jan 2025 03:35:21 -0800 (PST)
Received: from ivaylo-T580.. (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f23bsm24881055a12.32.2025.01.07.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:35:21 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] soc: samsung: usi: implement support for USIv1
Date: Tue,  7 Jan 2025 13:35:09 +0200
Message-ID: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_033523_921574_5116D40C 
X-CRM114-Status: GOOD (  20.96  )
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

Hey folks,

This patch series adds support for USIv1 in the existing exynos-usi driver,
as well as dedicated sysreg compatibles for exynos8895.

The USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895).
It provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1). It's a bit different from USIv2 as it doesn't
have any known MMIO register map and the serial protocols that it
implements share the same register base, hence why the way of modelling it
in device trees will be with ranges, like so:

usi1: usi@10460000 {
  compatible = "samsung,exynos8895-usi";
  ranges = <0x0 0x10460000 0x11000>;
  clocks = <1>, <2>;
  clock-names = "pclk", "ipclk";
  #address-cells = <1>;
  #size-cells = <1>;
  samsung,sysreg = <&syscon_peric0 0x1004>;
  status = "disabled";

  hsi2c_5: i2c@0 {
    compatible = "samsung,exynos8895-hsi2c";
    reg = <0x0 0x1000>;
    ...
  };
};

This patchset also assumes that [1] and [2] have been merged before it.
This has to be applied before the device tree changes [3].

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/
[2]: https://lore.kernel.org/all/20250103082549.19419-1-krzysztof.kozlowski@linaro.org/
[3]: https://lore.kernel.org/all/20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com/

Changes in v4:
  - merge the first and second patch and don't break compilation
  - add exynos8895 compatible in the binding's oneOf:
  - keep exynos850's compatible in the first allOf: if
  - add exynos_usi_remove callback and error path at the end of probe,
    making sure to also have a removal routine for usiv2 and not just v1

Changes in v3:
  - drop the sysreg patch as it was applied
  - add a patch at the beginning of the series for renaming all USI_V2
    constants to USI_MODE_ and a patch at the end to rename them in dt
  - redo the usi binding support for 8895 to hopefully match all
    feedback from Krzysztof
  - change the description of the usiv1 and 8895 binding patch in order
    to account for the constants changes
  - change the subject and description of the usiv1 driver support patch
    because we're adding support for exynos8895 in the first place
  - make exynos_usi_modes a two dimensional array while also accounting
    for the merged usi mode constants

Changes in v2:
  - add r-b from Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  - restrict the possible ids of samsung,mode with an allOf:if:then
  - set the properties samsung,clkreq-on and reg to false for non-usiv2
  - only make use of exynos_usi_modes
  - make sure pclk and ipclk are enabled

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      |  99 ++++++++++------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |  14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  48 ++++----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |   4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |   2 +-
 drivers/soc/samsung/exynos-usi.c              | 108 +++++++++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  |  17 ++-
 8 files changed, 209 insertions(+), 85 deletions(-)

-- 
2.43.0


