Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733C4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMcHgc36aaJU0Nr7RRyNOjEsyz6bF5/W9plziuy9uws=; b=r6tymweV+3xVuiJXfpsPXh2NJI
	JuOafzmRSowMAkNTL695neXNtoOM0+CgYlzrYiAvfPBfYCL1jBrJrmkA05O3FdayQc1+t7w7Irqfq
	s6ehr68Ma/L2pzTRX1F5tjpNbj2ePeXg4xwvNyED81SZzKk2TRp7qlTlPlSrhHIribsfaDaVhN5AS
	6Y4ZFbdFYTcNVWlGD3/KE7yK3JmkiaGxRGOD+xGs2OsoClR8wOm0AlLNApowiKKJZSWBY9n7dFkCx
	wG7hMbUpUVhttl9a97x0rF9iw0wOL8O0bU0iIMihGx5htq4O74LrYyxly0JIsiUi8b9KfvSKUoIuE
	4S3lffDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEHB-0000000F89i-039L;
	Mon, 29 Jun 2026 15:52:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEH8-0000000F89L-4Bpu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:51:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 311FF600DA;
	Mon, 29 Jun 2026 15:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6211F000E9;
	Mon, 29 Jun 2026 15:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782748317;
	bh=cMcHgc36aaJU0Nr7RRyNOjEsyz6bF5/W9plziuy9uws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kPocfMEUYuMNe84xZZDYWtfO4m0SOtx7s/Wp7ICcWWqoGN1zL9e+D+YdUSO/UDmwD
	 PZzO4FMO2ScHMKS8p25Z65MJYD1ORoPTJD7nt4sGLBtxXRxW/bZQue9ECmf/HDI3iz
	 lfnnY2V5SIv0HIb0q4NP/OPYwhG2OJai3WgC9k5JSZtsJZYVuwOU+amtlAI7xhLUBB
	 vxwP+hpxCqI1M09qg/vVNt7mNjO3homFld20KjeBbaExljBFjfc2SC9Ssf5mysLUSn
	 Uhb+TZZ53DLlorbdHpoUSUe0DvQCKRje6YvtsDnZKz2Kbsd64qr/57gWoTNUXnbMmO
	 phfu3Yl2/CZwg==
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Alexander Sverdlin <alex@sverdlin.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>, 
 Lukas Schmid <lukas.schmid@netcube.li>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Subject: Re: (subset) [PATCH v5 0/6] Add support for Baijie Helper A133
 board
Message-Id: <178274831392.2336627.18238595158174074345.b4-ty@kernel.org>
Date: Mon, 29 Jun 2026 23:51:53 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 23 Jun 2026 22:48:12 +0200, Alexander Sverdlin wrote:
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
> 
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - USB-C OTG port in peripheral mode (via onboard hub)
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
> 
> [...]

Applied to sunxi/config-for-7.3 in local tree, thanks!

[1/6] arm64: defconfig: Enable Allwinner LRADC input driver
      commit: b4158103c45386ab30ba7624bee17ebf33940baa

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


