Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FD2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=; b=4YWVfCoNZgccn1dCz7RdgAyebg
	H/OnYvw5AJ+0BZNkNSjRvAC1vsuQ+3FxowxOLXLn9BtkCz6onJKvS0XldG0DW7BiGtaNFms+HGj88
	QZUtiR3jWrG3VUkXOpuLPnF5wEtOkSD0lv7oqI9sGsm1GHqC246Ntn92sHh6uk94iF72TUC4b62HN
	EVV2HxNMOmMtdtUR9zIWfuFrPLMJIhexhsVdq9zFFuGVeU+xQ3b26U+agYmSRT/83f2fG8ublC7G6
	bAACSpwRfzNkJ6JLwsNTb+I8Ufr6iO6iuhQMxWwyZY2vxbYbyCu925movLQLSANSsFkG6/M5E37i1
	KEQuinaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm9s-00000005ScR-2GvQ;
	Mon, 09 Jun 2025 23:44:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOm7h-00000005SDb-4BV4;
	Mon, 09 Jun 2025 23:41:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3036450f8f.3;
        Mon, 09 Jun 2025 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512508; x=1750117308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=;
        b=g4jtYNrGJa07M3Ozm82b57n4vcFQcZwCkkp9C/bkdc+2yKQciASwGV4UyzOmb0kdeD
         /OzUAysznx+qhwr5dJKM7GzJaCCo03eUu8JnPJirZ7Bxo8GQbiuEDyjuNj8a5y/NrZC+
         WytYwkPtLQpM5XRT83ijetqvWv50bEyn/Tm1xeVGW8D/ums5Sh3orAZ49t0CSHJ9KVK8
         OAklfWe/mNnALQpvxFD+YzqcRwGyKDkAcCqcm4lZKvUSscGOgKTM5frrlGGQE5pReZ1b
         3repDxRAp4paxs3X4booCUfOYbfD5Xg99ofA4WAiiIzjny2BfKl375+L0TK0EwREIqtR
         1Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512508; x=1750117308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=;
        b=D36wCAaMq7Mouog3ieicL7G6SZz47ccuKJ5+FtLzqFaLLCT6cl0WPyiSCk5l0kl3pI
         2Sywx+dJgdbsDEjHJJpQsOOwBWC36s9fW/Q+aVM3XsyPH0qjFca0PQAcgBkSxewI5Od7
         HHi41MNNuaGF7Ar/yFWYGd+h9TDsSXw/os+eyRCF96aOCaJLFtkLqqyYtFAcRq22Jndk
         DN0iIhBtmZUAYSfr7s9hB20NbadJJ6tCPEL5pk3RK8nQviiZNkq2CrVKN+i/cRRd+oq7
         +EMtpeHv2ANb1jAoqVHdzmsUD2UG69zy10PVHWcKDwbYuOA2JO2HkgvXxdJTVt1rwI+K
         FWrg==
X-Forwarded-Encrypted: i=1; AJvYcCVqruhEvHf19BNQ/874BPCjF9JJi5jR5xTpkiS4Y7VsjpHsiphSVx60yyXxCUk8Fym5LIU6QO7U54H45g4=@lists.infradead.org, AJvYcCWWuz1AKfEy5+7xBT8mzu88j09BcVVqdpzTt9pAsgrUbxV/TNOU0GWNMHLlhNHXtA+Y8F9HAMbtDc2PecvcGur4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh1uTozTod6hfzfCt+84d5GRNIwT3HLSWxXDBCvUetFtyletOe
	u8LM3EAaaTUAEdPM6GNANQOINWU788jOdsYFWo79mzvKB8BaczZe3ee9
X-Gm-Gg: ASbGncsP08ZtBQ2is6QJV/jR7xyJ9nHkFMfa4Q1WlJuNlAH3QqsCuuPiMoyu2QHez3i
	HbvxvVnYIjQOgY7Rw91XY8PVp5VGqcYoI1HjfnFBpAv8epnFEhUNzcOU6Mkjhed8CVoEA2Q1ULi
	aIAr5adKh8opQ1nfBl3TNCnWNAGniNCswXiM3X+ToBlADDvpJ3Cdb39uJ94svKP5b04Wh4gyvif
	3uecC61QWVAafInZXstDq01SWkIx4xN32D6/pKK7+osBvYR9YOGBVPQ58RtxgUgJ9PoUghh+2Zc
	ZFSr+5Dj7rMoILQWA3LnBcOqn08OjUwXmvFAtzcvOSPtVo4f8h+hKiP8FMEAWC017Ubs591iO38
	=
X-Google-Smtp-Source: AGHT+IEsAqVyl21nrnHMCcfk0whdunesI5czCGvugVWSJ+BoAoNWxpXOTu6PD/8F0KK4s/GGTVK0tQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a5522cc60dmr287159f8f.51.1749512508160;
        Mon, 09 Jun 2025 16:41:48 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:47 -0700 (PDT)
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
Subject: [PATCH v6 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Tue, 10 Jun 2025 01:41:11 +0200
Message-ID: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_164150_051177_88413DA9 
X-CRM114-Status: GOOD (  17.46  )
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
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 91 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 8 files changed, 226 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

-- 
2.49.0


