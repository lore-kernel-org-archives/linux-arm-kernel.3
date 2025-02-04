Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD86C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 17:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VwTYKeTvP2zh98/mahXQlMWN8DbX0ZsQj54Z/htdF2U=; b=0ZApoyGN8NYRFE5nozEmw9Cb+q
	4FPkCGcq6K2LkkPLoC6NQ8L4QoS17U86k9qlATa+nz0M3dbVu4xFkVqPGIDLphWSuWBT999VKpVXG
	olecE9xwxpm0RNSypww1Qcp6FJk41Xtm6nlTYUiB55QwLppeXVxrmWWT45zBSci/LBaDz7+OeHzjx
	yz8csNlrR6vGtJjPkrhV1qZ9NfnkzmbYLLjBUuFZ9TdTQizyMrRjUJrB+66FWlycsHHOMApStkuMD
	63HKcTKcjGuwFQ49ufR2lsb+zJPJXv3qPl+z81slQL31vi54rjWTIXbssLcpMVauqd+iu0nxhhbMR
	iAuLCnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMkn-000000016CI-1I9a;
	Tue, 04 Feb 2025 17:30:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMjS-000000015tp-0CrA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:29:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5dcb060ca2dso4444373a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738690144; x=1739294944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwTYKeTvP2zh98/mahXQlMWN8DbX0ZsQj54Z/htdF2U=;
        b=RTXnwqNomNUBtYvWmByNM4ch0CNpOkNJ41Pp/qdQ6QrUs2wppoIp0Q8Fk0lhryqVtL
         71p+JEnwIilax724vvKScrC8xbhtpD2fU6/ursgamWIwdA7cFFVvvGfOrlDMWE10PapB
         V2fjaZGAB8fkU7cKbPJotV16TpdVV2gt62ww/4hL1NuBqMJEpfUpA5WzFJM0WhV11/E+
         STuhEx0xnD5QQR2/73u84el/4TmAWwjFNcWS5qlSAfvZHYPr/wGjMKFb66EICIEUQtQ1
         Cf73n+Vzx0AP3K3D2Ge4lGADlDcIRomNCQRDMQCOLVEf/58Upe2slzRG834cCFir7NsE
         ANtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690144; x=1739294944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwTYKeTvP2zh98/mahXQlMWN8DbX0ZsQj54Z/htdF2U=;
        b=iP3mJLIOfnq8YliJvEqCfz3BS0UCOrvw4hr2Cv34rn83uSFv8n/xJocehLzhxPg+dm
         SYsxS1Nx4LDzAsv4ztjkyXL55cQosdCkp9F3cWR2l3vo2t0TcwCbHiBvSBVknGNVuvLS
         vaXfD+VSrThyEe+3Vzt9yN3EGd2r735h/nbjMn9c72HBBibHKVa8lQndpz7+ujrIe9Wh
         JA3Duzqav23LbDtaYpGGGgc9sxi/Mce6ziEfB2jth+YBD6oqqoV6dHa+8L8Y225Y/RdP
         3bJm5AUC1AKmj2/K2nvXwc+G1mkC6d4AY6bOBTvmEpXmWTiS0wYFJQtgBYF4R52FTy8/
         92ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxSdToGPyAH9WHME7gCR1OARrTx3h/DGuRBsEQrR3UVxxi6dHjS82XT0ZwNv+qs5uLRaT7YeQEMCXp9F+xjFHk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/msRQ8C44WR4ZW0DJhkMX9kR2dW8lpXRQwu47CAgV/BUCZ5Z9
	hpHNGfOYBE0uK2O9XM8XANzXawV32RhhxCcjPU5xmImmtN17IuXK
X-Gm-Gg: ASbGncuAME5z/BXEPX0NNgSO/wWRXOvKpoU+mBXgVHeDd35ZmdxzEH5hTqs7u3k/Uk3
	gbX1kQ5tTxxP+kDJcIwizptOvGJOQlFtGg0Yy1Wl6kNR/t3RQ4HZY5amTs4pxyAdQny3R0VlvvU
	myiLIQjD31wfwBlDK2NB/hyS+6HuOfGg2q2Sg2/JykyXn5wEcbJPHrwdQSh687rhuaWYx/p7OTU
	eOEI34UsrewQ06gSIATMiVSVSpa9IkCSoZ1eX9A4IMx7I0lj/Ae77G5bzwLmmr8seKgNOoKNw5w
	OLPq+NN8q9ylzWj1EKUWILeqyW2Re2xqUg3+eSzlezyExkwCZYnq36Yl7hZR5m7Gtic=
X-Google-Smtp-Source: AGHT+IEOk+OK5ArG0VIXZjzqbOeM/+xjSaekgbV8rm9qb76uKXgF+iirLCOOn4iceexDRsG2x5zcjg==
X-Received: by 2002:a05:6402:26cc:b0:5dc:8fb1:d43e with SMTP id 4fb4d7f45d1cf-5dc8fb1d6c0mr17739015a12.12.1738690143316;
        Tue, 04 Feb 2025 09:29:03 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd3156ec7sm664981a12.67.2025.02.04.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:29:02 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] soc: samsung: usi: implement support for USIv1
Date: Tue,  4 Feb 2025 19:27:59 +0200
Message-ID: <20250204172803.3425496-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_092906_091254_E0112A8B 
X-CRM114-Status: GOOD (  22.76  )
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

Changes in v6:
  - move the action reset after usi init
  - make sure clocks are enabled during unconfiguring, otherwise return

Changes in v5:
  - add r-b tag from Krzysztof
  - make the usiv1 code a bit more symmetric
  - split the action reset into a different commmit

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

Ivaylo Ivanov (4):
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: add a routine for unconfiguring the ip
  soc: samsung: usi: implement support for USIv1 and exynos8895
  arm64: dts: exynos: update all samsung,mode constants

 .../bindings/soc/samsung/exynos-usi.yaml      | 99 ++++++++++++-------
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 14 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 48 ++++-----
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  2 +-
 .../boot/dts/exynos/google/gs101-oriole.dts   |  4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  2 +-
 drivers/soc/samsung/exynos-usi.c              | 99 ++++++++++++++++---
 include/dt-bindings/soc/samsung,exynos-usi.h  | 17 +++-
 8 files changed, 200 insertions(+), 85 deletions(-)

-- 
2.43.0


