Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DFFC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKWEfBt7WvFReq3E3/cEOsq0CGvWl4f2Ylunt+Kk9gw=; b=zJ3pTeKtNGZqeC5lZACnFvtMnX
	jAWGOrLD+TI+RWtkBWrLtsL3Ze1zw/HlkRE+Jo5/qiC+B4NB6UjCmSBRqHKxcoL4l8SkAYxI9EnJt
	Zd8ESOVcVla1QDKpHScRWyA92GbGzo0S9VzmOJFQqi/DR5EFMpEMvdp77NG4ZLTPu/DePFDCByfaA
	BkDS9lirVJNkvHo8tMZXMZWGgjPHuHMCJyl4tiCZyL1BQrlXisYwfBEEakW4dTxPD3aLzzT5I9NzR
	fHa5jQVSzZw94JrvhL+munmUlesa+hNngupgCzmgYyfrG8RgGUqw1Hcqns24nMdwyO7U3g5jKBB6r
	CpjR1qgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wvL-0000000GAtU-0L8o;
	Fri, 11 Sep 2026 08:47:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wvJ-0000000GAtC-2lCf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:47:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4F21601EF;
	Fri, 11 Sep 2026 08:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B5E1F000FF;
	Fri, 11 Sep 2026 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116472;
	bh=VKWEfBt7WvFReq3E3/cEOsq0CGvWl4f2Ylunt+Kk9gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lKBkS4kLtja6upngeOs2y9+xmcYZK5zy/MgcV+b5TVCV9EQRs3zn6rcZuwWw1vWYc
	 i2wr+UT2wwveO1rCo0uTsc4XjuuhsipEDa/mjzUIr+hMa0U7X5Eh+PwLjloOgeLVX7
	 H2TZmNOa2CUXv2MQE72mWauX/PkurQ9Y9SBNf1TDQP9j2NKppKlwdOLT3usL+BXLeD
	 4nRwyungZwSN+jpRDx1zXwgKnLJlFs2QRSnC7fyWjcK9DR1lPrw0d7OoYeDUbqs2p9
	 EgujoIS0xJXAPhRbApQToPDSCHtqkEZMjYOyfPnL9/FFXNRIK2A8OwrfBj80/1EQnN
	 plPmNfGyb+zyg==
Date: Fri, 11 Sep 2026 10:47:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Message-ID: <20260911-dexterous-elastic-alligator-6517b8@quoll>
References: <20260910101616.139270-1-francesco@dolcini.it>
 <20260910101616.139270-3-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910101616.139270-3-francesco@dolcini.it>
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

On Thu, Sep 10, 2026 at 12:16:08PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
> OSM Development Board they can be mated with.
> 
> The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
> on the NXP i.MX91 and i.MX93 SoCs, respectively.
> 
> Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
> Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
> Link: https://www.toradex.com/products/carrier-board/osm-development-board
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


