Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C696BD61010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpOvpQEwAt61tO5mdzsIZHIQzL8ZoQPJkOaSNw6fhrg=; b=BPLMrH8e/rJVVd/1rg95AZen5V
	6NfVOOYdpU4AAE6dLZ7/lXKlmsRWLzihPbCGyM3s8GFwq2ap9Tu0b9ufqFp3rcYmTaOvkw86EFi/l
	Yb8MPd4i3T7yPUkzfQNEnE+XrKWd30lIiqFJ4qI6/y5jN7n2816mo+qtA/n8MPXFdi+WkPntHKKi6
	QHS71tMmpKfpigEKgYy9Ye1SGaj7j4Mb68EVXHjJbEosgO1JsnYrEutaCLW1Hul3gJgnP4qxz/vFz
	cNrCLFIlhVszo1JNfQiQuBUV6A9UDfJd+2bAv7O0q5PrBMUw2KGBdtIwBlwcICEixDdF8R9D1mTLq
	T242JGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQoh-000000004tv-0Qty;
	Thu, 29 Jan 2026 12:08:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQof-000000004th-3S2n;
	Thu, 29 Jan 2026 12:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72EAE60126;
	Thu, 29 Jan 2026 12:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE224C116D0;
	Thu, 29 Jan 2026 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769688484;
	bh=wqvYiaougo9MgdPRxH7kVqp/5WhviKS4oyIBj/a1l5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNm06YzlYWUIvC+UHY6+rfdL/fSPmSiM1O1bwsVae1CYKPEPfGojHo/u4XVeRTkPb
	 zGJSnVHoGhxlyzAfDSWu+SICeSlFM0FkOQvis9LV7RtZWiJ5aqcO6pMFc5ViLc/Swm
	 PQOSLglhpraPpwoTUh9tziGgXEqlVZbex8M8TB7ghxffsuMIHvLlVafTkeU5C6Rk0b
	 yvmeTKpunVYQNE0/gn72MLgzAxTYn3QiGJEfopAEUMEkqQjttlqDmt2I3J051VtWVV
	 gl+GCccV9vum4vW1FkdtB6btpYMRTQ3LyOxlo5o5Uciwi0oOfWj5r0llS82gWJIlhi
	 fSnvfFtiNjIoQ==
Date: Thu, 29 Jan 2026 12:07:57 +0000
From: Simon Horman <horms@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com, bogdan-gabriel.roman@nxp.com,
	Ionut.Vicovan@nxp.com, alexandru-catalin.ionita@nxp.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, Frank.li@nxp.com
Subject: Re: [PATCH 4/4] MAINTAINERS: Add MAINTAINER for NXP S32G Serdes
 driver
Message-ID: <20260129120757.GA358439@kernel.org>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-5-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126092159.815968-5-vincent.guittot@linaro.org>
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

On Mon, Jan 26, 2026 at 10:21:59AM +0100, Vincent Guittot wrote:
> Add a new entry for S32G Serdes driver.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 765ad2daa218..888674a308a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3202,6 +3202,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
>  
> +ARM/NXP S32G SERDES DRIVER
> +M:	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> +R:	NXP S32 Linux Team <s32@nxp.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/nxp,s32g-serdes.yaml

This patchset adds the following file, not the one above:

Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
                                  ^^^

> +F:	drivers/phy/freescale/phy-nxp-s32g-*
> +F:	include/linux/pcs/pcs-nxp-xpcs.h
> +
>  ARM/Orion SoC/Technologic Systems TS-78xx platform support
>  M:	Alexander Clouter <alex@digriz.org.uk>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -- 
> 2.43.0
> 

