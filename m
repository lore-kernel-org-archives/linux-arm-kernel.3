Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1A0C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=45MS1jGnaUhNCKXawiCX+6El1Te2L6a6DJuqgA3p9nE=; b=zqvzFhjEWo2G5aXSvD7F4dWzrH
	sXcZqwd9yq+IJ5XhPSpN25hyjsu8aerSX0ib5AfY3Ru+3B5vPhhjqsp/m7c7ByLOrHWBnfYZkeA+9
	U2PHMl7gPYe3F7rMtsql9TBh0lx2XajblYzqESbYEU4GdC+X8YWF2tuwEol9vfUauw7bBlo5odBKw
	FuHoVa/0SjNH5h0ifu42eNALluqaOxtxyriDIRF+VDbb0ZtgiRhf75jHeI/P4ftyWhwBDrT2GJNbG
	fTeNv+7srI7ONoeFck+70v0HowfCrIFcdvCiqkg/G2szNgLMCwOgqLLbfQ6+MWNkZ7mGFhZptvs5J
	DHIgcH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWf0-0000000Gse9-0SEH;
	Sat, 28 Jun 2025 14:36:06 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWbs-0000000GsJb-1Y88;
	Sat, 28 Jun 2025 14:32:53 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e812c817de0so542429276.0;
        Sat, 28 Jun 2025 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751121171; x=1751725971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45MS1jGnaUhNCKXawiCX+6El1Te2L6a6DJuqgA3p9nE=;
        b=HFG/t7e4MCVCxRuGXZdQT12oG8zzUWjRUFy5+vR3zxqrA5gHJvSIrlY9kX3UDWpS3r
         yk67I19ttWAP3yiQLYejYNmYrrkvAmEQP7yPTn3RQ8jUgw0y5C7PC0cLJrC6gjEBEkek
         4xAVzr1gxDky3DkNiScRSkULKWm8dAaByN/c/OTDIKeaQNFQWSSCMk7oRwV2khSrjpSK
         QArDkT92q39rnNgnAtc3HcDzfPoGqjqa4ix6G3XU7H7/jtnNf266ul3xGbF9M/qVqux1
         JyP5kIYIOZ3ju02EeixnBxmdJ4NyJ9K8JCVVM2quxbGHzwurQYF2fxa3RnjaL2NuPx3H
         2XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751121171; x=1751725971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45MS1jGnaUhNCKXawiCX+6El1Te2L6a6DJuqgA3p9nE=;
        b=RdI74ou0r9oi0gCCP4bt5FtZhMVh+EDvIXhrN3e2cJDdtt9fqXEBqyLzNmkR37LyKQ
         +dzvyoKSVVOwatlixmjGjUrqGY6vAq0rHjKq4nPb0tMZDnx1yNiA72NQoOQkSz1RfxfU
         tcg+o2jUdNiKC8Pts++xgLGBVz6VPRwV/fgIy8Lg5kwbk8HUlDqVQHsNY7rzOrAIHDNB
         L3xHAqyjmjGNep1oKEAAv152ZE6uqHHvsKrdx4hmZohx/DWNVdIwGdG2vwHocxgyf1KS
         FYKvZEIuu3h/DNwmdeIB2ki+XqfzowzK1l+BiVdHEprmE7iNfOcLEI7FG2owjc8bg5eA
         bBZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtT0G6826YKYnGsd0z+VRw+xihkAbcVM4w8a4N1Qv7f9+Wqz2uPyYhLXakSh2+OLyr+I6o6WTZUTfbMv8FLV12@lists.infradead.org, AJvYcCXQoqsRkgXhFN79E7f/abRR6J3/3N1JsphqKRG96nwxEolgWFnLvxP+jby48yfd/JiyNZQBS4BxU1JHeYlU51U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwB8zAVn+A0omcSm+J2yyBDhWqDMHl7VzGTa4R18Hk+9JkMlobT
	U+gkL6EsvP7AwRMIFzTwXvtMrmT1+a+i6I3+vRtSkG1R8YTHgNGe2cQK
X-Gm-Gg: ASbGncv5+pf2G+O642tE57cthmweldw6bp53jn1rCzJcdOyhnAG8MZlcM3Jw1W9wToB
	X+orRDZPh3hX/PVZ2FxqHC9gbccCkqrnRrFrUQ9XsvnnF7ldhzE/XOXfn98bmEswz48xLwkLACG
	8tkuk8QK6JEfXw1gPt9q/BFJP8pafsVONb+xxorXtj91Lmc7B6qBho+ZegrTvEG7STjUOIk1Hr6
	+MGKyxi63zVLBc7JPzxZHQiZcNLChbAIsrMhNvxCRtLJt4EiCZIrMgbdA2VyKrVHQNoBcPPJ7tg
	Q4RN9zO6Imp8rsoBsEGhoWNb239EiSiucU/rxxOwWVMwNyTdeVDDuDZ69lmeVooVYI2KQvw=
X-Google-Smtp-Source: AGHT+IESFyFCWZLYfYcronoGyauhrXiKxJd2nnHn7cFixMqmLQzSw7QDvKjzm7oz76Y/iC13YdLNfA==
X-Received: by 2002:a05:690c:30b:b0:70d:f15d:b18f with SMTP id 00721157ae682-715171a2efcmr107899067b3.26.1751121170867;
        Sat, 28 Jun 2025 07:32:50 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515bee257sm8393477b3.23.2025.06.28.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:32:50 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v5 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Sat, 28 Jun 2025 10:32:27 -0400
Message-Id: <20250628143229.74460-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_073252_413544_86361CA6 
X-CRM114-Status: GOOD (  13.83  )
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

This series adds device tree support for the FriendlyElec NanoPi M5 board,
powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.

Changes in v5:
 - Addressed Jonas Karlman's feedback:
   - Added mmc0 alias for SD card
   - Updated regulator names to match schematic (e.g., vcc12v_dcin,
       vcc5v0_sys_s5, vcc3v3_m2_keym, vcc3v3_sd_s0, usb3_port2_5v,
       vcc5v0_usb_otg0, vcc5v_hdmi_tx)
   - Fixed vcc3v3_sd_s0 voltage to 3.3V
   - Removed unnecessary regulator-state-mem for fixed regulators
   - Removed vcc_5v0_device regulator
   - Added pinctrl for Ethernet PHY reset GPIOs in mdio0 and mdio1
   - Used correct pinctrl format for sdmmc and sfc1 (<&pin>)
   - Increased SPI flash frequency to 50 MHz
   - Updated LED colors (sys: red, led1/led2: green) and functions
       (LED_FUNCTION_HEARTBEAT, LED_FUNCTION_LAN)
   - Dropped rng node (enabled by default)
   - Omitted HDMI mode-switching GPIO (to be added later with driver
       support)
   - Updated pinctrl names to match schematic (e.g., pcie0_pwren_h,
       sdmmc0_pwren_h, usb3_host_pwren_h, usb_otg0_pwren_h, hp_det_l,
       pcie0_perstn)

Changes in v4:
 - Addressed Diederik's feedback:
   - Renamed pinctrl nodes to align with schematic labels
 - Moved pinctrl-0 and pinctrl-names into button-user sub-node

Changes in v3:
- Improved (even more) fspi1m1_pins comment for clarity, specifying
  gpio1_d5, gpio1_c4-c7 (clk, d0-d4) for SPI NOR flash.
- Removed redundant #address-cells and #size-cells from sfc1 node, as they
  are inherited from rk3576.dtsi.

Changes in v2:
- Fixed DT schema warnings (Rob Herring):
  - Renamed spi-nor@0 to flash@0
  - Renamed pmic@23 pinctrl nodes to end with -pins
  - Renamed hym8563@51 to rtc@51 and removed clock-frequency
  - Renamed button@1 to button-user
- Addressed Heiko Stuebner's feedback:
  - Sorted non-addressed nodes alphabetically
  - Added blank lines in regulator nodes
  - Improved fspi1m1_pins comment to clarify SPI NOR flash pinmux
  - Moved status property in saradc to last

Patch 1: Updates DT bindings in rockchip.yaml
Patch 2: Adds NanoPi M5 device tree and Makefile entry

No MAINTAINERS update needed, as the new file is covered by the existing
ARM/Rockchip SoC entry.

Tested on NanoPi M5 with successful boot and feature validation.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (2):
  dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
  arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 941 ++++++++++++++++++
 3 files changed, 948 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5


