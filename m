Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sD1Sd6cAP8Th7UTJsJpR3D3J20e2A9Te/LBbAhEgPjM=; b=1IOuC+coV+nD4c88nS/lqsDGtW
	V6HF5iswd1sA4rgPoAbqHgk3MdAsRZOCOR1jZ3fc+AUutshp2BLFzCzumS1qEpwMkT5wCr+ATNVRy
	nEB0ldJx6MCRRR83hFenYWioBdFc2rw3uChraPGEP5pQwxpODDchh1XvrtPjm8JAlqhJyXOmFMjs2
	qN0SAdpDHFuDZUH4g2KCLfWB5xHmt8P4cP6P6JAf0rtqEYqRYP5tFVnup0+zj4qGhGiy4TXRsSibx
	htg9O5osudihqvEHQaYqUrbK7EGHbJUlrmmG98CyspbDEIKExDQ+EsdJ4wZc32AOPPBWIfJL3V0UW
	1vG8sKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLdo-000000096Ux-2kQ4;
	Wed, 12 Feb 2025 22:55:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLSg-000000094hM-1HXp;
	Wed, 12 Feb 2025 22:44:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aaec61d0f65so67437966b.1;
        Wed, 12 Feb 2025 14:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400244; x=1740005044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sD1Sd6cAP8Th7UTJsJpR3D3J20e2A9Te/LBbAhEgPjM=;
        b=nDB3mFWm6O7Dm7hQwOu/9aUngsHHXo7u70TUulsWCEb/c2Ut3D8TXM72jwIVEp9Ax1
         iBl+5rWzmHtQggzmCYX6d84S2rivgSUTFD2jZw2Iec+sNhQN8OATZuGCtlT0zNTBE1ic
         rZrZlpCnD/Pya6OoMTDXx6JoJbOOUQUETF+hF30ODfHUQ2KMMmXqTObAut/bFmdx6FyZ
         +bnEYHBvnktw0htLfw7LSrV8lbssFHb2dEogVOIiMyxReqRrZYjh2gg8iHGYe6Wbuzqg
         ihw60d/X68b1QjpjMFlkOA6WqHvq6Pe/s/brVKzl7+IzewDYDPkFA7fFW6/wA9ohzATD
         OT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400244; x=1740005044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD1Sd6cAP8Th7UTJsJpR3D3J20e2A9Te/LBbAhEgPjM=;
        b=iMkOp+xrKD+mrKr8ucf4629xmAp9rygyiiX1Jr5+xP456d5pObE1w/CY0A3SHqkEjs
         IDQyGJmaitwKJXdAABBIF/wNhT+a6pTCdLP8yh//CchYMpqAIFbw15URKqUyKpQTYNgD
         PhgDLIIC5D1sTamIEMRlynnybL/j0DHFbIc9jKCBgvxGsk9E+nbuJzYnWafBg+ZshXds
         n/kLY3ZUT9zQ0jClXKQj/wkL0SjTUFVaTCjM+RYDKHFp5K15w6tbC6h7P0Ahdm81Ntmn
         K/9ZmLpZz/bN9qp4DlKPKEQoAd8C5sksVu9JsJNp/lMs+AG6BiJIFJh/C4H4UzwBM/Gn
         U5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT03YevZqeSN0CEhdlKzzqKOAC5AUhXgr8d4hwsWVCV16lh/XjdNSz/hRd5BPACkkx4JQ6lhoYrnQijlqHG5Ot@lists.infradead.org, AJvYcCXii0CNqDl2LjLtfhTh0vL5gtXgG7k8zIimGQOJu8ES6H+Xmv6qGtQDovUcRgauWTz1c1xihwxE9L6g8xw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAtayUIVTstHt1/ZYq7GAKuyXzxDdiEmtSHEAIfeheMo+S5v/7
	v7Dcp36BzDIQljpxG80nfaLwwWwX635F9qKgbByZMskN5IqQ/sslj0p/K+S3
X-Gm-Gg: ASbGncskmYM2XFsrO9X95tPp7dk4XAZKCFNtIU4SpBsJvCbUohTpaMi2nwLnkMdmddV
	pzVtwBdcgxBR34oOXfjk/wqxSOzHjCjwONL2sqXT2aRPJLlPG37aw3+szGDwAMNg9Fak65wEGs4
	/JXcfZhUwtlj2KLwNBVHc5W2Ky4fGtnsnUCs8eU0Qt6L67efWPXx8BdKKcZcEv8c3h7lr+CPG43
	9oEK4H4nr4aHlN/7ymYJ/3YDkH2iqEXVzauJX/uJB1ls0TqLKBYG53Uu8R92xuIEB3W3CDUqayV
	nioSGNzGO9sUJOabvjIIGPEYDWMo
X-Google-Smtp-Source: AGHT+IGew9eYcM2URi/21CyZAiBNRVDDORJCErtMKBXGaipTpLhYOkMN7qo1rF4n3H1ilggRuIN5EA==
X-Received: by 2002:a05:6402:2748:b0:5dc:c3c2:225e with SMTP id 4fb4d7f45d1cf-5dec9d3eb64mr723602a12.8.1739400234330;
        Wed, 12 Feb 2025 14:43:54 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:53 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Subject: [PATCH v3 0/7] arm64 support for Milk-V Duo Module 01 EVB
Date: Wed, 12 Feb 2025 23:43:32 +0100
Message-ID: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_144406_344455_6A632D3B 
X-CRM114-Status: GOOD (  16.91  )
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

This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
been chosen because the upstream toolchain can be utilized.

Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
peripherals with an addition of ARM64 core. Therefore it would be
beneficial not to copy-paste the peripherals' device-tree, but rather split
the most suitable riscv DT into ARCH-specific and peripherals parts and
just include the latter on the arm64 side.

This series adds the device-tree for Milk-V Duo Module 01 EVB, which
in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
SG2000 SoC inside (separate .dtsi).

This series has been tested with Sophgo-provided U-Boot binary [2]: it
boots from SD card; pinctrl, serial, GPIO drivers are functional (same
as for RiscV-based CV18xx SoCs).

Partial SoC documentation is available [3].

This series lacks the support of:
- USB
- Audio
- Ethernet
- WiFi
- Bluetooth
- eMMC
- Video
- "reboot" functionality

It would probably make sense that the series will go into ARM SOC tree.

Changelog:
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- dropped all patches related to the new reboot driver and corresponding DT
and bindings;
- grouped DT-related and config-related patches together;
- added patch moving sophgo.yaml from riscv into soc (to share it with
ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
- other changes are documented in the corresponding patches;

[1] https://milkv.io/docs/duo/getting-started/duo-module-01
[2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
[3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf

Alexander Sverdlin (7):
  riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi
    files
  dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
    SG2000
  arm64: dts: sophgo: Add initial SG2000 SoC device tree
  arm64: dts: sophgo: Add Duo Module 01
  arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
  arm64: Add SOPHGO SOC family Kconfig support
  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

 .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
 arch/arm64/Kconfig.platforms                  |  6 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 75 +++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 28 +++---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 28 +++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi    | 36 ++++++++
 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi   | 23 +++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 34 ++++---
 15 files changed, 347 insertions(+), 106 deletions(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi

-- 
2.48.1


