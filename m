Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D28C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 09:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDSoTSUS2I1dTZwOQ+u5rDpMK4NvDjOxPVPEoUv01MM=; b=niKeGCFHUuEZfdqjZD+Hqkd2aF
	6vu1W+hXlq8PrNQGoQtRMr9c5D/gaEc08QSoeAR3S4lf4FwGBjrp1I9qoQUlGUXzMZz0sJHFiyN1D
	1iRuyYEwb092v9C95jC/2R3dZf+ixpas5ZQaGg/EheBZE5bnfJ5XJfujeeMrDDDt/IqpITrN32t+e
	RQbS3vqH/uqY5cBV9bwYNscg0T9qnjyz2gAZ0oe4DBBIKGjMKgc2hN/KLAGpyHWIfzX2Oy3B5wWIG
	rlY0RJkVkVhlciFN5glHD17QBvx+JGvXLt1cBoleK5g3zuCeoZwPc2IDkWDezKTRhx48CzUbxEduh
	DFD/B4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElZo-0000000BqCY-34nE;
	Tue, 13 May 2025 09:05:28 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElR3-0000000BowD-49sr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 08:56:27 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3C684C001A13;
	Tue, 13 May 2025 01:56:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3C684C001A13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1747126585;
	bh=T0ibg3U914tadzkdlJ83unkROgclGmyfF23V6v04o/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K+f2JiFk5jFPGiwzDoLi+HMgrAis/qnCFHrqnEDuh3HBexuHpD+JWpyL57ng/lc7b
	 D0UJGxR7mnuXARZjkQdFjHCW54kh39Aqh5SAItACW2URDNEShr1rHUvSaxDorpykFw
	 mqFm+8GjplOUmvm2QQTBCPjQ6fn3Fbuf5Gl0MbZU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B898F180008FB;
	Tue, 13 May 2025 01:55:54 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Olivia Mackall <olivia@selenic.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3 06/12] ARM: dts: bcm63138: Add BCMBCA peripherals
Date: Tue, 13 May 2025 01:55:54 -0700
Message-ID: <20250513085554.2043646-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-6-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org> <20250512-bcmbca-peripherals-arm-v3-6-86f97ab4326f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_015626_146338_444CE135 
X-CRM114-Status: GOOD (  13.82  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 12 May 2025 14:05:52 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments.
> 
> Extend the peripheral interrupt window to 0x10000 as it need
> to fit the DMA block.
> 
> Add the GPIO, RNG and LED and DMA blocks for the
> BCM63138 based on the vendor files 63138_map_part.h and
> 63138_intr.h from the "bcmopen-consumer" code drop.
> 
> This SoC has up to 160 possible GPIOs due to having 5
> registers with 32 GPIOs in each available.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

