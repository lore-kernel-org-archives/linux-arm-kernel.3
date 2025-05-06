Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65C6C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cthrBE/hKEN3eoQrm4i+nHKuGR4paL2rIAOIGOo2Fo=; b=b+ZlxGccBUPqAENoXKd6ylum72
	GVeF/fbZdP+WNligEbJGB/iwbozOCOn15TcoC6DGtP7gkLI090HQWA1hHP063z4dRBmES+K5j/LbD
	U1l6z9ALGmq/cTaf/QtUyjM+0kkVP2D+8oBcYaPkml8xj5emAtWcckZ+XyvIyit8AT9UZ9LVvON/n
	ISVwMJ70YfMRLQGNhQ8i1A0DQylCV7IjST4KlG9esadkPxnMnVxVYHm7ihXm9l0Mu8N/KtDoV2E4w
	G+ye5XIOg6QYhlwI4dGOdaSJhml+BP0ZJIwwHwOxqi9poUr1auTg0b/Q7lOBZhUW35wqyNY+kJb4g
	DPs+Kq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIyz-0000000CGDH-2deu;
	Tue, 06 May 2025 14:09:17 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGfq-0000000BmA5-0TVU;
	Tue, 06 May 2025 11:41:23 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c56a3def84so567928685a.0;
        Tue, 06 May 2025 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746531680; x=1747136480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cthrBE/hKEN3eoQrm4i+nHKuGR4paL2rIAOIGOo2Fo=;
        b=T6j+f3v0MmNvalSFyYswmRaBILCDOsdEAGfDGfyFUczxnnqgFbNte+GDEMlHW15WXy
         4RRknbWsYu9cWuFJ7GgUAPfB5VuVZpop4HdEwzMULV6EQl+Yz7PMztaVP1nb0DA9FMFM
         fYzgpSJDh5mJDIjKbID2yH7LbEzX9uleG1JvABI75L9xNZL9C/CgvhsDPlV/olvEd6A8
         1iscgiHpf5zy0vEKaX2GN5D7qvM9TgGq3BaL87Rpe7yhGNVjC/KgfZVS+4EYvPEIlf8L
         ztqYCsRqapGyaniF6jI3tWHLojAV43J6/YIq2teMtqhlxpDe8qfrs2K8mLjD1VXGjTms
         SKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531680; x=1747136480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cthrBE/hKEN3eoQrm4i+nHKuGR4paL2rIAOIGOo2Fo=;
        b=Aev+ozrowrGpClOYqVxXYN5R6+JEvZgoiWQQdKDorDIGVGIRS621Ku2w7d2s9rs3ln
         0B/lnyhUJgKLx4NxUkSY47a/x4iyp7PetuNbdDmTg2N86Ag4FL4+zKp7QuG/4gUt56qk
         ai8UFfblS8urAaa7ZASZqdun3Uf3slr/jBYXlHjHG2CFiXWnmY/rWLjaKJQWcstzaLhK
         dAXzunZcTYWkp7d7HAQ1YlCqNegynooXRGCA+EX2YCU9mlSdj38eO7ILmmEhpnwx20W6
         cn+2iNmplkbkNQspCJVPPKl+4OUDRpz4EbwVTrG9HlHvwPCjcfw4Tzb9iGG3xt75HV17
         VK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgWq7u1yPCZIFpZ1WLvN4ePw4c+/vfnD95bzfQvhmFw1MO+kLhcp7OPI7MR7d0ucEx8R9nNoHR5qd9uF94Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIelgozvG9wg6RKU9qbpmVquKVzcOIyNYs/4VLf/NPNFPXR4vq
	jOfNGjSwZlyaCrrtl+zvVPhX/S9SxXslZIEy6Iq71dru6uyQN0RR
X-Gm-Gg: ASbGncvFGStfWrHYQHgE/m8W0p0ReXxsPCuyn+LOSCb3GdzUjSz+3SQDxOy3N1UJ6iC
	DAFlKmFgMANnxOFx2pJXsVHH3KdRzL6kcr0AjNs8+vV6ZdA4VQwpuWI8MRbdjNYJqDZTvBAKQ0h
	3wkY68iIGyd21IYxGJRe0gw3v2yzYIOTda8jKXy0+N+FuCPBW+peaamhwj2pSMoZJg8sgwrxGiQ
	FLcKFoUTEp+3Bau2N0/2jGIFNWdE+kmyJfGGErvg0kpLPTJh7hwaEXE+N0dlXqePpF7fJ9LgYFA
	XJ9FzXwKMummgBMAU3FsR6DN5BFa8uBt7AMpMLvn5JeLvpvJM9jBrE8EMVDlBkw=
X-Google-Smtp-Source: AGHT+IEP6qIEAlepbHnWxP68BD3kTfUkbgfGRMwMADJPrH8tCOpAS0cFOSp6pVFkj9TKKKJqIT+RlA==
X-Received: by 2002:a05:620a:c51:b0:7ca:c6c7:be14 with SMTP id af79cd13be357-7caf110be9fmr396054485a.1.1746531680390;
        Tue, 06 May 2025 04:41:20 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23b51f9sm697408485a.21.2025.05.06.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:41:19 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	jonas@kwiboo.se,
	frattaroli.nicolas@gmail.com,
	andrew@lunn.ch,
	John Clark <inindev@gmail.com>
Subject: [PATCH v3 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Tue,  6 May 2025 07:41:12 -0400
Message-Id: <20250506114115.613616-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044122_153358_3942C141 
X-CRM114-Status: GOOD (  17.03  )
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

This series adds device tree support for the Luckfox Omni3576
Carrier Board with the Core3576 Module, powered by the Rockchip
RK3576 SoC (four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52
MC3 GPU). It enables essential functionality for booting Linux and
basic connectivity, with plans for future support of peripherals
like WiFi, MIPI-DSI, HDMI, and Ethernet.

The series was first posted as v1 at:
https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com
v2 at:
https://lore.kernel.org/linux-rockchip/20250504102447.153551-1-inindev@gmail.com

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

The device tree is covered by the existing ROCKCHIP ARCHITECTURE
entry in MAINTAINERS. I am aware of ongoing RK3576 upstreaming
efforts (e.g., by Collabora) and welcome feedback or collaboration
to align with mainline driver development.

Changes in v3:
 - Addressed Jonas Karlman's feedback on patch 3/3
   (Luckfox Omni3576 device tree):
   - Added pinctrl for green LED GPIO (gpio1 RK_PD5) for proper
     pin setup.
   - Reordered regulator node properties for consistent sequence
     (e.g., regulator-name, regulator-min-microvolt,
     regulator-max-microvolt, etc.).
   - Updated regulator nodes (vcc_3v3_pcie, vbus_5v0_typec,
     vcc_5v0_host, vcc_5v0_hdmi) to use 'gpios' property instead
     of deprecated 'gpio'.
   - Removed pmic-power-off pinctrl state and pinctrl-1 from RK806
     PMIC node, as they are vendor-specific and undocumented in
     bindings.
   - Removed pwrkey node from PMIC, as it lacks binding
     documentation.
   - Added blank line between properties and child nodes in i2c2
     node for DT style compliance.
   - Removed no-mmc property from sdmmc node to enable MMC
     support, aligning with RK3576 SD v3.0 and MMC v4.51
     capabilities, allowing TF card slot to support MMC devices
     or eMMC via adapter.
 - Removed Ethernet support (gmac0/gmac1 nodes) per Andrew Lunn's
   feedback, as it relied on the generic PHY driver with incorrect
   RGMII delay settings, which would break with the upcoming
   MAE0621A driver.
 - Addressed Rob Herring's DTB check warnings, other warnings
   (e.g., VOP, PCIe, OTP, HDMI PHY) originate from rk3576.dtsi and
   are outside this patchset scope.
 - Added RNG node to pick up Nicolas Frattaroli's "add RK3576 RNG
   node" patch

Changes in v2:
 - Enabled HDMI node per feedback from Heiko Stuebner and Nicolas
   Frattaroli; untested due to upstream driver issues.
 - Enabled Ethernet 1 node per Heiko's device tree philosophy;
   untested due to suspected PHY driver or configuration issues
   (removed in v3 per Andrew Lunn).
 - Clarified eMMC remains enabled but unpopulated on tested
   board, per Heiko.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
  dt-bindings: vendor-prefixes: Add luckfox prefix
  dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
  arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 683 ++++++++++++++++++
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  53 ++
 5 files changed, 749 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5


