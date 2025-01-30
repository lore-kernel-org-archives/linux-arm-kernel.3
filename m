Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B0DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhz0/jjo4qFmW1iXyIdZlfsAPb2fX8Oz/NK6I0T9x78=; b=EK2dUqshGk56dqYEYrEWyVBc1I
	Bp4yJLwYxLOy/nnetuQi2FDiuKWXnlZbD0Ioi83TVpOKhSOAhtotNLFFSQbOfJ6RdnNfLrqfRWcqe
	g3lyEFbvqlQ8HXpOIHTZBUuVLzrKcEgewJNdwkvoA/eeWDWdfySnXlA/xpLCKTQZL8gkS9Fog6kUG
	RcPsAsO+ijjDpYmAW5nVN8C46iwzZYNMF6jc0kBw367rNUdB5xoIEXUQuVPJO+lYTnV9tXTk33vyg
	k5Wxf8CJP8tw+yr2YMzMnngRfr0HeMOUuy+7ICxLoRABFIzzZP0aqPxXuWvciC/vLFV6qro93tioW
	w+HdZ2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tde47-00000009nNa-1IjK;
	Thu, 30 Jan 2025 23:35:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tde2m-00000009nDH-1iP5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 23:33:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8EC85C622A;
	Thu, 30 Jan 2025 23:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA02C4CED2;
	Thu, 30 Jan 2025 23:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738280035;
	bh=SNxpLIyh55YaYu/hoLrvuDAiZPa2g61UsphjBmtgs1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPe1eydsdeX665hA6YFhLHITqz8YY5YGlgJWlDLrQIiJTVB8i+0ojHS7KYwpmiBDg
	 9WFsWP8BaUEVqTGb3ffbDU9WnYjPgqyM9WkUkxohjdROJeoqIMc71OTChSeGQzknZT
	 NgtjgwilGvEFrZNEXLDqqzrdhxaiAMHcIuZqdi38yisYV9njItwZPMCFpLnlc9NUuz
	 ACruYmH/yVSCaf+h0Koya20nO3+hU9Yc0UekLX0WjXsMaPHtsIWj/PwFbC/Ysktg2+
	 4dIlx/ObXD1T9F5LQ1HW8fUMKCIilRYUrNU2DmLr/H9QMG5V+824bFSDwjbeTYqyY3
	 MJh2vZS04bnbw==
Date: Thu, 30 Jan 2025 17:33:54 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 01/16] dt-bindings: mfd: syscon: add
 microchip,sama7d65-ddr3phy
Message-ID: <20250130233354.GA1868322-robh@kernel.org>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
 <01181325b16c78ac50b8bab3f178b14e8f417892.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01181325b16c78ac50b8bab3f178b14e8f417892.1738257860.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_153356_490579_FE22FBD3 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 30, 2025 at 10:33:41AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 DDR3phy compatible to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index b414de4fa779b..54a6d5957e13a 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -188,6 +188,7 @@ properties:
>            - microchip,lan966x-cpu-syscon
>            - microchip,mpfs-sysreg-scb
>            - microchip,sam9x60-sfr
> +          - microchip,sama7d65-ddr3phy
>            - microchip,sama7g5-ddr3phy
>            - mscc,ocelot-cpu-syscon
>            - mstar,msc313-pmsleep

Actually, this needs to be in both lists of compatibles.

> -- 
> 2.43.0
> 

