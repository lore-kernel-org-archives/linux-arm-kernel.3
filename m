Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85649C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0SStEyTofDPhfx4JhlqbX9qCANFPRgD9nwadZXdsKAw=; b=oT2S68JATVl2zum82FwH43arCv
	2Wt4Lp0+jr89dxY7dA277kwmHFY5fEwIb4eX8am7pfAee9yQ1peNJdCTZ/CQd8M5a4fTw65fF8zmH
	gr32QgQlxiZxQ8CgtlP2+gFwBpaOT+Y6GJe85hk6CN/JFpabllGFZwFXkaGHbxEISJi62YO2j/Ip3
	4/SwFsiRguc0/JnS+1m2uhr7FP4XDykME5fEM8cEC76zBsX+HTagisYJKjqG2kV9s5ZVMu3JNulza
	19NAgnOK2p9Jela77VnFXsWnSVOaIQiC8Rz7TZkDinrI0EacMmpMV/cjTQDjZOxwX3yGD8QnVy8uC
	tAiWDDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFTe-0000000Fevg-3ym3;
	Sun, 09 Feb 2025 22:08:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSE-0000000Feet-3evq;
	Sun, 09 Feb 2025 22:07:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so851598f8f.3;
        Sun, 09 Feb 2025 14:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138825; x=1739743625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SStEyTofDPhfx4JhlqbX9qCANFPRgD9nwadZXdsKAw=;
        b=JipztD6hP2mAPjl5RFKco+Cgw566JlsIWeerII9zR4k62Ippj2OkUQhgs5xT4NfBwo
         GHcaqC0lRQcjn+k8ozamlvo3z7MaKeFHeELz8xBGV9cQwdPSHguFjDUz2K+S7ilVG+Cm
         KvWxmLC9KRt32UHB8ekQiJ6S+OAINfZYW4rHjzDCewFS4+I+ki2ZfEV8cxG0FDHxWeQI
         cYRGdBPyon7e89kCjnH0z+SWLPX/fbwoSjj+/mga8EbFptRUdjnnRIjU9qdYzG8hBjgI
         KURbduleDbn57M+861i8P4obvS/RPlN6iZ8se5CVUzQMOCtElCuL4x5F50RQ/N56xcX6
         NYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138825; x=1739743625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SStEyTofDPhfx4JhlqbX9qCANFPRgD9nwadZXdsKAw=;
        b=ejS10h+fXIesOwRVRc9f+WDaYaqsO12EKNdbBOEoLhwUJqWFf+lnryHCZ4ewRNOLcS
         AWKULAGqyEVgzUUBbHf0WT+lhpfaRepmcS5LB/Tmq1ThbkuP5A+qk2Xos0JemzJPUIUm
         BXbwMi6y3yJsbYsaRAwLh/wv0ilkTjBnNN9VGPWIzXc3nrE2MlM4oLvWo2FyWVzV7/P6
         AfIZgeLeI8a63tcJQXx3Hg8A8yquuJMcP8uS2Sa5xQhNHc3T4xTFkVLEnKw2kZ9v+pFm
         +7mcVTKn2EAQFo1atno+16eCtTRCoxYCPkCrao7TFNd+JoL0Je4gwytiQjuwpeBPqvCI
         UYBA==
X-Forwarded-Encrypted: i=1; AJvYcCVCUJsCS4mKA12bdXyZnSRuH9jgr65wTyD38EQTwcXT3Dkalf7LkiPOIdyJvYsoe+Ro3BWipPjiafUTTgc=@lists.infradead.org, AJvYcCVuQ8pJjfSFuYMfI0g0hwcraQlf1NjxQnkGpUqo1fujJz/TIZGX5O4vf7nvjxYQudWrE0JVoK6aabwBxycA4pIK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+oIQTNCAFAAkWNabfg06WjgSGqv5Rg6kYwIIbeSUdYIwm5Vs
	0dIzjQLaARecVs7B8YqXWp08+29bQ4UXBfKrwZ2uKMbxCnVd6khq
X-Gm-Gg: ASbGncug6P/SuyDuRrxTQN/KPn++iRO68FhdrsKz8QwpAyQwsb/7jbAJErqXAMnPinB
	Xg1S+rEfmoKkjMwX+1oQK3L3skNt7JFXrMsER2rAmbBInEOyz1gbstXdsC8EHbQl4zz1PdBIfxG
	GmKAkxxOYFUOxo3IRhA0zZsVogcjpslYqkxPQ53ATIPXQK4RI77WDwJrkTGAIFoK2mOto7urMUb
	Cfo/XkKVswrC69h6vWvyjUR3Y9wOEX3LYWEPd3jEjq14Mo0+G1BhPMcVMZktS+R9tPqLFNiTZLs
	E9IqVuPzdSPZ4CNLZEB7d9vuFlHr
X-Google-Smtp-Source: AGHT+IGaYGcJZM+92Cv8nPvpHOwYc6gunMtsp2ldN4nyyr8ek9G+l/o+4jLNm5KeXzDP/LDAiB9c+A==
X-Received: by 2002:a5d:5f88:0:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-38ddffcc58cmr305497f8f.44.1739138824394;
        Sun, 09 Feb 2025 14:07:04 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:03 -0800 (PST)
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
	linux-pm@vger.kernel.org
Subject: [PATCH 00/10] arm64 support for Milk-V Duo Module 01 EVB
Date: Sun,  9 Feb 2025 23:06:25 +0100
Message-ID: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140706_914482_1B7B3437 
X-CRM114-Status: GOOD (  16.38  )
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
boots from SD card, pinctrl, serial, GPIO drivers are functional (same
as for RiscV-based CV18xx SoCs).
New reset driver is provided as an alternative to the ATF PSCI handler,
which Sophgo only provides in binary form.

Partial SoC documentation is available [3].

This series lacks the support of:
- USB
- Audio
- Ethernet
- WiFi
- Bluetooth
- eMMC
- Video

It would probably make sense that the whole series would go into SOC tree,
even though technically nothing prevents the reboot/reset driver to come
in PM/reset tree. If everything would come together, `reboot` command would
work out of the box.

[1] https://milkv.io/docs/duo/getting-started/duo-module-01
[2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
[3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf

Alexander Sverdlin (10):
  arm64: Add SOPHGO SOC family Kconfig support
  riscv: dts: sophgo: cv18xx: Split into CPU core and peripheral parts
  arm64: dts: sophgo: Add initial SG2000 SoC device tree
  arm64: dts: sophgo: Add Duo Module 01
  arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
  dt-bindings: mfd: syscon: Add Cvitek CV18xx rtcsys core and ctrl
    compatible
  dt-bindings: reset: sophgo: Add CV18xx reset controller
  riscv/arm64: dts: cv18xx: Add sysctl and reset nodes
  power: reset: cv18xx: New driver
  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

 .../devicetree/bindings/mfd/syscon.yaml       |   4 +
 .../bindings/reset/sophgo,cv1800-reset.yaml   |  38 ++
 MAINTAINERS                                   |   1 +
 arch/arm64/Kconfig.platforms                  |  12 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/sophgo/Makefile           |   2 +
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        |  79 +++++
 .../sophgo/sg2000_milkv_duo_module_01.dtsi    |  84 +++++
 .../sophgo/sg2000_milkv_duo_module_01_evb.dts |  30 ++
 arch/arm64/configs/defconfig                  |   3 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |   2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 329 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 305 +---------------
 drivers/power/reset/Kconfig                   |  12 +
 drivers/power/reset/Makefile                  |   1 +
 drivers/power/reset/cv18xx-reset.c            |  89 +++++
 16 files changed, 689 insertions(+), 303 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800-reset.yaml
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000_milkv_duo_module_01_evb.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
 create mode 100644 drivers/power/reset/cv18xx-reset.c

-- 
2.48.1


