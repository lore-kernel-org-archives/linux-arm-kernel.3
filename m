Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C7FE95A79
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1guDDeJREHvuCw+ZPT1T95z9nhJbFOwEjHIzC5xChIk=; b=ZrC620bugrG5P6erAI02CcOFLD
	GtxBrGMqtETdwS7O4EPEnEGY4qkvqbxo6P3hLAJaTdGYCHdO1JiHd/8394rE5LJqjFlyMwcIDL+l9
	tnhnEt9ylapJJcT5i/HwLyVwOBCdN/r7M6RE8WPY19BIeCXShbdOvaw9OfGd6/TXrP8SQT4PtNXSj
	/mKrlZLl3vzYaTdxUMcUWY2wtYhOYlTb5sh7ZyJ2gRUvHn109qEozgD8XGtMypqAGJgy+b+X+lFa4
	rY0py50d5k/dOzA2rhpW0IpB8Qug8z2KVDXFlThI+FhoTB2SgB8W1G9pL5NJC6ekkIIjn5bK6GofL
	3ez9mtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXi7-00000004kjA-36ZD;
	Tue, 30 Dec 2025 11:16:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXi6-00000004kiz-14px
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 11:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50E226000A;
	Tue, 30 Dec 2025 11:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764D6C4CEFB;
	Tue, 30 Dec 2025 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767093377;
	bh=uqmUVWYwiYG8qYbJoU6eyoDu1iIymIOMQ/K/g42OgHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSzI6+jS+0Ww9sc0VnhdAjjAKKd+S3PPhyjCgeEH1RD0s1QGtWRQds3lfArdQg6Vb
	 f98a9p0WooJ2Dlr/WLYZOck4HR3QWDhA5q9+5NIn0lkfxXmR6anrNQlwntIMMyocRp
	 rJv/zhVZ3SXk4OHG1j6DOheJJ12xbY3tWPojRB+DVOLdOFvNeWWe1gJRkOGhSMOMdd
	 IiN2tMoq+PwJzjcT3n4cf5TRsk1KlJrQ98oe9GSKB6JTcBAO8A09Mk+Q9QnAe18Qc/
	 vlsCg5peF9R0++ETlVktBhMsCPpwbY5cNvu7uHBQRNvWgzOjj2ARdR6SgJCgeSiwus
	 wFYFmGU538QPw==
Date: Tue, 30 Dec 2025 12:16:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Primoz Fiser <primoz.fiser@norik.com>, Markus Niebel <Markus.Niebel@tq-group.com>, 
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95
 Boards
Message-ID: <20251230-cerulean-manatee-from-mars-be5ace@quoll>
References: <20251229213726.79374-1-stefano.r@variscite.com>
 <20251229213726.79374-2-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229213726.79374-2-stefano.r@variscite.com>
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

On Mon, Dec 29, 2025 at 10:37:15PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Add DT compatible strings for Variscite DART-MX95 SoM and Variscite
> development carrier Board.
> 
> Link: https://variscite.com/system-on-module-som/i-mx-9/dart-mx95/
> Link: https://variscite.com/carrier-boards/sonata-board/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


