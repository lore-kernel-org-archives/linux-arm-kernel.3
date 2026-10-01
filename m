Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89001CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/imt2ZFR4iPgDVR5E7V1cTC9eu5GVAhLsMP8e8lZgI=; b=mlFKE+j8wIAFHCqIGy1C0kTpNJ
	MuG5esML5etSj6aw9t+ShlZSKruCRxbKyIWf/uVgb0qpMkXVeOkdU+ls6zd80RqN9/8tjZt1R/qK/
	TdugfMbqlBgiQnUFd6zESzcdR8VDYunEjvDgYKcKJItLIPXrooT+4RWFJMXLBQFvML46jKRX69qyE
	Iavzt38S7Y47+6uFSmt5e0cLaX4gRWVxB0j6pbqKnGRlVwdviEGy/tAeAx+Hd4uGyw9UolCh2ZVke
	f7NBqhB/nmGOzmGDLCeA/T+BE7mtbFE92Z2ba0cCnq/KHoRVerXXj2EzZx5YirriPZRMC9c7nL8RN
	asB9dBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBUk-000000082yw-2aTC;
	Thu, 01 Oct 2026 07:46:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBUj-000000082ym-3NUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:46:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAD3E601FE;
	Thu,  1 Oct 2026 07:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1631F000FF;
	Thu,  1 Oct 2026 07:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840780;
	bh=E/imt2ZFR4iPgDVR5E7V1cTC9eu5GVAhLsMP8e8lZgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8bK+t4nuolwA6ibbwTSxvT3bxhH8MeraRDJ5AOuR/1XtYxjYfjN2MPM4gh5y8i1y
	 uOI7lVWbTqBP2+2W1mjOJmXgSYPf1C6eURueVC6kknmNF8ZYsGnWL/mF3vTDL+CFzJ
	 MQ62bkS5T+P8KIZGad937ZQRVK67C500Qv6ZypcZoRcCiskrgzblVpYLJBRKRSM8eH
	 ctGFb+XLq1HTORXfSyWC3GjbB3X9SxuO5AoN06KhzWza3AeJXal+bZqIW6K0nNQho8
	 U79KfGDNmUHKFXo9k7s6VpP2s58xGm2JPKbZ3Q67+u7IjAMjlaF40QbAzyuCx81Wzz
	 B5vdXufloPT7g==
Date: Thu, 1 Oct 2026 09:46:17 +0200
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
Subject: Re: [PATCH v4 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL
 board variants
Message-ID: <20261001-spiritual-mongoose-of-force-9323be@quoll>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <c547995bcb14779a5883d855137148ebddb7ef8d.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c547995bcb14779a5883d855137148ebddb7ef8d.1790693249.git.stefano.r@variscite.com>
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

On Tue, Sep 29, 2026 at 05:17:28PM +0200, Stefano Radaelli wrote:
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
> ---
> v3->v4:
>  - Split the board binding by SoC, extend the existing VAR-SOM-6UL
>    entry with new Concerto and Symphony variants, and add DART-6UL.
>  - Drop the redundant -board suffix from the new carrier compatibles
>    and use sorted items/enum lists.
> 
>  .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


