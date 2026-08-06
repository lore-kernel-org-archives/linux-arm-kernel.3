Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A5C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 19:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8V8MSCxS1zSv5He6itY4ooM4bAabvALiETJahUY3Eu8=; b=zUK00BL/HtsRWB4w43sgZ6K7Zf
	p572xizEo6mc2VHIt6ahOOCmdBVKJTk/WzLs5A7ZFbgIdKay9LbWPmvcdGX8i6HGCjXoURhavvrT7
	6znAPJFduCHl3ab1+9nkFUcS06+XSzdKImYhryY0xutiXNf4ZaTf+uov52bSFKXGZl/rFXrbSY0rm
	r/q+5n4Z3LE0vsC+D3Lbf8srL6+UREsWtrfK1JTbH/Ho/19S1NAsF+gnGgdKuliZjIChGVxE2UyxQ
	uJ7iERvdXipNVGqLWKZKogcjn3iqNTs2mx4hM+enupUV0962Cw85ZVBt921t86RST1CybD1CBecAK
	M2ObFqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4Bo-00000006b4U-2BIw;
	Thu, 06 Aug 2026 19:55:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws4Bm-00000006b2p-1hdO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 19:55:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D995540BE4;
	Thu,  6 Aug 2026 19:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68D71F00ACF;
	Thu,  6 Aug 2026 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786046137;
	bh=8V8MSCxS1zSv5He6itY4ooM4bAabvALiETJahUY3Eu8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RkLZHklgqHB8KCQmWi1DR5ujcuhgafO9wwwBcA1llwPwY2TPBvWHveRJS6ByYX0wx
	 vphm+5tCCUj2xLCA1Ijl7o/FgNpFhqwIGLmDTgWnUIXTJE4zKTBHq0xChnfNH6Hw6p
	 akEUT7VG8YBQYkheNPZNz9fTArWJHi9rHMO4mWVZU6xzQUaGPp8AwtWcErFRUbgfxH
	 3VTm4Mb6xj/x5R1qkEj2evnbCKImlK3GF9N4vTNci6OdUus9gWikROjp2nIRAzz5rk
	 +2nKc3sHYeNG+1h3geahoSQcXEcQOJ1+wFYBXfbFHeP17uTpdBZvG2rW1zk5J5bPDu
	 bJNDHkP0OmuxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198823809A29;
	Thu,  6 Aug 2026 19:54:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V6 0/4] Add PCIe M.2 Key E connector support for NXP i.MX
 boards
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <178604609663.1449574.5164434195319660259.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 19:54:56 +0000
References: <20260713023435.235765-1-sherry.sun@oss.nxp.com>
In-Reply-To: <20260713023435.235765-1-sherry.sun@oss.nxp.com>
To: Sherry Sun (OSS) <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com,
 marcel@holtmann.org, luiz.dentz@gmail.com, hongxing.zhu@nxp.com,
 l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, sherry.sun@nxp.com
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

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 13 Jul 2026 10:34:31 +0800 you wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> This series adds support for NXP Wi-Fi/BT combo chips (88W9098, AW693)
> inserted into PCIe M.2 Key E connectors on i.MX95-19x19-EVK boards.
> 
> For M.2 cards that rely on PCIe L2 link state and wake-up mechanisms, the
> card must remain powered during suspend. Patch #2 uses the existing
> dw_pcie_rp::skip_pwrctrl_off flag to skip power-off during suspend and skip
> power-on during the init path.
> 
> [...]

Here is the summary with links:
  - [V6,1/4] PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()
    (no matching commit)
  - [V6,2/4] PCI: imx6: Add skip_pwrctrl_off flag support
    (no matching commit)
  - [V6,3/4] Bluetooth: btnxpuart: Add M.2 Bluetooth device support using pwrseq
    https://git.kernel.org/bluetooth/bluetooth-next/c/c424d3c907ec
  - [V6,4/4] arm64: dts: imx95-19x19-evk: Describe the PCIe M.2 Key E connector
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



