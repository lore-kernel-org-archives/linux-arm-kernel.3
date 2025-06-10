Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E3C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6wXuQ0VlRw4xeAGCSUgQnm/1pPPb1xh3dx2heNqSZYs=; b=X8JpM2uD41xEtzq6ph2pQp0Yqb
	W1hrfHp0zZRZZlawjKeiYwXSfSplZkyRp+6d73Vas7Am8d9xVO7BN/YJzZPysizS6qqv/oD4a16U7
	LOJsvp5sblEVATW5HCdJY6WHooP5LV2zudoyglxJ9euv+8Gf3OokB+oZwNjH/nB+O7Pi+Q2k+6KjY
	/S38OD6jesi8sISFpEgSV1nEEWCrphdd76LgBtoVQOyDA2IgnBwHBLExkV1VJuPEr7XdhYRxX5q4V
	Tqw2JdzGENOlNH3nyvM5idCPjbM72F0hkn9U4QKrf+7kyEkirifB9CRTCTzVaerzzr5noj/U29pi5
	XxZMB/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7n1-00000008Hs3-2U5u;
	Tue, 10 Jun 2025 22:49:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP5Kn-000000080iK-3Q8W;
	Tue, 10 Jun 2025 20:12:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so67545875e9.2;
        Tue, 10 Jun 2025 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586356; x=1750191156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wXuQ0VlRw4xeAGCSUgQnm/1pPPb1xh3dx2heNqSZYs=;
        b=EPrPqppn7VTF9EiyX/bqeALLhbzza5aKcTkIyYi6yttsbhpYA4T/U01qfRm1MRX37a
         76EkDLCT+ceGwE63+8uQ4i2Fjf+eXgj2p8LthceIH5WwKxmrzlZAzyyOWna5mvLKtz13
         G9H8yG6R8bCxdJaPIRCI4f5YUgjV4cypbpsJFbfpoTjksCu9xazZ01LIryjTZ6e/q2NU
         oo3rSql8pMmcplRlPGgkvAaFx8P6vPcUCJGGFScN17cDQxZMV4EXegRMkT2xbVV68RCd
         tg9S5CNg+V6c7mjfrZGC45u6TN4b0jE0gMZDbQU/hjLhnvXK5gSazUvw1dMuhbuILmpB
         oiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586356; x=1750191156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wXuQ0VlRw4xeAGCSUgQnm/1pPPb1xh3dx2heNqSZYs=;
        b=Td+8X/w57z7lyF574alflc/4d9/47EiCoRgDbeIXE0z8KP6YMbkiZJr+Udj3DFf7BV
         TPiwxtuZjmH+CEDfeDlQbMMv40rekKzfkdjNVOwWxhYlTlDiW5CZ/HikQx7QyfPEAfbd
         tBmpVBUML2O8JjQ7mImIB3Bk4w6x9MF0CeGVCRiyCwXGPxOa7/mCVVzXBfCCO21SAiWK
         xbrrCaexSOi0wWQAeYrIvh1VZk4WpoyrOloiMqd/45rSOfDVvNRQ1H7FOv/wTBkRchuN
         F/eG51QZTVzm4v6xoZSkeEWH+6o+NGkYnl5ysE4s/uDUsT0NYBRmXYcdxRTsg0GRpy2p
         m23g==
X-Forwarded-Encrypted: i=1; AJvYcCVwASIB3Dsnr0zwZLma3cIPuyx9YbbOtZsUMYJtf1zALr1hQ+HMU0kTg/WSiKhEtbMLLukwBGsxJYU/xEA=@lists.infradead.org, AJvYcCXOoGacAEI6FDjKhiUnBmkcE/DJjI+uBT302qYbO9Yj7QFGQ6GL4xmj6CcZLBD7kUSqFAawr5NkdHfRRuXD1eKo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8AQRnwcqgTTctbm5UmVvgi3MM/diJBx/uhI8dmI+1no56mUSx
	yHbr8eGCiFoV0N08UymJbP480yoZdzdc2BrFT2gL4hP65YPGCMb2PWXx
X-Gm-Gg: ASbGncsJxS5COQM8rkYe6b7V4BEQCm5Lb+4ai/Wr9WDZzv7qA/dv6RFWxvYfvliUkDm
	rzTXtoZLLOz6cqkNubhjz8N5eANItTIjo78UgGwT7+hZLoekGVvcvrMTiyKaJeW82TXLreaCKE8
	fJb8AHxKlhSqiQ4LroSZbvH8nH6uufXflx2OyMqTwqFIlvOklxzt6XlE2vy+wP8vcW79gyterWv
	sMfZsRfb2xdX5H9q3ZSpXjPh0eQoEaqdhamECXt3gxWD0YucfbjuIKTu2kcIqQjdIWE2hyzrhFG
	nLn1cukW3V/vJWcKNBTUDkVReG0qouVBeNP9djQmnbXYxYssv/mR++qGLkoGX0LXpD3HgXnPcsk
	=
X-Google-Smtp-Source: AGHT+IF7ZtZQchjXHit9dQu+Isc3qU7RROUr0beDeSQ4CVfjUtS/qF2Z56VOPyuF7ZV8Vzq7V130lg==
X-Received: by 2002:a05:6000:40d9:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3a5586c30a7mr339272f8f.11.1749586355592;
        Tue, 10 Jun 2025 13:12:35 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:35 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Tue, 10 Jun 2025 22:12:13 +0200
Message-ID: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131237_853042_0BCD7054 
X-CRM114-Status: GOOD (  17.74  )
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

Changelog:
v7:
- dropped all reset stuff again; it will come independently in [5] and is
  fully compatible;
- rebase onto sophgo [6] for-next (3a8cef361be5) (almost v6.16-rc1)
v6:
- rebase onto sophgo/for-next (108a76779829)
- dropped first patch refactoring RiscV counterpart (equivalent present in
  sophgo/for-next)
- added cpu_on/cpu_off properties into psci node
- added reset-controller node, compatible comes in [4]
v5:
- PSCI node in DT
v4:
- minimized patch 1/7 (cleanups dropped)
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
patch 1/7
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
[4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/
[5] https://lore.kernel.org/all/20250608232214.771855-1-inochiama@gmail.com/
[6] https://github.com/sophgo/linux.git

Alexander Sverdlin (6):
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
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 ++++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 86 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 8 files changed, 221 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

-- 
2.49.0


