Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D145C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 00:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m6pURmVL5pc7CL/4Z+XDERMVUMwy4OEE/W3/L9YQ5D0=; b=iRRRMtTIVlLgEruUxN9OXAd39q
	v9VwHexGX2w71Q42I+A3IWOA7zrsZ7kb+FCBmGYkp6sNJ5mNvzHHCdPqNdYQbk0khX/X/bGDNxbHA
	Mbe3Vil8m2hMBVjn5VtUlW+gy3yIrBP6JDVaP1L11UcKHmQCmS5nxqPNKbKx3+/W89k0DMG+ECD3e
	XB//muzhZqZRC5D2ZDsI8OCVKge7wv1zmtzW9Y2zyT131d9Q5Kgxmhox9FSoToJlP0SbyQV+09NqM
	U7BvkOVQxGQx+GeCvk/dDFx0uATE+I1Tq3HF9sXAqAoDZwIsltVMNs174blE22M9uU17IoDuwRDZU
	HOP2N1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFixY-000000028RC-2KQg;
	Fri, 16 May 2025 00:29:56 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFiv7-000000028BJ-3BRn;
	Fri, 16 May 2025 00:27:26 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-48d71b77cc0so20907921cf.1;
        Thu, 15 May 2025 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747355244; x=1747960044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6pURmVL5pc7CL/4Z+XDERMVUMwy4OEE/W3/L9YQ5D0=;
        b=EqFImN6mnkTNgcEHlzI9zUwp3cP8Ek3tmaCi00C1R7CIZ4zRtEaRk38a8h6tX12gDW
         aYKOe04MmeXuO5ogGQhP3Csv2xNTtje8hzyyGgErEV1o/bEH9oF1JZzo1d9Xsp9ah5xE
         AWoMoY8cxfAi1Gwe4qu2JHqaZgUi1IJDqxIhuKVSEb9xJ06HgZVxX7Dwwx38Zp2KO3pg
         9NTnROsxDwoZy6vHy44RdkxVzJTQPu6ktyP86rBLgzW0qZMMQgr2VIyLnONp+dx8sa1U
         q6HSrii8ckofw5MwcZUsBiIN/Z4lBLXYUWkOiG2pnp/1G2frHCjbNfIgSbczOpuZa7Bh
         +GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355244; x=1747960044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6pURmVL5pc7CL/4Z+XDERMVUMwy4OEE/W3/L9YQ5D0=;
        b=Ln1z196VDte4ur7cJoDn1JPna7ztnFjn/XPlskrXW87LX1SCFPMetneUZ/fFOojBXF
         Ihk/p2eGy5rEAVwKS/2nJekR/UnKActDDbgG//pTKxOzfm+05l1eWKKrT0RWJgzdQ4b6
         PGL54sTv5567v67V4qXvDwEy9hoeQeMXekmse7cBm6A+mC4nlYvMAqPLocmvKntnIYLv
         0TAPS52XwqqsBuEKlMZK+5vVV6MiD2uLyxSquT4uLPFpc5hpU85QhrPGHsD/0M6ejUjZ
         QMZuQoBhMMrwZSror7qMQ0j/N84aWVJxaYly9UZcaONOJJw9ON7EiNob0mTw2+zm0r/F
         CNDA==
X-Forwarded-Encrypted: i=1; AJvYcCUZrI1QAxEgbuAX6BJi9TPQ1sv5GTFmNP2XxQAlNI6UQlByVzXp3HeskiqkZaMrpkQoU1AwetH7LDZfOy2v4YCL@lists.infradead.org, AJvYcCVNUO+ypAebwc+95E7mXaYkhcG7qOH6rfKGXYTJFxWV8dESr4mfNC6u9khtajJQ/QcmthffHTrrLvJ9tBvp1bk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX+Z7MTz/L44iMMvQiOUaecciCLU36w9cMXtZPO+Xd+c3PKiw0
	415L4DpqC6lgGnGp2oLrVch1/8Tyd98lu9Y1BHLLCWbsPjd+erOx9NVj
X-Gm-Gg: ASbGncvF6YxAFRqWLwTpVrLan9LD4lHT5WuDY5njBWl9So4rfLFcOnInZOSdb1F23pm
	p8xlv3ec1kwn2IJehD3NjHuO3QRgsduUxW6hZ0IE7HAl1XACSCr4VmXPCMYEQZFBIEKVfySSMtV
	iyOHCNrDaAj/DFLOwB3X3uZdoLn2rvnUyc4mDnuItQ7gs8N4O8QwlTG7CcLjlMEq4WNBbMMJ3al
	jrlYIB5OPLyP21uXSstsMB38sNg/Zr3zGhgui/m1uM7nHMa6fbYwxkZfTp5Iq5QHLVY8GLJ+6UI
	gkF4bPlX8X2ZJ6f+QeV4qqETjJ33DF0GIn/FhSW10epJBhFJO6zcS1kzPvdFNb4=
X-Google-Smtp-Source: AGHT+IGri81tUaY4oEPMDFBUBSTE06hP6AeMH0PFD71DE1XCAFR5XnVVmfT9+56UOC1NwRJLmcI+KA==
X-Received: by 2002:a05:622a:98d:b0:48f:5d4f:8e86 with SMTP id d75a77b69052e-494ae4ac4b0mr30273961cf.50.1747355243930;
        Thu, 15 May 2025 17:27:23 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef1fsm4563991cf.9.2025.05.15.17.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:27:22 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v5 0/3] [PATCH v5 0/3] Add device tree support for Luckfox Omni3576 and Core3576
Date: Thu, 15 May 2025 20:27:10 -0400
Message-Id: <20250516002713.145026-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_172725_796226_297DCD76 
X-CRM114-Status: GOOD (  16.46  )
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

Subject: [PATCH v5 0/3] Add device tree support for Luckfox Omni3576 and Core3576

This series adds device tree support for the Luckfox Omni3576 Carrier
Board with the Core3576 Module, powered by the Rockchip RK3576 SoC
(four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52 MC3 GPU). It
enables essential functionality for booting Linux and basic connectivity,
with plans for future support of peripherals like WiFi, MIPI-DSI, HDMI,
and Ethernet.

Tested features (on Linux 6.15-rc4):
 - UART: Serial console operational
 - SD card: Mounts and reads/writes successfully
 - PCIe: NVMe SSD detected, mounted, and fully functional
 - USB 2.0: Host ports operational
 - RTC: Timekeeping and wake-up tested
 - LED: Heartbeat trigger functional
 - eMMC: Enabled in device tree, not populated on tested hardware

The series includes three patches:
 1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
 2. dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
 3. arm64: dts: rockchip: Add Luckfox Omni3576 board support

The device tree is covered by the existing ROCKCHIP ARCHITECTURE entry in
MAINTAINERS. I am aware of ongoing RK3576 upstreaming efforts (e.g., by
Collabora) and welcome feedback or collaboration to align with mainline
driver development.

Changes in v5:
 - Patch 1: Moved luckfox vendor prefix to correct alphabetical position
   between lsi and lunzn (Quentin Schulz, v4).
   Acked-by: Conor Dooley <conor.dooley@microchip.com>
   Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - Patch 2: Unchanged from v4.
   Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
   Acked-by: Rob Herring (Arm) <robh@kernel.org>
 - Patch 3:
   - Updated copyright to include John Clark (Quentin Schulz, v4).
   - Reordered top-level nodes alphabetically per DTS coding style
     (Quentin Schulz, v4).
   - Reordered CPU node overrides to match alphabetical order (cpu_bX
     before cpu_lX) (Quentin Schulz, v4).
   - Moved mmc0 alias to rk3576-luckfox-core3576.dtsi for module-level
     eMMC; kept mmc1 in rk3576-luckfox-omni3576.dts for board-specific
     SD (Quentin Schulz, v4).
   - Added regulator-state-mem to top-level regulator-fixed nodes with
     blank lines, omitting deprecated regulator-suspend-microvolt; PMIC
     regulators retain regulator-suspend-microvolt to preserve Luckfox
     SDK behavior, with a future patch planned after RK806 driver
     validation (Quentin Schulz, v4).
   - Removed redundant max-frequency from &sdmmc, as it matches
     rk3576.dtsi (Quentin Schulz, v4).
   - Added vmmc-supply and vqmmc-supply to &sdhci to support eMMC (Jonas
     Karlman, v2).
   - Confirmed blank line style compliance across DTSI and DTS (Jonas
     Karlman, v2).

Changes in v4:
 - Patch 1: Unchanged, Acked-by: Conor Dooley.
 - Patch 2: Fixed binding for Omni3576 to use correct enum syntax (enum:
   [luckfox,omni3576]), added luckfox,core3576 to compatible string
   (Heiko Stuebner, v3).
 - Patch 3: Updated compatible string in rk3576-luckfox-omni3576.dts to
   match revised binding.

Changes in v3:
 - Split device tree into rk3576-luckfox-core3576.dtsi and
   rk3576-luckfox-omni3576.dts for modularity (Jonas Karlman, v2).
 - Patch 3:
   - Added pinctrl for green LED GPIO (Jonas Karlman, v2).
   - Reordered regulator node properties for consistency (Jonas
     Karlman, v2).
   - Used gpios instead of deprecated gpio in regulators (Jonas
     Karlman, v2).
   - Removed vendor-specific pmic-power-off pinctrl and pwrkey from
     RK806 PMIC (Jonas Karlman, v2).
   - Removed no-mmc from &sdmmc to enable MMC support (Jonas Karlman, v2).
   - Removed Ethernet nodes (gmac0/gmac1) due to unreliable PHY driver
     (Andrew Lunn, v2).
   - Addressed DTB warnings within scope (Rob Herring, v2).
   - Added RNG node per Nicolas Frattaroli’s patch (v3).

Changes in v2:
 - Enabled HDMI node, untested due to driver issues (Heiko Stuebner,
   Nicolas Frattaroli, v1).
 - Enabled Ethernet 1 node, removed in v3 (Heiko Stuebner, v1).
 - Clarified eMMC enabled but unpopulated (Heiko Stuebner, v1).
 - Patch 1: Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - Patch 2: Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
 dt-bindings: vendor-prefixes: Add luckfox prefix
 dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
 arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 748 ++++++++++++++++++
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  50 ++
 5 files changed, 808 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5

