Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FBDC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgeQguDY7FYPW0ceQVRYb/rtE2D0IyrkMgAY/iXKKm8=; b=12GlYpXo1hl1vBC/xBgoulgEBQ
	zMedRscq9GLFclpzE7O5IhEBFysHDEUjxUW6aEI2snc+LFLRqQdWTkkbYvEsF2GT9EvENBVmEAmkh
	NKQkrnFtGpIv2R5SMVSxd1vOwgvoPyXHGcyIr5BXD3jjoIAbSJzQVxzFLTwQ3pXdlCo6/FYyREPPc
	OuwPZ9uUKDskc7c+6/MAfyrwml4+upXcUO4ucMsDlb6hGSpSKpPwWlgJoU7vv5wytMg1HHPP7Ddlw
	tblDZgvJH7dXvN0sCXtbXr8VthLnowpTwpNWfiwNAnps/ZNsrhTyaXIZgUhSLP5MiOhcIuJE5qKvP
	kiVYvbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7st-0000000Cjds-0ttg;
	Fri, 28 Feb 2025 21:27:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to7p5-0000000CjEo-34Mh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 483355C6A37;
	Fri, 28 Feb 2025 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C923C4CED6;
	Fri, 28 Feb 2025 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740777786;
	bh=pPhg3oNE6NxT4rC2ot9DW+HPkCoU/NwpAONXXchEa5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCerUwiqo50WYbj+/EYFOBQtg3Hw8hKteAoVF2mEuBYCNynj8Zjsu6/2Tc7niJ/Bv
	 a5wm53RvhGQf3yyteNZcQZ718t9Wc7wQXPyrXEzMG76MZBD2m/fBd5bE6Ofkr6/IBv
	 Xp2nu9jrU8uJlGrehp8hrQz2XAlo6LiJRWpisXsMgyHXQixP2IRaixz3PbCAmkEu1Z
	 40jDLCj4QJS0OkvjZ+XDilgbEfzuu+zt7+f2JRbzLg9qqRN5Y7Hv3q3I9evHGhxmDx
	 Nb4Yc8iMwu9CdEI2Jzsx4FZU45TTzJ1fdem/zKlHCi+UpEwipToaTDi8GJQDEYlBDm
	 lZyRhI5G+4+8Q==
Date: Fri, 28 Feb 2025 15:23:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 07/21] dt-bindings: at91rm9260-rtt: add
 microchip,sama7d65-rtt
Message-ID: <174077778429.3739910.8784445067469354265.robh@kernel.org>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <5b365a63d2124ebf27aebb0ec8395b1946e6c070.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b365a63d2124ebf27aebb0ec8395b1946e6c070.1740671156.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_132307_810962_2BA2D40F 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 27 Feb 2025 08:51:54 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTT compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


