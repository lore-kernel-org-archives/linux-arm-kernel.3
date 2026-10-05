Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD8ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=06i4WcQESlvt9d5hVxVL6XtfxJGmUMnEYGAhzyyvOHw=; b=g0yvvp9riznCnisptuxJFJri5F
	cA2gNFsy/VfbzcVgTG3Dkaf60+NFeVAx3zpOHKhwOcqDusePkDiaz+44vtYwOiKB90DNaiPLkU7DR
	miX2uoHAHByZO7iM6pd/VfVHGg//oUwqAHIrq8BEpf5f4M+a73ZsFS9g3cMdUjWzevFRfySZTdZit
	mfyGzsHVU4kuStjffIyA8iq6C8okfF7mFIi09z8yOGFnCVTgH4FeyCrxtefAAuy0lP/W8u/HfJiHN
	V2OOdAfDZAoPkmZWJ1aEQ1PCW/LLrUwMyRxEAh4BgV+A9OIJJvNdj388PTr0HYORcIdkeUzSzvBAW
	AkiyIlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmYv-0000000Gva3-0jx4;
	Mon, 05 Oct 2026 17:33:17 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmYs-0000000GvYe-0yto
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221592; bh=06i4WcQESlvt9d5hVxVL6XtfxJGmUMnEYGAhzyyvOHw=;
	h=From:To:Cc:Subject:Date;
	b=vEVNBgE9bXkG7ny5INeAyekjas8ERoiSySS1Xsna0hZBEEXYf0J4k/1xCVeKAfiqs
	 MznJX1OyqhNcSNNjcOI+lAoeXkmzONdQCrgGEoSL5VJjx/Onznhh49BSpOcgUrQVwW
	 cVH895LZchFOeaoGp9uST67Hs+dgwZ2zMkWN37Ms=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8493A252; Tue, 06 Oct 2026 01:33:09 +0800
X-QQ-mid: xmsmtpt1791221589t8fu07obf
Message-ID: <tencent_AFCC7B9046C57B49E6FDBD8009981E935006@qq.com>
X-QQ-XMAILINFO: Nx5J06Esz7r7GeE/XHa3dCNz59OfJGVkoXqRXygwwtoTU4VYjug57S68tanRxP
	 UQRzBBrqj4wX5zSj7WZ5ceCrkvlQ97O9gVeHca132oRSjklCu+/P5TwOoSCggdtEWCCW5ukmTUew
	 g1D4dld8qheyrWkG9q4FFiBnPXE3odYFT6z0m5zJ5OhZ3LWNS1RKJi8E5IOXFxlb1UEXJzIkI2gm
	 XK5Vg3ccA15ShAnk85fUTjGeFdtGg8mJ3P4AUNcdK1piKl9/LrHzPtuenJX3SZ8dT+1cspASMSOG
	 qPH9iUkpI282MkQGd3c2G/guzcl6gLg6sg/rtkS2rR+pd7zRpYPPNrcGRmMdP8oc4NyQ085PePN1
	 m0Imq9kl9haTphx06PU+nPUTwgg6rOfbkoveGu0/dBJejUtiuTKTLSBv9whdV5RBiLYM6JriErv4
	 BlcNAtO+cTI1QR50F7nMlkWQb3OhY80x6Pp13EjCf8ZAV4HgjlMvebi1mBUV8/mTUk62ZIZkxXZy
	 2rtZodl/hG8G2LYt221URqc0lHS4bP2oI4O+MEBuuFmZdNIq/x21J+L1WvBbVp6KhK3gxJHES+9z
	 S31b74dDE89hi2qsOON2KX8jniM8DdnsUpVNS6q5W/gpbZISi95zWJdoCEEsvo4PVYwg100jNyc7
	 XkkokXheo4a9lhoiX/HsR/cfDl4c9sFkbs9f/3tt2QU87z0VkSgC0NdBbJZzdk9FeQMUhIvv1Gyy
	 Li2AFwQF1RttoHC4oWoNbv9WbDnA/kimgMdcfnfJ6v110RbDrkAw318I2VMuLkB0ERQCeEFDO5X2
	 NMjKoahjgNpIaX05ALdGMbh3X17J+NxKw7dGo9vRkbC1SaNWTTjVdL7FFlWUUCPGvNhrdUJnLuyV
	 zEAoOt2b06Q7YNueT13HdYSKDhWzYeibdfms0GB1G14umxUJU+gOdA/vPn4V1CA5q6/G5RzrmLg1
	 F3xLBq46wdWULGauA18S9Ca5ySU4yd/f6IvAkvPijvjxDREAaj1t5zYhJhYqwDU7edPopM2GN+GV
	 z1ghKBBKKUAglGW1UGVjqcfRLrYd5qzrIqE2Ph8ATS2BXM2EbV7Y9bUjfMBnJSC6aCpym8CA3vNH
	 q/2CDFr+BYQ/0KSFSoBERZ9LuGFECp/G6TyT6/u/bjwpwzoz7znaylomgF1A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 0/3] arm64: zynqmp: Add support for ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:33:05 +0800
X-OQ-MSGID: <20261005173308.710986-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103314_828290_68D304BD 
X-CRM114-Status: GOOD (  11.66  )
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

The ALINX EdgeBoard FZ3A is a single board computer from ALINX based on
the Xilinx Zynq UltraScale+ XCZU3EG SoC.

This series adds the ALINX vendor prefix, documents the board compatible,
and adds a device tree for the board's PS peripherals:

  - UART1 debug console
  - eMMC (HS200) and microSD card
  - GEM3 Ethernet with Micrel KSZ9031 PHY on the MDIO bus
  - I2C0 and I2C1
  - QSPI NOR flash
  - PCIe
  - USB 3.0 host
  - DisplayPort output

The Paddle-Mobile FPGA accelerator is not included. Its PL description
depends on vendor-specific IP and an out-of-tree driver.

Tested on ALINX FZ3A hardware with Linux 7.3.0-rc5: the board boots from
SD card into userspace over the serial console, gem3 negotiates
1000Mbps/Full duplex with phy-mode = "rgmii-id", and the eMMC runs in
HS200 mode.

The base DTB passes CHECK_DTBS=y, and the Xilinx SoC binding passes
dt_binding_check.

Changes since v1:
  - Use the correct vendor prefix 'alinx' instead of 'ebdee', and rename
    the board and DTS file accordingly (Krzysztof Kozlowski)
  - Describe the board as a single board computer with the SoC, DDR4 and
    eMMC on one PCB, not a carrier board with a MYIR SoM (Andrew Lunn)
  - Add the MDIO bus and describe the KSZ9031 PHY with phy-handle
    (Andrew Lunn)
  - Enable eMMC HS200 on sdhci0: drop no-1-8-v, add pinctrl and
    mmc-hs200-1_8v
  - Drop power-source and bias-high-impedance from pinctrl_gem3_default,
    which only produce spurious warnings on the board's pre-2023.1 PM
    firmware

Pufan Jin (3):
  dt-bindings: vendor-prefixes: Add ALINX vendor prefix
  dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
  arm64: zynqmp: Add ALINX EdgeBoard FZ3A

 .../bindings/soc/xilinx/xilinx.yaml           |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/xilinx/Makefile           |   1 +
 .../xilinx/zynqmp-alinx-edgeboard-fz3a.dts    | 350 ++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-alinx-edgeboard-fz3a.dts

Range-diff against v1:
1:  d6e565186 < -:  --------- dt-bindings: Add EBDEE vendor prefix
2:  f546b0d1a < -:  --------- dt-bindings: soc: xilinx: Add EBDEE EdgeBoard FZ3A
3:  b114e1da4 < -:  --------- arm64: zynqmp: Add EBDEE EdgeBoard FZ3A development board
4:  c33ea63b7 = 1:  c33ea63b7 dt-bindings: vendor-prefixes: Add ALINX vendor prefix
5:  888548b4e = 2:  888548b4e dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
6:  cd96303fb = 3:  cd96303fb arm64: zynqmp: Add ALINX EdgeBoard FZ3A

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0


