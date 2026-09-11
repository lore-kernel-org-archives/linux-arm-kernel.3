Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7BBC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYBG4Mo6VNUGeOVpP2EIFPgZriiFWbCLLDjsSAka0yw=; b=ffvjrRw15cVPCXyp2HKFW8ghak
	kF1YDDVPiR4zc5kTy1IxPILKiFJFb35x0uvM5xbRYeadCaA7ibtbYEfxxNK0hYVpQu+idqYTT0Tcc
	fIgxFYRYXssFPPOtbqmiwT76awmsjfJ5PXdOw4GjM7GuVFQ6uYhNhMp5ZAGCNRvEmmSMA2jQrO9ao
	8n5by2V/hcv/E/evyHKbgGYjzT7goaJGl3YYahSdWBoR2adlBwHMUXmGQGGDT+xftvGZ+b8/38TZ0
	kNrtIKh2iOgBEs6CHOaNFYQtwLaDFcEpJDfLKWGIfel2oqQe/wOk7s1pNzjtqR9N6OjR4Vuc0oDld
	a/Z3c9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wv3-0000000GAph-3d7L;
	Fri, 11 Sep 2026 08:47:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wv2-0000000GApY-1jFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:47:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC10F43F62;
	Fri, 11 Sep 2026 08:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11461F00893;
	Fri, 11 Sep 2026 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116455;
	bh=VYBG4Mo6VNUGeOVpP2EIFPgZriiFWbCLLDjsSAka0yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q+tw+7VMyjhr9XZKyqf54iyK+2UZHCuWsr7qOD3CFxioHsRwQJAPB0/ntqhCz4RoG
	 YwkBBwjIZHs7TN36ruuwggOAffNCw3k2+u6wjWYa3GtBFoUAqX1VSt3iZFJOEzHzf6
	 lKcRrTGKzReGEzpczxTCFEKHidH5bNJScRgFSJ2HXf6ihMEvL5q731YUBu6FCh2xqM
	 wXjz71ZSQZ8J+cPrSiBTVjYB3ejmhwtY8ZIKN+da+PJhlyGX66HHIacWfUFvPsVuJD
	 PpGpQSmRSeG64koWLA0zGzIYxSB+lAfOsR+y5aQGtYvhVd9D627FpUgDpMdk01Jtfm
	 t73+UVn6avr9g==
Date: Fri, 11 Sep 2026 10:47:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Message-ID: <20260911-misty-gentle-macaque-6bebeb@quoll>
References: <20260910101616.139270-1-francesco@dolcini.it>
 <20260910101616.139270-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910101616.139270-2-francesco@dolcini.it>
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

On Thu, Sep 10, 2026 at 12:16:07PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add bindings for the Toradex Lino iMX91 and Lino iMX93 SoMs, based on
> the NXP i.MX91 and i.MX93 SoCs, respectively.
> 
> Lino SoMs use two board-to-board connectors to interface with a carrier
> board. They can also be mounted on the Lino-Verdin Adapter, which
> converts the Lino interface to the Toradex Verdin family pinout and
> allows the SoM to be used with Verdin-compatible carrier boards.
> 
> The Lino-Verdin Adapter also provides a Wi-Fi/Bluetooth module, an
> Ethernet PHY and a GPIO expander.
> 
> Add compatibles for systems consisting of a Lino SoM mounted on a
> Lino-Verdin Adapter and connected to either a Verdin Development Board
> or a Dahlia carrier board.
> 
> Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
> Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> Link: https://www.toradex.com/accessories/lino-verdin-adapter
> Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


