Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36136CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KXqzVoCOHNj4x3oLI8LonBNbU14rAUA+riYDz1pDaA0=; b=SVAVTVok02DH6zRvpyF+sfYnD+
	6QSTcsf4imk0m+HUWXHcWNOqROH1AqGxI6zWlba2gW7OVujByIZ4KLp4c8g+ea4DmuCZxsjsV3o6J
	X46y8FoPI23NIorYHXaIklHOTDUrvbFsqWxE2IeLU3rf4NbCY4870n0DIMqgSeRGhbsOF+Y7PRjsr
	FJJ6YFgdCCH/PQT4d8Zw1Lvp3pRGSoc/NL/EmVo8N69ex9V3cj0V5qXeA9cNkM9ugDznywvnOwP8a
	2GgumJWIib4V6YTNq+CFyxCA5I4QlAxtXhxVdb+9uKue66FNuyTc6Rr+JkSTNizJW4tpAtdm7BuG+
	NNGcGRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5gy-0000000Dxvo-1lQb;
	Sat, 03 Oct 2026 19:46:44 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5gv-0000000DxtR-1Dld
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 19:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791056793; bh=KXqzVoCOHNj4x3oLI8LonBNbU14rAUA+riYDz1pDaA0=;
	h=From:To:Cc:Subject:Date;
	b=WOewKR34m6KKKjNP+ze8At/bPfhY6OgNPhEJMMT53/s9QnFTSKa3aASpMmS8vCAuG
	 ZZi1W2Gzy8fEpdTjB0i+wbeRzlOSYTmwtMKUc1WxK2gLupbfWS7PMgPrLOuZBorIcv
	 mHk3PIFxvOm/A/t7tmrSoUe6ibRfY0QKSywuwNFE=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B9D93CB0; Sun, 04 Oct 2026 03:46:29 +0800
X-QQ-mid: xmsmtpt1791056789tmd9xg9z6
Message-ID: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
X-QQ-XMAILINFO: M2SvzgchpLqfCSVcvSgQB7e432dlIGlLZrovKeFBv0TAHYe9WXGY3FxV37JeyX
	 dHdwWhfp26KS02Vzsx6TlYjvuA78DOji+Uimyq2rcewDQM8AhJaHQmuy/l5tV+W/yOjE/EN3wHoT
	 m6rShVkqzEMAgMW+Y7Wk3xBLHbn9tr//fISPELMA9e12w4wcwiPeC6ra/kdRCYcuj3kVn7NrDY9b
	 FBCyPoTl2u+11jIT+dEbgX1/xcmj7MSRCnB8DGZ8pq1vsv9GUyt7QChwjryZvPKE77WOFP6KBjZv
	 5zPGDZUZUip3bVuEZYtDSIMPjuvqTLVyGZ/L6gg0510xjGhLR2s1zDfaWhffMzNtY+q8OHmLs0M8
	 vQa/HF4ZXv0YELi/BjcN1k8do3M8IWh5ShLQFrVbZWf6Tmk0yWtzYD4ee3AD64ctjniNLZxegTeU
	 Avtxsi5hHR7X0JZBY8v2ymjEflm6X1AhAFTD2nP6XvrK7aacH5gk56xujhYx/AzzHXPi1/hBFqjC
	 lqG8/TQGwj3i+01TYeKLClAOzuDbTC3x17yIvS6PLkPswQBNqueVfDr85a6XQ/1mQUxI1ZUNJfmx
	 6lzziCLKmz0hpkVOvtRrzEVIuYg6yFXACFNnb0Bn27GYGmB007QNdAnRdvvio3pb73riA8JPzfyC
	 4XNjTAKzVa/ipbmTNCpa6172lkEN08h2m+m7u6MR5WF4rvshVA+Y8qGqZjiDY1PmGsdG2SdV00Uz
	 B9XFp5SRZOVsaPHvuhHeqWoimbzQQi18DwBmUbmWjoZINPIg9Evb/qpczG7YcQsQgNeLzCuw0RY4
	 cuIqZ3nLNhRea6TIcS+VIxq41YKSJK4TiO1mMbafynWg7UnpoxeZX8ZBGWr9+U8IazMdwdtfdT8+
	 Y9LPEGRlg6uRA4gyivdF09ugdP2XWE1izXTa4H8YxKUPXggRB/NqT7LI6+2QW63sTiNTeASCJeaz
	 2ZkUKYKepu/JVDjdE8RYhc7V0s3HvFofsgf3rmuOCuzars0bwPaPJ+t/LK8gyH8pIf6I98SRyvHB
	 ohf81j9uWj9Yl/TfUSux0+nymAOC7ehMhZRZ6M/KzpcWea2ydI
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: zynqmp: Add support for EBDEE EdgeBoard FZ3A
Date: Sun,  4 Oct 2026 03:46:22 +0800
X-OQ-MSGID: <20261003194625.936288-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_124641_871312_D86C1378 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

The EBDEE EdgeBoard FZ3A is a development board built around the MYIR
MYS-CZU3EG SoM, based on the Xilinx Zynq UltraScale+ XCZU3EG.

This series adds the EBDEE vendor prefix, documents the board compatible,
and adds a device tree for the board's PS peripherals:

  - UART1 debug console
  - eMMC and microSD card
  - GEM3 Ethernet
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

The Paddle-Mobile FPGA accelerator is not included. Its PL description
depends on vendor-specific IP and an out-of-tree driver.

Tested on EBDEE FZ3A hardware with Linux 7.3.0-rc5: the board boots from
the SD card into userspace over the serial console, and all enabled board
functions work as expected.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Pufan Jin (3):
  dt-bindings: Add EBDEE vendor prefix
  dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
  arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-ebdee-edgeboard-fz3a.dts    | 272 ++++++++++++++++++
 4 files changed, 276 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-ebdee-edgeboard-fz3a.dts


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0


