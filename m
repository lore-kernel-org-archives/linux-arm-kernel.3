Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4370CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=06i4WcQESlvt9d5hVxVL6XtfxJGmUMnEYGAhzyyvOHw=; b=TwvwOGDz43Xd95TgZbnW7ZYgzS
	DppkxGRTCYKvzjp5mayKUhd1cf3lQGnwEDPJP1S23tbaXlPwzfenSL3PM7/1V0sNJ3FGHy0ZjVmWF
	WjodGBqisDmL6nk7mRqGyL2YCc3nn1d4D9FragBiWHH6KUDXjudh85tnHd4iOqALvmsGWuzpFyWMj
	tukAVIFc2OgE9Pm51nUfkjP3fNUl3uHh84ZjfpCyMMmBMYBmUKun4vSVwUudXH3AbWxL4jZCJsM87
	PG8sW1Dj1iZga9TqOGzrBMgtd/3BjyLzAvAvnKZWu3mTFJgr/DgAkhPxAcpO7aLNuPcSsGg6ZRL5J
	1l5Rn/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWZ-0000000Gv6o-0lt6;
	Mon, 05 Oct 2026 17:30:51 +0000
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmWV-0000000Gv5g-3Uc7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 17:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221443; bh=06i4WcQESlvt9d5hVxVL6XtfxJGmUMnEYGAhzyyvOHw=;
	h=From:To:Cc:Subject:Date;
	b=YkB3gfNKOChzQuefRW2U32oLrvzMvYg4k8/6tnvhtaJYU9q5nGI4QhqA93p/LIEGY
	 RLFcOnQE8xoCkU8thEj8LafLEWCPnsYUwMDCKIfWsP8WHzV468Aj5QcO6dv3pbzAjt
	 QMeFcJ63fXQNu1vJjsg1bC1eJcJ1BiMGSfN/0t/g=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221440tyu2bvv5v
Message-ID: <tencent_71C80AF592B6FB36817B3040A6EE18B3A007@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeA7tiWD0PBvbLeyhmaygXeK0maMxBTlhgBNqV2vidODyNH0TEtN
	 PssLlhnZOBvks2JZZNF+BqwVqwbmeGyxlA0faH3r3PFAy2aMzCkglnQRtoAgE1SOn0/uh6/EGTZA
	 rg0lEKp5DGFAbr6T0giiDYhLwrLGh3cxwHQ7V+J7L8nH3/XnednF+Hju5MY/NM5c2NULAsMLu6El
	 tI/6ezyqQVSDXbactoM3r0QhQtT4dWJFVtJl0z4KdCXCXERESaPFQGGZWIL/Vsc8lg9qivJIJLq3
	 z+vVkGEuqYk/iIGPlKyHysVq6OeJxeBlYjCjyTM2LejusmbjQ4SYeJXKBhRRdQOePgIEK32enJYy
	 bp7Ha9EPqGMKlCZBLNoXU48DBTPKN1dWkFLAg91WZ5WQKZygC/1MEMMEBdWRg5ie5cMVEqrjFYSx
	 e7wyD5J0hvgfiUr9BgPB+kTJ4DhURKdAbDM9SWzoZP8un7RdLvCzBEdpWUeDjN+TXWqJu+RQ5wiU
	 hH94yzueGcD1bEoSSxOShIU4HTIR2KzGj4mpLWLMBXxqI6Fp4wR1i1qISDKGqqn4ZYVnqYjsOVsH
	 pEo8JRgtRvJLqzH6670oBDYWksSpK9C/c5g9Ja5aOF9g0aQvYArL+KjMYSys4McTh2RXGf68snqT
	 9UMliQkJgnNvgKxJpMCR8ikAaKf0g2mzkarsO3LiNaUOhrNOSzJSsnbrrGBou/XXVExX/EQX07OR
	 /LuyaoQYHpZGUw9KwUOEz9FPfZVvErcUjngPMoBXHX+yvQD99/xJPgN7Yu1nWYiCm1QnAr6Wy4bB
	 XqJLex8/wbGCWNx0GkHdBdXllYUP08283EcRHZWfhnGlFuIqHFbunoROKBJuDAa3YIiSpY5gL5re
	 GxdBE3mKKMydJkd84NdxORJOhM2hN0eiy6ND3bl/O943Zhm8fro9kXFi3SlWS6qkdQ8B3W7X0eug
	 xHLZmW/J9GNz6yETA/p9GGC11uORKdV2buct+xN3U3pmL6KaRqcwjoKw6/iITxkhlLZxrXF2pI+M
	 DgIciDppJ8DMPIVc8lHOeM1BdF8w6bKVQ0CAm++XCiLEKErPzp6s6G++SHYYG7XQKxFxbPZAyADg
	 RvgEX+
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Date: Tue,  6 Oct 2026 01:30:36 +0800
X-OQ-MSGID: <20261005173039.707304-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_103048_175384_7186CDFC 
X-CRM114-Status: GOOD (  11.76  )
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


