Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8CECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SS2mGHyUmwe0VmX0h8vluIHyfjQsXGUXCMbq0JhU3lo=; b=3mcAg7FjroCg6htytWynCBLURE
	00H310WBYgJMFO48fq7amZdGC1Pcstl3218m8MvedaqR246LDUbVdfxzOm8BTOxJLsmP+D+Ppa0yl
	tXFd4G4BhSnp/sxa/ZTt5klZQfMuWLtbf8vgm/MdkVGGoElcmMv/2cnuJaoN5SQuTz3X/hMswDRdi
	43MJBURHI8e+U2QvoaQUuACjMwxcqL+sGiQHuCCo2uQoXtFN0dWED+f9tJox2lfXObAE0xRaBhypw
	2xFY5Yo0juJulaZaLBgB3ruVMyjkYMyyay64WRHL6xfHzgAWiGjeZrJPrCUblNL4vGbsgTDFGKwem
	1JUy9t8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBpb-000000085g3-3ZgK;
	Thu, 01 Oct 2026 08:07:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBpa-000000085fQ-46GV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:07:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A14A6022C;
	Thu,  1 Oct 2026 08:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734791F00898;
	Thu,  1 Oct 2026 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842074;
	bh=SS2mGHyUmwe0VmX0h8vluIHyfjQsXGUXCMbq0JhU3lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbeGcI29zuUSYAKStnXiypREtlH6js2GNQJXjVBCtm7Anbt+ppZoAuCmt/mP2v6iv
	 2rcRxQZEZVvrc2sB4fDDVk5JuFzsYe4/AUaaJz+BXvYvQNBNA8vzIekXHHubWbWFiY
	 6p0RSVKlRPkYBT+ZwHhLdsZ4Kn7fzgtymOAtpz81WU+4bKrgqm5OZrylOiI4MgrNce
	 Z17XjxgdZWeXHVamV5I9Io++nMbcq3BIr7VQULNiqTxEKHUgIQc7EOuQs14a666Cpl
	 3WUL/yrVoB08V4dLFZD/OGdfSNH/ryrDVWOS/mOf7t96e7ly0OtyuspZ0+tC0RnzfM
	 +OLzzE00dl8Hg==
Date: Thu, 1 Oct 2026 10:07:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>, 
	Josua Mayer <josua@solid-run.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL
 board variants
Message-ID: <20261001-pearl-skylark-of-bloom-6a6b40@quoll>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <075691831d4da249672c3141ab16b9e856ee42da.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <075691831d4da249672c3141ab16b9e856ee42da.1790693249.git.stefano.r@variscite.com>
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

On Tue, Sep 29, 2026 at 05:17:29PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Document new VAR-SOM-6UL configurations on the already supported
> Concerto carrier while retaining its legacy compatible. Add
> VAR-SOM-6UL variants on Symphony and DART-6UL variants on
> VAR-6ULCustomBoard.
> 
> The new compatibles identify the SoM storage, wireless and audio
> options followed by the carrier, module and SoC compatibles.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


