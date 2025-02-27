Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA09C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/r+CJMZnG9NZASBNYGflOz7cbas9DNtAwpu9NsMCuA=; b=y1jZSu1iCNOAQtTm95/GLDDoDg
	dteeA6B3PHhregb7RT6MSo3mFv3C6cOz/IOor1FxCpxu38M0gx/5fYJwbeCilLlJJeacf7DeJrhI+
	NBlCCbjCqNVwwKetLHmFjQNBpkw7OVl/sR446pj2XnH0A3q6Pksl1hXL4stuWvJcO8DZne18csQRs
	Vfs3seIU3hhh8vqZTaKI3f3VP1qNVkSY2TlYdKhPE9HIXTe7qOYDrthPpUCXyK/f6/gAi6lUwBy/L
	xdziZdnuWJg/8/Rb07zhUxXRLoPfmZna7tm9WQI3qSVk1StbLF16fEOa23S4iIS8VjwMUZ8MWmlLi
	VMLQfgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndEV-00000007PXw-0Cj3;
	Thu, 27 Feb 2025 12:43:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tncgD-00000007IMs-2iZY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:07:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 558CC5C552C;
	Thu, 27 Feb 2025 12:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D6CC4CEE8;
	Thu, 27 Feb 2025 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740658072;
	bh=XeRhQ6iq6uKT/D+pyDPZgb7AbcoHU0EabaJrmBJdI+I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IHdCOLJCXFMQcKDXTBbd5QCoOizYpE5URnyiFNAasjlOnNLT5ECIj//PcH0kWMFVe
	 lEpYbKBGqTOUHrgtxTqXoFokwe5MfuFI2bkNpTo/WVY+0Mr/XiGC+2onpLAuxng/eH
	 QGlI0zsWnCOHseAXuMInqtQLzcbx0ztw5ImyEWtff3hsxgIDNxTd5GlbTM/l4MyTPM
	 AXzL/UdBkODuMCt7Jm2PguiYx3H6wxgasJtqNoR+HJuoXE28OH6y27cqdpaqGBYlBG
	 En56VXbzMy9zqkgcn3qGrd1piftlK/xyMcLo5MDYwNubmJBVtSHt3vPLyQf/yGf212
	 IzqzKNIskEYSQ==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, wim@linux-watchdog.org, linux@roeck-us.net, 
 Ryan.Wanner@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-watchdog@vger.kernel.org
In-Reply-To: <cover.1739555984.git.Ryan.Wanner@microchip.com>
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
Subject: Re: (subset) [PATCH 0/8] Add System Components for Microchip
 SAMA7D65 SoC
Message-Id: <174065806827.367410.5368210992879330466.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 17:37:48 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_040753_732089_D6D7DB2B 
X-CRM114-Status: UNSURE (   8.83  )
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


On Fri, 14 Feb 2025 11:08:13 -0700, Ryan.Wanner@microchip.com wrote:
> This patch set adds support for the following systems in the SAMA7D65
> SoC:
> - DMAs
> - Chip ID
> - Dual watchdog timer.
> 
> Ryan Wanner (8):
>   dt-bindings: atmel-sysreg: Add SAMA7D65 Chip ID
>   dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
>   dt-bindings: dma: atmel: add microchip,sama7d65-dma
>   ARM: at91: Add Support in SoC driver for SAMA7D65
>   ARM: dts: microchip: sama7d65: Add chipID for sama7d65
>   ARM: dts: microchip: sama7d65: Add watchdog for sama7d65
>   ARM: dts: microchip: sama7d65: Add DMAs to sama7d65 SoC
>   ARM: dts: microchip: sama7d65: Enable DMAs
> 
> [...]

Applied, thanks!

[3/8] dt-bindings: dma: atmel: add microchip,sama7d65-dma
      commit: e19ba02eeb8e98086708ee11ca1b123d17ec1977

Best regards,
-- 
~Vinod



